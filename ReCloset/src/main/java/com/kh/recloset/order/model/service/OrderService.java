package com.kh.recloset.order.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.order.model.dao.OrderDAO;
import com.kh.recloset.order.model.vo.Delivery;
import com.kh.recloset.order.model.vo.Order;
import com.kh.recloset.product.model.vo.Goods;

@Service
public class OrderService {

	@Autowired
	OrderDAO orderDAO;

	public int insertOrder(Order o) {
		return orderDAO.insertOrder(o);
	}
	
	public Order selectOrder(int userNo) {
		return orderDAO.selectOrder(userNo);
	}
	
	public int insertDelivery(Delivery delivery) {
		return orderDAO.insertDelevery(delivery);
	}

	public List<Integer> cartList(int userNo) {
		return orderDAO.cartList(userNo);
	}

	public Goods selectGoods(int goodsNo) {
		return orderDAO.selectGoods(goodsNo);
	}

	public List<Delivery> addressList(int userNo) {
		return orderDAO.addressList(userNo);
	}

	public Delivery selectDelivery(int orderNo) {
		return orderDAO.selectDelivery(orderNo);
	}


	

}
