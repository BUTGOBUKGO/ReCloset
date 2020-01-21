package com.kh.recloset.order.model.vo;

import java.io.Serializable;

public class OrderGoods implements Serializable {

	private int orderGoodsNo;
	private int orderNo;
	private int goodsNo;
	private String rStatus;
	
	public OrderGoods() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderGoods(int orderGoodsNo, int orderNo, int goodsNo, String rStatus) {
		super();
		this.orderGoodsNo = orderGoodsNo;
		this.orderNo = orderNo;
		this.goodsNo = goodsNo;
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "OrderGoods [orderGoodsNo=" + orderGoodsNo + ", orderNo=" + orderNo + ", goodsNo=" + goodsNo
				+ ", rStatus=" + rStatus + "]";
	}

	public int getOrderGoodsNo() {
		return orderGoodsNo;
	}

	public void setOrderGoodsNo(int orderGoodsNo) {
		this.orderGoodsNo = orderGoodsNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	
}
