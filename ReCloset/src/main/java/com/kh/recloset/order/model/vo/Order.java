package com.kh.recloset.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{

	private int orderNo;
	private int userNo;
	private int orderchkNo;
	private String payment;
	private Date oDate;
	private String refund;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int orderNo, int userNo, int orderchkNo, String payment, Date oDate, String refund) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderchkNo = orderchkNo;
		this.payment = payment;
		this.oDate = oDate;
		this.refund = refund;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", orderchkNo=" + orderchkNo + ", payment="
				+ payment + ", oDate=" + oDate + ", refund=" + refund + "]";
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

	public int getOrderchkNo() {
		return orderchkNo;
	}

	public void setOrderchkNo(int orderchkNo) {
		this.orderchkNo = orderchkNo;
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

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}
	
	
	
}
