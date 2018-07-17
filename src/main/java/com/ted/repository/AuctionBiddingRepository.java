package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ted.model.Auction;
import com.ted.model.AuctionBidding;
import com.ted.model.AuctionBiddingPK;
import com.ted.model.CommonBid;
import com.ted.model.User;

@Repository("auctionBiddingRepository")
public interface AuctionBiddingRepository extends JpaRepository<AuctionBidding, AuctionBiddingPK> {
	
	List<AuctionBidding> findByUser(User user);
	
	List<AuctionBidding> findByAuction(Auction auction);
	
	Long countByUser(User user);
	
//	@Query(value = "SELECT count(*) FROM AuctionBidding a1, AuctionBidding a2 WHERE a1.user = :user1 AND a2.user = :user2 AND a1.auction = a2.auction")
//	Integer getCommonBidsCount(@Param("user1") User user1, @Param("user2") User user2);
	
//	@Query(value = "select similar.bidder_userid, count(*) from auction_bidding target "
//			+ "join auction_bidding similar on target.auctionid = similar.auctionid and target.bidder_userid != similar.bidder_userid "
//			+ "where target.bidder_userid = :userid"
//			+ "group by similar.bidder_userid", nativeQuery=true)
	List<CommonBid> getCommonBidsCount(@Param("userid") int userid);
	
//	List<CommonBid> getAllBidsCount();
	
	@Query(value = "SELECT NEW com.ted.model.CommonBid(a.user.userid, COUNT(*)) FROM AuctionBidding as a GROUP BY a.user")
	List<CommonBid> getAllBidsCount();
	
	@Query(value = "SELECT a.auction FROM AuctionBidding a WHERE a.user = :user")
	List<Auction> findAuctionsByUser(@Param("user") User user);
	
	@Query(value = "SELECT SUM(similarity) FROM similar WHERE user1_id = :userid AND user2_id IN "
			+ "(SELECT bidder_userid FROM auction_bidding WHERE auctionid = :auctionid AND "
			+ "bidder_userid != :userid AND bidder_userid IN (SELECT user2_id FROM similar WHERE user1_id = :userid));", nativeQuery = true)
	Double findCommonSimilarities(@Param("userid") int userid, @Param("auctionid") int auctionid);
	
	List<AuctionBidding> findTop10ByOrderByTime();
}
