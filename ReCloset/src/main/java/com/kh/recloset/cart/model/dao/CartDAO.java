package com.kh.recloset.cart.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.cart.model.vo.Cart;
import com.kh.recloset.product.model.vo.Goods;

@Repository
public class CartDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<Integer> cartList(int userNo) {
		return sqlSession.selectList("cart-mapper.selectCartList", userNo);
	}

	public Goods selectGoods(int goodsNo) {
		return sqlSession.selectOne("cart-mapper.selectGoodsList", goodsNo);
	}

	public int deleteCart(Cart cart) {
		return sqlSession.delete("cart-mapper.deleteCart", cart);
	}
	
	
}
