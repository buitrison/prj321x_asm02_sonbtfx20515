package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FollowCompanyDAO;
import com.example.demo.entity.FollowCompany;

@Service
public class FollowCompanyServiceImpl implements FollowCompanyService {

	@Autowired
	private FollowCompanyDAO followCompanyDAO;

	@Override
	@Transactional
	public List<FollowCompany> getAll() {
		// TODO Auto-generated method stub
		return followCompanyDAO.getFollowCompanies();
	}

	@Override
	@Transactional
	public List<FollowCompany> getListByUserId(int theId) {
		// get list SaveJob by userId
		List<FollowCompany> list = new ArrayList<FollowCompany>();
		for (FollowCompany followCompany : followCompanyDAO.getFollowCompanies()) {
			if (followCompany.getUser().getId() == theId) {
				list.add(followCompany);
			}
		}

		return list;
	}

	@Override
	@Transactional
	public void save(FollowCompany followCompany) {
		followCompanyDAO.saveFollowCompany(followCompany);

	}

	@Override
	@Transactional
	public void delete(int theId) {
		followCompanyDAO.deleteFollowCompany(theId);

	}

	@Override
	@Transactional
	public FollowCompany getById(int theId) {
		// TODO Auto-generated method stub
		return followCompanyDAO.getFollowCompany(theId);
	}

	@Override
	@Transactional
	public boolean isExist(int userId, int companyId) {
		List<FollowCompany> list = followCompanyDAO.getFollowCompanies();
		for (FollowCompany followCompany : list) {
			if (followCompany.getUser().getId() == userId && followCompany.getCompany().getId() == companyId) {
				return true;
			}
		}
		return false;
	}

	@Override
	@Transactional
	public FollowCompany getIfExist(int userId, int companyId) {
		List<FollowCompany> list = followCompanyDAO.getFollowCompanies();
		for (FollowCompany followCompany : list) {
			if (followCompany.getUser().getId() == userId && followCompany.getCompany().getId() == companyId) {
				return followCompany;
			}
		}
		return null;
	}

}
