package com.kh.recloset.searchRank.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.searchRank.model.dao.SearchRankDAO;

@Service
public class SearchRankService {

	@Autowired
	SearchRankDAO searchRankDAO;
	
	public String[][] realtimeSearchRanking(){
		
		return searchRankDAO.realtimeSearchRanking();
	}
	
}
