package com.kh.recloset.seller_statistics.model.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.seller_statistics.model.vo.GenderRatio;
import com.kh.recloset.seller_statistics.model.vo.MonthRevenue;
import com.kh.recloset.seller_statistics.model.vo.SelectRevenue;

@Repository
public class Seller_StatisticsDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public String[][] sellSelectMonthRevenue(int userNo) {
		List<MonthRevenue> list = new ArrayList<>();
		list = sqlSession.selectList("seller_statistics-mapper.sellSelectMonthRevenue",userNo);
		
		String[][] arr = new String[12][2];
		
		
		for(int i = 0; i < list.size() ; i++) {
			arr[i][0] = list.get(i).getMon();
			arr[i][1] = String.valueOf(list.get(i).getTotalCost());
		}
		
		return arr;
	}
	
	public String[][] sellGenderRatio(int userNo) {
		List<GenderRatio> list = new ArrayList<>(); 
		list= sqlSession.selectList("seller_statistics-mapper.sellGenderRatio",userNo);

		String[][] arr = new String[2][2];
		
		for(int i = 0; i < list.size() ; i++) {
			arr[i][0] = list.get(i).getGender();
			arr[i][1] = String.valueOf(list.get(i).getPct());
		}
		
		return arr;
	}
	public SelectRevenue sellSelectRevenue(int userNo) {
			
		return sqlSession.selectOne("seller_statistics-mapper.sellSelectRevenue", userNo);
	}
	
}
