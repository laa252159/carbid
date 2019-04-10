package com.ted.utils;

import org.junit.Test;

import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import static org.junit.Assert.*;

public class TokenEncryptorDescriptorTest {

    @Test
    public void encryptDecrypt() throws Exception {
        TokenEncryptorDescriptor cryptoUtil=new TokenEncryptorDescriptor();
        String source="san1";
        String token=cryptoUtil.encrypt(source);
        String param1After = URLEncoder.encode(token, "UTF-8");
        String dd = URLDecoder.decode(param1After, "UTF-8");
        String decrypted=cryptoUtil.decrypt(token);
        assertEquals(source, decrypted);
    }

}