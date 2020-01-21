package com.kh.recloset.cart.model.vo;
 
import java.io.Serializable;

public class Cart implements Serializable{
	
	private int userNo;
	private int goodsNo;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int userNo, int goodsNo) {
		super();
		this.userNo = userNo;
		this.goodsNo = goodsNo;
	}

	@Override
	public String toString() {
		return "Cart [userNo=" + userNo + ", goodsNo=" + goodsNo + "]";
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
	
	
	
}
