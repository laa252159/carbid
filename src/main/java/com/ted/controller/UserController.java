package com.ted.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.validation.Valid;

import com.ted.service.SecurityService;
import com.ted.utils.TokenEncryptorDescriptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ted.model.Auction;
import com.ted.model.User;
import com.ted.service.AuctionService;
import com.ted.service.LoginService;
import com.ted.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	AuctionService auctionService;

	@Autowired
	private SecurityService securityService;
	
	
	@RequestMapping(value = "/myprofile", method = RequestMethod.GET)
	public String getMyProfile(Model model) throws NoSuchPaddingException,
			UnsupportedEncodingException, InvalidKeyException,
			NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException,
			InvalidAlgorithmParameterException, InvalidKeySpecException {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);

		model.addAttribute("removeMeUrl", "remove-me?t=" + TokenEncryptorDescriptor.encrypt(user.getUsername()));
		
		return "myprofile";
	}
	
	@RequestMapping(value = "/myprofile/update", method = RequestMethod.GET)
	public String getMyProfileUpdate(Model model) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("user", user);
		
		return "update-profile";
	}
	
	@RequestMapping(value = "/myprofile/update", method = RequestMethod.POST)
	public String postMyProfileUpdate(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			@RequestParam("input1") MultipartFile image) {
		
		if(result.hasErrors()) {
			return "update-profile";
		}
		
		loginService.updateUser(user, image);
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		return "myprofile";
	}
	
	@RequestMapping(value = "/myprofile-inbox", method = RequestMethod.GET)
	public String getMyProfileInbox(Model model) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		model.addAttribute("button", "inbox_tab");
		
		return "myprofile";
	}

	/**
	 * Самоудаление пользователя
	 */
	@RequestMapping(value = "/remove-me", method = RequestMethod.GET)
	public String removeMe(Model model, @RequestParam(value = "t", required = true) String token)
			throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeySpecException, IOException {
		String login = TokenEncryptorDescriptor.decrypt(token);
		User user = userService.getUserByUsername(login);
		if (user != null) {
			userService.pseudoRemoveUser(user);
		}
		return "redirect:/j_spring_security_logout";
	}
	
	@RequestMapping(value = "/myprofile-new-message", method = RequestMethod.GET)
	public String getMyProfileNewMessage(Model model) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		model.addAttribute("button", "newMessage_tab");
	
		return "myprofile";
	}

	@RequestMapping(value = "/deleteuser/{id}", method = RequestMethod.GET)
	public String deleteUser(Model model, @PathVariable(value="id") Integer id) {
		userService.deleteUserById(id);
		return "redirect:/admin-users";
	}

	@RequestMapping(value = "/decline-registration/{token}", method = RequestMethod.GET)
	public String deleteUserThroughToken(Model model, @PathVariable(value="token") String token)
			throws NoSuchPaddingException, InvalidKeyException, NoSuchAlgorithmException,
			IllegalBlockSizeException, InvalidKeySpecException, BadPaddingException,
			InvalidAlgorithmParameterException, IOException {

		String login = TokenEncryptorDescriptor.decrypt(token);
		User user = userService.getUserByUsername(login);
		userService.deleteUserById(user.getUserid());
		return "redirect:/";
	}

	@RequestMapping(value = "/myprofile-new-message/{receiver}", method = RequestMethod.GET)
	public String getMyProfileNewMessageReply(Model model, @PathVariable(value="receiver") String receiver) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		model.addAttribute("button", "newMessage_tab");
		model.addAttribute("receiver", receiver);
	
		return "myprofile";
	}
	
	@RequestMapping(value = "/myprofile-sent", method = RequestMethod.GET)
	public String getMyProfileSent(Model model) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		model.addAttribute("button", "sent_tab");
	
		return "myprofile";
	}
	
	@RequestMapping(value = "/myprofile-anouncements", method = RequestMethod.GET)
	public String getMyProfileAnouncements(Model model) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		model.addAttribute("button", "anouncements_tab");
	
		return "myprofile";
	}
	
	@RequestMapping(value = "/myprofile-auctions", method = RequestMethod.GET)
	public String getMyProfileAuctions(Model model) {
		
		User user = userService.getLoggedInUser();
		
		if(user == null)
			return "index";
		
		/* Auctions if Seller */
		String msg = null;
		List<Auction> auctions = auctionService.getUserAuctions(user);
		if(auctions == null)
			msg = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("auctions", auctions);
		
		/* Bought auctions */
		String msg2 = null;
		auctions = auctionService.getBuyerAuctions(user);
		if(auctions == null)
			msg2 = "No Auctions found.";
		else
			auctions = auctionService.putPrimaryImage(auctions);
		
		model.addAttribute("boughtAuctions", auctions);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(user);
		
		model.addAttribute("avatar", base64Picture);
		model.addAttribute("msg", msg);
		model.addAttribute("msg2", msg2);
		model.addAttribute("user", user);
		
		model.addAttribute("button", "auctions_tab");
	
		return "myprofile";
	}
	
	@RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
	public String getProfile(Model model, @PathVariable Integer id) {
		
		User usr = userService.getUserById(id);
		
		/* User Picture */
		String base64Picture = userService.getUserPicture(usr);
		model.addAttribute("avatar", base64Picture);
		
		model.addAttribute("usr", usr);
		
		return "profile";
	}
	
	@RequestMapping(value = "/rating/bidder/{id}", method = RequestMethod.GET)
	public @ResponseBody Float getBidderRating(Model model, @PathVariable Integer id) {
		
		User usr = userService.getUserById(id);
		
		return usr.getBidderRating();
	}
	
	@RequestMapping(value = "/rating/seller/{id}", method = RequestMethod.GET)
	public @ResponseBody Float getSellerRating(Model model, @PathVariable Integer id) {
		
		User usr = userService.getUserById(id);
		
		return usr.getSellerRating();
	}
	
	@RequestMapping(value = "/rate/seller/{id}", method = RequestMethod.POST)
	public @ResponseBody String rateSeller(Model model, @PathVariable Integer id, @RequestParam("rating") Float rating) {
		
		userService.rateSeller(id, rating);
		
		return "200";
	}
	
	@RequestMapping(value = "/rate/bidder/{id}", method = RequestMethod.POST)
	public @ResponseBody String rateBidder(Model model, @PathVariable Integer id, @RequestParam("rating") Float rating) {
		
		userService.rateBidder(id, rating);
		
		return "200";
	}

}
