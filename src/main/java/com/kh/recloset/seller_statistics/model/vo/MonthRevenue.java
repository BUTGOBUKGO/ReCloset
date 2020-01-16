package com.kh.recloset.seller_statistics.model.vo;

import java.io.Serializable;

public class MonthRevenue implements Serializable {
	
	private String mon;
	private int totalCost;
	
	
	
	public MonthRevenue() {
		super();
		// TODO Auto-generated constructor stub
	}



	public MonthRevenue(String mon, int totalCost) {
		super();
		this.mon = mon;
		this.totalCost = totalCost;
	}



	public String getMon() {
		return mon;
	}



	public void setMon(String mon) {
		this.mon = mon;
	}



	public int getTotalCost() {
		return totalCost;
	}



	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}



	@Override
	public String toString() {
		return "MonthRevenue [mon=" + mon + ", totalCost=" + totalCost + "]";
	}
	
	

}
