package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Base.BestRecruitment;
import com.example.demo.dao.RecruitmentDAO;
import com.example.demo.entity.Recruitment;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

	@Autowired
	private RecruitmentDAO recruitmentDAO;

	@Override
	@Transactional
	public List<Recruitment> getRecruitments(int page, int size) {
		// TODO Auto-generated method stub
		return recruitmentDAO.getRecruitments(page, size);
	}

	@Override
	@Transactional
	public List<Recruitment> getRecruitments() {
		// TODO Auto-generated method stub
		return recruitmentDAO.getRecruitments();

	}

	@Override
	@Transactional
	public void saveRecruitment(Recruitment theRecruitment) {
		// TODO Auto-generated method stub
		recruitmentDAO.saveRecruitment(theRecruitment);

	}

	@Override
	@Transactional
	public Recruitment getRecruitment(int theId) {
		// TODO Auto-generated method stub
		return recruitmentDAO.getRecruitment(theId);
	}

	@Override
	@Transactional
	public void deleteRecruitment(int theId) {
		// TODO Auto-generated method stub
		recruitmentDAO.deleteRecruitment(theId);

	}

	// get Recruitment same Company
	@Override
	@Transactional
	public List<Recruitment> getRecruitmentsOfCompany(int companyId) {
		List<Recruitment> recruitments = new ArrayList<Recruitment>();
		try {
			for (Recruitment recruitment : recruitmentDAO.getRecruitments()) {
				if (recruitment.getCompany().getId() == companyId) {
					recruitments.add(recruitment);
				}
			}
		} catch (Exception e) {
			throw new NullPointerException("company_id of recruitment in database is null!");
		}

		return recruitments;

	}

	// get Recruitment By Category
	@Override
	@Transactional
	public List<Recruitment> getRecruitmentsByCategory(int categoryId) {
		List<Recruitment> recruitments = new ArrayList<Recruitment>();
		try {
			int count = 0;
			for (Recruitment recruitment : recruitmentDAO.getRecruitments()) {
				if(count == 5) {
					break;
				}
				if (recruitment.getCategory().getId() == categoryId) {
					recruitments.add(recruitment);
					count++;
				}
			}
		} catch (Exception e) {
			throw new NullPointerException("category_id of recruitment in database is null!");
		}

		return recruitments;

	}

	@Override
	@Transactional
	public List<BestRecruitment> getReSpecials() {
		// TODO Auto-generated method stub
		return recruitmentDAO.getReSpecials();
	}

	@Override
	@Transactional
	public List<Recruitment> findRecruitments(String keySearch) {
		// TODO Auto-generated method stub
		return recruitmentDAO.findRecruitments(keySearch);
	}

	@Override
	@Transactional
	public List<Recruitment> findRecruitmentsByCompany(String keySearch) {
		// TODO Auto-generated method stub
		return recruitmentDAO.findRecruitmentsByCompany(keySearch);
	}

	@Override
	@Transactional
	public List<Recruitment> findRecruitmentsByAddress(String keySearch) {
		// TODO Auto-generated method stub
		return recruitmentDAO.findRecruitmentsByAddress(keySearch);
	}

	@Override
	@Transactional
	public List<Recruitment> findJobByAdvanceSearch(String keySearch, String type, String location) {
		// TODO Auto-generated method stub
		return recruitmentDAO.findJobByAdvanceSearch(keySearch, type, location);
	}

}
