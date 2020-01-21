package com.kh.recloset.myPage.model.vo;

import java.io.Serializable;

public class OrderedGoods implements Serializable{

	private int userNo;
	private String userName; 
	private int orderNo;
	private int goodNo;
	private int categoryCode; 
	private String category;
	private String gName;
	private int gPrice;
	private String changeName;
	private String deliveryNo; 
	private String trackingNo;
    private String trCode;
    private String trName;
	public OrderedGoods() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderedGoods(int userNo, String userName, int orderNo, int goodNo, int categoryCode, String category,
			String gName, int gPrice, String changeName, String deliveryNo, String trackingNo, String trCode,
			String trName) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.orderNo = orderNo;
		this.goodNo = goodNo;
		this.categoryCode = categoryCode;
		this.category = category;
		this.gName = gName;
		this.gPrice = gPrice;
		this.changeName = changeName;
		this.deliveryNo = deliveryNo;
		this.trackingNo = trackingNo;
		this.trCode = trCode;
		this.trName = trName;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getGoodNo() {
		return goodNo;
	}
	public void setGoodNo(int goodNo) {
		this.goodNo = goodNo;
	}
	public int getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public String getTrackingNo() {
		return trackingNo;
	}
	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}
	public String getTrCode() {
		return trCode;
	}
	public void setTrCode(String trCode) {
		this.trCode = trCode;
	}
	public String getTrName() {
		return trName;
	}
	public void setTrName(String trName) {
		this.trName = trName;
	}
	@Override
	public String toString() {
		return "OrderedGoods [userNo=" + userNo + ", userName=" + userName + ", orderNo=" + orderNo + ", goodNo="
				+ goodNo + ", categoryCode=" + categoryCode + ", category=" + category + ", gName=" + gName
				+ ", gPrice=" + gPrice + ", changeName=" + changeName + ", deliveryNo=" + deliveryNo + ", trackingNo="
				+ trackingNo + ", trCode=" + trCode + ", trName=" + trName + "]";
	}
	

}
