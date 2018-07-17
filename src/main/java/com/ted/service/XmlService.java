package com.ted.service;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.ted.model.Auction;
import com.ted.model.Category;
import com.ted.model.Location;
import com.ted.model.User;
import com.ted.model.XmlSeller;

public interface XmlService {
	
	void saveXmlAuction(List<Auction> auctions);

	User saveBidderUser(User user);
	
	User saveSellerUser(XmlSeller seller);
	
	Location saveLocation(Location location);
	
	List<Category> saveCategories(List<Category> categories);
	
	Date formatString(String dateString);
	
	void xmlUnmarshalling();
	
	File xmlFileProduce(List<Integer> auctionids);

}
