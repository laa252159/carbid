package com.ted;

import com.ted.service.AuctionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"/com/ted/db/applicationTests-context.xml"})
public class TestAuctionService {
	
	@Autowired
	private AuctionService auctionService;
	
	@Test
	public void testReadBids() {
//		auctionService.readBids(1);
	}
}
