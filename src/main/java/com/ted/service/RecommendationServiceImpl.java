package com.ted.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.Auction;
import com.ted.model.CommonBid;
import com.ted.model.Recommendation;
import com.ted.model.RecommendationPK;
import com.ted.model.Similar;
import com.ted.model.SimilarPK;
import com.ted.model.User;
import com.ted.repository.AuctionBiddingRepository;
import com.ted.repository.AuctionRepository;
import com.ted.repository.RecommendationRepository;
import com.ted.repository.SimilarRepository;
import com.ted.repository.UserRepository;

@Service("recommendationService")
@EnableAsync
@EnableScheduling
public class RecommendationServiceImpl implements RecommendationService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	AuctionRepository auctionRepository;
	
	@Autowired 
	AuctionBiddingRepository auctionBiddingRepository;
	
	@Autowired
	SimilarRepository similarRepository;
	
	@Autowired
	RecommendationRepository recommendationRepository;
	
	@Autowired
	UserService userService;
	
	@PersistenceContext
    private EntityManager entityManager;
	
//	@Scheduled(fixedDelay = 3600000)		// Every hour
	@Transactional
	public void updateSimilarUsers() {
		
		List<User> users = userRepository.findAll();
		HashMap<Integer, User> userMap = new HashMap<>();
		for(User user : users)
			userMap.put(user.getUserid(), user);
		
		List<CommonBid> allBidsCounts = auctionBiddingRepository.getAllBidsCount();
		HashMap<Integer, Long> countsMap = new HashMap<>();
		for(CommonBid countBids : allBidsCounts)
			countsMap.put(countBids.getUserid(), countBids.getCount());
		
		/* Compare all users loop*/
		for(User user1 : users) {
			List<Similar> similarUsers = new ArrayList<>();
			Similar min = new Similar();	// min similarity value
			min.setSimilarity(0.0);	
			
			List<CommonBid> commonBids = auctionBiddingRepository.getCommonBidsCount(user1.getUserid());
				
//			Long user1Bids = auctionBiddingRepository.countByUser(user1);
			Long user1Bids = countsMap.get(user1.getUserid());
			
			for(CommonBid commonBid : commonBids) {
				
				User user2 = userMap.get(commonBid.getUserid());
//				Long user2Bids = auctionBiddingRepository.countByUser(user2);
				Long user2Bids = countsMap.get(user2.getUserid());
				
				Double similarity = similarity(commonBid.getCount(), user1Bids, user2Bids);		// get similarity from cosine
				if(similarity < 1.0) {
					if(similarUsers.size() >= 20) {														// Neighborhood size <= 20
						if(similarity > min.getSimilarity()) {
							similarUsers.remove(min);
							
							/* New similar object */
							Similar similar = new Similar();
							SimilarPK similarPK = new SimilarPK();
							similarPK.setUser1Id(user1.getUserid());
							similarPK.setUser2Id(user2.getUserid());
							similar.setId(similarPK);
							similar.setSimilarity(similarity);
							
							similarUsers.add(similar);
							
							/* Sort similarUsers */
							Collections.sort(similarUsers, new SimilarityComparator());
							min = similarUsers.get(0);
						}
					}
					else {
						/* New similar object */
						Similar similar = new Similar();
						SimilarPK similarPK = new SimilarPK();
						similarPK.setUser1Id(user1.getUserid());
						similarPK.setUser2Id(user2.getUserid());
						similar.setId(similarPK);
						similar.setSimilarity(similarity);
						
						similarUsers.add(similar);
						
						if(similarity < min.getSimilarity())
							min = similar;
					}
				}
			}
			
			/* Persist top User Similarities */
			for(Similar similar : similarUsers) {
				similarRepository.save(similar);
			}
		}
		System.out.println("UpdateSimilarUsers Ended.");
		updateRecommendations();
	}
	
//	@Scheduled(fixedDelay = 2000000)
	public void  updateRecommendations() {
		
		List<User> users = similarRepository.getUsersWithSimilarity();
		for(User user : users) {
			
			List<Recommendation> recs = new ArrayList<>();
			Recommendation min = new Recommendation();	// min prediction value
			min.setPrediction(0.0);
			
			List<Similar> similars = similarRepository.findByUser1(user);
				
			if(!similars.isEmpty()) {
				List<Auction> auctions = auctionRepository.findBySimilarUsers(user.getUserid());	// Auctions from neighborhood
				for(Auction auction : auctions) {
					
					Double prediction = prediction(user, similars, auction);	
					if(recs.size() >= 16) {														// Recommendations <= 16
						if(prediction > min.getPrediction()) {
							recs.remove(min);
							
							/* New Recommendation object */
							Recommendation rec = new Recommendation();
							RecommendationPK recPK = new RecommendationPK();
							recPK.setAuctionId(auction.getAuctionid());
							recPK.setUserId(user.getUserid());
							rec.setId(recPK);
							rec.setPrediction(prediction);
							
							recs.add(rec);
							
							/* Sort similarUsers */
							Collections.sort(recs, new PredictionComparator());
							min = recs.get(0);
						}
					}
					else {
						/* New Recommendation object */
						Recommendation rec = new Recommendation();
						RecommendationPK recPK = new RecommendationPK();
						recPK.setAuctionId(auction.getAuctionid());
						recPK.setUserId(user.getUserid());
						rec.setId(recPK);
						rec.setPrediction(prediction);
						
						recs.add(rec);
						
						if(prediction < min.getPrediction())
							min = rec;
					}
				
				}
				
				/* Persist top User Recommendations */
				for(Recommendation rec : recs) {
					recommendationRepository.saveAndFlush(rec);
				}
			}
		}
		System.out.println("UpdateRecommentations Ended");
	}
	
	double similarity(Long commonBids, Long user1Bids, Long user2Bids) {
		
		if(user1Bids == 0 || user2Bids == 0)
			return 0;
		
		return commonBids/(Math.sqrt(user1Bids.doubleValue()) * Math.sqrt(user2Bids.doubleValue()));
		
	}
	
	double prediction(User user, List<Similar> similars, Auction auction) {
		
		/* Sum of the similarities of all the neighbor users that have bid the auction */
		Double commonSimilaritiesSum = auctionBiddingRepository.findCommonSimilarities(user.getUserid(), auction.getAuctionid());
		Integer neighborhoodSize = similars.size();
		
		Double prediction = commonSimilaritiesSum/neighborhoodSize;	
		
		return prediction;
		
	}

	public List<Auction> getRecommendations() {
		
		List<Integer> recAuctionsIds = null;
		User user = userService.getLoggedInUser();
		
		if(user != null) {
			recAuctionsIds = recommendationRepository.getRecommendedAuctionsIds(user.getUserid());
		
			if(recAuctionsIds.size() < 16) {
				List<Integer> topAuctionsIds = auctionRepository.getTopAuctionsIds(16 - recAuctionsIds.size());
				recAuctionsIds.addAll(topAuctionsIds);
			}
		}
		else {
			recAuctionsIds = auctionRepository.getTopAuctionsIds(16);
		}
		
		List<Auction> auctions = auctionRepository.findByAuctionidIn(recAuctionsIds);
		
		return auctions;
		
	}
	
}


	
class SimilarityComparator implements Comparator<Similar> {

	  public int compare(Similar x, Similar y) {

	    int startComparison = compare(x.getSimilarity(), y.getSimilarity());
	    return startComparison != 0 ? startComparison
	                                : compare(x.getSimilarity(), y.getSimilarity());
	  }
	  private int compare(double a, double b) {
	    return a < b ? -1
	         : a > b ? 1
	         : 0;
	  }
}

class PredictionComparator implements Comparator<Recommendation> {

	  public int compare(Recommendation x, Recommendation y) {

	    int startComparison = compare(x.getPrediction(), y.getPrediction());
	    return startComparison != 0 ? startComparison
	                                : compare(x.getPrediction(), y.getPrediction());
	  }
	  private int compare(double a, double b) {
	    return a < b ? -1
	         : a > b ? 1
	         : 0;
	  }
}

