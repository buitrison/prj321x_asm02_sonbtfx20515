package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.FollowCompany;

public interface FollowCompanyService {
	
	public List<FollowCompany> getAll();
	
	public List<FollowCompany> getListByUserId(int theId);
	
	public void save(FollowCompany followCompany);
	
	public void delete(int theId);
	
	public FollowCompany getById(int theId);
	
	/**
	 * Check follow company exist? 
	 */
	public boolean isExist(int userId, int companyId);

	
	/**
	 * tra ve id voi tham so userId va companyId
	 */
	public FollowCompany getIfExist(int id, int companyId);
}
