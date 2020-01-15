package com.kh.recloset.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.cart.model.dao.CartDAO;
import com.kh.recloset.cart.model.vo.Cart;
import com.kh.recloset.product.model.vo.Goods;

@Service
public class CartService {

	@Autowired
	CartDAO cartDAO;
	
	public List<Integer> cartList(int userNo) {
		return cartDAO.cartList(userNo);
	}

	public Goods selectGoods(int goodsNo) {
		return cartDAO.selectGoods(goodsNo);
	}

	public int deleteCart(Cart cart) {
		return cartDAO.deleteCart(cart);
	}

}
