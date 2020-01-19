package com.kh.recloset.product.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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

	

	public List selectList(int limit) {

		RowBounds rows = new RowBounds(0, limit);
		
		return sqlSession.selectList("product-mapper.selectList", null, rows);
	}

	
	  public Goods selectOne(int goodsNo) {
	  
	  return sqlSession.selectOne("product-mapper.selectOnePro", goodsNo); 
	  }
	  
	  public List<Attachment> selectAttachment(int goodsNo) {
	  
	  return sqlSession.selectList("product-mapper.selectAttachment", goodsNo); 
	  }

	public int updateProduct(Goods originProduct) {
		
		return sqlSession.update("product-mapper.updateProduct", originProduct);
	}

	public int deleteAttachment(int goodsNo) {
		
		return sqlSession.delete("product-mapper.daleteAttachment", goodsNo);
	}

	public int updateAttachment(Attachment a) {
		
		return sqlSession.insert("product-mapper.updateAttachment", a);
	}

	public int deleteGoods(int goodsNo) {
		
		return sqlSession.delete("product-mapper.deleteGoods", goodsNo);
	}

	public int totalCount() {
		
		return sqlSession.selectOne("product-mapper.totalCount");
	}

	public List<Goods> selectList4LoadMore(int currentPage, int limit) {
		
		RowBounds rows = new RowBounds((currentPage - 1) * limit -1, limit);
		
		return sqlSession.selectList("product-mapper.selectList4LoadMore", null, rows);
	}
	 

	
	
}
