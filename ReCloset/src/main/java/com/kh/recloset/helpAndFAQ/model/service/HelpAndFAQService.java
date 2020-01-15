package com.kh.recloset.helpAndFAQ.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.helpAndFAQ.exception.HelpAndFAQException;
import com.kh.recloset.helpAndFAQ.model.dao.HelpAndFAQDAO;
import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
import com.kh.recloset.helpAndFAQ.model.vo.Post;



@Service
public class HelpAndFAQService {
	
	@Autowired
	HelpAndFAQDAO helpDAO;
	
	
	public int insertFAO(HelpAndFAQ helpAndFAQ) {
		 int result = 0;

	      // 1. 게시글 추가
	      result = helpDAO.insertFAQ(helpAndFAQ);
	      if (result < 1) throw new HelpAndFAQException("게시글 추가 중 에러 발생");

	   return result;
	}

	public int insertPOST(Post post) {
		int result = 0;
		
		// 1. 게시글 추가
		result = helpDAO.insertPOST(post);
		if (result < 1) throw new HelpAndFAQException("게시글 추가 중 에러 발생");
		
		return result;
		
	}
	

	public List<HelpAndFAQ> faq() {
		
		return helpDAO.qselectList();
	}


	public List<Post> post() {
		
		return helpDAO.pselectList();
	}

	
		

	/*
	 * public List<Map<String, String>> selectList(int cPage, int numPerPage) {
	 * 
	 * return helpDAO.selectList(cPage, numPerPage); }
	 * 
	 * 
	 * public int selectTotalContents() {
	 * 
	 * return helpDAO.selectTotalContents(); }
	 */

	

}

