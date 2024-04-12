package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.SaveJobDAO;
import com.example.demo.entity.SaveJob;

@Service
public class SaveJobServiceImpl implements SaveJobService {

	@Autowired
	private SaveJobDAO saveJobDAO;

	@Override
	@Transactional
	public List<SaveJob> getAll() {
		// TODO Auto-generated method stub
		return saveJobDAO.getSaveJobs();
	}

	@Override
	@Transactional
	public List<SaveJob> getListByUserId(int theId) {
		// get list SaveJob by userId
		List<SaveJob> list = new ArrayList<SaveJob>();
		for (SaveJob saveJob : saveJobDAO.getSaveJobs()) {
			if (saveJob.getUser().getId() == theId) {
				list.add(saveJob);
			}
		}

		return list;
	}

	@Override
	@Transactional
	public void save(SaveJob saveJob) {
		saveJobDAO.saveSaveJob(saveJob);

	}

	@Override
	@Transactional
	public void delete(int theId) {
		saveJobDAO.deleteSaveJob(theId);

	}

	@Override
	@Transactional
	public SaveJob getById(int theId) {
		// TODO Auto-generated method stub
		return saveJobDAO.getSaveJob(theId);
	}

	/**
	 * Check save job exist?
	 */
	@Override
	@Transactional
	public boolean isExist(int userId, int reId) {
		List<SaveJob> list = saveJobDAO.getSaveJobs();
		for (SaveJob saveJob : list) {
			if (saveJob.getUser().getId() == userId && saveJob.getRecruitment().getId() == reId) {
				return true;
			}
		}
		return false;
	}

	@Override
	@Transactional
	public SaveJob getIfExist(int userId, int idRe) {
		List<SaveJob> list = saveJobDAO.getSaveJobs();
		for (SaveJob saveJob : list) {
			if (saveJob.getUser().getId() == userId && saveJob.getRecruitment().getId() == idRe) {
				return saveJob;
			}
		}
		return null;
	}

}
