package com.kh.recloset.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.myPage.model.vo.MyPage;
	

	@Repository
	public class AdminDAO {

		@Autowired
		SqlSessionTemplate sqlSession;
		
		
		// 계정 자동정지
		public int updateMemBlock(int userNo) {
			return sqlSession.update("admin-mapper.updateMemBlock", userNo);
				
		}
		
		// 리뷰블라인드
		public int updateBlindReview(int userNo) {
			return sqlSession.update("admin-mapper.updateBlindReview", userNo);
				
		}
		
		// 일반회원 블락해제
		public int updateUnBlock(int userNo) {
			return sqlSession.update("admin-mapper.updateUnBlock", userNo);
				
		}
		
		// 판매자회원 블락해제
		public int updateUnBlockS(int userNo) {
			return sqlSession.update("admin-mapper.updateUnBlockS", userNo);
				
		}
		
		// 판매자회원으로 승격시켜주기
		public int updateSeller(int userNo) {
			return sqlSession.update("admin-mapper.updateSeller", userNo);
				
		}
		
		// 회원삭제쿼리
		public int deleteMember(int userNo) {	
			return sqlSession.update("admin-mapper.deleteMember", userNo);
				
		}
		

}
