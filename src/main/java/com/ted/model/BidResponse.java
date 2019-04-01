package com.ted.model;

import java.util.List;

public class BidResponse {
	
	AuctionInfo info;

	boolean lastBidMy;

	public boolean isLastBidMy() {
		return lastBidMy;
	}

	public void setLastBidMy(boolean lastBidMy) {
		this.lastBidMy = lastBidMy;
	}

	public AuctionInfo getInfo() {
		return info;
	}

	public void setInfo(AuctionInfo info) {
		this.info = info;
	}
}
