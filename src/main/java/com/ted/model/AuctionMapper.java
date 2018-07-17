package com.ted.model;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("singleton")
public class AuctionMapper {
	
	private Map<Integer, AuctionInfo> mapper;

	public Map<Integer, AuctionInfo> getMapper() {
		return mapper;
	}
	
	AuctionMapper() {
		this.mapper = new ConcurrentHashMap<Integer, AuctionInfo>();
	}

	public void setMapper(Map<Integer, AuctionInfo> mapper) {
		this.mapper = mapper;
	}
	
	public AuctionInfo getAuctionInfo(Integer auctionId) {
		return mapper.get(auctionId);
	}
	
	public void setAuctionInfo(Integer auctionId, AuctionInfo info) {
		mapper.put(auctionId, info);
	}

}
