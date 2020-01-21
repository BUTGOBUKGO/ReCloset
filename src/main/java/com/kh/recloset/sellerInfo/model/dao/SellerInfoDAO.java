package com.kh.recloset.sellerInfo.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.sellerInfo.model.vo.Review;


@Repository
public class SellerInfoDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	public Member selectUserNo(String userId) {
		return sqlSession.selectOne("sellerInfo-mapper.selectUserNo", userId);
	}

	public List<Review> selectReview(int userNo) {
		return sqlSession.selectList("sellerInfo-mapper.selectReview", userNo);
	}

	public List<Goods> selectSellerGoods(int userNo) {
		return sqlSession.selectList("sellerInfo-mapper.selectSellerGoods", userNo);
	}
	
	public List<Goods> selectOrderList(int userNo) {
		return sqlSession.selectList("sellerInfo-mapper.selectOrderList", userNo);
	}

	public int insertReview(Review r) {
		return sqlSession.insert("sellerInfo-mapper.insertReview", r);
	}

	public Review selectOneReview(int orderGoodsNo) {
		return sqlSession.selectOne("sellerInfo-mapper.selectOneReview", orderGoodsNo);
	}

	public List<Review> selectReview2(int orderGoodsNo) {
		return sqlSession.selectList("sellerInfo-mapper.selectReview2", orderGoodsNo);
	}

	public int updateOrderGoods(int orderGoodsNo) {
		return sqlSession.update("sellerInfo-mapper.updateOrderGoods", orderGoodsNo);
	}

	public List<Goods> selectGoodsListAll(int userNo) {
		return sqlSession.selectList("sellerInfo-mapper.selectGoodsListAll", userNo);
	}

	public List<Goods> selectGoodsList(Goods g) {
		return sqlSession.selectList("sellerInfo-mapper.selectGoodsList", g);
	}





	
	
	
	
	
}
