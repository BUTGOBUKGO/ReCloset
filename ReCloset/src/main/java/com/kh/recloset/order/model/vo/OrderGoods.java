package com.kh.recloset.order.model.vo;

import java.io.Serializable;

public class OrderGoods implements Serializable {

	private int ordergoodsno;
	private int orderno;
	private int goodsno;
	
	public OrderGoods() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderGoods(int ordergoodsno, int orderno, int goodsno) {
		super();
		this.ordergoodsno = ordergoodsno;
		this.orderno = orderno;
		this.goodsno = goodsno;
	}

	@Override
	public String toString() {
		return "OrderGoods [ordergoodsno=" + ordergoodsno + ", orderno=" + orderno + ", goodsno=" + goodsno + "]";
	}

	public int getOrdergoodsno() {
		return ordergoodsno;
	}

	public void setOrdergoodsno(int ordergoodsno) {
		this.ordergoodsno = ordergoodsno;
	}

	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public int getGoodsno() {
		return goodsno;
	}

	public void setGoodsno(int goodsno) {
		this.goodsno = goodsno;
	}
	
	
	
}
