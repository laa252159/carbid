package com.ted.service;

import com.ted.model.Authority;
import com.ted.model.AuthorityPK;
import com.ted.model.User;
import com.ted.model.UserPicture;
import com.ted.repository.AuthorityRepository;
import com.ted.repository.UserPictureRepository;
import com.ted.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

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

	@Override
	public User approveEmail(String email) {

		User user = userService.getUserByEmail(email);
		if (user == null || (user.getEmailApproved() == (byte) 1)) {
			return null;
		}
		user.setEmailApproved((byte) 1);
		// Persist user
		user = userRepository.saveAndFlush(user);

		//notify admin about new user
		mailer.notifyAdminAboutNewUser(user);
		return user;
	}

	@Transactional
	public User saveUser(User user, MultipartFile file) {
		
		// Enabled = true 
		user.setEnabled((byte)1);
		
		// BCrypt password encryption
		BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
		String hashedPass = passEncoder.encode(user.getPassword());
		user.setPassword(hashedPass);
		
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

		//sending confirmation link to user
		mailer.sendToUserMailConfirmationLink(user);

		return user;
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

    /**
     * Изменение пароля у юзера
     * @param user
     */
    @Modifying
    @Transactional
    public void changeUserPassword(User user){

        //Copy new user info
        User perUser = userRepository.findByUserid(user.getUserid());

        if(!user.getPassword().equals("p4DS*4a$hLA*4#ataPv")) {
            // BCrypt password encryption
            BCryptPasswordEncoder passEncoder = new BCryptPasswordEncoder();
            String hashedPass = passEncoder.encode(user.getPassword());
            perUser.setPassword(hashedPass);
        }

        userRepository.saveAndFlush(perUser);
    }

	public String checkEmailUsername(User user) {
		
		if(userRepository.findByEmail(user.getEmail()) != null )
			return "Данный Email уже есть в системе";
		if(userRepository.findByUsername(user.getUsername()) != null )
			return "Такой логин уже занят";
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
