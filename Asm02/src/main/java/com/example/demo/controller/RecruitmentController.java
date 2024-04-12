package com.example.demo.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.logging.Logger;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.ApplyPost;
import com.example.demo.entity.Category;
import com.example.demo.entity.Company;
import com.example.demo.entity.Recruitment;
import com.example.demo.entity.User;
import com.example.demo.service.ApplyPostService;
import com.example.demo.service.CategoryService;
import com.example.demo.service.CompanyService;
import com.example.demo.service.RecruitmentService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/recruitment")
public class RecruitmentController {
	
	private Logger logger = Logger.getLogger(getClass().getName());

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private ApplyPostService applyPostService;

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
		
	}

	@GetMapping("/")
	public String showRecruitmentPage(Principal principal, Model model) {
		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			model.addAttribute("user", user);
		}
		return "public/recruitment";
	}

	/// recruitment/post dang tuyen

	@RequestMapping("/post")
	public String showPostRecruitment(Principal principal, Model model) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		List<Category> categories = categoryService.getCategories();
		model.addAttribute("user", user);
		model.addAttribute("categories", categories);
		model.addAttribute("recruitment", new Recruitment());

		return "public/post-job";
	}

	@PostMapping("/add")
	public String addPostRecruitment(@Valid @ModelAttribute("recruitment") Recruitment recruitment, BindingResult bindingResult, Model model,
			Principal principal, RedirectAttributes attributes) {
		logger.info("Processing with " + recruitment.getTitle());
		
		if (principal == null) {
			return "errors/error-404";
		}

		User user = userService.getUserByEmail(principal.getName());
		Company company = companyService.getCompanyByUserId(user.getId());

		System.out.println("Step 1");
		if (bindingResult.hasErrors()) {
			List<Category> categories = categoryService.getCategories();
			model.addAttribute("user", user);
			model.addAttribute("categories", categories);
			model.addAttribute("recruitment", recruitment);
			System.out.println("Step 2");
			return "public/post-job";
		}

		if (company == null) {
			attributes.addFlashAttribute("msg_error", "Bạn chưa cập nhật công ty của bạn!");
			return "redirect:/recruitment/post";
		}
		recruitment.setCreatedAt(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		recruitment.setCompany(company);

		// plus numberChoose in category
		Category category = categoryService.getCategoryById(recruitment.getCategory().getId());
		categoryService.updateNumberChoose(category, true);
		// tao dang tuyen moi
		recruitmentService.saveRecruitment(recruitment);
		attributes.addFlashAttribute("msg_success", "Đăng tuyển thành công!");

		return "redirect:/recruitment/post";
	}

	@GetMapping("/edit-post/{reId}")
	public String editPostRecruitment(@PathVariable("reId") int reId, Model model, Principal principal) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		Recruitment recruitment = recruitmentService.getRecruitment(reId);
		List<Category> categories = categoryService.getCategories();
		if (recruitment.getCompany() == null || recruitment.getCompany().getUser().getId() != user.getId()) {
			System.out.println("company null or user cant edit this post!");
			return "errors/error-404";
		}
		model.addAttribute("user", user);
		model.addAttribute("recruitment", recruitment);
		model.addAttribute("categories", categories);

		return "public/edit-job";
	}

	// xu li cap nhat form edit recruitment
	@PostMapping("/edit")
	public String updateRecruitment(@Valid @ModelAttribute("recruitment") Recruitment recruitment,BindingResult bindingResult , Model model,
			Principal principal, RedirectAttributes attributes) {
		logger.info("Processing with " + recruitment.getTitle());
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());

		if (bindingResult.hasErrors()) {
			List<Category> categories = categoryService.getCategories();
			model.addAttribute("user", user);
			model.addAttribute("categories", categories);
			model.addAttribute("recruitment", recruitment);
			return "public/edit-job";
		}
		System.out.println(recruitment.getExperience());
		Recruitment oldRecruitment = recruitmentService.getRecruitment(recruitment.getId());

		recruitment.setCreatedAt(oldRecruitment.getCreatedAt());
		recruitment.setStatus(oldRecruitment.getStatus());
		recruitment.setView(oldRecruitment.getView());
		recruitment.setXh(oldRecruitment.getXh());
		recruitment.setCompany(oldRecruitment.getCompany());
		recruitmentService.saveRecruitment(recruitment);

		// xu li numberChoose in category false trừ, true cộng
		categoryService.updateNumberChoose(oldRecruitment.getCategory(), false);
		categoryService.updateNumberChoose(categoryService.getCategoryById(recruitment.getCategory().getId()), true);

		attributes.addFlashAttribute("msg_success", "Chỉnh sửa đã được lưu thành công!");
		attributes.addFlashAttribute("user", user);
		return "redirect:/recruitment/edit-post/" + recruitment.getId();

	}

	// delete bai dang tuyen dung
	@PostMapping("/delete")
	public String deleteRe(@RequestParam("id") int reId, Principal principal, RedirectAttributes attributes) {
		if (principal == null) {
			return "errors/error-404";
		}
		// add dieu kien xoa
		List<ApplyPost> applyPosts = applyPostService.getApplyByRecruitmentId(reId);
		if (applyPosts.size() > 0) {
			attributes.addFlashAttribute("msg_error", "Bài đăng đang có người ứng tuyển!");
		} else {
			// minus numberChoose in category
			Recruitment recruitment = recruitmentService.getRecruitment(reId);
			categoryService.updateNumberChoose(recruitment.getCategory(), false);

			recruitmentService.deleteRecruitment(reId);
			attributes.addFlashAttribute("msg_success", "Thành công!");
		}
		return "redirect:/user/list-post";
	}

	// detail bai tuyen dung
	@GetMapping("/detail/{reId}")
	public String showDetailRe(@PathVariable("reId") int reId, Principal principal, Model model) {
		Recruitment recruitment = recruitmentService.getRecruitment(reId);
		model.addAttribute("recruitment", recruitment);
		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			model.addAttribute("user", user);
			List<ApplyPost> applyPostList = applyPostService.getApplyByRecruitmentId(reId);
			model.addAttribute("applyList", applyPostList);

			if (user.getEmail().equals(recruitment.getCompany().getUser().getEmail())) {
				// chi co hr cua cong ty moi duoc xem danh sach ung tuyen cong ty
				model.addAttribute("unlock", "unlock");
			}
		}

		List<Recruitment> recruitmentsInCategory = recruitmentService
				.getRecruitmentsByCategory(recruitment.getCategory().getId());
		model.addAttribute("sameList", recruitmentsInCategory);
		System.out.println("samelist have size is:" + recruitmentsInCategory.size());
		return "public/detail-post";
	}

	@GetMapping("category/{id}")
	public String putMethodName(@PathVariable("id") int id, Principal principal, Model model) {

		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			model.addAttribute("user", user);
		}
		Category category = categoryService.getCategoryById(id);
		model.addAttribute("category", category);
		List<Recruitment> recruitments = recruitmentService.getRecruitmentsByCategory(id);
		model.addAttribute("recruitments", recruitments);

		return "public/list-re";
	}

}
