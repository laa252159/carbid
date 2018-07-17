package com.ted.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the global_messages database table.
 * 
 */
@Entity
@Table(name="global_messages")
@NamedQuery(name="GlobalMessage.findAll", query="SELECT g FROM GlobalMessage g")
public class GlobalMessage implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="g_message_id", unique=true, nullable=false)
	private int messageId;

	@Column(nullable=false)
	private Timestamp date;

	@Lob
	@Column(name="g_message")
	private String message;

	public GlobalMessage() {
	}

	public int getMessageId() {
		return this.messageId;
	}

	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}