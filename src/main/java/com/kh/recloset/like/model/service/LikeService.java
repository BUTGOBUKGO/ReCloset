package com.kh.recloset.like.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.like.model.dao.LikeDAO;
import com.kh.recloset.like.model.vo.Like;
import com.kh.recloset.product.model.vo.Goods;

@Service
public class LikeService {

	@Autowired
	LikeDAO likeDAO;
	
	public Like selectLike(Like like) {
		
		return likeDAO.selectLike(like);
	}

	public int insertLike(Like like) {
		
		return likeDAO.insertLike(like);
	}

	public int updateLike(Like like) {
		
		return likeDAO.updateLike(like);
	}

	public int cancelLike(Like like) {

		return likeDAO.cencelLike(like);
	}

	public int likeCount(int goodsNo) {
	
		return likeDAO.likeCount(goodsNo);
	}
	
	

	
	  public List<Integer> likeList(int userNo) {
	  
	  return likeDAO.likeList(userNo); }
	  
	  public Goods selectGoods(int goodsNo) {
	  
	  return likeDAO.selectGoods(goodsNo); }

	public int deleteLike(Like l) {
	
		return likeDAO.deleteLike(l);
	}

	public int myLikeCount(int userNo) {
		return likeDAO.myLikeCount(userNo);
	}


	 

}
