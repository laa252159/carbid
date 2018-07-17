package com.ted.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ted.model.User;

public interface LoginService {
	
	User saveUser(User user, MultipartFile picture);
	
	User updateUser(User user, MultipartFile picture);

	String checkEmailUsername(User user);
	
	String upgradeUser(Map<String, String> params);

}
