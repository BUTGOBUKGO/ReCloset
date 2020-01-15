package com.kh.recloset.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
import com.kh.recloset.product.model.vo.Attachment;
import com.kh.recloset.product.model.vo.Goods;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertProduct(Goods goods) {
		
		return sqlSession.insert("product-mapper.insertProduct", goods);
	}

	public int insertAttachment(Attachment a) {
		
		return sqlSession.insert("product-mapper.insertAttachment", a);
	}

	/*
	 * public List<Attachment> selectAttahment(int goodsno) {
	 * 
	 * return sqlSession.selectList("product-mapper.selectAttahment", goodsno); }
	 */

	public List selectList() {

		return sqlSession.selectList("product-mapper.selectList");
	}

	
	  public Goods selectOne(int goodsno) {
	  
	  return sqlSession.selectOne("product-mapper.selectOnePro", goodsno); 
	  }
	  
	  public List<Attachment> selectAttachment(int goodsno) {
	  
	  return sqlSession.selectList("product-mapper.selectAttachment", goodsno); 
	  }
	 

	
	
}
