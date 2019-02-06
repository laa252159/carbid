package com.ted.controller;

import com.ted.model.User;
import com.ted.service.CategoryService;
import com.ted.service.LoginService;
import com.ted.service.SecurityService;
import com.ted.service.UserService;
import com.ted.utils.PasswordEncryptorDescriptor;
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

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

@Controller
public class LoginController extends AbstractController {

	@Autowired
	private SecurityService securityService;

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
		model.addAttribute(HIDE_ENT_BTN, true);
		model.addAttribute(HIDE_REG_BTN, true);
		model.addAttribute(HIDE_RUL_BTN, true);

		return "reg";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registrationPost(@Valid @ModelAttribute("user") User user, BindingResult result,
                                   HttpServletRequest request, Model model) {
		String password = user.getPassword();

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
		securityService.autologin(user.getUsername(), password);
		model.addAttribute("headerMsg", "Данные регистрации приняты");
		model.addAttribute("contentMsg", "На адрес Вашей электронной почты отправлена информация для подтверждения  почтового адреса.");
		model.addAttribute(HIDE_ENT_BTN, true);
		model.addAttribute(HIDE_REG_BTN, true);
		model.addAttribute(HIDE_RUL_BTN, true);
        return "successMessagePage";
	}


	@RequestMapping(value = "/approve-email", method = RequestMethod.GET)
	public String approveUsersEmail (Model model,@RequestParam(value="email", required=true) String email) {
		User user = loginService.approveEmail(email);
		if(user == null){
			return "redirect:login";
		}
		return "contract_page";
	}

	@RequestMapping(value = "/login-link", method = RequestMethod.GET)
	public String approveUsersEmail (Model model,@RequestParam(value="l", required=true) String login,
									 @RequestParam(value="p", required=true) byte[] password)
			throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException,
			NoSuchPaddingException {
		PasswordEncryptorDescriptor.decrypt(password);
		securityService.autologin(login, new String(password));
		return "index";
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
