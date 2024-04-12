package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Cv;

public interface CvService {
	
	public List<Cv> getAll();
	public List<Cv> getListByUserId(int theId);
	
	public void save(Cv cv);
	
	public void delete(int theId);
	
	public Cv getById(int theId);
	
	public Cv getCvByUserId(int userId);

}
