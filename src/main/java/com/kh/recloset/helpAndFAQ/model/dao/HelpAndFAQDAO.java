package com.kh.recloset.helpAndFAQ.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.helpAndFAQ.model.vo.Comment;
import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
import com.kh.recloset.helpAndFAQ.model.vo.PComment;
import com.kh.recloset.helpAndFAQ.model.vo.Post;
import com.kh.recloset.product.model.vo.Attachment;

@Repository
public class HelpAndFAQDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertFAQ(HelpAndFAQ helpAndFAQ) {

		return sqlSession.insert("help-mapper.insertFAQ", helpAndFAQ);
	}
	public int insertPOST(Post post) {
		
		return sqlSession.insert("post-mapper.insertPOST", post);
	}

	public List<HelpAndFAQ> qselectList(int cPage) {
		RowBounds rows = new RowBounds((cPage-1) * 10, 10);
		return sqlSession.selectList("help-mapper.faqList", null, rows);
	}

	public List<Post> pselectList(int cPage) {
		RowBounds rows = new RowBounds((cPage-1) * 10, 10);
		return sqlSession.selectList("post-mapper.postList", null, rows);
	}
	public HelpAndFAQ selectHelp(int qnaNo) {
		
		return sqlSession.selectOne("help-mapper.selectHelp", qnaNo);
	}
	public Post selectPost(int psnaNo) {
		
		return sqlSession.selectOne("post-mapper.selectPost", psnaNo);
	}
	public int updateHelp(HelpAndFAQ originHelp) {
	
		return sqlSession.update("help-mapper.updateHelp", originHelp);
	}
	public int updatePost(Post originpost) {
		
		return sqlSession.update("post-mapper.updatePost", originpost);
	}
	public int deleteHelp(int qnaNo) {
		
		return sqlSession.delete("help-mapper.deleteHelp", qnaNo);
	}
	public int deletePost(int psnaNo) {
		
		return sqlSession.delete("post-mapper.deletePost", psnaNo);
	}
	public int selectTotalContents() {
		
		return sqlSession.selectOne("help-mapper.selectTotalContents");
	}
	public int selectpTotalContents() {
	
		return sqlSession.selectOne("post-mapper.selectpTotalContents");
	}
	
	
	/*-------------------------------------*/
	
	
	  public List<Comment> selectqComments(int qnaNo) {
	  
	  return sqlSession.selectList("help-mapper.selectqComments", qnaNo); 
	  
	  }
	  public List<PComment> selectpComments(int psnaNo) {

		  return sqlSession.selectList("post-mapper.selectpComments", psnaNo);
	  }
	  
	  
	
		public int insertqComment(Comment cmt) {
		
		return sqlSession.insert("help-mapper.insertqComment", cmt);
	}
		public int insertpComment(PComment pcmt) {
			
			return sqlSession.insert("post-mapper.insertpComment", pcmt);
		}
	
		
		public int updateqComment(Comment cmt) {
			
			return sqlSession.update("help-mapper.updateqComment" , cmt);
		}
		public int updatepComment(PComment pcmt) {
			
			return sqlSession.update("post-mapper.updatepComment" , pcmt);
		}
		public int deleteqComment(int cNo) {
			
			return sqlSession.update("help-mapper.deleteqComment", cNo);
		}
		public int deletepComment(int psnacNo) {
			
			return sqlSession.update("post-mapper.deletepComment", psnacNo);
		}
		
	
	
	
	
	
	

}
