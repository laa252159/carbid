package com.ted.controller;

import com.ted.model.User;
import com.ted.service.*;
import com.ted.utils.TokenEncryptorDescriptor;
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
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
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

    @Autowired
    private MailService mailer;

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
		model.addAttribute("headerMsg", "Данные регистрации приняты");
		model.addAttribute("contentMsg", "На адрес Вашей электронной почты отправлена информация для подтверждения  почтового адреса.");
		model.addAttribute(HIDE_ENT_BTN, true);
		model.addAttribute(HIDE_REG_BTN, true);
		model.addAttribute(HIDE_RUL_BTN, true);
        return "successMessagePage";
	}

	/**
	 *  Читаем условия контракта по ссылке с почты
	 */
	@RequestMapping(value = "/approve-and-contract", method = RequestMethod.GET)
	public String approveUsersEmail (Model model,@RequestParam(value="email", required=true) String email)
			throws NoSuchPaddingException, UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, InvalidKeySpecException {
		User user = userService.getUserByEmail(email);
		if(user == null){
			return "redirect:login";
		}
		String login = user.getUsername();
		String token = TokenEncryptorDescriptor.encrypt(login);
		boolean showApplyContractButtons = user.getEmailApproved() == (byte)0;
		model.addAttribute(APPLY_CONTRACT_AND_LOG_IN, "agreement-token?t="+token);
		model.addAttribute(REJECT_CONTRACT_AND_REMOVE_USER, "decline-registration/"+token);
		model.addAttribute(SHOW_APPLY_CONTRACT_BUTTONS, showApplyContractButtons);
		return "contract_page";
	}

	/**
	 * Юзер соглашается с условиями сайта
	 */
	@RequestMapping(value = "/agreement-token", method = RequestMethod.GET)
	public String loginBySingleLogin(Model model, @RequestParam(value = "t", required = true) String token)
			throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException, NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeySpecException, IOException {
		String login = TokenEncryptorDescriptor.decrypt(token);
		User user = userService.getUserByUsername(login);
		if (user != null && user.getEmailApproved() == (byte)0) {
			loginService.approveEmail(user.getEmail());
			securityService.autologin(login);
		}
		return "redirect:/";
	}

    /**
     * Переход на страницу отправки ссылки на почту
     */
    @RequestMapping(value = "/mail_check", method = RequestMethod.GET)
    public String approveEmailGet (Model model) {

        User user = new User();
        model.addAttribute("user", user);

        return "mail_check";
    }

    /**
     *  Проверка почты и отправка на неё ссылки для входа в систему и перехода на страницу смены пароля
     */
    @RequestMapping(value = "/mail_check", method = RequestMethod.POST)
    public String approveEmailPost(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request, Model model)
            throws NoSuchPaddingException, UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, InvalidKeySpecException
    {
        String mail = user.getEmail();
        User userApprove = userService.getUserByEmail(mail);

        String headline = "Восстановление пароля";
        model.addAttribute("headline", headline);
        String message;

        if (userApprove != null){
            String login = userApprove.getUsername();
            String token = TokenEncryptorDescriptor.encrypt(login);
            mailer.sendToUserMailPasswordVerificationLink(userApprove, token);
            user.setChangePassword((byte) 1);

            message = "На вашу почту отправлена информация для восстановления пароля.";
            model.addAttribute("message", message);
        }
        else {
            message = "Аадрес почты '" + user.getEmail() + "' не зарегистрирован в нашей системе";
            model.addAttribute("message", message);
        }

        return "report";
    }

    /**
     * Переход на страницу редактирования пароля
     */
    @RequestMapping(value = "/password_recovery", method = RequestMethod.GET)
    public String changePasswordGet (Model model, @RequestParam(value="token", required=true) String token)
            throws NoSuchPaddingException, IOException, InvalidKeyException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, InvalidKeySpecException
    {
        try {
            String login = TokenEncryptorDescriptor.decrypt(token);
            User userOld = userService.getUserByUsername(login);

            if (userOld.getChangePassword() == (byte)0){
                return "redirect:/";
            }

            User user = new User();
            user.setUsername(userOld.getUsername());
            model.addAttribute("user", user);

        } catch (IOException e) {
            throw new IOException();
        }
        return "password_recovery";
    }

    /**
     *  Проверка почты и отправка на неё ссылки для входа в систему и перехода на страницу смены пароля
     */
    @RequestMapping(value = "/password_recovery", method = RequestMethod.POST)
    public String changePasswordPost(@Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request, Model model)
            throws NoSuchPaddingException, UnsupportedEncodingException, InvalidKeyException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException, InvalidKeySpecException
    {
        User userNew = userService.getUserByUsername(user.getUsername());
        if (userNew != null){
            String passwordNew = user.getPassword();
            userNew.setPassword(passwordNew);
            loginService.changeUserPassword(userNew);
            securityService.autologin(userNew.getUsername());
        }

        return "redirect:/myprofile";
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
