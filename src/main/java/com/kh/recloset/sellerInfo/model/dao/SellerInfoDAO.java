package com.kh.recloset.sellerInfo.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.cart.model.vo.Cart;
import com.kh.recloset.order.model.vo.Delivery;
import com.kh.recloset.order.model.vo.Order;
import com.kh.recloset.order.model.vo.OrderGoods;
import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.sellerInfo.model.vo.Review;


@Repository
public class SellerInfoDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	

	public List<Review> selectReview(int userNo) {
		return sqlSession.selectList("sellerInfo-mapper.selectReview", userNo);
	}
	
	
	
	
	
}
