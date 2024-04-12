package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.SaveJob;

public interface SaveJobService {
	
	public List<SaveJob> getAll();
	
	public List<SaveJob> getListByUserId(int theId);
	
	public void save(SaveJob saveJob);
	
	public void delete(int theId);
	
	public SaveJob getById(int theId);
	
	
	/**
	 * check save job is exist?
	 */
	public boolean isExist(int userId, int reId);

	/**
	 * get SaveJob if exist with parameter userId and recruitmentId
	 */
	public SaveJob getIfExist(int userId, int idRe);

}
