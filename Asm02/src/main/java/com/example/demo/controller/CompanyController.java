package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Company;
import com.example.demo.entity.Recruitment;
import com.example.demo.entity.User;
import com.example.demo.service.CompanyService;
import com.example.demo.service.RecruitmentService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private RecruitmentService recruitmentService;
	
	@GetMapping("/{id}")
	public String showCompany(@PathVariable("id") int companyId,Principal principal, Model model) {
		if(principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		model.addAttribute("user", user);
		Company company = companyService.getCompany(companyId);
		model.addAttribute("company", company);
		return "public/detail-company";
	}
	
	
	@GetMapping("/{id}/list-job")
	public String getListJobInCompany(@PathVariable("id") int companyId, Model model, Principal principal) {
		if(principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		model.addAttribute("user", user);
		Company company = companyService.getCompany(companyId);
		model.addAttribute("company", company);
		List<Recruitment> recruitments = recruitmentService.getRecruitmentsOfCompany(companyId);
		model.addAttribute("reList", recruitments);
		return "public/post-company";
	}
	

}
