package com.ted.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.Authority;
import com.ted.model.BidderRating;
import com.ted.model.BidderRatingPK;
import com.ted.model.SellerRating;
import com.ted.model.SellerRatingPK;
import com.ted.model.User;
import com.ted.model.UserPicture;
import com.ted.repository.BidderRatingRepository;
import com.ted.repository.SellerRatingRepository;
import com.ted.repository.UserPictureRepository;
import com.ted.repository.UserRepository;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	SellerRatingRepository sellerRatingRepository;
	
	@Autowired
	BidderRatingRepository bidderRatingRepository;
	
	@Autowired
	UserPictureRepository userPictureRepository;
	
	@Autowired
	ImageService imageService;

	public User getLoggedInUser() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    String username = authentication.getName();
		    return userRepository.findByUsername(username);
		}
		
		return null;
	}
	
	public boolean isUserBidder() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    for(GrantedAuthority auth : authentication.getAuthorities())
		    {
		    	if(auth.getAuthority().equals("ROLE_BIDDER"))
		    		return true;
		    }
		}
		
		return false;
	}
	
	public boolean isUserSeller() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    for(GrantedAuthority auth : authentication.getAuthorities())
		    {
		    	if(auth.getAuthority().equals("ROLE_SELLER"))
		    		return true;
		    }
		}
		
		return false;
	}
	
	public boolean isUserAdmin() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
		    for(GrantedAuthority auth : authentication.getAuthorities())
		    {
		    	if(auth.getAuthority().equals("ROLE_ADMIN"))
		    		return true;
		    }
		}
		
		return false;
	}

	public List<User> getAllUsers() {
		
		return userRepository.findAll();
		
	}

	@Transactional
	public void approveUsers(List<String> approved) {
		
		User user;
		
		for(String username : approved) {
			user = userRepository.findByUsername(username);
			user.setApproved((byte)1);
			userRepository.save(user);
		}
	}

	public User getUserByUsername(String username) {
		
		return userRepository.findByUsername(username);
		
	}

	@Transactional
	public boolean hasAuthority(String username, String role) {
		
		User user = userRepository.findByUsername(username);
		
		List<Authority> authorities = user.getAuthorities();
		
		for(Authority authority : authorities) {
			if(authority.getId().getRole().equals(role))
				return true;
		}
		
		return false;
	}

	public User getUserById(int id) {

		return userRepository.findByUserid(id);
		
	}

	@Transactional
	public void rateSeller(Integer id, float rating) {
		
		User rated = userRepository.findByUserid(id);
		User rater = getLoggedInUser();
		
		SellerRatingPK sellerRatingPK = new SellerRatingPK();
		sellerRatingPK.setRatedSellerId(id);
		sellerRatingPK.setRaterSellerId(rater.getUserid());
		
		SellerRating sellerRating;
		
		sellerRating = sellerRatingRepository.findOne(sellerRatingPK);
		
		/* If rating exists */
		if(sellerRating != null) {
			sellerRating.setRating(rating);
		}
		else {
			sellerRating = new SellerRating();
			sellerRating.setId(sellerRatingPK);
			sellerRating.setRating(rating);
		}
		
		/* Persist Rating */
		sellerRatingRepository.saveAndFlush(sellerRating);
		
		/* Update Overall Rating */
		float newAvgRating = sellerRatingRepository.userAvgRating(rated);
		rated.setSellerRating(newAvgRating);
		rated.setNumberOfSellerRatings(rated.getNumberOfSellerRatings()+1);
		
		/* Update rated User */
		userRepository.saveAndFlush(rated);
		
	}

	@Transactional
	public void rateBidder(Integer id, float rating) {
		
		User rated = userRepository.findByUserid(id);
		User rater = getLoggedInUser();
		
		BidderRatingPK bidderRatingPK = new BidderRatingPK();
		bidderRatingPK.setRatedBidderId(id);
		bidderRatingPK.setRaterBidderId(rater.getUserid());
		
		BidderRating bidderRating;
		
		bidderRating = bidderRatingRepository.findOne(bidderRatingPK);
		
		/* If rating exists */
		if(bidderRating != null) {
			bidderRating.setRating(rating);
		}
		else {
			bidderRating = new BidderRating();
			bidderRating.setId(bidderRatingPK);
			bidderRating.setRating(rating);
		}
		
		/* Persist Rating */
		bidderRatingRepository.saveAndFlush(bidderRating);
		
		/* Update Overall Rating */
		float newAvgRating = bidderRatingRepository.userAvgRating(rated);
		rated.setBidderRating(newAvgRating);
		rated.setNumberOfBidderRatings(rated.getNumberOfBidderRatings()+1);
		
		/* Update rated User */
		userRepository.saveAndFlush(rated);
		
	}

	public String getUserPicture(User user) {
		
		UserPicture userPicture = userPictureRepository.findByUser(user);
		if(userPicture == null)
			return null;
		
		String base64Picture = imageService.imageToBase64(userPicture.getContent());
		
		return base64Picture;
	}
	
}
