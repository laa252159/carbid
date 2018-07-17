package com.ted.service;




import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

	public String imageToBase64(byte[] image) {
		
		String base64Encoded = null;
		
		try {
			byte[] encodeBase64 = Base64.encodeBase64(image);
			base64Encoded = new String(encodeBase64, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    
	    return base64Encoded;
	}

	public List<String> imagesToBase64(List<byte[]> images) {
		
		List<String> base64Encoded = new ArrayList<>();
		
		try {
			for(byte[] image : images) {
				byte[] encodeBase64 = Base64.encodeBase64(image);
				base64Encoded.add(new String(encodeBase64, "UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	    
	    return base64Encoded;
	}

}
