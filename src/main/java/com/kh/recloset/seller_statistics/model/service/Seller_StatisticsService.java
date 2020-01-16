package com.kh.recloset.seller_statistics.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.seller_statistics.model.dao.Seller_StatisticsDAO;
import com.kh.recloset.seller_statistics.model.vo.SelectRevenue;

@Service
public class Seller_StatisticsService {

	
	@Autowired
	Seller_StatisticsDAO seller_statisticsDAO;
	
	public String[][] sellSelectMonthRevenue(int userNo) {
		
		return seller_statisticsDAO.sellSelectMonthRevenue(userNo);
	}
	public String[][] sellGenderRatio(int userNo) {
		
		return seller_statisticsDAO.sellGenderRatio(userNo);
	}
	public SelectRevenue sellSelectRevenue(int userNo) {
		
		return seller_statisticsDAO.sellSelectRevenue(userNo);
	}
}
