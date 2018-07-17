package com.ted.service;

import java.util.List;

import com.ted.model.Auction;

public interface RecommendationService {
	
	void updateSimilarUsers();
	
	void updateRecommendations();
	
	List<Auction> getRecommendations();
	
}
