package com.ted;

import java.io.FileReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ted.model.Auction;
import com.ted.model.XmlAuctionWrapper;
import com.ted.service.XmlService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/WEB-INF/config/auctioner-servlet.xml", "/WEB-INF/config/jpaContext.xml", "/WEB-INF/config/security-config.xml"})
public class XmlMarshalling {
	
	@Autowired
	XmlService xmlService;
	
	
	@Test
	public void auctionsUnmarshalling() {

		try {
			JAXBContext context = JAXBContext.newInstance(XmlAuctionWrapper.class);
			Unmarshaller unmarshaller = context.createUnmarshaller();
			
			for(int j = 1; j < 2; j++) {
				
				XmlAuctionWrapper wrapper = (XmlAuctionWrapper)unmarshaller.unmarshal(new FileReader("D:\\ebay-data\\items-" + j + ".xml"));
				
				xmlService.saveXmlAuction(wrapper.getAuctions());
				
				int i = 0;
				for(Auction auction : wrapper.getAuctions()) {
					System.out.println("File" + j + ": Auction" + i + ": " + auction.getName());
					i++;
				}
			}
			
		} catch (Exception ex) {
			System.out.println(ex);
		}
		
	}
	
	@Test
	public void dateFormating() {
		
		SimpleDateFormat formatter = new SimpleDateFormat("MMM-dd-yy HH:mm:ss", Locale.ENGLISH);
		
		String dateString = "Aug-13-01 18:10:40";
		
		String nowDate = formatter.format(new Date());
		
		System.out.println(nowDate);
		

		try {
			
			Date date = formatter.parse(dateString);
			System.out.println(date);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
