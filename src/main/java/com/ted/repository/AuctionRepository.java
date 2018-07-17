package com.ted.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.Auction;
import com.ted.model.Category;
import com.ted.model.User;

@Repository("auctionRepository")
public interface AuctionRepository extends JpaRepository<Auction, Long> {
	
	@Transactional
	Auction findByAuctionid(int id);
	
	@Transactional
	List<Auction> findByUserOrderByStartedDesc(User user);
	
	@Transactional
	List<Auction> findAllByOrderByStarted();
	
	@Transactional
	Page<Auction> findAll(Pageable page);
	
	@Transactional
	Page<Auction> findByIsBought(Boolean isBought, Pageable page);
	
	@Transactional
	@Query(value = "SELECT a FROM Auction a WHERE :cat MEMBER OF a.categories AND a.isBought = false")
	Page<Auction> findByCategory(@Param("cat") Category cat, Pageable page);
	
	@Transactional
	Page<Auction> findByNameContainingAndIsBought(String searchString, Boolean isBought, Pageable page);
	
	@Transactional
	@Query(value = "SELECT * FROM auctions WHERE auctionid IN (SELECT a.auctionid "
			+ "FROM auction_bidding as a WHERE a.bidder_userid IN "
			+ "(SELECT user2_id FROM similar WHERE user1_id = :userid) AND a.bidder_userid != :userid) AND isBought = 0", nativeQuery = true)
	List<Auction> findBySimilarUsers(@Param("userid") int userid);
	
	@Transactional
	List<Auction> findByAuctionidIn(List<Integer> ids);
	
	@Transactional
	@Query(value = "SELECT auctionid FROM auctions WHERE isBought = 0 ORDER BY number_of_bids DESC LIMIT :limit", nativeQuery = true)
	List<Integer> getTopAuctionsIds(@Param("limit") int limit);
	
	/* Dashboard Info */
	@Query(value = "SELECT COUNT(*) FROM auctions WHERE started >= ( CURDATE() - INTERVAL 3 DAY )", nativeQuery = true)
	Long countLast3Days();
	
	@Transactional
	List<Auction> findTop5ByOrderByStarted();
	
	List<Auction> findByBuyerOrderByStartedDesc(User user);
	
	List<Auction> findByIsBought(Boolean isBought);
	
	List<Auction> findByIsBoughtAndBuyerNotified(Boolean isBought, Boolean notified);

}
