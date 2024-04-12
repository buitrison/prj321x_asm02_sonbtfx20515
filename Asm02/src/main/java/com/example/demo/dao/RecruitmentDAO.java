package com.example.demo.dao;

import java.util.List;

import com.example.demo.Base.BestRecruitment;
import com.example.demo.entity.Recruitment;


public interface RecruitmentDAO {
	
	public List<Recruitment> getRecruitments(int page, int size);
	
	public List<Recruitment> getRecruitments();

	public void saveRecruitment(Recruitment theRecruitment);

	public Recruitment getRecruitment(int theId);

	public void deleteRecruitment(int theId);
	
	public List<BestRecruitment> getReSpecials();
	
	/**
	 * search by key
	 */
	public List<Recruitment> findRecruitments(String keySearch);

	public List<Recruitment> findRecruitmentsByCompany(String keySearch);

	public List<Recruitment> findRecruitmentsByAddress(String keySearch);

	public List<Recruitment> findJobByAdvanceSearch(String keySearch, String type, String location);
	

}
