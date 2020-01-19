package com.kh.recloset.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Goods implements Serializable{

	private int goodsNo;
	private int categoryCode;
	private int userNo;
	private String gName;
	private int gPrice;
	private String gColor;
	private String gSize;
	private String gSimple;
	private String gDetail;
	private String gStatus;
	private Date gDate;
	private String gSoldout;
	private String changeName;
	private String userId;
	
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Goods(int goodsNo, int categoryCode, int userNo, String gName, int gPrice, String gColor, String gSize,
			String gSimple, String gDetail, String gStatus, Date gDate, String gSoldout, String changeName,
			String userId) {
		super();
		this.goodsNo = goodsNo;
		this.categoryCode = categoryCode;
		this.userNo = userNo;
		this.gName = gName;
		this.gPrice = gPrice;
		this.gColor = gColor;
		this.gSize = gSize;
		this.gSimple = gSimple;
		this.gDetail = gDetail;
		this.gStatus = gStatus;
		this.gDate = gDate;
		this.gSoldout = gSoldout;
		this.changeName = changeName;
		this.userId = userId;
	}



	

	@Override
	public String toString() {
		return "Goods [goodsNo=" + goodsNo + ", categoryCode=" + categoryCode + ", userNo=" + userNo + ", gName="
				+ gName + ", gPrice=" + gPrice + ", gColor=" + gColor + ", gSize=" + gSize + ", gSimple=" + gSimple
				+ ", gDetail=" + gDetail + ", gStatus=" + gStatus + ", gDate=" + gDate + ", gSoldout=" + gSoldout
				+ ", changeName=" + changeName + ", userId=" + userId + "]";
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public String getgColor() {
		return gColor;
	}

	public void setgColor(String gColor) {
		this.gColor = gColor;
	}

	public String getgSize() {
		return gSize;
	}

	public void setgSize(String gSize) {
		this.gSize = gSize;
	}

	public String getgSimple() {
		return gSimple;
	}

	public void setgSimple(String gSimple) {
		this.gSimple = gSimple;
	}

	public String getgDetail() {
		return gDetail;
	}

	public void setgDetail(String gDetail) {
		this.gDetail = gDetail;
	}

	public String getgStatus() {
		return gStatus;
	}

	public void setgStatus(String gStatus) {
		this.gStatus = gStatus;
	}

	public Date getgDate() {
		return gDate;
	}

	public void setgDate(Date gDate) {
		this.gDate = gDate;
	}

	public String getgSoldout() {
		return gSoldout;
	}

	public void setgSoldout(String gSoldout) {
		this.gSoldout = gSoldout;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	
	
	
	
}