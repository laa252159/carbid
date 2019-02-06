package com.ted.utils;

import org.junit.Test;

import static org.junit.Assert.*;

public class TokenEncryptorDescriptorTest {

    @Test
    public void encryptDecrypt() throws Exception {
        TokenEncryptorDescriptor cryptoUtil=new TokenEncryptorDescriptor();
        String key="ezeon8547";
        String source="sanix";
        String token=cryptoUtil.encrypt(key, source);
        String decrypted=cryptoUtil.decrypt(key, token);
        assertEquals(source, decrypted);
    }

}