package com.kh.recloset.like.model.vo;

import java.io.Serializable;

public class Like implements Serializable{
	
	private int goodsNo;
	private int userNo;
	private String lStatus;
	
	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Like(int goodsNo, int userNo, String lStatus) {
		super();
		this.goodsNo = goodsNo;
		this.userNo = userNo;
		this.lStatus = lStatus;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getlStatus() {
		return lStatus;
	}

	public void setlStatus(String lStatus) {
		this.lStatus = lStatus;
	}

	@Override
	public String toString() {
		return "Like [goodsNo=" + goodsNo + ", userNo=" + userNo + ", lStatus=" + lStatus + "]";
	}

	
}
