package com.ted.model;

import java.io.Serializable;

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
 * The persistent class for the user_pictures database table.
 * 
 */
@Entity
@Table(name="user_pictures")
@NamedQuery(name="UserPicture.findAll", query="SELECT u FROM UserPicture u")
public class UserPicture implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_pictures_id", unique=true, nullable=false)
	private int userPicturesId;

	@Lob
	@Column(nullable=false)
	private byte[] content;

	// bi-directional many-to-one association to Auction
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;

	public UserPicture() {
	}

	public int getUserPicturesId() {
		return this.userPicturesId;
	}

	public void setUserPicturesId(int userPicturesId) {
		this.userPicturesId = userPicturesId;
	}

	public byte[] getContent() {
		return this.content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}