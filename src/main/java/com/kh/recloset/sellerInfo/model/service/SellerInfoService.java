package com.kh.recloset.sellerInfo.model.service;

  
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.sellerInfo.model.dao.SellerInfoDAO;
import com.kh.recloset.sellerInfo.model.vo.Review;

@Service
public class SellerInfoService {

	@Autowired
	SellerInfoDAO sellerInfoDAO;

	
	public Member selectUserNo(String userId) {
		return sellerInfoDAO.selectUserNo(userId);
	}

	public List<Review> selectReview(int userNo) {
		return sellerInfoDAO.selectReview(userNo);
	}

	public List<Goods> selectSellerGoods(int userNo) {
		return sellerInfoDAO.selectSellerGoods(userNo);
	}
	
	public List<Goods> selectOrderList(int userNo) {
		return sellerInfoDAO.selectOrderList(userNo);
	}

	public int insertReview(Review r) {
		return sellerInfoDAO.insertReview(r);
	}

	public Review selectOneReview(int orderGoodsNo) {
		return sellerInfoDAO.selectOneReview(orderGoodsNo);
	}

	public int updateOrderGoods(int orderGoodsNo) {
		return sellerInfoDAO.updateOrderGoods(orderGoodsNo);
	}

	public List<Goods> selectGoodsListAll(int userNo) {
		return sellerInfoDAO.selectGoodsListAll(userNo);
	}

	public List<Goods> selectGoodsList(Goods g) {
		return sellerInfoDAO.selectGoodsList(g);
	}

	





	
	
	

}
