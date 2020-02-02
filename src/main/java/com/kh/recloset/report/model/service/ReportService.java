package com.kh.recloset.report.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.admin.model.vo.Report;
import com.kh.recloset.report.model.dao.ReportDAO;

@Service

public class ReportService {

	@Autowired
	ReportDAO reportDAO;
	
	
	
	public int report(Report re) {
		
		return reportDAO.report(re);
	}

	public List<Report> selectList() {
		
		return reportDAO.selectList();
	}

}
