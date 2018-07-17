package com.ted.service;

import java.util.List;

import com.ted.model.ImageInfo;

public interface ImageService {
	
	String imageToBase64(byte[] image);
	
	List<String> imagesToBase64(List<byte[]> images);

}
