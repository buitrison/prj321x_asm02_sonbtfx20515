package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.ApplyPost;
import com.example.demo.entity.Company;
import com.example.demo.entity.Cv;
import com.example.demo.entity.FollowCompany;
import com.example.demo.entity.Recruitment;
import com.example.demo.entity.User;
import com.example.demo.service.ApplyPostService;
import com.example.demo.service.CompanyService;
import com.example.demo.service.CvService;
import com.example.demo.service.FollowCompanyService;
import com.example.demo.service.RecruitmentService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private ApplyPostService applyPostService;

	@Autowired
	private FollowCompanyService followCompanyService;

	@Autowired
	private CvService cvService;

	@Autowired
	private ServletContext servletContext;

	// show profile Page
	@GetMapping("/profile/{userID}")
	public String showProfile(@PathVariable("userID") int userID, Model model, Principal principal) {
		User user = userService.getUser(userID);
		if (principal != null && user.getEmail().equals(principal.getName())) {
			model.addAttribute("user", user);
			if (user.getRole().getId() == 1) {
				Cv cv = cvService.getCvByUserId(userID);
				model.addAttribute("cv", cv);

			}
			if (user.getRole().getId() == 2) {
				Company company = companyService.getCompanyByUserId(userID);
				if (company == null) {
					model.addAttribute("company", new Company());
				} else {
					model.addAttribute("company", company);
				}
			}
		} else {

			return "errors/error-404";
		}

		return "public/profile";
	}

	// update profile
	@PostMapping("/update-profile/{userId}")
	public String updateProfile(@PathVariable("userId") int userId, @RequestParam("email") String email,
			@RequestParam("fullName") String fullName, @RequestParam("address") String address,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("description") String description,
			Principal principal, RedirectAttributes attributes, Model model) {
		User user = userService.getUser(userId);
		if (principal != null && userService.getUserByEmail(principal.getName()).getId() == userId) {

			// mail does exist ?
			if (!userService.getUser(userId).getEmail().equals(email) && userService.getUserByEmail(email) != null) {

				attributes.addFlashAttribute("msg_error", "Email đã tồn tại!");
			} else {
				user.setEmail(email);
				user.setAddress(address);
				user.setFullName(fullName);
				user.setPhoneNumber(phoneNumber);
				user.setDescription(description);
				userService.updateUser(user);
				System.out.println("update complete");
				attributes.addFlashAttribute("msg_success", "Lưu thay đổi Người dùng thành công!");
				attributes.addFlashAttribute("user", user);

			}
		} else {
			return "errors/error-404";
		}
		return "redirect:/user/profile/" + userId;
	}

	// update company cua HR
	@PostMapping("/update-company/{userId}")
	public String updateCompany(@PathVariable("userId") int userId, @RequestParam("nameCompany") String nameCompany,
			@RequestParam("email") String email, @RequestParam("address") String address,
			@RequestParam("phoneNumber") String phoneNumber, @RequestParam("description") String description,
			Principal principal, RedirectAttributes attributes, Model model) {
		User user = userService.getUser(userId);
		System.out.println("check");
		if (principal == null || user == null || !user.getEmail().equals(principal.getName())) {
			return "errors/error-404";
		} else {
			Company company = companyService.getCompanyByUserId(userId);
			if (company == null) {
				company = new Company();
			}
			company.setEmail(email);
			company.setDescription(description);
			company.setNameCompany(nameCompany);
			company.setPhoneNumber(phoneNumber);
			company.setAddress(address);
			company.setUser(user);
			companyService.saveCompany(company);
			System.out.println("update company complete");
			attributes.addFlashAttribute("msg_success", "Lưu thay đổi Công ty thành công!");
		}
		return "redirect:/user/profile/" + userId;
	}

	// show list bai tuyen dung cua HR
	@GetMapping("/list-post")
	public String showUserListPost(Principal principal, Model model) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		model.addAttribute("user", user);
		Company company = companyService.getCompanyByUserId(user.getId());
		if (company == null) {
			if (user.getRole().getId() == 2) {
				model.addAttribute("msg_error", "Chưa cập nhật Công ty của bạn!");
			}

		} else {
			List<Recruitment> recruitmentsOfCompany = recruitmentService.getRecruitmentsOfCompany(company.getId());
			System.out.println("size of list: " + recruitmentsOfCompany.size());

			model.addAttribute("list", recruitmentsOfCompany);
		}

		return "public/post-list";
	}

	// show list apply cua User
	@GetMapping("/get-list-apply")
	public String showListApply(Principal principal, Model model) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		model.addAttribute("user", user);

		if (user.getRole().getId() == 1) {
			List<ApplyPost> applyPosts = applyPostService.getListByUserId(user.getId());
			model.addAttribute("applyList", applyPosts);
			System.out.println("size of applyPost:" + applyPosts.size());
		}

		return "public/list-apply-job";
	}

	// xu li delete apply
	@PostMapping("/delete-apply/{id}")
	public String deleteApplyPost(@PathVariable("id") int applyId, Principal principal, RedirectAttributes attributes) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		attributes.addFlashAttribute("user", user);
		ApplyPost applyPost = applyPostService.getApplyPost(applyId);

		if (applyPost.getUser().getId() != user.getId()) {
			return "errors/error-404";
		}

		applyPostService.delete(applyId);
		attributes.addFlashAttribute("msg_success", "Xoá thành công!");
		return "redirect:/user/get-list-apply";
	}

	// show list company da follow cua User
	@GetMapping("/get-list-company")
	public String showListFollowCompany(Principal principal, Model model) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		model.addAttribute("user", user);
		List<FollowCompany> list = followCompanyService.getListByUserId(user.getId());
		model.addAttribute("list", list);
		return "public/list-follow-company";
	}

	// xu li delete follow company cua user
	@GetMapping("/delete-follow/{id}")
	public String deleteFollowCompany(@PathVariable("id") int theId, Principal principal,
			RedirectAttributes attributes) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		attributes.addFlashAttribute("user", user);
		FollowCompany followCompany = followCompanyService.getById(theId);
		if (followCompany.getUser().getId() != user.getId()) {
			return "errors/error-404";
		}
		followCompanyService.delete(theId);
		attributes.addFlashAttribute("msg_success", "Xoá thành công!");
		return "redirect:/user/get-list-company";
	}

	// list ung cu vien Page danh cho HR
	@GetMapping("/list-candidate")
	public String showListCandidate(Principal principal, Model model) {
		if (principal == null) {
			return "redirect:/auth/login";
		}
		User user = userService.getUserByEmail(principal.getName());
		model.addAttribute("user", user);
		Company company = companyService.getCompanyByUserId(user.getId());
		Set<User> applyUsers = new HashSet<User>();
		System.out.println("size of list: " + applyUsers.size());
		if (company != null) {
			applyUsers = applyPostService.getCandidatesByCompanyId(company.getId());
		}
		System.out.println("size of list: " + applyUsers.size());
		model.addAttribute("applyList", applyUsers);
		return "public/list-user";
	}

	/**
	 * Apply Job Button
	 */
	@PostMapping("/apply-job")
	@ResponseBody
	public String applyJob(@RequestParam("file") MultipartFile file, @RequestParam("idRe") int idRe,
			@RequestParam("text") String text, Principal principal) {
		if (principal == null) {
			return "false";
		}
		User user = userService.getUserByEmail(principal.getName());
		if (user.getRole().getId() == 2) {
			return "error";
		}
		if (applyPostService.isExist(user.getId(), idRe)) {
			return "exist";
		}
		if (!file.getContentType().equals("application/pdf")) {
			return "typeFalse";
		}

		String uploadDir = servletContext.getRealPath("/") + "resources" + File.separator + "uploads";
		System.out.println(uploadDir);
		File dir = new File(uploadDir);
		if (!dir.exists()) {
			dir.mkdirs(); // Tạo thư mục nếu nó không tồn tại
		}
		String fileName = file.getOriginalFilename();
		String filePath = uploadDir + File.separator + fileName;
		try {
			file.transferTo(new File(filePath));
			System.out.println("File đã được lưu tại: " + filePath);

			Recruitment recruitment = recruitmentService.getRecruitment(idRe);
			ApplyPost applyPost = new ApplyPost();
			applyPost.setCreatedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			applyPost.setRecruitment(recruitment);
			applyPost.setUser(user);
			applyPost.setNameCv(fileName);
			applyPost.setText(text);
			applyPost.setStatus(0);
			applyPostService.saveApply(applyPost);

			return "true";
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}

	}

	/**
	 * Apply Job Button 1
	 */
	@PostMapping("/apply-job1")
	@ResponseBody
	public String applyJob1(@RequestParam("idRe") int idRe, @RequestParam("text") String text, Principal principal) {
		if (principal == null) {
			return "false";
		}
		User user = userService.getUserByEmail(principal.getName());
		if (user.getRole().getId() == 2) {
			return "error";
		}

		if (applyPostService.isExist(user.getId(), idRe)) {
			return "exist";
		}
		Recruitment recruitment = recruitmentService.getRecruitment(idRe);
		Cv cv = cvService.getCvByUserId(user.getId());
		ApplyPost applyPost = new ApplyPost();
		applyPost.setCreatedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		applyPost.setRecruitment(recruitment);
		applyPost.setUser(user);
		applyPost.setNameCv(cv.getFileName());
		applyPost.setText(text);
		applyPost.setStatus(0);
		applyPostService.saveApply(applyPost);

		return "true";
	}

	/**
	 * Follow Company
	 */
	@PostMapping("/follow-company")
	@ResponseBody
	public String followCompany(@RequestParam("idCompany") int companyId, Principal principal) {
		if (principal == null) {
			return "false";
		}
		User user = userService.getUserByEmail(principal.getName());
		if (user.getRole().getId() == 2) {
			return "error";
		}

		if (followCompanyService.isExist(user.getId(), companyId)) {
			FollowCompany followCompany = followCompanyService.getIfExist(user.getId(), companyId);
			followCompanyService.delete(followCompany.getId());
			return "exist";
		} else {
			Company company = companyService.getCompany(companyId);
			FollowCompany followCompany = new FollowCompany();
			followCompany.setCompany(company);
			followCompany.setUser(user);
			followCompanyService.save(followCompany);

			return "true";
		}

	}

	// xu li duyet ung vien da apply tu HR
	@RequestMapping(value = "/approve/{applyId}/{reId}", method = RequestMethod.POST)
	public String approveApplyOfUser(@PathVariable("applyId") int applyId, @PathVariable("reId") int reId,
			Principal principal, RedirectAttributes attributes) {

		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		Company company = companyService.getCompanyByUserId(user.getId());
		Recruitment recruitment = recruitmentService.getRecruitment(reId);
		attributes.addFlashAttribute("user", user);
		System.out.println("Company Id: " + company.getId());
		System.out.println("Re Company Id: " + recruitment.getCompany().getId());
		if (company.getId() != recruitment.getCompany().getId()) {
			attributes.addFlashAttribute("msg_error", "Loi xac thuc!");
			return "redirect:/recruitment/detail/" + reId;
		}

		ApplyPost applyPost = applyPostService.getApplyPost(applyId);
		applyPost.setStatus(1);
		applyPostService.saveApply(applyPost);
		attributes.addFlashAttribute("msg_success", "Duyệt thành công!");
		return "redirect:/recruitment/detail/" + reId;
	}

	// xu li upload anh user
	@PostMapping("/upload")
	@ResponseBody
	public String handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam("email") String email) {

		User user = userService.getUserByEmail(email);
		if (user == null) {
			return "Error";
		}
		if (file.isEmpty()) {
			return "Error";
		}
		String uploadDir = servletContext.getRealPath("/") + "resources" + File.separator + "uploads";
		System.out.println(uploadDir);
		File dir = new File(uploadDir);
		if (!dir.exists()) {
			dir.mkdirs(); // Tạo thư mục nếu nó không tồn tại
		}
		String fileName = file.getOriginalFilename();
		String filePath = uploadDir + File.separator + fileName;

		try {
			file.transferTo(new File(filePath));
			System.out.println("File đã được lưu tại: " + filePath);
			String urlImage = "http://localhost:8080/Asm02/resources/uploads/" + file.getOriginalFilename();
			user.setImage(urlImage);
			userService.saveUser(user);
			return urlImage;
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			return "Error";
		}
	}

	/**
	 * Process upload logo company
	 * 
	 * @param file
	 * @param email
	 * @return
	 */
	@PostMapping("/upload-company")
	@ResponseBody
	public String handleFileUploadCompany(@RequestParam("file") MultipartFile file,
			@RequestParam("email") String email) {

		User user = userService.getUserByEmail(email);

		if (user == null) {
			return "Error";
		}
		if (user.getRole().getId() == 1) {
			return "Error";
		}

		Company company = companyService.getCompanyByUserId(user.getId());
		if(company == null) {
			company = new Company();
			company.setUser(user);
		}

		if (file.isEmpty()) {
			return "Error";
		}
		String uploadDir = servletContext.getRealPath("/") + "resources" + File.separator + "uploads";
		System.out.println(uploadDir);
		File dir = new File(uploadDir);
		if (!dir.exists()) {
			dir.mkdirs(); // Tạo thư mục nếu nó không tồn tại
		}
		String fileName = file.getOriginalFilename();
		String filePath = uploadDir + File.separator + fileName;

		try {
			file.transferTo(new File(filePath));
			System.out.println("File đã được lưu tại: " + filePath);
			String urlImage = "http://localhost:8080/Asm02/resources/uploads/" + file.getOriginalFilename();
			company.setLogo(urlImage);
			companyService.saveCompany(company);
			return urlImage;
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			return "Error";
		}
	}

	/**
	 * upload cv
	 */
	@PostMapping("/upload-cv")
	@ResponseBody
	public String handleFileUploadCv(@RequestParam("file") MultipartFile file, Principal principal) {
		if (principal == null) {
			return "Error";
		}
		User user = userService.getUserByEmail(principal.getName());

		if (user.getRole().getId() == 2) {
			return "Error";
		}

		Cv cv = cvService.getCvByUserId(user.getId());
		if (cv == null) {
			cv = new Cv();
			cv.setUser(user);
		}

		if (file.isEmpty()) {
			return "Error";
		}
		if (!file.getContentType().equals("application/pdf")) {
			return "false";
		}
		String uploadDir = servletContext.getRealPath("/") + "resources" + File.separator + "uploads";
		System.out.println(uploadDir);
		File dir = new File(uploadDir);
		if (!dir.exists()) {
			dir.mkdirs(); // Tạo thư mục nếu nó không tồn tại
		}
		String fileName = file.getOriginalFilename();
		String filePath = uploadDir + File.separator + fileName;

		try {
			file.transferTo(new File(filePath));
			System.out.println("File đã được lưu tại: " + filePath);

			cv.setFileName(fileName);
			cvService.save(cv);
			cv.getUser().setCv(cv);
			userService.saveUser(cv.getUser());

			return fileName;

		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			return "Error";
		}
	}

	/**
	 * delete cv
	 */
	@PostMapping("/delete-cv")
	public String deleteCv(@RequestParam("idCv") int idCv, Principal principal, RedirectAttributes attributes) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		attributes.addFlashAttribute("user", user);
		Cv cv = cvService.getCvByUserId(user.getId());
		if (cv.getId() == idCv) {
			cv.getUser().setCv(null);
			userService.saveUser(cv.getUser());

			cvService.delete(idCv);

			// xoa file
			String filePath = servletContext.getRealPath("/") + "resources" + File.separator + "uploads/"
					+ cv.getFileName();
			File file = new File(filePath);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("Delete file [" + cv.getFileName() + "] success!");
				} else {
					System.out.println("Delete file [" + cv.getFileName() + "] fail!");
				}
			} else {
				System.out.println("File khong ton tai!");
			}

			attributes.addFlashAttribute("msg_success", "Xoá thành công!");

		} else {
			attributes.addFlashAttribute("msg_error", "Xử lí không thành công!");
		}
		return "redirect:/user/profile/" + user.getId();
	}

	/**
	 * send activation
	 */
	@PostMapping("/confirm-account")
	public String confirmAccount(@RequestParam("email") String email, Principal principal,
			RedirectAttributes attributes) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		if (!user.getEmail().equals(email)) {
			System.out.println(email);
			System.out.println(user.getEmail());
			return "errors/error-404";
		}
		if (user.getStatus() == 0) {
			String activeLink = "http://localhost:8080/Asm02/auth/activation?id=" + user.getId();
			userService.sendEmail(email, activeLink);
			attributes.addFlashAttribute("user", user);
			attributes.addFlashAttribute("confirm", "Success");
		}
		return "redirect:/user/profile/" + user.getId();
	}

}
