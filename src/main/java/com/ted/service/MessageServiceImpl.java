package com.ted.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.GlobalMessage;
import com.ted.model.Message;
import com.ted.model.User;
import com.ted.repository.GlobalMessageRepository;
import com.ted.repository.MessageRepository;
import com.ted.repository.UserRepository;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageRepository messageRepository;
	
	@Autowired
	GlobalMessageRepository globalMessageRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserService userService;

	public List<Message> getByReceiver(User receiver) {
		
		return messageRepository.findByReceiverAndReceiverDeleteOrderByDateDesc(receiver, (byte)0);
		
	}

	public List<Message> getBySender(User sender) {

		return messageRepository.findBySenderAndSenderDeleteOrderByDateDesc(sender, (byte)0);
		
	}

	public Message getById(Integer id) {
		
		return messageRepository.findByMessageId(id);
		
	}

	public boolean isMessageOwner(String username, Message message) {
		
		if(username.equals(message.getSenderUsername()) || username.equals(message.getReceiverUsername()))
			return true;
		
		return false;
	}

	@Transactional
	public void messageIsRead(Message message) {
		
		message.setIsRead((byte)1);
		
		messageRepository.saveAndFlush(message);
		
	}

	@Transactional
	public String saveMessage(Message message) {
		
		User receiver = userRepository.findByUsername(message.getReceiver().getUsername());
		User sender = null;
		
		if(receiver == null)
			return "Username doesn't exist";
		
		// TODO: Extra input check
		
		sender = userService.getLoggedInUser();
		
		message.setReceiver(receiver);
		message.setSender(sender);
		message.setReceiverUsername(receiver.getUsername());
		message.setSenderUsername(sender.getUsername());
		
		messageRepository.saveAndFlush(message);	
		
		return null;
	}

	@Transactional
	public void saveGlobalMessage(GlobalMessage message) {
		
		globalMessageRepository.saveAndFlush(message);
		
	}

	public List<GlobalMessage> getAllGlobalMessages() {
		
		return globalMessageRepository.findAll();
		
	}

	public Integer checkNewMessages(User user) {
		
		Integer newMessages;
		
		for(int i = 0; i < 3; i++) {
			
			newMessages = messageRepository.newMessagesCount(user.getUserid());
			
			if(newMessages > 0)
				return newMessages;
			
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		return 0;
	}

	@Modifying
	@Transactional
	public void deleteMessage(Message message, String username) {

		if(username.equals(message.getSenderUsername())) {
			message.setSenderDelete((byte)1);
		}
		else {
			message.setReceiverDelete((byte)1);
		}
		
		if(message.getReceiverDelete() == (byte)1 && message.getSenderDelete() == (byte)1) {
			messageRepository.delete(message);
		}
		else {
			messageRepository.save(message);
		}
		
		return;

	}
	
	

}
