package com.kh.recloset.search.model.vo;

public class SearchValue {
	private String searchName;
	private int category;
	
	public SearchValue() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchValue(String searchName, int category) {
		super();
		this.searchName = searchName;
		this.category = category;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "SearchValue [searchName=" + searchName + ", category=" + category + "]";
	}
	
	
}
