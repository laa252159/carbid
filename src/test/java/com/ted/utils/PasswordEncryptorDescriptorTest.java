package com.ted.utils;

import org.junit.Before;
import org.junit.Test;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import static org.junit.Assert.assertEquals;

public class PasswordEncryptorDescriptorTest {

    private static PasswordEncryptorDescriptor passwordEncryptorDescriptor;

    @Before
    public void init(){
        passwordEncryptorDescriptor = new PasswordEncryptorDescriptor();
    }

    @Test
    public void encryptAndDecrypt() throws NoSuchAlgorithmException,
            BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, InvalidKeyException {
        String password = "password";
        byte[] abracadabra = passwordEncryptorDescriptor.encrypt(password.getBytes());
        byte[] finalPassword = passwordEncryptorDescriptor.decrypt(abracadabra);
        assertEquals(password, new String(finalPassword));
    }

}