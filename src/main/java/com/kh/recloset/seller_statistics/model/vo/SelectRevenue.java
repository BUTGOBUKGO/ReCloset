package com.kh.recloset.seller_statistics.model.vo;

import java.io.Serializable;

public class SelectRevenue implements Serializable  {
    private int totalCost;
	private String userName;
	public SelectRevenue() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SelectRevenue(int totalCost, String userName) {
		super();
		this.totalCost = totalCost;
		this.userName = userName;
	}
	public int getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "SelectRevenue [totalCost=" + totalCost + ", userName=" + userName + "]";
	}
	
	
	
}
