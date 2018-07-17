package com.ted;

import org.junit.Test;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordHash {

	@Test
	public void testMD5Hash() {
		String password = "secret";
		Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();
		String hashedPass = passwordEncoder.encodePassword(password, null);
		
		System.out.println("MD5 Hashed Password: " + hashedPass);
	}
	
	@Test
	public void testBCryptHash() {
		
		String pass = "secret";
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String hashedPass = passEncoder.encode(pass);
		
		System.out.println("BCrypt Hashed Password: " + hashedPass);
	}

}
