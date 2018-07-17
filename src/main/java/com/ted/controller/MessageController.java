package com.ted.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ted.model.Auction;
import com.ted.model.Dashboard;
import com.ted.model.GlobalMessage;
import com.ted.model.Message;
import com.ted.model.User;
import com.ted.service.AdminService;
import com.ted.service.AuctionService;
import com.ted.service.MessageService;
import com.ted.service.UserService;

@Controller
@RequestMapping(value = "/messaging")
public class MessageController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	AuctionService auctionService;

	@RequestMapping(value = "inbox", method = RequestMethod.GET)
	public String userInbox(Model model) {
		
		User user = userService.getLoggedInUser();
		
		model.addAttribute("inbox", messageService.getByReceiver(user));
		
		return "inbox";
		
	}
	
	@RequestMapping(value = "sent", method = RequestMethod.GET)
	public String userSent(Model model) {
		
		User user = userService.getLoggedInUser();
		
		model.addAttribute("sent", messageService.getBySender(user));
		
		return "sent";
		
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String userMessage(@PathVariable Integer id, Model model) {
		
		User user = userService.getLoggedInUser();
		Message message = messageService.getById(id);
		
		if(messageService.isMessageOwner(user.getUsername(), message)) {
			
			model.addAttribute("message", message);
			
			return "message";
		}
		
		return "redirect:myprofile";
		
	}
	
	@RequestMapping(value = "/isRead/{id}", method = RequestMethod.GET)
	public @ResponseBody String userMessageIsRead(@PathVariable Integer id, Model model) {
		
		User user = userService.getLoggedInUser();
		Message message = messageService.getById(id);
		
		if(messageService.isMessageOwner(user.getUsername(), message)) {
			
			messageService.messageIsRead(message);
	
			return "200 OK";
		}
		
		return "Error";
		
	}
	
	@RequestMapping(value = "new-message", method = RequestMethod.GET)
	public String userNewMessageGet(Model model) {
		
		User user = new User();
		Message message = new Message();
		
		message.setReceiver(user);
		
		model.addAttribute("new_message", message);
		
		return "new-message";
	}
	
	@RequestMapping(value = "new-message", method = RequestMethod.POST)
	public String userNewMessagePost(@ModelAttribute("new_message") Message message, Model model) {
		
		String err_msg = messageService.saveMessage(message);
				
		if(err_msg != null) {
			model.addAttribute("err_msg", err_msg);
		}
		else {
			model.addAttribute("info_msg", "Message Sent!");
		}
		
		model.addAttribute("button", "newMessage_tab");	// New Message tab Active
		
		/* Initialize Admin Dashboars */
		if(userService.isUserAdmin()){
			
			Dashboard dashboard = adminService.generateDashboard();
			model.addAttribute("dashboard", dashboard);
			return "admin";
		}
		
		/* Initialize profile */
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("auctions", auctions);
		model.addAttribute("user", user);
		
		return "myprofile";
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteMessage(@PathVariable Integer id, Model model) {
		
		User user = userService.getLoggedInUser();
		if(user == null)
			return "Not Logged in User";
		
		Message message = messageService.getById(id);
		
		if(messageService.isMessageOwner(user.getUsername(), message)) {
			
			messageService.deleteMessage(message, user.getUsername());
		}
		
		model.addAttribute("button", "inbox_tab");	// New Message tab Active
		
		/* Initialize Admin Dashboars */
		if(userService.isUserAdmin()){
			
			Dashboard dashboard = adminService.generateDashboard();
			model.addAttribute("dashboard", dashboard);
			return "admin";
		}
		
		/* Initialize profile */
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("auctions", auctions);
		model.addAttribute("user", user);
		
		return "myprofile";
		
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "new-anouncement", method = RequestMethod.GET)
	public String userNewAnouncementGet(Model model) {
		
		System.out.println("new an get");
		
		GlobalMessage message = new GlobalMessage();
		
		model.addAttribute("new_message", message);
		
		return "new-anouncement";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "new-anouncement", method = RequestMethod.POST)
	public String userNewAnouncementPost(@ModelAttribute("new_message") GlobalMessage message, Model model) {
		
		System.out.println("new an post");
		
		messageService.saveGlobalMessage(message);
		
		model.addAttribute("button", "newAnouncement_tab");	// New Message tab Active
		
		model.addAttribute("info_an", "Message Sent!");
		
		return "admin";
	}
	
	@RequestMapping(value = "anouncements", method = RequestMethod.GET)
	public String anouncements(Model model) {
		
		System.out.println("an");
		
		model.addAttribute("anouncements", messageService.getAllGlobalMessages());
		
		return "anouncements";
	}
	
//	@PreAuthorize("hasRole('ROLE_ADMIN') OR hasRole('ROLE_BIDDER')")
	@RequestMapping(value = "checkNewMessages", method = RequestMethod.GET)
	public @ResponseBody Integer checkNewMessages(Model model) {
		
		User user = userService.getLoggedInUser();
		if(user == null)
			return 0;
		
		Integer number = messageService.checkNewMessages(user);
		
		System.out.println("Returning messages number: " + number);		// Debug
		
		System.out.println("Checking for new messages. User: " + user.getUsername());
		
		return number;
	}
}
