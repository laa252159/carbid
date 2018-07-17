package com.ted.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.ted.model.Auction;
import com.ted.model.BidResponse;
import com.ted.model.Category;
import com.ted.model.Filter;
import com.ted.model.FormAuction;
import com.ted.model.ImageInfo;
import com.ted.model.Location;
import com.ted.model.User;
import com.ted.repository.AuctionBiddingRepository;
import com.ted.repository.CategoryRepository;
import com.ted.service.AuctionPictureService;
import com.ted.service.AuctionService;
import com.ted.service.CategoryService;
import com.ted.service.RecommendationService;
import com.ted.service.UserService;

@Controller
@SessionAttributes("filter")
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	RecommendationService recommendationService;
	
	@Autowired
	AuctionPictureService auctionPictureService;
	
	@Autowired
	AuctionBiddingRepository auctionBiddingRepository;
	
	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	Filter filter;
	
	@RequestMapping(value = "auction/{id}", method = RequestMethod.GET)
	public String getAuction(Model model, @PathVariable Integer id) {
		
		Auction auction = auctionService.getAuctionById(id);
		model.addAttribute("auction", auction);
		
		/* End time in milliseconds */
		Long ends = auction.getEnds().getTime();
		model.addAttribute("ends", ends);
		
		/* Recommendations */
		List<Auction> recs = recommendationService.getRecommendations();
		recs = auctionService.putPrimaryImage(recs);
		model.addAttribute("recs", recs);
		
		/* Auction Images */
		List<String> images = auctionPictureService.getAuctionPictures(auction);
		model.addAttribute("images", images);
		
		/* User */
		User user = userService.getLoggedInUser();
		model.addAttribute("user", user);
		
		/* Check modify */
		if(user != null) {
			
			/* Eager Fetch */
			auction.setAuctionBiddings(auctionBiddingRepository.findByAuction(auction));
			if(user.getUserid() == auction.getUser().getUserid() && auction.getAuctionBiddings().isEmpty() && !auction.isBought())
				model.addAttribute("modify", 1);
		}
		
		return "auction";
	}
	
	@RequestMapping(value = "auction-list", method = RequestMethod.GET)
	public String getAuctionList(Model model) {
		
		return "auction-list";
	}
	
	@RequestMapping(value = "auctions", method = RequestMethod.GET)
	public String getAuctions(Model model, HttpServletRequest request) {		
		
		auctionService.updateFilter(request);
		
		Page<Auction> auctions = auctionService.pageAuctions(request);
		List<Auction> auctionList = auctions.getContent();
		auctionList = auctionService.putPrimaryImage(auctionList);
		model.addAttribute("auctions", auctionList);
		
		System.out.println(filter.getSortBy());
		
		model.addAttribute("filter", filter);
		
		return "auctions";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String searchAuctions(Model model, HttpServletRequest request) {
		
		request.setAttribute("categoryId", "all");
		
		auctionService.updateFilter(request);
		
		Page<Auction> auctions = auctionService.pageAuctions(request);
		model.addAttribute("auctions", auctions.getContent());
		
		System.out.println(filter.getSortBy());
		
		model.addAttribute("filter", filter);
		
		/* Recommendations */
		List<Auction> recs = recommendationService.getRecommendations();
		model.addAttribute("recs", recs);
		
		return "auctions";
	}

	@RequestMapping(value = "checkBids/{id}", method = RequestMethod.GET)
	public @ResponseBody BidResponse checkBids(@RequestParam(value="numofBids") Integer numofBids, @PathVariable Integer id) {

		System.out.println("NumofBids: " + numofBids);
		
		BidResponse bidResponse = auctionService.checkBids(numofBids, id);

		return bidResponse;
	}
	
//	@PreAuthorize("hasRole('ROLE_BIDDER')")
	@RequestMapping(value = "auction/bid/{id}", method = RequestMethod.POST)
	public @ResponseBody String auctionBidPost(Model model, @PathVariable Integer id, @RequestParam(value="bidAmount") String bidAmount) {
		
		System.out.println("BidPost controller");
		
		if(bidAmount == null || bidAmount.isEmpty())
			return "Please provide a price.";
		
		String msg = auctionService.bidSave(id, new BigDecimal(bidAmount));
		
		if(msg != null)
			return msg;
		
		return "OK";
	}
	
	@RequestMapping(value = "new-auction", method = RequestMethod.GET)
	public String newAuctionGet(Model model) {
		
		FormAuction formAuction = new FormAuction();
		Auction auction = new Auction();
		Location location = new Location();
		List<Category> categories = categoryService.getAllCategories();
		
		auction.setLocation(location);
		formAuction.setAuction(auction);
		formAuction.setCategoryName(null);
		
		model.addAttribute("formAuction", formAuction);
		model.addAttribute("categories", categories);
		
		return "new-auction";
	}
	
	@RequestMapping(value = "new-auction",  method = RequestMethod.POST)
	public String newAuctionPost(@Valid @ModelAttribute("formAuction") FormAuction formAuction, BindingResult result, Model model,
			@RequestParam(value = "input1", required = false) MultipartFile[] images) {
		
		
		formAuction.setFiles(images);
		
		String error = auctionService.saveFormAuction(formAuction);
		
		if(error != null) {
			List<Category> categories = categoryService.getAllCategories();
			model.addAttribute("categories", categories);
			model.addAttribute("error", error);
			return "new-auction";
		}
		
		System.out.println("Auction Saved! " + formAuction.getAuction().getName());
		
		return "redirect:/myprofile-auctions";
	}
	
	@RequestMapping(value = "update-auction/{id}", method = RequestMethod.GET)
	public String updateAuctionGet(Model model,  @PathVariable Integer id) {
		
		User user = userService.getLoggedInUser();
		Auction auction = auctionService.getAuctionById(id);
		
		/* Eager Fetch */
		auction.setCategories(categoryRepository.findByAuction(auction));
		auction.setAuctionBiddings(auctionBiddingRepository.findByAuction(auction));
		
		/* Security Check */
		if(user == null || user.getUserid() != auction.getUser().getUserid())
			return "403";
		
		/* Check if there are bids */
		if(!auction.getAuctionBiddings().isEmpty())
			return "403";
		
		/* Check if bought */
		if(auction.isBought())
			return "403";
		
		/* Initialize FormAuction */
		FormAuction formAuction = new FormAuction();
		Location location = auction.getLocation();
		List<Category> auctionCategories = auction.getCategories();
		List<Category> categories = categoryService.getAllCategories();
		
		auction.setLocation(location);
		formAuction.setAuction(auction);
		formAuction.setCategoryName(categories.get(auctionCategories.size()-1).getName());
		
		/* Initialize images */
		List<ImageInfo> imageInfos = auctionPictureService.getAuctionImageInfo(auction);
		model.addAttribute("imageInfos", imageInfos);
		
		model.addAttribute("formAuction", formAuction);
		model.addAttribute("categories", categories);
		
		return "update-auction";
	}
	
	@RequestMapping(value = "update-auction/{id}",  method = RequestMethod.POST)
	public String updateAuctionPost(@Valid @ModelAttribute("formAuction") FormAuction formAuction, BindingResult result, Model model,
			@RequestParam(value = "input1", required = false) MultipartFile[] images, @PathVariable Integer id) {
		
		Auction perAuction = auctionService.getAuctionById(id);
		
		/* Check if there are bids */
		if(!perAuction.getAuctionBiddings().isEmpty())
			return "403";
		
		formAuction.setFiles(images);
		
		String error = auctionService.updateFormAuction(formAuction);
		
		if(error != null) {
			
			/* Eager Fetch */
			perAuction.setCategories(categoryRepository.findByAuction(perAuction));
			perAuction.setAuctionBiddings(auctionBiddingRepository.findByAuction(perAuction));
			
			/* Check if there are bids */
			if(!perAuction.getAuctionBiddings().isEmpty())
				return "403";
			
			/* Initialize images */
			List<ImageInfo> imageInfos = auctionPictureService.getAuctionImageInfo(perAuction);
			model.addAttribute("imageInfos", imageInfos);
			
			List<Category> categories = categoryService.getAllCategories();
			model.addAttribute("categories", categories);
			model.addAttribute("error", error);
			return "update-auction";
		}
		
		System.out.println("Auction Saved! " + formAuction.getAuction().getName());
		
		return "redirect:/myprofile-auctions";
	}
	
	@RequestMapping(value = "delete-image/{id}",  method = RequestMethod.GET)
	public @ResponseBody String deleteImage(@PathVariable Integer id) {
		
		String response = auctionPictureService.deleteImage(id);
		
		return response;
	}
	
	

}
