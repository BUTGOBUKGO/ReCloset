package com.kh.recloset.myPage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.myPage.model.vo.MyPage;
	
	@Repository
	public class MyPageDAO {

		@Autowired
		SqlSessionTemplate sqlSession;
		
	public List selectMyOrderList(int userNo) {
			
		return sqlSession.selectList("mypage-mapper.selectMyOrderList", userNo);
			
	}
		
		
	public List select1MOrderList(int userNo) {
		
		return sqlSession.selectList("mypage-mapper.select1MOrderList", userNo);
		
	}
	
	public List select3MOrderList(int userNo) {
		
		return sqlSession.selectList("mypage-mapper.select3MOrderList", userNo);
		
	}
	
	public List select6MOrderList(int userNo) {
		
		return sqlSession.selectList("mypage-mapper.select6MOrderList", userNo);
		
	}
	
	public List selectMySOrderList(MyPage my) {
		
		return sqlSession.selectList("mypage-mapper.select1MOrderList", my);
		
	}

	
	
}

