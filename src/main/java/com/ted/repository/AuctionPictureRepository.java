package com.ted.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ted.model.Auction;
import com.ted.model.AuctionPicture;

@Repository("auctionPictureRepository")
public interface AuctionPictureRepository extends JpaRepository<AuctionPicture, Long> {
	
	List<AuctionPicture> findByAuction(Auction auction);
	
	@Transactional
	Integer deleteByPicId(int id);

}
