package com.ted.model;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "seller")
public class XmlSeller {
	
	private String username;
	
	private float rating;

	@XmlAttribute(name = "Rating")
	public float getRating() {
		return rating;
	}

	@XmlAttribute(name = "UserID")
	public String getUsername() {
		return username;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	

}
