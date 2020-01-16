package com.kh.recloset.search.model.vo;

import java.sql.Timestamp;

public class Search {
	 private int searchNo;
	 private String searchName;
	 private int userNo;
	 private Timestamp searchDate;
	 
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Search(int searchNo, String searchName, int userNo, Timestamp searchDate) {
		super();
		this.searchNo = searchNo;
		this.searchName = searchName;
		this.userNo = userNo;
		this.searchDate = searchDate;
	}

	@Override
	public String toString() {
		return "Search [searchNo=" + searchNo + ", searchName=" + searchName + ", userNo=" + userNo + ", searchDate="
				+ searchDate + "]";
	}

	public int getSearchNo() {
		return searchNo;
	}

	public void setSearchNo(int searchNo) {
		this.searchNo = searchNo;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Timestamp getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Timestamp searchDate) {
		this.searchDate = searchDate;
	}
	 
	 
}
