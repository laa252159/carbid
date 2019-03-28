package com.ted.model;


import java.util.List;

public class AuctionInfo {
	
	Integer numofBids;
	
	boolean bought;

	boolean lastBidIsMy;

	Integer latestBid;
	
	Integer buyPrice;
	
	Long ends; 
	
	String buyer;

	List<Bid> bids;

	public List<Bid> getBids() {
		return bids;
	}

	public void setBids(List<Bid> bids) {
		this.bids = bids;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public Integer getBuyPrice() {
		return buyPrice;
	}

	public Long getEnds() {
		return ends;
	}

	public Integer getLatestBid() {
		return latestBid;
	}

	public Integer getNumofBids() {
		return numofBids;
	}

	public boolean isBought() {
		return bought;
	}

	public void setBought(boolean bought) {
		this.bought = bought;
	}

	public void setBuyPrice(Integer buyPrice) {
		this.buyPrice = buyPrice;
	}

	public void setEnds(Long ends) {
		this.ends = ends;
	}

	public void setLatestBid(Integer latestBid) {
		this.latestBid = latestBid;
	}

	public void setNumofBids(Integer numofBids) {
		this.numofBids = numofBids;
	}

	public boolean isLastBidIsMy() {
		return lastBidIsMy;
	}

	public void setLastBidIsMy(boolean lastBidIsMy) {
		this.lastBidIsMy = lastBidIsMy;
	}
}
