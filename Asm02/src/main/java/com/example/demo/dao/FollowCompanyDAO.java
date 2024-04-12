package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.FollowCompany;

public interface FollowCompanyDAO {
	public List<FollowCompany> getFollowCompanies();
	public void saveFollowCompany(FollowCompany followCompany);
	public FollowCompany getFollowCompany(int theId);
	public void deleteFollowCompany(int theId);

}
