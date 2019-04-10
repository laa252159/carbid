package com.ted.repository;

import com.ted.model.AuctionMoreInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("auctionMoreInfoRepository")
public interface AuctionMoreInfoRepository extends JpaRepository<AuctionMoreInfo, Long> {

}
