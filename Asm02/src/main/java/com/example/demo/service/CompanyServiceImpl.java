package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Base.BestCompany;
import com.example.demo.dao.CompanyDAO;
import com.example.demo.entity.Company;

@Service
public class CompanyServiceImpl implements CompanyService {


	@Autowired
	private CompanyDAO companyDAO;

	@Override
	@Transactional
	public List<Company> getCompanys() {
		// TODO Auto-generated method stub
		return companyDAO.getCompanys();
	}

	@Override
	@Transactional
	public void saveCompany(Company theCompany) {
		// TODO Auto-generated method stub
		companyDAO.saveCompany(theCompany);
	}

	@Override
	@Transactional
	public Company getCompany(int theId) {
		// TODO Auto-generated method stub
		return companyDAO.getCompany(theId);
	}


	@Override
	@Transactional
	public void deleteCompany(int theId) {
		// TODO Auto-generated method stub
		companyDAO.deleteCompany(theId);

	}

	@Override
	public Company getCompanyByUserId(int userId) {
		// TODO Auto-generated method stub
		return companyDAO.getCompanyByUserId(userId);
	}

	@Override
	public BestCompany getSpecial() {
		// TODO Auto-generated method stub
		return companyDAO.getSpecial();
	}
	
	
	
	



}
