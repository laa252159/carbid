package com.ted.controller;


import java.io.File;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ted.model.Auction;
import com.ted.model.UploadInfo;
import com.ted.model.XmlAuctionWrapper;
import com.ted.repository.AuctionBiddingRepository;
import com.ted.repository.AuctionRepository;
import com.ted.repository.AuthorityRepository;
import com.ted.repository.CategoryRepository;
import com.ted.repository.LocationRepository;
import com.ted.repository.UserRepository;
import com.ted.service.AuctionService;
import com.ted.service.UserService;
import com.ted.service.XmlService;

@Controller
@RequestMapping(value = "/api")
public class XMLController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	XmlService xmlService;
	
	@Autowired
	AuctionBiddingRepository auctionBiddingRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	AuctionRepository auctionRepository;

	
	
	@RequestMapping(value = "auction/put", method = RequestMethod.POST) 
	public @ResponseBody String putAuction(@RequestBody XmlAuctionWrapper wrapper, Model model) {
		
		try {
			xmlService.saveXmlAuction(wrapper.getAuctions());
		} catch (Exception ex) {
			System.out.println(ex);
			return "Error while passing data in database.";
		}
			
		return "200 OK";
	} 
	
	@RequestMapping(value = "auction/upload", method = RequestMethod.POST) 
	public @ResponseBody UploadInfo uploadAuction(@RequestParam("input1") MultipartFile multipart, Model model) {
		
		Long auctions = auctionRepository.count();
		Long users = userRepository.count();
		Long bids = auctionBiddingRepository.count();
		Long categories = categoryRepository.count();
		
		try {
			JAXBContext context = JAXBContext.newInstance(XmlAuctionWrapper.class);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			
			File convFile = new File( multipart.getOriginalFilename());
	        multipart.transferTo(convFile);
				
			XmlAuctionWrapper wrapper = (XmlAuctionWrapper)unmarshaller.unmarshal(convFile);
			
			xmlService.saveXmlAuction(wrapper.getAuctions());
			
			int i = 0;
			for(Auction auction : wrapper.getAuctions()) {
				System.out.println(convFile.getName() + ": Auction" + i + ": " + auction.getName());
				i++;
			}
			
		} catch (Exception ex) {
			System.out.println(ex);
		}
		
		UploadInfo info = new UploadInfo();
		info.setAuctions(auctionRepository.count() - auctions);
		info.setBids(auctionBiddingRepository.count() - bids);
		info.setCategories(categoryRepository.count() - categories);
		info.setUsers(userRepository.count() - users);
			
		return info;
	} 
	
	@RequestMapping(value = "xmlAuctions", method = RequestMethod.GET)
	public @ResponseBody String saveAuctions() {
		
		xmlService.xmlUnmarshalling();
		
		return "200 OK";
	}
	
	@RequestMapping(value = "auctions/{id}", method = RequestMethod.GET)
	public @ResponseBody Auction getAuction(@PathVariable Integer id) {
		
		Auction auction = auctionService.getAuctionById(id);
		
		/* Eager Fetch */
		auction.setAuctionBiddings(auctionBiddingRepository.findByAuction(auction));
		auction.setCategories(categoryRepository.findByAuction(auction));
		
		return auction;
		
	}

}


