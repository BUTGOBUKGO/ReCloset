package com.kh.recloset.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyPage implements Serializable {

	private int userNo;
	private Date oDate;
	private int orderNo;
	private String gName;
	private int gPrice;
	private String oderChk;
	private String startDate;
	private String endDate;
	
	
	public MyPage() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MyPage(int userNo, Date oDate, int orderNo, String gName, int gPrice, String oderChk, String startDate,
			String endDate) {
		super();
		this.userNo = userNo;
		this.oDate = oDate;
		this.orderNo = orderNo;
		this.gName = gName;
		this.gPrice = gPrice;
		this.oderChk = oderChk;
		this.startDate = startDate;
		this.endDate = endDate;
	}


	@Override
	public String toString() {
		return "MyPage [userNo=" + userNo + ", oDate=" + oDate + ", orderNo=" + orderNo + ", gName=" + gName
				+ ", gPrice=" + gPrice + ", oderChk=" + oderChk + ", startDate=" + startDate + ", endDate=" + endDate
				+ "]";
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public Date getoDate() {
		return oDate;
	}


	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getgName() {
		return gName;
	}


	public void setgName(String gName) {
		this.gName = gName;
	}


	public int getgPrice() {
		return gPrice;
	}


	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}


	public String getOderChk() {
		return oderChk;
	}


	public void setOderChk(String oderChk) {
		this.oderChk = oderChk;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	
	
	
	
	

	
}
