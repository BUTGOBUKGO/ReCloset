package com.kh.recloset.searchRank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.searchRank.model.vo.SearchRank;

@Repository
public class SearchRankDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public String[][] realtimeSearchRanking(){
		List<SearchRank> list = new ArrayList<>();
		list = sqlSession.selectList("searchPage-mapper.realtimeSearchRanking");
		
		String[][] arr = new String[10][2];
		
		for(int i = 0; i < list.size(); i++) {
			
			arr[i][0] = String.valueOf(list.get(i).getRankNo());
			arr[i][1] = list.get(i).getSearchName();
		}
		
		return arr;
	}
}
