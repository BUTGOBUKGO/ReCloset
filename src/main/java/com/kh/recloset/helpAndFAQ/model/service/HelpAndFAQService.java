package com.kh.recloset.helpAndFAQ.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.helpAndFAQ.exception.HelpAndFAQException;
import com.kh.recloset.helpAndFAQ.model.dao.HelpAndFAQDAO;
import com.kh.recloset.helpAndFAQ.model.vo.Comment;
import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
import com.kh.recloset.helpAndFAQ.model.vo.PComment;
import com.kh.recloset.helpAndFAQ.model.vo.Post;
import com.kh.recloset.product.model.vo.Attachment;



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
	

	public List<HelpAndFAQ> faq(int cPage) {
		
		return helpDAO.qselectList(cPage);
	}


	public List<Post> post(int cPage) {
		
		return helpDAO.pselectList(cPage);
	}

	public HelpAndFAQ selectHelp(int qnaNo) {
		
		return helpDAO.selectHelp(qnaNo);
	}

	public Post selectPost(int psnaNo) {
		
		return helpDAO.selectPost(psnaNo);
	}
	
	public int updateHelp(HelpAndFAQ originHelp) {

		return helpDAO.updateHelp(originHelp);
	}

	public int updatePost(Post originpost) {
		
		return helpDAO.updatePost(originpost);
	}
	public int deleteHelp(int qnaNo) {
	
		return helpDAO.deleteHelp(qnaNo);
	}

	public int deletePost(int psnaNo) {
		
		return helpDAO.deletePost(psnaNo);
	}

	public int selectTotalContents() {
	
		return helpDAO.selectTotalContents();
	}
	
	public int selectpTotalContents() {
		
		return helpDAO.selectpTotalContents();
	}

	/* ----------------------------------------------------- */
	
	public int insertqComment(Comment cmt) {
		
		return helpDAO.insertqComment(cmt);
	}

	public int insertpComment(PComment pcmt) {
		
		return helpDAO.insertpComment(pcmt);
	}

	
	
	 public List<Comment> selectqComments(int qnaNo) {
	 
	 return helpDAO.selectqComments(qnaNo); 
	 }
	 
	 public List<PComment> selectpComments(int psnaNo) {
		
		 return helpDAO.selectpComments(psnaNo);
	 }

	public int updateqComment(Comment cmt) {

		return helpDAO.updateqComment(cmt);
	}
	
	public int updatepComment(PComment pcmt) {

		return helpDAO.updatepComment(pcmt);
	}
	

	public int deleteqComment(int cNo) {

		int result = 0;
		
		result = helpDAO.deleteqComment(cNo);
	      if(result < 1) throw new HelpAndFAQException("댓글 삭제 실패");
	      
	      return result;
	}

	public int deletepComment(int psnacNo) {
		int result = 0;
		
		result = helpDAO.deletepComment(psnacNo);
		if(result < 1)throw new HelpAndFAQException("댓글 삭제 실패");
		
		return result;
	}

	





	
	
		


}


