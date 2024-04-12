package com.example.demo.service;

import java.util.List;
import java.util.Set;

import com.example.demo.entity.ApplyPost;
import com.example.demo.entity.User;

public interface ApplyPostService {
	public List<ApplyPost> getApplyPostList();
	
	public List<ApplyPost> getApplyByCompanyId(int companyId);
	
	public Set<User> getCandidatesByCompanyId(int companyId);
	
	public List<ApplyPost> getApplyByRecruitmentId(int reId);
	
	public void saveApply(ApplyPost applyPost);
	
	public ApplyPost getApplyPost(int theId);
	
	public void delete(int theId);
	
	public List<ApplyPost> getListByUserId(int theId);
	
	/**
	 * Check apply job exist? 
	 */
	public boolean isExist(int userId, int reId);

}
