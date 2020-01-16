package com.kh.recloset.admin_statistics.controller;

import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.admin_statistics.model.service.Admin_StatisticsService;

@Controller
public class Admin_StatisticsController {

	@Autowired
	Admin_StatisticsService admin_StatisticsService;
	
	@RequestMapping("/admin_Statistics/admin_Statistics.do")
	public String statisticsView(Model model) {
		
		return "admin_statistics/admin_statistics";
	}
	
	@RequestMapping("/admin_Statistics/admin_Statistics.stat")
	@ResponseBody
	public HashMap<String, Object> selectStatistics(HttpSession session, Model model) {

		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("month", admin_StatisticsService.adminSelectMonthRevenue());
		hmap.put("gender", admin_StatisticsService.adminGenderRatio());
		hmap.put("total", admin_StatisticsService.adminSelectRevenue());
		hmap.put("age", admin_StatisticsService.adminSelectAgeRatio());
		hmap.put("sample", admin_StatisticsService.adminSelectTOP3());

		/*
		 * Set<HashMap.Entry<String, Object>> entries = hmap.entrySet(); for
		 * (HashMap.Entry<String, Object> entry : entries) { System.out.println("key : "
		 * + entry.getKey()); System.out.println(", value : " + entry.getValue()); }
		 */

		return hmap;
	}
}
