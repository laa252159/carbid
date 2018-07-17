package com.ted.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ted.model.Dashboard;
import com.ted.repository.AuctionBiddingRepository;
import com.ted.repository.AuctionRepository;
import com.ted.repository.UserRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	AuctionRepository auctionRepository;
	
	@Autowired
	AuctionBiddingRepository auctionBiddingRepository;
	
	public Dashboard generateDashboard() {
		
		Dashboard dashboard = new Dashboard();
		
		/* Initialize Dashboard */
		dashboard.setUserNum(userRepository.count());
		
		dashboard.setNonApprovedUsers(userRepository.countByApproved((byte)0));
		
		dashboard.setSellers(userRepository.countSellers());
		
		dashboard.setBidders(dashboard.getUserNum() - dashboard.getSellers());
		
		dashboard.setNewUsers(userRepository.findTop5ByOrderByUseridDesc());
		
		dashboard.setAuctionNum(auctionRepository.count());
		
		dashboard.setNewAuctions(auctionRepository.countLast3Days());
		
		dashboard.setLatestAuctions(auctionRepository.findTop5ByOrderByStarted());
		
		dashboard.setLatestBids(auctionBiddingRepository.findTop10ByOrderByTime());
		
		return dashboard;
	}
}
