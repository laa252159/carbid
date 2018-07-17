package com.ted.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ted.service.JpaTesting;

@Controller
public class TestingController {
	
	@Autowired
	private JpaTesting jpaTesting;
	
	@RequestMapping("/showusers")
	public String showUsers(Model model) {
		
		model.addAttribute("users", jpaTesting.showUsers());
		
		return "showusers";
		
	}

}
