package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CvDAO;
import com.example.demo.entity.Cv;
@Service
public class CvServiceImpl implements CvService {
	
	@Autowired
	private CvDAO cvDAO;

	@Override
	@Transactional
	public List<Cv> getAll() {
		// TODO Auto-generated method stub
		return cvDAO.getCvList();
	}

	@Override
	@Transactional
	public List<Cv> getListByUserId(int theId) {
		List<Cv> cvs = new ArrayList<Cv>();
		for(Cv cv: cvDAO.getCvList()) {
			if(cv.getUser().getId() == theId) {
				cvs.add(cv);
			}
		}
		return cvs;
	}

	@Override
	@Transactional
	public void save(Cv cv) {
		cvDAO.saveCv(cv);
		
	}

	@Override
	@Transactional
	public void delete(int theId) {
		cvDAO.deleteCv(theId);
		
	}

	@Override
	@Transactional
	public Cv getById(int theId) {
		// TODO Auto-generated method stub
		return cvDAO.getCv(theId);
	}

	/**
	 *  Get cv by userid, return cv or null
	 */
	@Override
	@Transactional
	public Cv getCvByUserId(int userId) {
		return cvDAO.getCvByUserId(userId);
		
	}

}
