package com.ted.controller;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;

public class AbstractController {
    protected static final String secretKey = "6LeBTm8UAAAAAA7v_BAYNXWNNf0IjJfhV5ADUulr";

    public static String HIDE_RUL_BTN = "hideRulBtn";
    public static String HIDE_ENT_BTN = "hideEntBtn";
    public static String HIDE_REG_BTN = "hideRegBtn";

    public static String SHOW_APPLY_CONTRACT_BUTTONS = "showApplyContractButtons";
    public static String APPLY_CONTRACT_AND_LOG_IN = "applyContractAndLogIn";
    public static String REJECT_CONTRACT_AND_REMOVE_USER = "rejectContractAndRemoveUser";

    /**
     * Validates Google reCAPTCHA V2 or Invisible reCAPTCHA.
     *  secretKey Secret key (key given for communication between your site and Google)
     * @param response reCAPTCHA response from client side. (g-recaptcha-response)
     * @return true if validation successful, false otherwise.
     */
    protected static boolean isCaptchaValid(String response) {
        try {
            String url = "https://www.google.com/recaptcha/api/siteverify?"
                    + "secret=" + secretKey
                    + "&response=" + response;
            InputStream res = new URL(url).openStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));

            StringBuilder sb = new StringBuilder();
            int cp;
            while ((cp = rd.read()) != -1) {
                sb.append((char) cp);
            }
            String jsonText = sb.toString();
            res.close();

            JSONObject json = new JSONObject(jsonText);
            return json.getBoolean("success");
        } catch (Exception e) {
            return false;
        }
    }
}
