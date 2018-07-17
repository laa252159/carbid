package com.ted.service;

import java.util.List;

import com.ted.model.Category;

public interface CategoryService {
	
	List<Category> getAllCategories();

	String getMenuHtml();
	
	List<Category> getParentCategories(Category category);

}
