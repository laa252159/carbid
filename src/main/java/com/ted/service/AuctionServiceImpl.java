package com.ted.service;


import com.ted.model.*;
import com.ted.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Service("auctionService")
public class AuctionServiceImpl implements AuctionService {

	private static final String DELIMETER = ":";

	public static int AUCTIONS_ON_PAGE = 5;

	@Autowired
	AuctionRepository auctionRepository;

	@Autowired
	AuctionMoreInfoRepository auctionMoreInfoRepository;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	AuctionBiddingRepository auctionBiddingRepository;

	@Autowired
	LocationRepository locationRepository;

	@Autowired
	AuctionPictureService auctionPictureService;

	@Autowired
	UserService userService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	Filter filter;

	@Autowired
	AuctionMapper auctionMapper;

	@Autowired
	MessageRepository messageRepository;

	@Autowired
	private MailService mailer;

	@Transactional
	public void saveAuction(Auction auction) {

		auctionRepository.save(auction);

	}

	public List<Auction> getAllAuctions() {

		return auctionRepository.findAllByOrderByStarted();

	}

	@Override
	public List<Auction> getBoughtAuctions() {

		return auctionRepository.findByIsBought(true);

	}

	public Auction getAuctionById(Integer id) {

		return auctionRepository.findByAuctionid(id);

	}

	/* Paging and filtering results */
	public Page<Auction> pageAuctions(HttpServletRequest request) {

		String pageString = request.getParameter("page");
		Integer pageNumber = 1;

		Page<Auction> auctions = null;

		Sort sort = null;
		Pageable page = null;

		sort = new Sort(Sort.Direction.ASC, filter.getSortBy());

		if(pageString != null) {
			pageNumber = Integer.parseInt(pageString);
			page = new PageRequest(pageNumber - 1, AUCTIONS_ON_PAGE, sort);
		}
		else {
			page = new PageRequest(0, AUCTIONS_ON_PAGE, sort);
			filter.setSearchString(null);
		}

		if(filter.getCategory() != null) {
			auctions = auctionRepository.findByCategory(filter.getCategory(), page);
			//auctions = auctionRepository.findAll(page);
		}
		else {
			if(filter.getSearchString() == null)
				auctions = auctionRepository.findByIsBought(false, page);
			else
				auctions = auctionRepository.findByNameContainingAndIsBought(filter.getSearchString(), false, page);
		}

		filter.setNumberofPages(auctions.getTotalPages());
		filter.setNumberofItems(auctions.getTotalElements());
		filter.setPageNum(pageNumber);

		/* Paging order */
		ArrayList<Integer> pageList = new ArrayList<Integer>();

		for(int i = 3; i > 0; i--) {
			if(pageNumber - i > 0)
				pageList.add(pageNumber - i);
		}
		pageList.add(pageNumber);
		for(int j = 1; j < 4; j++) {
			if(pageNumber + j < filter.getNumberofPages())
				pageList.add(pageNumber + j);
		}

		filter.setPages(pageList);

		return auctions;

	}

	/* Update filter session bean */
	public void updateFilter(HttpServletRequest request) {

		String categoryId = request.getParameter("categoryId");
		String price = request.getParameter("price");
		String sortBy = request.getParameter("sortBy");
		String searchString = request.getParameter("searchString");

		if(categoryId != null) {
			if(categoryId.equals("all"))
				filter.setCategory(null);
			else
				filter.setCategory(categoryRepository.findByCategoryId(Integer.parseInt(categoryId)));
		}

		if(price != null) {
			filter.setPrice(price);
		}

		if(sortBy != null) {
			filter.setSortBy(sortBy);

			if(sortBy.equals("ends"))
				filter.setSortByOutput("Дата окончания");
			else if(sortBy.equals("firstBid")) {
				filter.setSortByOutput("Стартовая цена");
			}
		}

		if(searchString != null)
			filter.setSearchString(" " + searchString + " ");
	}

	/* Response preparation for ajax request checkBids */
	public BidResponse checkBids(Integer numofBids, Integer auctionId) {

		Auction auction = getAuctionById(auctionId);
		BidResponse bidResponse = new BidResponse();
		List<Bid> bids = new ArrayList<Bid>();

		/* Loop for 30 seconds */
		for(int i = 0; i < 300; i++) {

//			auction = getAuctionById(id);
//
//			List<AuctionBidding> biddings = auction.getAuctionBiddings();

			initializeMapper(auctionId);	// Initializes if mapping doesn't exist

			AuctionInfo info = auctionMapper.getAuctionInfo(auctionId);	// Gets the current number of bids for the auction
			info.setNumofBids(auction.getAuctionBiddings().size());
			/* If there are new bids the response is prepared */
			if(info.getNumofBids() > numofBids) {

				System.out.println("Preparing response with " + (info.getNumofBids() - numofBids) + "bids");

				/* Eager Fetch */
				auction.setAuctionBiddings(auctionBiddingRepository.findByAuction(auction));
				List<AuctionBidding> biddings = auction.getAuctionBiddings();

				/* Sort bids */
				Collections.sort(biddings, new BidTimeComparator());
				if(biddings.size()>4){
					biddings = biddings.subList(biddings.size()-3, biddings.size());
				}
				for (AuctionBidding bidding : biddings) {
					Bid bid = new Bid();
					bid.setAmount(bidding.getId().getAmount());
					bid.setTime(bidding.getTime().getTime());
					bid.setUsername(bidding.getUser().getUsername());

					bids.add(bid);
				}

				/* Check if Auction ended */
				if(auction.getEnds().getTime() < new Date().getTime()) {
					info.setBought(true);
					auction.setBought(true);
					auctionRepository.saveAndFlush(auction);
				}

				bidResponse.setBids(bids);
				bidResponse.setInfo(info);

				return bidResponse;
			}

			/* Check if Auction ended */
			if(info.getEnds() < new Date().getTime()) {
				info.setBought(true);
				auction = getAuctionById(auctionId);
				auction.setBought(true);
				auctionRepository.saveAndFlush(auction);

				info.setNumofBids(numofBids);
				bidResponse.setInfo(info);
				return bidResponse;
			}

			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}

		System.out.println("Loop end");

		AuctionInfo info = new AuctionInfo();
		info.setNumofBids(numofBids);

		bidResponse.setInfo(info);

		return bidResponse;
	}

	/* Synchronized method to avoid race condition on persisting bid and updating AuctionMapper singleton bean */
	public synchronized String bidSave(Integer auctionId, Integer bidAmount) {

		System.out.println("Persisting amount: " + bidAmount);

		User user = userService.getLoggedInUser();
		if(user == null)
			return "Not logged in";

		/* Check if auction id bought or bidAmount > latest bid amount */
		AuctionInfo info = auctionMapper.getAuctionInfo(auctionId);

		if(info.isBought()) {
			String msg = "The auction is already bought.";
			return msg;
		}
//        if (info.getLatestBid() != null) {
//            if (info.getLatestBid().compareTo(bidAmount) != -1) {
//                String msg = "Your bid must be bigger than the current price.";
//                return msg;
//            }
//        } else {
//
//        }
		if(info.getEnds() < new Date().getTime()) {
			String msg = "The time has ended.";
			return msg;
		}

		/* Check and Update Currently */
		Auction auction = auctionRepository.findByAuctionid(auctionId);
//		if(auction.getCurrently().compareTo(bidAmount) != -1) {
//			String msg = "Your bid must be bigger than the current price.";
//			return msg;
//		}
		auction.setCurrently(bidAmount);
		auction.setNumberOfBids(auction.getNumberOfBids()+1);

		/* Persist Bid */
		AuctionBidding auctionBidding = new AuctionBidding();
//		auctionBidding.setAmount(bidAmount);
		auctionBidding.setTime(new Date());

		AuctionBiddingPK auctionBiddingPK = new AuctionBiddingPK();
		auctionBiddingPK.setAuctionid(auctionId);
		auctionBiddingPK.setBidderUserid(user.getUserid());
		auctionBiddingPK.setAmount(bidAmount);

		auctionBidding.setId(auctionBiddingPK);

		auctionBiddingRepository.saveAndFlush(auctionBidding);


		System.out.println("Updating auctionMapper: " + bidAmount);

		/* Update auctionMapper */
		if(info.getBuyPrice() != null) {
			if(info.getBuyPrice().compareTo(bidAmount) != 1)
				/* Check if bidAmount >= buyPrice */
				if(auction.getBuyPrice().compareTo(bidAmount) != 1) {
					auction.setBought(true);
					info.setBought(true);
				}
			else
				info.setBought(false);
		}
		else
			info.setBought(false);

		/* Set Buyer */
		info.setBuyer(user.getUsername());
		auction.setBuyer(user);
		info.setLastBidIsMy(user.getUserid() == auction.getBuyer().getUserid());

		info.setLatestBid(bidAmount);
		info.setNumofBids(info.getNumofBids()+1);
//		info.setEnds(auctionBidding.getTime().getTime());
		auctionMapper.setAuctionInfo(auctionId, info);

		/* Update Auction */
		auctionRepository.saveAndFlush(auction);

		System.out.println("Persisted amount: " + bidAmount);

		return null;

	}

	public void initializeMapper(Integer auctionId) {

		/* Initialize Auction Mapping if it doesn't exist */
		if(!auctionMapper.getMapper().containsKey(auctionId)) {

			Auction auction = getAuctionById(auctionId);
			/* Eager Fetch */
			auction.setAuctionBiddings(auctionBiddingRepository.findByAuction(auction));
			List<AuctionBidding> biddings = auction.getAuctionBiddings();

			Integer numofBids = biddings.size();
			Collections.sort(biddings, new BidTimeComparator()); 	// Sort bids

			/* Auction Info */
			AuctionInfo info = new AuctionInfo();
			info.setEnds(auction.getEnds().getTime());
			info.setBuyPrice(auction.getBuyPrice());
			info.setBought(auction.isBought());
			info.setNumofBids(numofBids);
			if(numofBids > 0)
				info.setLatestBid(biddings.get(numofBids-1).getId().getAmount());
			if(auction.isBought() && !biddings.isEmpty())
				info.setBuyer(biddings.get(numofBids-1).getUser().getUsername());

			auctionMapper.setAuctionInfo(auctionId, info);
		}
	}

	public String validateFormAuction(FormAuction formAuction) {
		Auction auction = formAuction.getAuction();
		/* Check */
//		if(formAuction.getCategoryName() == null || formAuction.getCategoryName().isEmpty())
//			return "You must select a category for the Auction.";
		if(auction.getEnds() == null || auction.getEnds().getTime() < new Date().getTime())
			return "Please provide a future date as Ending date.";

		/* Seller */
		User user = userService.getLoggedInUser();
		if(user == null)
			return "You must be logged in to create an auction.";
		return null;
	}

    @Override
    public void suggestFormAuction(SuggestAuctionDto suggestAuctionDto) {
        mailer.suggestAuction(suggestAuctionDto);
    }

	@Override
	public void spamPromo(PromoDto promoDto) {
		mailer.spamPromo(promoDto);
	}

	//использовать после validateFormAuction(FormAuction formAuction)
	public void saveAndUpdateFormAuction(FormAuction formAuction) {
		boolean isNew = false;
		/* Copy new Auction Info */
		Auction dtoAuction = formAuction.getAuction();
		Auction auction = auctionRepository.findByAuctionid(dtoAuction.getAuctionid());
		AuctionMoreInfo auctionMoreInfo;
		if(auction == null) {							//в случае создания аукциона
			isNew = true;

			auction = dtoAuction;

			/* Starting Date */
			auction.setStarted(new Date());

			/* Seller */
			User user = userService.getLoggedInUser();
			auction.setUser(user);


			/* IsBought */
			auction.setBought(false);
			auctionMoreInfo = new AuctionMoreInfo();
			auction.setAuctionMoreInfo(auctionMoreInfo);
		} else {									//в случае редактирования существующего аукциона
			auctionMoreInfo = auction.getAuctionMoreInfo();
			if(auctionMoreInfo == null){
				auctionMoreInfo = new AuctionMoreInfo();
				auction.setAuctionMoreInfo(auctionMoreInfo);
			}
			auction.setBuyPrice(dtoAuction.getBuyPrice());
			auction.setDescription(dtoAuction.getDescription());
			auction.setEnds(dtoAuction.getEnds());
			auction.setName(dtoAuction.getName());
			auction.setFirstBid(dtoAuction.getFirstBid());


			auction.setBrand(formAuction.getAuction().getBrand());
			auction.setModel(formAuction.getAuction().getModel());
			auction.setReleased(formAuction.getAuction().getReleased());
			auction.setRun(formAuction.getAuction().getRun());
			auction.setEngineType(formAuction.getAuction().getEngineType());
			auction.setPower(formAuction.getAuction().getPower());
			auction.setTransmission(formAuction.getAuction().getTransmission());
			auction.setBody(formAuction.getAuction().getBody());
			auction.setDrive(formAuction.getAuction().getDrive());
			auction.setColor(formAuction.getAuction().getColor());
			auction.setDoors(formAuction.getAuction().getDoors());
			auction.setBodyState(formAuction.getAuction().getBodyState());
			auction.setOwners(formAuction.getAuction().getOwners());
			auction.setVin(formAuction.getAuction().getVin());
			auction.setGibdd(formAuction.getAuction().getGibdd());
			auction.setFssp(formAuction.getAuction().getFssp());
			auction.setDriveState(formAuction.getAuction().getDriveState());
			auction.setEngineState(formAuction.getAuction().getEngineState());
		}

		/* Location */
		auction.setLocation(saveLocation(dtoAuction.getLocation()));

		formAuction.setCategoryName("cars");

		/* Categories */
		Category category = categoryRepository.findByName(formAuction.getCategoryName());
		auction.setCategories(categoryService.getParentCategories(category));

		/* Currently Price */
		auction.setCurrently(auction.getFirstBid());

		/* Price Strings for XML */
		if(auction.getBuyPrice() != null)
			auction.setBuyPriceString(dtoAuction.getBuyPrice().toString());
		auction.setFirstBidString(auction.getFirstBid().toString());
		auction.setCurrentlyString(auction.getCurrently().toString());





		auction.setDamagedElements(collectElements(formAuction));

		fillAuctionMoreInfoFromForm(formAuction, auctionMoreInfo);
		auctionMoreInfo.setAuctionid(auction.getAuctionid());
		auctionMoreInfoRepository.saveAndFlush(auctionMoreInfo);

		//получаем айди для нового, сохраняя в БД
		if(isNew){
			auction = auctionRepository.saveAndFlush(auction);
		}

		/* Pictures */
		MultipartFile[] files = formAuction.getFiles();
		if (files != null && !files[0].isEmpty())
			auction.setAuctionPictures(auctionPictureService.saveMultipartList(files, auction));

		/* Persist Auction */
		auctionRepository.saveAndFlush(auction);

		if(isNew){
			//notify approved users about auction
			mailer.notifyUsersAboutNewAuction(auction);
		}
	}

	// с UI
	private void fillAuctionMoreInfoFromForm(FormAuction formAuction, AuctionMoreInfo auctionMoreInfo){
		auctionMoreInfo.setPowerSteering(formAuction.getPowerSteering());
		auctionMoreInfo.setConditioner(formAuction.isConditioner());
		auctionMoreInfo.setClimateControl(formAuction.isClimateControl());
		auctionMoreInfo.setControlOnWheel(formAuction.isControlOnWheel());
		auctionMoreInfo.setLeatherWheel(formAuction.isLeatherWheel());
		auctionMoreInfo.setSunRoof(formAuction.isSunRoof());
		auctionMoreInfo.setHeatedSeatsFront(formAuction.isHeatedSeatsFront());
		auctionMoreInfo.setHeatedSeatsBack(formAuction.isHeatedSeatsBack());
		auctionMoreInfo.setHeatedMirrors(formAuction.isHeatedMirrors());
		auctionMoreInfo.setHeatedWheel(formAuction.isHeatedWheel());
		auctionMoreInfo.setHeatedWheel(formAuction.isHeatedWheel());
		auctionMoreInfo.setPowerWindows(formAuction.getPowerWindows());
		auctionMoreInfo.setPowerSeatsFront(formAuction.isPowerSeatsFront());
		auctionMoreInfo.setPowerMirrors(formAuction.isPowerMirrors());
		auctionMoreInfo.setLightSensor(formAuction.isLightSensor());
		auctionMoreInfo.setFrontParkingSensors(formAuction.isFrontParkingSensors());
		auctionMoreInfo.setRearParkingSensors(formAuction.isRearParkingSensors());
		auctionMoreInfo.setCruiseControl(formAuction.isCruiseControl());
		auctionMoreInfo.setOnBoardComputer(formAuction.isOnBoardComputer());
		auctionMoreInfo.setAlarm(formAuction.isAlarm());
		auctionMoreInfo.setAutostart(formAuction.isAutostart());
		auctionMoreInfo.setAirbags(formAuction.isAirbags());
		auctionMoreInfo.setAbs(formAuction.isAbs());
		auctionMoreInfo.setAntiSlip(formAuction.isAntiSlip());
		auctionMoreInfo.setDirectionalStability(formAuction.isDirectionalStability());
		auctionMoreInfo.setGps(formAuction.isGps());
		auctionMoreInfo.setCarStereo(formAuction.getCarStereo());
		auctionMoreInfo.setCarStereo(formAuction.getCarStereo());
		auctionMoreInfo.setSubwoofer(formAuction.isSubwoofer());
		auctionMoreInfo.setHeadlights(formAuction.getHeadlights());
		auctionMoreInfo.setWinterTires(formAuction.isWinterTires());
		auctionMoreInfo.setVehicleLogBook(formAuction.isVehicleLogBook());
		auctionMoreInfo.setWarrantyOn(formAuction.isWarrantyOn());
	}




    public FormAuction allocateElements(FormAuction form, String damagedElements) {
        if (damagedElements != null && !damagedElements.trim().isEmpty()) {
            String[] vals = damagedElements.split(DELIMETER);
            for (String str : vals) {
                String[] arr = str.split("_");
                int number = new Integer(arr[0]);
                switch (number) {
                    case 1:
                        form.setEl1(arr[1]);
                        break;
                    case 2:
                        form.setEl2(arr[1]);
                        break;
                    case 3:
                        form.setEl3(arr[1]);
                        break;
                    case 4:
                        form.setEl4(arr[1]);
                        break;
                    case 5:
                        form.setEl5(arr[1]);
                        break;
                    case 6:
                        form.setEl6(arr[1]);
                        break;
                    case 7:
                        form.setEl7(arr[1]);
                        break;
                    case 8:
                        form.setEl8(arr[1]);
                        break;
                    case 9:
                        form.setEl9(arr[1]);
                        break;
                    case 10:
                        form.setEl10(arr[1]);
                        break;
                    case 11:
                        form.setEl11(arr[1]);
                        break;
                    case 12:
                        form.setEl12(arr[1]);
                        break;
                    case 13:
                        form.setEl13(arr[1]);
                        break;
                }
            }
        }
        return form;
    }

	private String collectElements(FormAuction form){
		StringBuilder elements = new StringBuilder();

		addElementData(form.getEl1(), elements);
		addElementData(form.getEl2(), elements);
		addElementData(form.getEl3(), elements);
		addElementData(form.getEl4(), elements);
		addElementData(form.getEl5(), elements);
		addElementData(form.getEl6(), elements);
		addElementData(form.getEl7(), elements);
		addElementData(form.getEl8(), elements);
		addElementData(form.getEl9(), elements);
		addElementData(form.getEl10(), elements);
		addElementData(form.getEl11(), elements);
		addElementData(form.getEl12(), elements);
		addElementData(form.getEl13(), elements);

		return elements.toString();
	}

	private StringBuilder addElementData(String string, StringBuilder sb) {
		if (string != null && !(string.trim()).isEmpty()) {
			sb.append(string.trim());
			sb.append(DELIMETER);
		}
		return sb;
	}

	@Transactional
	public Location saveLocation(Location location) {

		Location loc = locationRepository.findByName(location.getName());

		if(loc == null)
			locationRepository.save(location);
		else if(location.getLatitude() != null || location.getLongitude() != null) {
			loc.setLatitude(location.getLatitude());
			loc.setLongitude(location.getLongitude());
			locationRepository.save(loc);
		}
		return locationRepository.findByName(location.getName());
	}

	public List<Auction> getUserAuctions(User user) {

		List<Auction> auctions = auctionRepository.findByUserOrderByStartedDesc(user);

		if(auctions.isEmpty())
			return null;

		return auctions;

	}

	public List<Auction> putPrimaryImage(List<Auction> auctions) {

		List<Auction> rAuctions = new ArrayList<>();

		for(Auction auction : auctions){
			List<String> images = auctionPictureService.getAuctionPictures(auction);
			if(images != null)
				auction.setPrimaryImage(images.get(0));
			rAuctions.add(auction);
		}

		return rAuctions;

	}

	@Override
	public List<Auction> putImagesForGallery(List<Auction> auctions) {
		List<Auction> rAuctions = new ArrayList<>();

		for(Auction auction : auctions){
			List<String> images = auctionPictureService.getAuctionPictures(auction);
			if(images != null)
				if(images.size() > 5){
					images = images.subList(images.size()-5, images.size());
					auction.setImagesForGallery(images);
				} else {
					auction.setImagesForGallery(images);
				}
			rAuctions.add(auction);
		}

		return rAuctions;
	}


	public List<Auction> getBuyerAuctions(User user) {

		List<Auction> auctions = auctionRepository.findByBuyerOrderByStartedDesc(user);

		if(auctions.isEmpty())
			return null;

		return auctions;
	}

	@Scheduled(fixedDelay = 60000)	// Every minute
	@Transactional
	public void updateAuctions() {

		/* Update ended Auctions */
		List<Auction> auctions = auctionRepository.findByIsBought(false);
		Date now = new Date();

		for(Auction auction : auctions) {
			if(auction.getEnds().getTime() < now.getTime()) {
				auction.setBought(true);
				auctionRepository.save(auction);
			}
		}

		/* Notify Users */
		auctions = auctionRepository.findByIsBoughtAndBuyerNotified(true, false);

		for(Auction auction : auctions) {
			if(auction.getBuyer() != null)
				notifyUser(auction);

			auction.setBuyerNotified(true);
			auctionRepository.save(auction);
		}
	}

	@Transactional
	public void notifyUser(Auction auction) {

//		Message message = new Message();
//
//		message.setReceiver(auction.getBuyer());
//		message.setReceiverUsername(auction.getBuyer().getUsername());
//		message.setSender(userService.getUserById(1));
//		message.setSenderDelete((byte)1);
//		message.setSenderUsername("System Message");
//		message.setMessage("Congratulations! You've won the Auction " + auction.getName() + "!");
//
//		messageRepository.save(message);

		mailer.notifyUsersAboutVictory(auction);

	}

}

class BidTimeComparator implements Comparator<AuctionBidding> {

    public int compare(AuctionBidding a, AuctionBidding b) {
        return a.getTime().getTime() < b.getTime().getTime() ? -1 : a.getTime().getTime() == b.getTime().getTime() ? 0 : 1;
    }

}
