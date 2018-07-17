package com.ted.model;

import java.util.List;

public class Dashboard {
	
	private Long userNum;
	
	private Long sellers;
	
	private Long bidders;
	
	private Long nonApprovedUsers;
	
	private Long auctionNum;
	
	private Long newAuctions;
	
	private List<AuctionBidding> latestBids;
	
	private List<User> newUsers;
	
	private List<Auction> latestAuctions;

	public Long getUserNum() {
		return userNum;
	}

	public void setUserNum(Long userNum) {
		this.userNum = userNum;
	}

	public Long getSellers() {
		return sellers;
	}

	public void setSellers(Long sellers) {
		this.sellers = sellers;
	}

	public Long getBidders() {
		return bidders;
	}

	public void setBidders(Long bidders) {
		this.bidders = bidders;
	}

	public Long getNonApprovedUsers() {
		return nonApprovedUsers;
	}

	public void setNonApprovedUsers(Long nonApprovedUsers) {
		this.nonApprovedUsers = nonApprovedUsers;
	}

	public Long getAuctionNum() {
		return auctionNum;
	}

	public void setAuctionNum(Long auctionNum) {
		this.auctionNum = auctionNum;
	}

	public Long getNewAuctions() {
		return newAuctions;
	}

	public void setNewAuctions(Long newAuctions) {
		this.newAuctions = newAuctions;
	}

	public List<AuctionBidding> getLatestBids() {
		return latestBids;
	}

	public void setLatestBids(List<AuctionBidding> latestBids) {
		this.latestBids = latestBids;
	}

	public List<User> getNewUsers() {
		return newUsers;
	}

	public void setNewUsers(List<User> newUsers) {
		this.newUsers = newUsers;
	}

	public List<Auction> getLatestAuctions() {
		return latestAuctions;
	}

	public void setLatestAuctions(List<Auction> latestAuctions) {
		this.latestAuctions = latestAuctions;
	}
	
	
}
