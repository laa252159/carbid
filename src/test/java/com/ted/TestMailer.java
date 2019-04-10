package com.ted;

import com.ted.model.Auction;
import com.ted.repository.UserRepository;
import com.ted.service.MailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"/com/ted/db/applicationTests-context.xml"})
public class TestMailer {
	
	@Autowired
	private UserRepository userRepository;

	@Qualifier("mailMail")
	@Autowired
	private MailService mailService;
	
	@Test
	public void testFindingApproved() {
//		userRepository.findByApproved((byte)1);
	}


	@Test
	public void testNotifyProcess() {
//		Auction auction = new Auction();
//		mailService.notifyUsersAboutNewAuction(auction);
	}

}
