package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.Base.BestCompany;
import com.example.demo.Base.BestRecruitment;
import com.example.demo.entity.Category;
import com.example.demo.entity.Recruitment;
import com.example.demo.entity.User;
import com.example.demo.service.CategoryService;
import com.example.demo.service.CompanyService;
import com.example.demo.service.RecruitmentService;
import com.example.demo.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecruitmentService recruitmentService;

	// show index page
	@RequestMapping("/")
	public String showHome(Model model, Principal principal) {
		// global
		List<Category> categories = categoryService.getCategoriesSorted();
		model.addAttribute("categories", categories);
		model.addAttribute("companyNumber", companyService.getCompanys().size());
		model.addAttribute("userNumber", userService.coutOfUser());
		model.addAttribute("recruitmentNumber", recruitmentService.getRecruitments().size());

//		Object[] special = companyService.getSpecial();
//		if(special != null && special.length > 0) {
//			int reId = (int) special[0];
//			Long countA = (Long) special[1];
//			System.out.println("id: "+reId+", count: "+countA);
//		}

		// cong ty noi bat
		BestCompany bestCompany = companyService.getSpecial();
		if(bestCompany != null) {
		bestCompany.setCompany(companyService.getCompany(bestCompany.getCompanyId()));
		System.out
				.println("best company id: " + bestCompany.getCompanyId() + ", count recruit: " + bestCompany.getNum());
		model.addAttribute("bestCompany", bestCompany);
		}

		// bai viet noi bat
		List<BestRecruitment> listB = recruitmentService.getReSpecials();
		for (BestRecruitment br : listB) {
			br.setRecruitment(recruitmentService.getRecruitment(br.getRecruitmentId()));
			System.out.println("best reId:" + br.getRecruitmentId() + ", count apply: " + br.getNum());
		}

		model.addAttribute("bestList", listB);

		// trong session
		if (principal != null) {
			String username = principal.getName();
			User user = userService.getUserByEmail(username);

			model.addAttribute("user", user);

		}
		return "public/home";
	}

	// show browse job page
	@GetMapping("/list-job")
	public String showListJob(Model model, Principal principal) {

		List<Category> categories = categoryService.getCategoriesSorted();
		model.addAttribute("categories", categories);

		List<Recruitment> listRecruitments = recruitmentService.getRecruitments();
		model.addAttribute("listRe", listRecruitments);
		if (principal != null) {
			String username = principal.getName();
			User user = userService.getUserByEmail(username);
			model.addAttribute("user", user);
		}

		return "public/listJob";
	}

	// show list candidate
	@GetMapping("/list-user")
	public String getUserList(Principal principal, Model model) {
		if (principal == null) {
			return "redirect:/auth/login";
		}

		return "redirect:/user/list-candidate";
	}

}
