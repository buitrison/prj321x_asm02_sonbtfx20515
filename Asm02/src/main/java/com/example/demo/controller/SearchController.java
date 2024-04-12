package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Recruitment;
import com.example.demo.entity.User;
import com.example.demo.service.CompanyService;
import com.example.demo.service.RecruitmentService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private RecruitmentService recruitmentService;

	/**
	 * Search by Job name
	 */
	@PostMapping("/search-job")
	public String searchbyJobName(@RequestParam("keySearch") String keySearch, Principal principal, Model model) {
		model.addAttribute("companyNumber", companyService.getCompanys().size());
		model.addAttribute("userNumber", userService.coutOfUser());
		model.addAttribute("recruitmentNumber", recruitmentService.getRecruitments().size());
		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			model.addAttribute("user", user);

		}

		List<Recruitment> list = recruitmentService.findRecruitments(keySearch);
		System.out.println(list);
		model.addAttribute("searchList", list);
		return "public/result-search";
	}

	/**
	 * Search by Company
	 */
	@PostMapping("/search-company")
	public String searchCompany(@RequestParam("keySearch") String keySearch, Principal principal, Model model) {
		model.addAttribute("companyNumber", companyService.getCompanys().size());
		model.addAttribute("userNumber", userService.coutOfUser());
		model.addAttribute("recruitmentNumber", recruitmentService.getRecruitments().size());
		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			model.addAttribute("user", user);

		}
		List<Recruitment> list = recruitmentService.findRecruitmentsByCompany(keySearch);
		System.out.println(list);
		model.addAttribute("searchList", list);

		return "public/result-search-company";
	}

	/**
	 * Search by Address
	 */
	@PostMapping("/search-by-address")
	public String searchByAddress(@RequestParam("keySearch") String keySearch, Principal principal, Model model) {
		model.addAttribute("companyNumber", companyService.getCompanys().size());
		model.addAttribute("userNumber", userService.coutOfUser());
		model.addAttribute("recruitmentNumber", recruitmentService.getRecruitments().size());
		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			model.addAttribute("user", user);

		}
		List<Recruitment> list = recruitmentService.findRecruitmentsByAddress(keySearch);
		System.out.println(list);
		model.addAttribute("searchList", list);

		return "public/result-search-address";
	}

	/**
	 * 
	 * Advance Search
	 * 
	 * @param keySearch
	 * @param type
	 * @param location
	 * @return
	 */
	@GetMapping("/advance-search-job")
	public String advanceSearchJob(@RequestParam("keySearch") String keySearch, @RequestParam("type") String type,
			@RequestParam("location") String location, Principal principal, RedirectAttributes attributes) {
		if (principal != null) {
			User user = userService.getUserByEmail(principal.getName());
			attributes.addFlashAttribute("user", user);
		}
		List<Recruitment> list = recruitmentService.findJobByAdvanceSearch(keySearch, type, location);
		System.out.println(list);
		attributes.addAttribute("keySearch", keySearch);
		attributes.addAttribute("type", type);
		attributes.addAttribute("location", location);
		attributes.addFlashAttribute("searchList", list);

		return "redirect:/list-job";
	}

}
