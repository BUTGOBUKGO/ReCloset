package com.kh.recloset.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.admin.model.vo.Report;
import com.kh.recloset.report.model.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	
//	@RequestMapping("/adminPage_R.do")
//	public String rePortMgr() {
//		
//		List<Report> list = reportService.selectList();
//		
//		return "/admin/adminPage_report";
//	}
	
	@RequestMapping("/reportReview.do")
	@ResponseBody
	public int reportReview(@RequestParam int reportCode,
							@RequestParam int userNo,
							@RequestParam String rreason,
							@RequestParam String rreporter,
							@RequestParam String defendant) {
		
		Report re = new Report();
		re.setReportCode(reportCode);
		re.setUserNo(userNo);
		re.setRreason(rreason);
		re.setRreporter(rreporter);
		re.setDefendant(defendant);
		
		int result = reportService.report(re);
		
		return result;
	}
	
	@RequestMapping("/reportSeller.do")
	@ResponseBody
	public int reportSeller(@RequestParam int reportCode,
							@RequestParam int userNo,
							@RequestParam String rreason,
							@RequestParam String rreporter,
							@RequestParam String defendant) {
		
		Report re = new Report();
		re.setReportCode(reportCode);
		re.setUserNo(userNo);
		re.setRreason(rreason);
		re.setRreporter(rreporter);
		re.setDefendant(defendant);
		
		int result = reportService.report(re);
		
		return result;
	}

}
