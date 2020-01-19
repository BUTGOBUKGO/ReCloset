package com.kh.recloset.sellerInfo.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.cart.model.vo.Cart;
import com.kh.recloset.order.model.dao.OrderDAO;
import com.kh.recloset.order.model.vo.Delivery;
import com.kh.recloset.order.model.vo.Order;
import com.kh.recloset.order.model.vo.OrderGoods;
import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.sellerInfo.model.dao.SellerInfoDAO;
import com.kh.recloset.sellerInfo.model.vo.Review;

@Service
public class SellerInfoService {

	@Autowired
	SellerInfoDAO sellerInfoDAO;

	

	public List<Review> selectReview(int userNo) {
		return sellerInfoDAO.selectReview(userNo);
	}
	
	
	

}
