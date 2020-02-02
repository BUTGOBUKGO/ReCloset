
package com.kh.recloset.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.admin.model.vo.MemSearch;
import com.kh.recloset.report.model.vo.Report;
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
		public int updateSeller(String userId) {
			return sqlSession.update("admin-mapper.updateSeller", userId);
				
		}
		
		// 회원삭제쿼리
		public int deleteMember(int userNo) {	
			return sqlSession.update("admin-mapper.deleteMember", userNo);
				
		}
		
		// 회원검색결과
		public List<MemSearch> searchMember(MemSearch ms) {
			return sqlSession.selectList("admin-mapper.searchMember", ms);
		}

		// 회원계정정지
		public int updateMemBlock(String userId) {
			return sqlSession.update("admin-mapper.updateMemBlock", userId);
		}
		
		// 회원블락해제
		public int updateUnBlock(String userId) {
			return sqlSession.update("admin-mapper.updateUnBlock", userId);
		}

		// 회원삭제
		public int deleteMember(String userId) {
			return sqlSession.update("admin-mapper.deleteMember", userId);
		}
		

		public List<Report> selectList() {

			return sqlSession.selectList("admin-mapper.selectReportList");
		} 
		

}
