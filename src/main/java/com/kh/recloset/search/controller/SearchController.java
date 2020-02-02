package com.kh.recloset.search.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.search.model.service.SearchService;
import com.kh.recloset.search.model.vo.SearchValue;
import com.kh.recloset.searchRank.model.service.SearchRankService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	SearchRankService searchRankService;
	
	
	
	
	@RequestMapping("/search/gnameSearch.ser")
	public String gnameSearch(HttpSession session,
							  @RequestParam(value="searchName", required = false ) String searchName,
							  @RequestParam(value="category", required = false) int category, Model model) {
		
		
		Member member = (Member)session.getAttribute("member");

		if(member == null) {
			
		} else {

			int userNo = member.getUserNo();
			int result = searchService.insertSearch(searchName, userNo);
		}
		
		SearchValue sv = new SearchValue();
		sv.setSearchName(searchName);
		sv.setCategory(category);

		  System.out.println(sv);
		  List<Goods> list = searchService.gnameSearch(sv);
		  System.out.println(list);
		  model.addAttribute("goods", list);	
		  
		  
		  return "product/productList";
	}
	
	@RequestMapping("/search/sellerSearch.ser")
	public String sellerSearch(HttpSession session,
							   @RequestParam(value="searchName", required = false ) String searchName,
			  				   @RequestParam(value="category", required = false) int category, Model model) {
	
		
		System.out.println("category : " + category);
		System.out.println("searchName : " + searchName);
		
		
		
		Member member = (Member)session.getAttribute("member");

		if(member == null) {
					
		} else {

		  int userNo = member.getUserNo();
		  int result = searchService.insertSearch(searchName, userNo);

		}
		
		
		SearchValue sv = new SearchValue();
		sv.setSearchName(searchName);
		sv.setCategory(category);
		  List<Goods> list = searchService.sellerSearch(sv);
		  System.out.println(list);
		  model.addAttribute("goods", list);	
		  
		  
		  return "product/productList";
	}
	
}
