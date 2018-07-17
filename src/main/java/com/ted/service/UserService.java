package com.ted.service;

import java.util.List;

import com.ted.model.User;

public interface UserService {
	
	User getLoggedInUser();
	
	boolean isUserBidder();
	
	boolean isUserSeller();
	
	boolean isUserAdmin();
	
	List<User> getAllUsers();
	
	void approveUsers(List<String> approved);
	
	User getUserByUsername(String username);
	
	User getUserById(int id);
	
	boolean hasAuthority(String username, String role);
	
	void rateSeller(Integer id, float rating);
	
	void rateBidder(Integer id, float rating);
	
	String getUserPicture(User user);

}
