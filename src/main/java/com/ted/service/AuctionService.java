package com.ted.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ted.model.*;
import org.springframework.data.domain.Page;

public interface AuctionService {

	void saveAuction(Auction auction);
	
	List<Auction> getAllAuctions();

	List<Auction> getBoughtAuctions();

	Page<Auction> pageAuctions(HttpServletRequest request);
	
	Auction getAuctionById(Integer id);

	void updateFilter(HttpServletRequest request);
	
	BidResponse checkBids(Integer numofBids, Integer id);
	
	String bidSave(Integer auctionId, Integer bidAmount);
	
	void initializeMapper(Integer auctionId);
	
	String saveFormAuction(FormAuction formAuction);

	void suggestFormAuction(SuggestAuctionDto suggestAuctionDto);

	List<Auction> getUserAuctions(User user);
	
	List<Auction> putPrimaryImage(List<Auction> auctions);
	
	String updateFormAuction(FormAuction formAuction);
	
	List<Auction> getBuyerAuctions(User user);
	
	void updateAuctions();
	
	void notifyUser(Auction auction);

}
