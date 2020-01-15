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

	
	
	
	
	
	
	
	/*
	 * public List<Map<String, String>> selectList(int cPage, int numPerPage) {
	 * 
	 * RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage); //
	 * "매퍼의 실행할 SQL 명", 파라미터로 받을 값, RowBounds 전용 공간 return
	 * sqlSession.selectList("help-mapper.selectList", null, rows); }
	 * 
	 * public int selectTotalContents() { // TODO Auto-generated method stub return
	 * sqlSession.selectOne("help-mapper.selectTotalContents"); }
	 */

}
