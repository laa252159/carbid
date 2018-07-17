package com.ted.model;

import java.util.List;

public class BidResponse {
	
	List<Bid> bids;
	
	AuctionInfo info;

	public List<Bid> getBids() {
		return bids;
	}

	public void setBids(List<Bid> bids) {
		this.bids = bids;
	}

	public AuctionInfo getInfo() {
		return info;
	}

	public void setInfo(AuctionInfo info) {
		this.info = info;
	}
}
