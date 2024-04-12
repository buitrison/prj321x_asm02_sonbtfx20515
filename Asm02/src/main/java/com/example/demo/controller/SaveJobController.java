package com.example.demo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Recruitment;
import com.example.demo.entity.SaveJob;
import com.example.demo.entity.User;
import com.example.demo.service.RecruitmentService;
import com.example.demo.service.SaveJobService;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("save-job")
public class SaveJobController {
	@Autowired
	private UserService userService;

	@Autowired
	private SaveJobService saveJobService;

	@Autowired
	private RecruitmentService recruitmentService;

	// show save job list
	@GetMapping("/get-list")
	public String showSaveJob(Model model, Principal principal) {
		if (principal == null) {
			return "errors/error-404";
		}
		String username = principal.getName();
		User user = userService.getUserByEmail(username);
		model.addAttribute("user", user);
		List<SaveJob> saveJobs = saveJobService.getListByUserId(user.getId());
		model.addAttribute("list", saveJobs);
		return "public/list-save-job";
	}

	// delete save job
	@RequestMapping("/delete/{id}")
	public String deleteSaveJob(@PathVariable("id") int saveJobId, Principal principal, RedirectAttributes attributes) {
		if (principal == null) {
			return "errors/error-404";
		}
		User user = userService.getUserByEmail(principal.getName());
		attributes.addFlashAttribute("user", user);
		SaveJob saveJob = saveJobService.getById(saveJobId);

		if (saveJob.getUser().getId() != user.getId()) {
			return "errors/error-404";
		}

		saveJobService.delete(saveJobId);
		attributes.addFlashAttribute("msg_success", "Xoá thành công!");
		return "redirect:/save-job/get-list";
	}

	/**
	 * Save Job Button
	 */
	@PostMapping("/save")
	@ResponseBody
	public String saveJob(@RequestParam("idRe") int idRe, Principal principal) {
		if (principal == null) {
			return "false";
		}
		User user = userService.getUserByEmail(principal.getName());
		if (user.getRole().getId() == 2) {
			return "error";
		}
		if (saveJobService.isExist(user.getId(), idRe)) {
			SaveJob saveJob = saveJobService.getIfExist(user.getId(), idRe);
			saveJobService.delete(saveJob.getId());
			return "exist";
		}

		SaveJob saveJob = new SaveJob();
		Recruitment recruitment = recruitmentService.getRecruitment(idRe);
		saveJob.setUser(user);
		saveJob.setRecruitment(recruitment);
		saveJobService.save(saveJob);
		return "true";
	}

}
