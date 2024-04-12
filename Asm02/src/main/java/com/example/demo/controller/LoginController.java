package com.example.demo.controller;

import java.security.Principal;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.service.RoleService;
import com.example.demo.service.UserService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/auth")
public class LoginController {

	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	private Logger logger = Logger.getLogger(getClass().getName());

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

	// login
	@GetMapping("/login")
	public String showLogin(Model model, Principal principal) {
		if (principal != null) {
//			String username = principal.getName();
//			User user = userService.getUserByEmail(username);
//			model.addAttribute("user", user);
			return "redirect:/";
		} else {
			model.addAttribute("user", new User());
			List<Role> roles = roleService.getRoles();
			model.addAttribute("roles", roles);
		}
		return "public/login";
	}

	// login success
	@RequestMapping("/loginSuccess")
	public String redirectLoginSuccess(RedirectAttributes attributes, Principal principal) {
		attributes.addFlashAttribute("msg_login_success", "Đăng nhập thành công!");
		return "redirect:/";
	}

	// access denied

	@RequestMapping("/access-denied")
	public String showAccessDenied() {
		return "errors/error-404";
	}

	// logout

	@RequestMapping("/logout")
	public String showLogin(HttpServletRequest request, Principal principal) {
		request.getSession().invalidate();
		return "redirect:/auth/login?logout";
	}

	// register

	@PostMapping("/register")
	public String processRegister(@Valid @ModelAttribute("user") User theUser, BindingResult bindingResult,
			RedirectAttributes attributes, Model model) {

		logger.info("Processing registration form for: " + theUser.getEmail());
		if (bindingResult.hasErrors()) {
//			model.addAttribute("msg_error", "Field can not be empty.");
//			logger.warning("Field can not be empty.");
			model.addAttribute("user", theUser);
			List<Role> roles = roleService.getRoles();
			model.addAttribute("roles", roles);

			return "public/login";
		}

		if (!theUser.getPassword().equals(theUser.getConfirmPassword())) {
			bindingResult.rejectValue("confirmPassword", "error.user", "Mật khẩu không trùng khớp!");
			System.out.println("password not match");
			model.addAttribute("user", theUser);
			List<Role> roles = roleService.getRoles();
			model.addAttribute("roles", roles);
			return "public/login";
		}

		// check exists
		if (doesUserExist(theUser.getEmail())) {
			bindingResult.rejectValue("email", "error.user", "Email đã được sử dụng!");
			System.out.println("Email đã được sử dụng!");
			model.addAttribute("user", theUser);
			List<Role> roles = roleService.getRoles();
			model.addAttribute("roles", roles);
//			model.addAttribute("msg_error", "Email already exists.");
//			logger.warning("Email already exists.");
			return "public/login";
		}

		String encodedPassword = passwordEncoder.encode(theUser.getPassword());
		theUser.setPassword(encodedPassword);
		theUser.setStatus(0);

		// create user object (from Spring Security framework)
		userService.saveUser(theUser);
		// save user in the database
		logger.info("Successfully created user: " + theUser.getEmail());
		attributes.addFlashAttribute("msg_success", "Đăng kí thành công " + theUser.getEmail());
		return "redirect:/auth/login";
	}

	/**
	 * confirm user exist
	 */
	private boolean doesUserExist(String userName) {

		logger.info("Checking if user exists: " + userName);

		boolean exists = true;

		// check the database if the user already exists
		User user = userService.getUserByEmail(userName);
		if (user == null) {
			exists = false;
		}

		logger.info("User: " + userName + ", exists: " + exists);

		return exists;
	}

	// confirm by email
	@GetMapping("/activation")
	public String activeAccount(@RequestParam("id") int id, Model model) {
		User user = userService.getUser(id);
		if (user == null) {
			return "errors/error-404";
		}
		if (user.getStatus() == 0) {
			user.setStatus(1);
			userService.saveUser(user);
			model.addAttribute("success", "success");
		}
		return "public/activation";
	}

}
