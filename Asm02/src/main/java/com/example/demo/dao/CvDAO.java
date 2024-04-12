package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.Cv;


public interface CvDAO {
	public List<Cv> getCvList();
	public void saveCv(Cv cv);
	public Cv getCv(int theId);
	public void deleteCv(int theId);
	
	public Cv getCvByUserId(int theId);

}
