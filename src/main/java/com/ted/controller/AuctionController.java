package com.ted.controller;


import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.ted.model.*;
import com.ted.service.*;
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

import com.ted.repository.AuctionBiddingRepository;
import com.ted.repository.CategoryRepository;

@Controller
@SessionAttributes("filter")
public class AuctionController extends AbstractController {

	public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
			Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private RecommendationService recommendationService;
	
	@Autowired
	private AuctionPictureService auctionPictureService;
	
	@Autowired
	private AuctionBiddingRepository auctionBiddingRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private Filter filter;

	@Autowired
	private SuggestionService suggestionService;


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
	
	@RequestMapping(value = {"auctions"} , method = RequestMethod.GET)
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

	@RequestMapping(value = {"/", ""} , method = RequestMethod.GET)
	public String getIndex(Model model, HttpServletRequest request) {

		auctionService.updateFilter(request);

		Page<Auction> auctions = auctionService.pageAuctions(request);
		List<Auction> auctionList = auctions.getContent();
		auctionList = auctionService.putImagesForGallery(auctionList);
		model.addAttribute("auctions", auctionList);

		System.out.println(filter.getSortBy());

		model.addAttribute("filter", filter);

		User user = userService.getLoggedInUser();
		if(user != null){
			boolean approved = user.getApproved() > (byte)0 ? true : false;
			request.getSession().setAttribute("approved", approved);
		}

		return "index";
	}

	@RequestMapping(value = {"/contract_page"} , method = RequestMethod.GET)
	public String getContract(Model model, HttpServletRequest request) {
		return "contract_page";
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
		
//		if(bidAmount == null || bidAmount.isEmpty())
//			return "Please provide a price.";
		
//		String msg = auctionService.bidSave(id, new Integer(bidAmount));

		Auction auction = auctionService.getAuctionById(id);

		//hardcode + 1000 rubles
		int amount = auction.getCurrently();
		int bidValue = new Integer(bidAmount);
		if (bidValue > 1 || !auction.getAuctionBiddings().isEmpty()) {
			amount += 1;
		}

		String msg = auctionService.bidSave(id, amount);

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
		formAuction.setCategoryName("cars");


		model.addAttribute("formAuction", formAuction);
		model.addAttribute("categories", categories);
		
		return "edit-auction";
	}
	
	@RequestMapping(value = "new-auction",  method = RequestMethod.POST)
	public String newAuctionPost(@Valid @ModelAttribute("formAuction") FormAuction formAuction, BindingResult result, Model model,
			@RequestParam(value = "input1", required = false) MultipartFile[] images) {
		
		formAuction.setCategoryName("cars");

		String error = auctionService.validateFormAuction(formAuction);

		if(error != null) {
			List<Category> categories = categoryService.getAllCategories();
			model.addAttribute("categories", categories);
			model.addAttribute("error", error);
			return "edit-auction";
		}

		formAuction.setFiles(images);
		auctionService.saveAndUpdateFormAuction(formAuction);

		model.addAttribute("formAuction",formAuction);

		System.out.println("Auction Saved! " + formAuction.getAuction().getName());
		
		return "redirect:/auctions";
	}

    @RequestMapping(value = "suggest-auction", method = RequestMethod.GET)
    public String suggestAuctionGet(Model model) {

        SuggestAuctionDto suggestAuctionDto = new SuggestAuctionDto();

        model.addAttribute("suggestAuctionDto", suggestAuctionDto);

        return "suggest-auction-page";
    }

	@RequestMapping(value = "suggest-auction",  method = RequestMethod.POST)
	public void suggestAuctionPost(@Valid @ModelAttribute("formSuggestAuction") SuggestAuctionDto suggestAuctionDto,
                                     BindingResult result, HttpServletRequest request, Model model,
                                     @RequestParam(value = "input1", required = false) MultipartFile image, HttpServletResponse response) throws IOException {
		suggestAuctionDto.setPhoto(image);
		Matcher matcher = VALID_EMAIL_ADDRESS_REGEX .matcher(suggestAuctionDto.getEmail());
		boolean emailIsInvalid =  !matcher.find();
        model.addAttribute("suggestAuctionDto", suggestAuctionDto);
		if(suggestAuctionDto.getName().isEmpty() ||
				suggestAuctionDto.getEmail().isEmpty() ||
				suggestAuctionDto.getBrand().isEmpty() ||
				suggestAuctionDto.getModel().isEmpty() ||
				suggestAuctionDto.getPhone().isEmpty() ||
				suggestAuctionDto.getYear().isEmpty() ||
				image.getSize() == 0 ||
				emailIsInvalid){
			model.addAttribute("notAll",true);
			response.sendRedirect("/suggest-auction-page");
		}
        if(!isCaptchaValid(request.getParameter("g-recaptcha-response"))){
			response.sendRedirect("/suggest-auction-page");
        }
		auctionService.suggestFormAuction(suggestAuctionDto);
		response.sendRedirect("/operation-success");
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
		if (!auction.getAuctionBiddings().isEmpty()) {
			model.addAttribute("errorMsg", "Данный аукцион имеет ставки. Редактировать уже нельзя!");
			return "errorPage";
		}
		
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

		formAuction = auctionService.allocateElements(formAuction, auction.getDamagedElements());
        formAuction.setCategoryName("cars");

		model.addAttribute("formAuction", formAuction);
		model.addAttribute("categories", categories);
		
		return "edit-auction";
	}
	
	@RequestMapping(value = "update-auction/{id}",  method = RequestMethod.POST)
	public String updateAuctionPost(@Valid @ModelAttribute("formAuction") FormAuction formAuction, BindingResult result, Model model,
			@RequestParam(value = "input1", required = false) MultipartFile[] images, @PathVariable Integer id) {
		
		Auction perAuction = auctionService.getAuctionById(id);
		
		/* Check if there are bids */
		if(!perAuction.getAuctionBiddings().isEmpty())
			return "403";
		
		String error = auctionService.validateFormAuction(formAuction);
		
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
			return "edit-auction";
		}

		formAuction.setFiles(images);
		auctionService.saveAndUpdateFormAuction(formAuction);

		System.out.println("Auction Saved! " + formAuction.getAuction().getName());
		
		return "redirect:/auctions";
	}
	
	@RequestMapping(value = "delete-image/{id}",  method = RequestMethod.GET)
	public @ResponseBody String deleteImage(@PathVariable Integer id) {
		
		String response = auctionPictureService.deleteImage(id);
		
		return response;
	}

	@RequestMapping(value = "operation-success", method = RequestMethod.GET)
	public String successGet() {
		return "success";
	}

	@RequestMapping(value = "promo-page", method = RequestMethod.GET)
	public String promoGet(Model model) {

		PromoDto promoDto = new PromoDto();

		model.addAttribute("promoDto", promoDto);

		return "promo-page";
	}

	@RequestMapping(value = "suggestions-page", method = RequestMethod.GET)
	public String suggestionsGet(Model model) {
		List<Suggestion> allSuggestions = suggestionService.getAllSuggestions();
		model.addAttribute("suggestions", allSuggestions);
		return "suggestions-page";
	}


	@RequestMapping(value = "promo-page",  method = RequestMethod.POST)
	public String promoPost(@Valid @ModelAttribute("promoDto") PromoDto promoDto) {
		if(promoDto.getSuggestion().isEmpty() || promoDto.getSubject().isEmpty()){
			return "promo-page";
		}
		auctionService.spamPromo(promoDto);
		return "success";
	}
	

}
