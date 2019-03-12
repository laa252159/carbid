package com.ted.model;

import com.ted.repository.AuctionMoreInfoRepository;
import com.ted.repository.AuctionRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "/com/ted/db/applicationTests-context.xml"})
public class AuctionTest {

    @Autowired
    private AuctionRepository auctionRepository;

    @Autowired
    private AuctionMoreInfoRepository auctionMoreInfoRepository;

    @Test
    public void createNew() {
//        Auction auction = auctionRepository.findByAuctionid(3633);
//        AuctionMoreInfo auctionMoreInfo = new AuctionMoreInfo();
//        auction.setAuctionid(50001);
//        auctionMoreInfo.setAbs(true);
//        auction.setBuyPriceString("30000");
//        auction.setAuctionMoreInfo(auctionMoreInfo);
//        Auction auction1 = auctionRepository.saveAndFlush(auction);
//        auctionMoreInfo.setAuction(auction1);
//        auctionMoreInfo.setAuctionid(auction1.getAuctionid());
//        auctionMoreInfoRepository.saveAndFlush(auctionMoreInfo);

    }

    @Test
    public void readABS() {
//        Auction auction = auctionRepository.findByAuctionid(3654);
//        AuctionMoreInfo auctionMoreInfo = auction.getAuctionMoreInfo();
//        System.out.println(auctionMoreInfo.isAbs());

    }
}