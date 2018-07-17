package com.ted.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.User;
import com.ted.repository.UserRepository;

@Service("jpaTesting")
public class JpaTestingImpl implements JpaTesting {
	
	@Autowired
	private UserRepository userRepository;
	
	@Transactional
	public List<User> showUsers() {
		
		return userRepository.findAll();
	}

}
