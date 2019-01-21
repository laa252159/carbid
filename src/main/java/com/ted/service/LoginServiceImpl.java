package com.ted.service;

import java.io.IOException;
import java.util.Map;

import com.ted.mail.Mailer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ted.model.Authority;
import com.ted.model.AuthorityPK;
import com.ted.model.User;
import com.ted.model.UserPicture;
import com.ted.repository.AuthorityRepository;
import com.ted.repository.UserPictureRepository;
import com.ted.repository.UserRepository;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AuthorityRepository authorityRepository;
	@Autowired
	private UserPictureRepository userPictureRepository;
	
	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailer;

	@Transactional
	public User saveUser(User user, MultipartFile file) {
		
		// Enabled = true 
		user.setEnabled((byte)1);
		
		// BCrypt password encryption
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String hashedPass = passEncoder.encode(user.getPassword());
		boolean passwordsWereEqual = passwordsAreEqualAndNotEmpty(user.getPassword(), user.getMatchingPassword());
		user.setPassword(hashedPass);
		if(passwordsWereEqual){
			user.setMatchingPassword(hashedPass); //Костыль =)
		}
		
		// Approved = false until admin checks it
		user.setApproved((byte)0);
		
		// User Rating
//		user.setBidderRating(0);
//		user.setSellerRating(0);
		
		// Persist user
		user = userRepository.saveAndFlush(user);
		
		// Picture
		if(file != null && !file.isEmpty()) {
			UserPicture picture = new UserPicture();
			try {
				picture.setContent(file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			picture.setUser(user);
			userPictureRepository.saveAndFlush(picture);
		}
		
		// Authority Role
		AuthorityPK authorityPK = new AuthorityPK();
		authorityPK.setUserid(user.getUserid());
		authorityPK.setRole("ROLE_BIDDER");
		
		Authority authority = new Authority();
		authority.setId(authorityPK);
		authority.setUser(user);
		
		// Persist authority
		authorityRepository.saveAndFlush(authority);

		//sending email about registration new user
		mailer.notifyAdminAboutNewUser(user);
		return user;
	}

	private boolean passwordsAreEqualAndNotEmpty(String pass, String matchPass){
		if(!StringUtils.isEmpty(pass) && !StringUtils.isEmpty(matchPass)){
			return pass.equals(matchPass);
		}
		return false;
	}
	
	@Modifying
	@Transactional
	public User updateUser(User user, MultipartFile file) {
		
		/* Copy new user info */
		User perUser = userRepository.findByUserid(user.getUserid());
		perUser.setFirstName(user.getFirstName());
		perUser.setLastName(user.getLastName());
		perUser.setEmail(user.getEmail());
		perUser.setUsername(user.getUsername());
		perUser.setCity(user.getCity());
		perUser.setAddress(user.getAddress());
		perUser.setPostalCode(user.getPostalCode());
//		perUser.setAfm(user.getAfm());
		
		if(!user.getPassword().equals("p4DS*4a$hLA*4#ataPv")) {
			// BCrypt password encryption
			BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
			String hashedPass = passEncoder.encode(user.getPassword());
			perUser.setPassword(hashedPass);

			if(passwordsAreEqualAndNotEmpty(user.getPassword(), user.getMatchingPassword())){
				user.setMatchingPassword(hashedPass); //Костыль =)
			}
		}
		
		System.out.println("Password: " + user.getPassword());
		
		// Persist user
		user = userRepository.saveAndFlush(perUser);
		
		// Picture
		if(!file.isEmpty()) {
			UserPicture picture = new UserPicture();
			try {
				picture.setContent(file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			picture.setUser(user);
			userPictureRepository.deleteByUser(user);
			userPictureRepository.saveAndFlush(picture);
		}
		
		return user;
	}

	public String checkEmailUsername(User user) {
		
		if(userRepository.findByEmail(user.getEmail()) != null )
			return "Email already in use";
		if(userRepository.findByUsername(user.getUsername()) != null )
			return "Username already in use";	
		return null;
	}

	@Transactional
	public String upgradeUser(Map<String, String> params) {
		
		User user = userService.getLoggedInUser();
		if(user == null)
			return "Please login and try again.";
		
		/* Address */
		String address = params.get("address");
		if(address.isEmpty())
			return "Please provide an Address.";
		user.setAddress(address);
		
		/* Postal Code */
		String postalCode = params.get("postalCode");
		if(postalCode.isEmpty())
			return "Please provide an Postal Code.";
		user.setPostalCode(postalCode);
		
		/* AFM */
//		String afm = params.get("afm");
//		if(afm.isEmpty())
//			return "Please provide an AFM.";
//		user.setAfm(afm);
		
		/* Phone */
		String phone = params.get("phone");
		if(phone.isEmpty())
			return "Please provide a phone number.";
		user.setPhone(phone);
		
		/* Update User */
		user = userRepository.saveAndFlush(user);
		
		/* Authority */
		AuthorityPK authorityPK = new AuthorityPK();
		authorityPK.setUserid(user.getUserid());
		authorityPK.setRole("ROLE_SELLER");
		
		Authority authority = new Authority();
		authority.setId(authorityPK);
		authority.setUser(user);
		
		/* Persist authority */
		authorityRepository.save(authority);
		
		return null;
	}

}
