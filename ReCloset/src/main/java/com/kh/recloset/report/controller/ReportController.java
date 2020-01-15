package com.kh.recloset.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.recloset.report.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@RequestMapping("/reportMgr.do")
	public String rePortMgr() {
		return "/report/reportMgr";
	}
	
	
	/* Seller Report */
	
	/* Member Report */

}
