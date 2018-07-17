package com.ted.model;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
public class Filter {
	
	String sortBy;
	
	String sortByOutput;
	
	Category category;

	String price;
	
	Integer numberofPages;
	
	List<Integer> pages;
	
	Integer pageNum;
	
	Long numberofItems;
	
	String searchString;

	public Filter() {
		
		sortBy = "ends";
		
		category = null;
		
		price = null;

		sortByOutput = "Ending Date";
		
		searchString = null;
	}

	public Category getCategory() {
		return category;
	}

	public Long getNumberofItems() {
		return numberofItems;
	}
	
	public Integer getnumberofPages() {
		return numberofPages;
	}

	public Integer getNumberofPages() {
		return numberofPages;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public List<Integer> getPages() {
		return pages;
	}

	public String getPrice() {
		return price;
	}
	
	public String getSearchString() {
		return searchString;
	}

	public String getSortBy() {
		return sortBy;
	}

	public String getSortByOutput() {
		return sortByOutput;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public void setNumberofItems(Long numberofItems) {
		this.numberofItems = numberofItems;
	}

	public void setNumberofPages(Integer numberofPages) {
		this.numberofPages = numberofPages;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public void setPages(List<Integer> pages) {
		this.pages = pages;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public void setSortByOutput(String sortByOutput) {
		this.sortByOutput = sortByOutput;
	}
	
	

	
}
