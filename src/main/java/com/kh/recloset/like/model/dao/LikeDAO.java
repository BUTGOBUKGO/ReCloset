package com.kh.recloset.like.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.like.model.vo.Like;
import com.kh.recloset.product.model.vo.Goods;

@Repository
public class LikeDAO {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	public Like selectLike(Like like) {
		
		return sqlSession.selectOne("like-mapper.selectLike", like);
	}

	public int insertLike(Like like) {
	
		return sqlSession.insert("like-mapper.insertLike", like);
	}

	public int updateLike(Like like) {
		
		return sqlSession.update("like-mapper.updateLike", like);
	}

	public int cencelLike(Like like) {

		return sqlSession.update("like-mapper.cencelLike", like);
	}

	public int likeCount(int goodsNo) {

		return sqlSession.selectOne("like-mapper.likeCount", goodsNo);
	}

	
	  public List<Integer> likeList(int userNo) {
	  
	  return sqlSession.selectList("like-mapper.likeList", userNo); }
	  
	  public Goods selectGoods(int goodsNo) {
	  
	  return sqlSession.selectOne("like-mapper.selectGoods", goodsNo); }

	public int deleteLike(Like l) {

		return sqlSession.delete("like-mapper.deleteList", l);
	}

	public int myLikeCount(int userNo) {
		return sqlSession.selectOne("like-mapper.myLikeCount", userNo);
	}

	
	 
}
