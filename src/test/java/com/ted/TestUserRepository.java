package com.ted;

import com.ted.model.Auction;
import com.ted.model.XmlAuctionWrapper;
import com.ted.repository.UserRepository;
import com.ted.service.MailService;
import com.ted.service.UserService;
import com.ted.service.XmlService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.FileReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"/com/ted/db/applicationTests-context.xml"})
public class TestUserRepository {
	
	@Autowired
	private UserRepository userRepository;

	@Qualifier("mailMail")
	@Autowired
	private MailService mailService;
	
	@Test
	public void testFindingApproved() {
		userRepository.findByApproved((byte)1);
	}


//	@Test
	public void testNotifyProcess() {
		Auction auction = new Auction();
		mailService.notifyUsersAboutNewAuction(auction);
	}

}
