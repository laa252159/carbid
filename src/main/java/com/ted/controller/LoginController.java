package com.ted.controller;

import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ted.model.User;
import com.ted.service.CategoryService;
import com.ted.service.LoginService;
import com.ted.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login (Model model) {
		System.out.println("Inside login controller");
		return "login";
	}

	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	public String loginFailed(Model model) {
		
		System.out.println("Login failed");
		
		model.addAttribute("error","Login failed. Please provide correct credentials." );
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "index";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registrationGet(Model model) {
		
		User user = new User();
		
		model.addAttribute("user", user);
		
		return "reg";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registrationPost(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			@RequestParam("input1") MultipartFile image) {
		
		
		if(result.hasErrors()) {
			return "reg";
		}
		
		String msg = loginService.checkEmailUsername(user);
		if(msg != null)	// Check if email already exists
		{
			model.addAttribute("msg", msg);
			return "reg";
		}
		
		loginService.saveUser(user, image);
		
		return "redirect:login";
	}
	
	@RequestMapping(value = "/upgrade", method = RequestMethod.GET)
	public String getUpgrade(Model model) {
		
		User user = userService.getLoggedInUser();
		model.addAttribute("user", user);
		
		return "upgrade";
	}
	
	@RequestMapping(value = "/upgrade", method = RequestMethod.POST)
	public String postUpgrade(@RequestParam Map<String,String> allRequestParams, Model model, 
			HttpServletRequest request) {
		
		String error = loginService.upgradeUser(allRequestParams);
		
		if(error != null) {
			model.addAttribute("error", error);
			return "upgrade";
		}
		
		/* Logout */
		try {
			request.logout();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		/* Prepare login page */
		String msg = "Your account has just been upgraded. You can now create new Auctions and see them in your account."
				+ " Please Login again to complete ther process.";
		model.addAttribute("msg", msg);

		
		return "redirect:login";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String error403(Model model) {
		return "403";
	}
}
