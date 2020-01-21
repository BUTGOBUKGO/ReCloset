package com.kh.recloset.order.model.vo;

import java.io.Serializable;
   
public class Delivery implements Serializable{

	private int deliveryNo;
	private int orderNo;
	private int userNo;
	private int orderChkNo;
	private String receiver;
	private String zipCode;
	private String address1;
	private String address2;
	private String phone;
	private String dMessage;
	private String trackingNo;
	
	public Delivery() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Delivery(int deliveryNo, int orderNo, int userNo, int orderChkNo, String receiver, String zipCode,
			String address1, String address2, String phone, String dMessage, String trackingNo) {
		super();
		this.deliveryNo = deliveryNo;
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderChkNo = orderChkNo;
		this.receiver = receiver;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.dMessage = dMessage;
		this.trackingNo = trackingNo;
	}

	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", orderNo=" + orderNo + ", userNo=" + userNo + ", orderChkNo="
				+ orderChkNo + ", receiver=" + receiver + ", zipCode=" + zipCode + ", address1=" + address1
				+ ", address2=" + address2 + ", phone=" + phone + ", dMessage=" + dMessage + ", trackingNo="
				+ trackingNo + "]";
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getOrderChkNo() {
		return orderChkNo;
	}

	public void setOrderChkNo(int orderChkNo) {
		this.orderChkNo = orderChkNo;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getdMessage() {
		return dMessage;
	}

	public void setdMessage(String dMessage) {
		this.dMessage = dMessage;
	}

	public String getTrackingNo() {
		return trackingNo;
	}

	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}

	
	
}
