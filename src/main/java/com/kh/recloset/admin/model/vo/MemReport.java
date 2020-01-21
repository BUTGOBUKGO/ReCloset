package com.kh.recloset.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MemReport implements Serializable{
	
	/* 리뷰신고 */
	
	private int mreportNo;     //
	private int userNo;        //
	private int goodsNo;       //
	private int orderNo;       //
	private int reviewNo;       //
	private String mrReason;   //
	private Date mrDate;       //
	private String mrDheck;    //
	private String mReporter;  //
	
	
	
	public MemReport() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MemReport(int mreportNo, int userNo, int goodsNo, int orderNo, int reviewNo, String mrReason, Date mrDate,
			String mrDheck, String mReporter) {
		super();
		this.mreportNo = mreportNo;
		this.userNo = userNo;
		this.goodsNo = goodsNo;
		this.orderNo = orderNo;
		this.reviewNo = reviewNo;
		this.mrReason = mrReason;
		this.mrDate = mrDate;
		this.mrDheck = mrDheck;
		this.mReporter = mReporter;
	}


	@Override
	public String toString() {
		return "MemReport [mreportNo=" + mreportNo + ", userNo=" + userNo + ", goodsNo=" + goodsNo + ", orderNo="
				+ orderNo + ", reviewNo=" + reviewNo + ", mrReason=" + mrReason + ", mrDate=" + mrDate + ", mrDheck="
				+ mrDheck + ", mReporter=" + mReporter + "]";
	}
	


	public int getMreportNo() {
		return mreportNo;
	}


	public void setMreportNo(int mreportNo) {
		this.mreportNo = mreportNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getGoodsNo() {
		return goodsNo;
	}


	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getMrReason() {
		return mrReason;
	}


	public void setMrReason(String mrReason) {
		this.mrReason = mrReason;
	}


	public Date getMrDate() {
		return mrDate;
	}


	public void setMrDate(Date mrDate) {
		this.mrDate = mrDate;
	}


	public String getMrDheck() {
		return mrDheck;
	}


	public void setMrDheck(String mrDheck) {
		this.mrDheck = mrDheck;
	}


	public String getmReporter() {
		return mReporter;
	}


	public void setmReporter(String mReporter) {
		this.mReporter = mReporter;
	}
	
	
	
	
	
	
	
	
	
	
	
}
