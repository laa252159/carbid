package com.ted.service;

import com.ted.model.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface LoginService {

	User approveEmail(String email);

    void saveUser(User user);

	User saveUser(User user, MultipartFile picture);

	User updateUser(User user, MultipartFile picture);

	String checkEmailUsername(User user);
	
	String upgradeUser(Map<String, String> params);

    void changeUserPassword(User user);

}
