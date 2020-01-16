package com.kh.recloset.searchRank.model.vo;

public class SearchRank {
	private int rankNo;
	private String searchName;
	
	public SearchRank() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchRank(int rankNo, String searchName) {
		super();
		this.rankNo = rankNo;
		this.searchName = searchName;
	}
	public int getRankNo() {
		return rankNo;
	}
	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	@Override
	public String toString() {
		return "SearchRank [rankNo=" + rankNo + ", searchName=" + searchName + "]";
	}
	
	
	
	
}
