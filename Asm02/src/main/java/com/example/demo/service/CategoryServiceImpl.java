package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CategoryDAO;
import com.example.demo.entity.Category;
@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryDAO categoryDAO;

	@Override
	@Transactional
	public List<Category> getCategories() {
		// TODO Auto-generated method stub
		return categoryDAO.getCategories();
	}
	
	@Override
	@Transactional
	public List<Category> getCategoriesSorted() {
		return categoryDAO.getCategoriesSorted();
	}
	
	
	@Override
	@Transactional
	public void updateNumberChoose(Category category, boolean plusOrMinus) {
		
		System.out.println("Category Update: " +plusOrMinus);
		System.out.print(category.getName() + " now is " + category.getNumberChoose());
		// plus == true, minus == false
		if(plusOrMinus) {
			category.setNumberChoose(category.getNumberChoose() + 1);
		} else {
			category.setNumberChoose(category.getNumberChoose() - 1);
		}
		if(category.getNumberChoose() < 0) {
			category.setNumberChoose(0);
		}
		System.out.println(" update to " +category.getNumberChoose());
		categoryDAO.saveCategory(category);
		System.out.println("Success!");
		
	}

	@Override
	public Category getCategoryById(int theId) {
		// TODO Auto-generated method stub
		return categoryDAO.getCategoryById(theId);
	}

	

	
	

}
