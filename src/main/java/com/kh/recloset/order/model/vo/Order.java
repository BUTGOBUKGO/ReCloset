package com.kh.recloset.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{

	private int orderNo;
	private int userNo;
	private int orderChkNo;
	private String payment;
	private Date oDate;
	private int totalPrice;
	private String refund;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int orderNo, int userNo, int orderChkNo, String payment, Date oDate, int totalPrice, String refund) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderChkNo = orderChkNo;
		this.payment = payment;
		this.oDate = oDate;
		this.totalPrice = totalPrice;
		this.refund = refund;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", orderChkNo=" + orderChkNo + ", payment="
				+ payment + ", oDate=" + oDate + ", totalPrice=" + totalPrice + ", refund=" + refund + "]";
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

	public int getorderChkNo() {
		return orderChkNo;
	}

	public void setorderChkNo(int orderChkNo) {
		this.orderChkNo = orderChkNo;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}
	
	
	
	
}
