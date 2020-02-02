package com.kh.recloset.search.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.search.model.vo.Search;
import com.kh.recloset.search.model.vo.SearchValue;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insertSearch(Search search) {
		
		return sqlSession.insert("searchPage-mapper.insertSearch", search);
	}
	
	public List<Object> gnameSearch (SearchValue sv) {
		/*
		 * System.out.println("category : " + category);
		 * System.out.println("searchName : " + searchName);
		 */	
		
		
		return sqlSession.selectList("searchPage-mapper.gnameSearch", sv);
	}
	
	public List<Object> sellerSearch (SearchValue sv) {
		
		/*
		 * System.out.println("category : " + category);
		 * System.out.println("searchName : " + searchName);
		 */
		return sqlSession.selectList("searchPage-mapper.sellerSearch", sv);
	}

	public int insertSearch(String searchName, int userNo) {

		Search ser = new Search();
		ser.setUserNo(userNo);
		ser.setSearchName(searchName);
		
		return sqlSession.insert("searchPage-mapper.insertSearch", ser);
	}

}

