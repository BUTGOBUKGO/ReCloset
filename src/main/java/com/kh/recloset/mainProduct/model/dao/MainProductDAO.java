package com.kh.recloset.mainProduct.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainProductDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List selectMainWomanGoods(int limit) {

		RowBounds rows = new RowBounds(0, limit);
		
		return sqlSession.selectList("product-mapper.selectMainWomanGoods", null, rows);
	}
	
	public List selectMainManGoods(int limit) {

		RowBounds rows = new RowBounds(0, limit);
		
		return sqlSession.selectList("product-mapper.selectMainManGoods", null, rows);
	}
	
	public List selectMainAcGoods(int limit) {

		RowBounds rows = new RowBounds(0, limit);
		
		return sqlSession.selectList("product-mapper.selectMainAcGoods", null, rows);
	}

	public List selectMainAllGoods(int limit) {

		RowBounds rows = new RowBounds(0, limit);
		
		return sqlSession.selectList("product-mapper.selectMainAllGoods", null, rows);
	}
}
