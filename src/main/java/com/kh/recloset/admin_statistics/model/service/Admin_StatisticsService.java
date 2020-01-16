package com.kh.recloset.admin_statistics.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.admin_statistics.model.dao.Admin_StatisticsDAO;
import com.kh.recloset.seller_statistics.model.vo.SelectRevenue;

@Service
public class Admin_StatisticsService {

	@Autowired
	Admin_StatisticsDAO admin_statisticsDAO;
	
	public String[][] adminSelectMonthRevenue(){
		
		return admin_statisticsDAO.adminSelectMonthRevenue();
	}
	
	public String[][] adminGenderRatio(){
		return admin_statisticsDAO.adminGenderRatio();
	}
	
	public SelectRevenue adminSelectRevenue() {
		return admin_statisticsDAO.adminSelectRevenue();
	}

	public String[][] adminSelectAgeRatio(){
		return admin_statisticsDAO.adminSelectAgeRatio();
	}
	
	public String[][][] adminSelectTOP3() {
		return admin_statisticsDAO.adminSelectTOP3();
	}
	
}
