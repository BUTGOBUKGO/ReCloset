package com.kh.recloset.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SellReport implements Serializable{
	
	/* 판매자신고 */
	
	private int sreportNo;     //
	private int userNo;        //
	private int goodsNo;       //
	private int orderNo;       //
	private String srReason;   //
	private Date srDate;       //
	private String srDheck;    //
	private String sReporter;  //
	
	
	public SellReport() {
		super();
		// TODO Auto-generated constructor stub
	}


	public SellReport(int sreportNo, int userNo, int goodsNo, int orderNo, String srReason, Date srDate, String srDheck,
			String sReporter) {
		super();
		this.sreportNo = sreportNo;
		this.userNo = userNo;
		this.goodsNo = goodsNo;
		this.orderNo = orderNo;
		this.srReason = srReason;
		this.srDate = srDate;
		this.srDheck = srDheck;
		this.sReporter = sReporter;
	}


	@Override
	public String toString() {
		return "SellReport [sreportNo=" + sreportNo + ", userNo=" + userNo + ", goodsNo=" + goodsNo + ", orderNo="
				+ orderNo + ", srReason=" + srReason + ", srDate=" + srDate + ", srDheck=" + srDheck + ", sReporter="
				+ sReporter + "]";
	}


	public int getSreportNo() {
		return sreportNo;
	}


	public void setSreportNo(int sreportNo) {
		this.sreportNo = sreportNo;
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


	public String getSrReason() {
		return srReason;
	}


	public void setSrReason(String srReason) {
		this.srReason = srReason;
	}


	public Date getSrDate() {
		return srDate;
	}


	public void setSrDate(Date srDate) {
		this.srDate = srDate;
	}


	public String getSrDheck() {
		return srDheck;
	}


	public void setSrDheck(String srDheck) {
		this.srDheck = srDheck;
	}


	public String getsReporter() {
		return sReporter;
	}


	public void setsReporter(String sReporter) {
		this.sReporter = sReporter;
	}
	
	
	
	
	
	
	

}
