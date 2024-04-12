package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.Category;

public interface CategoryDAO {
	
	public List<Category> getCategories();
	
	public List<Category> getCategoriesSorted();
	
	public void saveCategory(Category category);

	public void deleteCategory(int theId);
	
	public Category getCategoryById(int theId);

}
