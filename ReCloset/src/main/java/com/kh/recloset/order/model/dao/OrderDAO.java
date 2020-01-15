package com.kh.recloset.order.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.order.model.vo.Delivery;
import com.kh.recloset.order.model.vo.Order;
import com.kh.recloset.product.model.vo.Goods;


@Repository
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertOrder(Order o) {
		return sqlSession.insert("order-mapper.insertOrder", o);
	}
	
	public Order selectOrder(int userNo) {
		return sqlSession.selectOne("order-mapper.selectOrder", userNo);
	}
	
	public int insertDelevery(Delivery delivery) {
		return sqlSession.insert("order-mapper.insertDelivery", delivery);
	}

	public List<Integer> cartList(int userNo) {
		return sqlSession.selectList("order-mapper.selectCartList", userNo);
	}

	public Goods selectGoods(int goodsNo) {
		return sqlSession.selectOne("order-mapper.selectGoods", goodsNo);
	}

	public List<Delivery> addressList(int userNo) {
		return sqlSession.selectList("order-mapper.selectAddressList", userNo);
	}

	public Delivery selectDelivery(int orderNo) {
		return sqlSession.selectOne("order-mapper.selectDelivery", orderNo);
	}



	
	
	
}
