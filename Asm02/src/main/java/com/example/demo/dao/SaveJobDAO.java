package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.SaveJob;

public interface SaveJobDAO {
	public List<SaveJob> getSaveJobs();
	public void saveSaveJob(SaveJob saveJob);
	public SaveJob getSaveJob(int theId);
	public void deleteSaveJob(int theId);

}
