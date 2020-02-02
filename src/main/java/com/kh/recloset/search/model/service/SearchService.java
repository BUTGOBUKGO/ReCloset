package com.kh.recloset.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.search.model.dao.SearchDAO;
import com.kh.recloset.search.model.vo.Search;
import com.kh.recloset.search.model.vo.SearchValue;

@Service
public class SearchService {

	@Autowired
	SearchDAO searchDAO;
	
	
	public List gnameSearch(SearchValue sv) {
		
		/*
		 * System.out.println("category : " + category);
		 * System.out.println("searchName : " + searchName);
		 */
		
		
		return searchDAO.gnameSearch(sv);
	}
	
	public List sellerSearch(SearchValue sv) {
		/*
		 * System.out.println("category : " + category);
		 * System.out.println("searchName : " + searchName);
		 */
		
		return searchDAO.sellerSearch(sv);
	}

	public int insertSearch(String searchName, int userNo) {
		System.out.println(searchName);

		return searchDAO.insertSearch(searchName, userNo);
	}
}
