package com.example.demo.service;

import java.util.List;

import com.example.demo.Base.BestRecruitment;
import com.example.demo.entity.Recruitment;

public interface RecruitmentService {
	public List<Recruitment> getRecruitments(int page, int size);

	public List<Recruitment> getRecruitments();

	public void saveRecruitment(Recruitment theRecruitment);

	public Recruitment getRecruitment(int theId);

	public void deleteRecruitment(int theId);

	/**
	 * get list re in company
	 */
	public List<Recruitment> getRecruitmentsOfCompany(int companyId);

	/**
	 * get list by category
	 */
	public List<Recruitment> getRecruitmentsByCategory(int categoryId);

	/**
	 * get list bai dang noi bat
	 */
	public List<BestRecruitment> getReSpecials();

	/**
	 * search List by name
	 */
	public List<Recruitment> findRecruitments(String keySearch);

	/**
	 * Search list by company
	 * 
	 * @param keySearch
	 * @return list
	 */
	public List<Recruitment> findRecruitmentsByCompany(String keySearch);

	/**
	 * Search list by address
	 * 
	 * @param keySearch
	 * @return list
	 */
	public List<Recruitment> findRecruitmentsByAddress(String keySearch);

	/**
	 * Advance Search
	 * 
	 * @param keySearch
	 * @param type
	 * @param location
	 * @return list
	 */
	public List<Recruitment> findJobByAdvanceSearch(String keySearch, String type, String location);
}
