package com.kh.recloset.seller_statistics.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.admin_statistics.model.service.Admin_StatisticsService;
import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.seller_statistics.model.service.Seller_StatisticsService;

@Controller
public class Seller_StatisticsController {

	@Autowired
	Seller_StatisticsService seller_StatisticsService;
	
	@Autowired
	Admin_StatisticsService admin_StatisticsService;
	
	@RequestMapping("/seller_Statistics/seller_Statistics.do")
	public String statisticsView(Model model) {
		
		return "seller_statistics/seller_statistics";
	}
	
	@RequestMapping("/seller_Statistics/seller_Statistics.stat")
	@ResponseBody
	public HashMap<String, Object> selectStatistics(HttpSession session, Model model) {
		
		//int userNo = ((Member)session.getAttribute("member")).getUserNo();
		int userNo = 1;
		// seller_StatisticsService.sellSelectMonthRevenue(userNo);
		
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("month", seller_StatisticsService.sellSelectMonthRevenue(userNo));
		hmap.put("gender", seller_StatisticsService.sellGenderRatio(userNo));
		hmap.put("total", seller_StatisticsService.sellSelectRevenue(userNo));
		
		return hmap;
	}

}
