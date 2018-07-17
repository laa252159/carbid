package com.ted.model;

import java.math.BigDecimal;

public class AuctionInfo {
	
	Integer numofBids;
	
	boolean bought;
	
	BigDecimal latestBid;
	
	BigDecimal buyPrice;
	
	Long ends; 
	
	String buyer;

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public BigDecimal getBuyPrice() {
		return buyPrice;
	}

	public Long getEnds() {
		return ends;
	}

	public BigDecimal getLatestBid() {
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

	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}

	public void setEnds(Long ends) {
		this.ends = ends;
	}

	public void setLatestBid(BigDecimal latestBid) {
		this.latestBid = latestBid;
	}

	public void setNumofBids(Integer numofBids) {
		this.numofBids = numofBids;
	}
	
	

}
