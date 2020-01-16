package com.kh.recloset.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.search.model.dao.SearchDAO;
import com.kh.recloset.search.model.vo.Search;

@Service
public class SearchService {

	@Autowired
	SearchDAO searchDAO;
	
	
	public List gnameSearch(String searchName, int category) {
		
		System.out.println("category : " + category);
		System.out.println("searchName : " + searchName);
		
		
		return searchDAO.gnameSearch(searchName, category);
	}
	
	public List sellerSearch(String searchName, int category) {
		
		System.out.println("category : " + category);
		System.out.println("searchName : " + searchName);
		
		
		return searchDAO.sellerSearch(searchName, category);
	}

	public int insertSearch(String searchName, int userNo) {
		System.out.println(searchName);

		return searchDAO.insertSearch(searchName, userNo);
	}
}
