package com.kh.recloset.helpAndFAQ.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.helpAndFAQ.model.vo.HelpAndFAQ;
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

	public List<HelpAndFAQ> qselectList() {
		return sqlSession.selectList("help-mapper.faqList");
	}

	public List<Post> pselectList() {
		
		return sqlSession.selectList("post-mapper.postList");
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
	
	
	
	
	
	
	
	
	

}
