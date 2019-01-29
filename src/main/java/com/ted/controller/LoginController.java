package com.ted.controller;

import com.ted.model.User;
import com.ted.service.CategoryService;
import com.ted.service.LoginService;
import com.ted.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;

@Controller
public class LoginController extends AbstractController {


	
	@Autowired
	LoginService loginService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UserService userService;

//	@Autowired
//	AuthenticationManager authenticationManager;
	
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
		boolean passwdsAreEqualErr = StringUtils.isEmpty(user.getPassword())
				|| StringUtils.isEmpty(user.getMatchingPassword())
				|| !user.getPassword().equals(user.getMatchingPassword());

		if (passwdsAreEqualErr) { // matching passwords
			model.addAttribute("matchPaswds", "Пароли не совпадают");
			result.addError(new ObjectError("matchingPassword","Пароли не совпадают!" ));
			return "reg";
		}


        if(!isCaptchaValid(request.getParameter("g-recaptcha-response"))){
            model.addAttribute("captchaInvalid", "Введите капчу");
            return "reg";
        }

        loginService.saveUser(user, null);
//		autoLogin(user.getUsername(), user.getPassword());
        return "redirect:login";
	}

//	private void autoLogin(String username, String password) {
//		User user = userService.getUserByUsername(username);
//		UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
//				new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
//
//		authenticationManager.authenticate(usernamePasswordAuthenticationToken);
//
//		if (usernamePasswordAuthenticationToken.isAuthenticated()) {
//			SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
//		}
//	}



	
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
