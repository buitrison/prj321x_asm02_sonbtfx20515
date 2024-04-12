package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ApplyPostDAO;
import com.example.demo.entity.ApplyPost;
import com.example.demo.entity.User;

@Service
public class ApplyPostServiceImpl implements ApplyPostService {
	
	@Autowired
	private ApplyPostDAO applyPostDAO;

	@Override
	@Transactional
	public List<ApplyPost> getApplyPostList() {
		// TODO Auto-generated method stub
		return applyPostDAO.getApplyPosts();
	}
	
	@Override
	@Transactional
	public List<ApplyPost> getApplyByCompanyId(int companyId) {
		// TODO Auto-generated method stub
		List<ApplyPost> applyPostList = new ArrayList<ApplyPost>();
		for(ApplyPost applyPost: applyPostDAO.getApplyPosts()) {
			if(applyPost.getRecruitment().getCompany().getId() == companyId) {
				applyPostList.add(applyPost);
			}
		}
		return applyPostList;
	}
	@Override
	@Transactional
	public List<ApplyPost> getApplyByRecruitmentId(int reId) {
		// TODO Auto-generated method stub
		List<ApplyPost> applyPostList = new ArrayList<ApplyPost>();
		for(ApplyPost applyPost: applyPostDAO.getApplyPosts()) {
			if(applyPost.getRecruitment().getId() == reId) {
				applyPostList.add(applyPost);
			}
		}
		return applyPostList;
	}

	@Override
	@Transactional
	public void saveApply(ApplyPost applyPost) {
		applyPostDAO.saveApplyPost(applyPost);
		
	}

	@Override
	@Transactional
	public ApplyPost getApplyPost(int theId) {
		// TODO Auto-generated method stub
		return applyPostDAO.getApplyPost(theId);
	}

	@Override
	@Transactional
	public Set<User> getCandidatesByCompanyId(int companyId) {
		// TODO Auto-generated method stub
		List<ApplyPost> applyPostList = new ArrayList<ApplyPost>();
		for(ApplyPost applyPost: applyPostDAO.getApplyPosts()) {
			if(applyPost.getRecruitment().getCompany().getId() == companyId && applyPost.getStatus() == 1) {
				applyPostList.add(applyPost);
			}
		}
		System.out.println(applyPostList);
		Set<User> set = new HashSet<>();
		for (ApplyPost applyPost : applyPostList) {
			if(!set.contains(applyPost.getUser()))
				set.add(applyPost.getUser());
		}
		System.out.println(set);
		
		return set;
	}

	@Override
	@Transactional
	public List<ApplyPost> getListByUserId(int theId) {
		// TODO Auto-generated method stub
		return applyPostDAO.getListByUserId(theId);
	}

	@Override
	@Transactional
	public void delete(int theId) {
		// TODO Auto-generated method stub
		applyPostDAO.deleteApplyPost(theId);
	}
	
	/**
	 * Check save job exist? 
	 */
	@Override
	public boolean isExist(int userId, int reId) {
		List<ApplyPost> list = applyPostDAO.getApplyPosts();
		for(ApplyPost applyPost: list) {
			if(applyPost.getUser().getId() == userId && applyPost.getRecruitment().getId() == reId) {
				return true;
			}
		}
		return false;
	}
	
	
}
