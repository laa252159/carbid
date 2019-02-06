package com.ted.utils;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryptorDescriptor {

    public static final String AES = "AES";
    private static String KEY = "Bar12345Bar12345"; // 128 bit key
    private static Key aesKey;
    private static Cipher cipher;

    public static Key getAesKey() {
        if(aesKey != null){
            return aesKey;
        }
        aesKey = new SecretKeySpec(KEY.getBytes(), AES);
        return aesKey;
    }

    public static Cipher getCipher() throws NoSuchPaddingException, NoSuchAlgorithmException {
        if(cipher != null){
            return cipher;
        }
        cipher = Cipher.getInstance(AES);
        return cipher;
    }

    /**
     * Encrypt the password
     *
     * @param password
     * @return
     * @throws InvalidKeyException
     * @throws NoSuchPaddingException
     * @throws NoSuchAlgorithmException
     * @throws BadPaddingException
     * @throws IllegalBlockSizeException
     */
    public static byte[] encrypt(byte[] password) throws InvalidKeyException,
            NoSuchPaddingException, NoSuchAlgorithmException, BadPaddingException, IllegalBlockSizeException {
        getCipher().init(Cipher.ENCRYPT_MODE, getAesKey());
        byte[] encrypted = getCipher().doFinal(password);
        return encrypted;
    }

    /**
     *  Decrypt the password
     *
     * @param password
     * @throws NoSuchPaddingException
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeyException
     * @throws BadPaddingException
     * @throws IllegalBlockSizeException
     */
    public static byte[] decrypt(byte[] password) throws NoSuchPaddingException,
            NoSuchAlgorithmException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        getCipher().init(Cipher.DECRYPT_MODE, getAesKey());
        return getCipher().doFinal(password);
    }
}
