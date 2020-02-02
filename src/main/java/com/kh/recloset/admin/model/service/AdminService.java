
package com.kh.recloset.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.admin.model.dao.AdminDAO;
import com.kh.recloset.admin.model.vo.MemSearch;
import com.kh.recloset.report.model.vo.Report;

@Service
public class AdminService {
	
	@Autowired
	AdminDAO adminDAO;
	
	// 계정 자동정지
	public int updateMemBlock(int userNo){
		return adminDAO.updateMemBlock(userNo);
		
	}
	
	// 리뷰블라인드
	public int updateBlindReview(int userNo){
		return adminDAO.updateBlindReview(userNo);
		
	}
	
	// 일반회원 블락해제
	public int updateUnBlock(int userNo){
		return adminDAO.updateUnBlock(userNo);
		
	}
	
	// 판매자회원 블락해제
	public int updateUnBlockS(int userNo){
		return adminDAO.updateUnBlockS(userNo);
		
	}
	
	// 판매자회원으로 승격시켜주기
	public int updateSeller(String userId){
		return adminDAO.updateSeller(userId);
		
	}
	
	// 회원삭제쿼리
	public int deleteMember(int userNo){
		return adminDAO.deleteMember(userNo);
		
	}
	
	// 회원검색
	
	public List<MemSearch> searchMember(MemSearch ms) {
		
		return adminDAO.searchMember(ms);
	}
	
	// 회원 계정 정지
	public int updateMemBlock(String userId) {
		return adminDAO.updateMemBlock(userId);
	}

	// 회원 블락해제
	public int updateUnBlock(String userId) {
		return adminDAO.updateUnBlock(userId);
	}
	
	// 회원삭제
	public int deleteMember(String userId) {
		return adminDAO.deleteMember(userId);
	}

	
	public List<Report> selectList() {
		
		return adminDAO.selectList();
	} 
	

}
