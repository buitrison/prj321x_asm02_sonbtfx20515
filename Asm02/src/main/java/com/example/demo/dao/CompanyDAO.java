package com.example.demo.dao;

import java.util.List;

import com.example.demo.Base.BestCompany;
import com.example.demo.entity.Company;

public interface CompanyDAO {
	public List<Company> getCompanys();

	public void saveCompany(Company theCompany);

	public Company getCompany(int theId);

	public void deleteCompany(int theId);
	
	public Company getCompanyByUserId(int userId);
	
	public BestCompany getSpecial();
	

}
