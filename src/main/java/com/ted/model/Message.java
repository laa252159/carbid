package com.ted.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the messages database table.
 * 
 */
@Entity
@Table(name="messages")
@NamedQuery(name="Message.findAll", query="SELECT m FROM Message m")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="message_id", unique=true, nullable=false)
	private int messageId;

	@Column(nullable=false)
	private Timestamp date;

	@Column(name="is_read", nullable=false)
	private byte isRead;

	@Lob
	private String message;
	
	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "receiver_id", nullable = false)
	private User receiver;
	
	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "sender_id", nullable = false)
	private User sender;
	
	@Column(name="sender_username", nullable=false)
	String senderUsername;
	
	@Column(name="receiver_username", nullable=false)
	String receiverUsername;
	
	@Column(name="sender_delete", nullable=false)
	private byte senderDelete;
	
	@Column(name="receiver_delete", nullable=false)
	private byte receiverDelete;

	public Message() {
	}

	public Timestamp getDate() {
		return this.date;
	}

	public byte getIsRead() {
		return this.isRead;
	}

	public String getMessage() {
		return this.message;
	}

	public int getMessageId() {
		return this.messageId;
	}

	public User getReceiver() {
		return this.receiver;
	}

	public byte getReceiverDelete() {
		return receiverDelete;
	}

	public String getReceiverUsername() {
		return receiverUsername;
	}

	public User getSender() {
		return this.sender;
	}

	public byte getSenderDelete() {
		return senderDelete;
	}

	public String getSenderUsername() {
		return senderUsername;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public void setIsRead(byte isRead) {
		this.isRead = isRead;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public void setReceiverDelete(byte receiverDelete) {
		this.receiverDelete = receiverDelete;
	}

	public void setReceiverUsername(String receiverUsername) {
		this.receiverUsername = receiverUsername;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public void setSenderDelete(byte senderDelete) {
		this.senderDelete = senderDelete;
	}

	public void setSenderUsername(String senderUsername) {
		this.senderUsername = senderUsername;
	}

}