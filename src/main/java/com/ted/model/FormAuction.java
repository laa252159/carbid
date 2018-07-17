package com.ted.model;

import org.springframework.web.multipart.MultipartFile;

public class FormAuction {
	
	Auction auction;
	
	MultipartFile[] files;
	
	String categoryName;

	public Auction getAuction() {
		return auction;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
