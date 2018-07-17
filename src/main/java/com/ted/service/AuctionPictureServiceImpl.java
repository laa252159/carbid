package com.ted.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ted.model.Auction;
import com.ted.model.AuctionPicture;
import com.ted.model.ImageInfo;
import com.ted.repository.AuctionPictureRepository;

@Service("auctionPictureService")
public class AuctionPictureServiceImpl implements AuctionPictureService {
	
	@Autowired
	AuctionPictureRepository auctionPictureRepository;
	
	@Autowired
	ImageService imageService;

	public List<AuctionPicture> saveMultipartList(MultipartFile[] images, Auction auction) {
		
		List<AuctionPicture> auctionPictures = new ArrayList<>();
		
		if (images.length > 0) {
			for(MultipartFile image : images) {
				try {
					AuctionPicture auctionPicture = new AuctionPicture();
					auctionPicture.setAuctionPicturescol(image.getBytes());
					auctionPicture.setAuction(auction);
					auctionPictures.add(auctionPictureRepository.saveAndFlush(auctionPicture));
	
					System.out.println("You successfully saved picture!");
				} catch (Exception e) {
					System.out.println("You failed to save picture  => " + e.getMessage());
				}
			}
		}
		return auctionPictures;
	}

	public List<String> getAuctionPictures(Auction auction) {

		List<AuctionPicture> pictures = auctionPictureRepository.findByAuction(auction);
		if(pictures.isEmpty())
			return null;
		
		List<byte[]> images = new ArrayList<>();
		for(AuctionPicture picture : pictures)
			images.add(picture.getAuctionPicturescol());
		
		List<String> base64Pictures = imageService.imagesToBase64(images);
		
		return base64Pictures;

	}

	public List<ImageInfo> getAuctionImageInfo(Auction auction) {
		
		List<AuctionPicture> pictures = auctionPictureRepository.findByAuction(auction);
		if(pictures.isEmpty())
			return null;
		
		List<ImageInfo> imagesInfo = new ArrayList<>();
		 for(AuctionPicture pic : pictures) {
			 ImageInfo imageInfo = new ImageInfo();
			 String pic64 = imageService.imageToBase64(pic.getAuctionPicturescol());
			 int id = pic.getPicId();
			 imageInfo.setId(id);
			 imageInfo.setImage(pic64);
			 imagesInfo.add(imageInfo);
		 }
		
		return imagesInfo;
	}
	
	@Modifying
	@Transactional
	public String deleteImage(Integer id) {

		int picId = auctionPictureRepository.deleteByPicId(id);
		
		if(picId != id)
			return "error";
		
		return "200 OK";

	}

}
