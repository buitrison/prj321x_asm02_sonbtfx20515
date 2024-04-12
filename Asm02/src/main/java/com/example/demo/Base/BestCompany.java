package com.example.demo.Base;

import com.example.demo.entity.Company;

/**
 *  Using JOIN to get Company has the most Recruitment
 */
public class BestCompany {
	
	private int companyId;
	
	private long num;
	
	private Company company;

	public BestCompany(int companyId, long num) {
		super();
		this.companyId = companyId;
		this.num = num;
	}


	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}



	public int getCompanyId() {
		return companyId;
	}



	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}


	public Company getCompany() {
		return company;
	}


	public void setCompany(Company company) {
		this.company = company;
	}
	
	

}
