package com.kh.recloset.searchRank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.searchRank.model.service.SearchRankService;

@Controller
public class SearchRankController {

	@Autowired
	SearchRankService searchRankService;
	
	@RequestMapping("/searchRank/searchRank.do")
	public String searchRankingView() {
		
		return "search.jsp";
	}
	
	
	@RequestMapping("/searchRank/searchRank.rank")
	@ResponseBody
	public String[][] searchRank(Model model){
		
		
		String arr[][] = searchRankService.realtimeSearchRanking();
		
		return arr;
				
	}
}
