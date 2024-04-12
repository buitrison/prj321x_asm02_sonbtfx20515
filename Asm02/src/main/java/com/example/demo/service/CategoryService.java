package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Category;

public interface CategoryService {
	public List<Category> getCategories();
	
	public List<Category> getCategoriesSorted();
	
	public Category getCategoryById(int theId);
	
	public void updateNumberChoose(Category category, boolean plusOrMinus);
}
