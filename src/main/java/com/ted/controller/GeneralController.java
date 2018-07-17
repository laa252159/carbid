package com.ted.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ted.model.User;
import com.ted.service.AuctionService;
import com.ted.service.CategoryService;
import com.ted.service.UserService;



@Controller
@SessionAttributes("user")
public class GeneralController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping(value={"/", "home"})
	public String sayHello(Model model, HttpSession session) {
	    
		User user = userService.getLoggedInUser();
		
		if(user != null)
			model.addAttribute("user", user);
		
		return "index";
	}
	
	@RequestMapping("menu")
	public @ResponseBody String getMenu(Model model) {
	    
		String html = categoryService.getMenuHtml();
	     
		return html;
	}
	
}
