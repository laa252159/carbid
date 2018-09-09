package com.ted.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.json.JSONObject;
import com.ted.model.User;
import com.ted.service.CategoryService;
import com.ted.service.LoginService;
import com.ted.service.UserService;

@Controller
public class LoginController {

    private static final String secretKey = "6LeBTm8UAAAAAA7v_BAYNXWNNf0IjJfhV5ADUulr";
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login (Model model) {
		System.out.println("Inside login controller");
		return "login";
	}

	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	public String loginFailed(Model model) {
		
		System.out.println("Login failed");
		
		model.addAttribute("error","Login failed. Please provide correct credentials." );
		return "login";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model) {
		return "redirect:/";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registrationGet(Model model) {
		
		User user = new User();
		
		model.addAttribute("user", user);
		
		return "reg";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registrationPost(@Valid @ModelAttribute("user") User user, BindingResult result,
                                   HttpServletRequest request, Model model) {
		
		
		if(result.hasErrors()) {
			return "reg";
		}
		
		String msg = loginService.checkEmailUsername(user);
		if(msg != null)	// Check if email already exists
		{
			model.addAttribute("msg", msg);
			return "reg";
		}


        if(!isCaptchaValid(request.getParameter("g-recaptcha-response"))){
            return "reg";
        }

        loginService.saveUser(user, null);

        return "redirect:login";
	}

    /**
     * Validates Google reCAPTCHA V2 or Invisible reCAPTCHA.
     *  secretKey Secret key (key given for communication between your site and Google)
     * @param response reCAPTCHA response from client side. (g-recaptcha-response)
     * @return true if validation successful, false otherwise.
     */
    private static boolean isCaptchaValid(String response) {
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

	
	@RequestMapping(value = "/upgrade", method = RequestMethod.GET)
	public String getUpgrade(Model model) {
		
		User user = userService.getLoggedInUser();
		model.addAttribute("user", user);
		
		return "upgrade";
	}
	
	@RequestMapping(value = "/upgrade", method = RequestMethod.POST)
	public String postUpgrade(@RequestParam Map<String,String> allRequestParams, Model model, 
			HttpServletRequest request) {
		
		String error = loginService.upgradeUser(allRequestParams);
		
		if(error != null) {
			model.addAttribute("error", error);
			return "upgrade";
		}
		
		/* Logout */
		try {
			request.logout();
		} catch (ServletException e) {
			e.printStackTrace();
		}
		
		/* Prepare login page */
		String msg = "Your account has just been upgraded. You can now create new Auctions and see them in your account."
				+ " Please Login again to complete ther process.";
		model.addAttribute("msg", msg);

		
		return "redirect:login";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String error403(Model model) {
		return "403";
	}
}
