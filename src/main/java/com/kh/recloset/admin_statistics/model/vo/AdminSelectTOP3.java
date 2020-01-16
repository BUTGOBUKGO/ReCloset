package com.kh.recloset.admin_statistics.model.vo;

public class AdminSelectTOP3 {

	private int rank10;
	private String mon;
	private int total;
	private String userName;
	
	public AdminSelectTOP3() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminSelectTOP3(int rank, String mon, int total, String userName) {
		super();
		this.rank10 = rank;
		this.mon = mon;
		this.total = total;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "AdminSelectTOP10 [rank=" + rank10 + ", mon=" + mon + ", total=" + total + ", userName=" + userName + "]";
	}

	public int getRank() {
		return rank10;
	}

	public void setRank(int rank) {
		this.rank10 = rank10;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
