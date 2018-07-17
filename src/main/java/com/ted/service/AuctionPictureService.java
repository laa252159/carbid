package com.ted.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ted.model.Auction;
import com.ted.model.AuctionPicture;
import com.ted.model.ImageInfo;

public interface AuctionPictureService {
	
	List<AuctionPicture> saveMultipartList(MultipartFile[] files, Auction auction);
	
	List<String> getAuctionPictures(Auction auction);
	
	List<ImageInfo> getAuctionImageInfo(Auction auction);
	
	String deleteImage(Integer id);

}
