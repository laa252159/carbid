package com.ted.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.User;
import com.ted.model.UserPicture;

public interface UserPictureRepository extends JpaRepository<UserPicture, Long> {
	
	UserPicture findByUser(User user);
	
	@Transactional
	Integer deleteByUser(User user);

}
