package com.kh.recloset.myPage.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.myPage.model.dao.MyPageDAO;
import com.kh.recloset.myPage.model.vo.MyPage;
import com.kh.recloset.myPage.model.vo.OrderedGoods;
import com.kh.recloset.myPage.model.vo.TrackCompany;

@Service
public class MyPageService {
	
	@Autowired
	MyPageDAO mypageDAO;
	
	
	public List selectMyOrderList(int userNo) {
		
		return mypageDAO.selectMyOrderList(userNo);
		
	}
	
	
	public List select1MOrderList(int userNo) {
		
		return mypageDAO.select1MOrderList(userNo);
		
	}
	
	public List select3MOrderList(int userNo) {
		
		return mypageDAO.select3MOrderList(userNo);
		
	}
	
	public List select6MOrderList(int userNo) {
		
		return mypageDAO.select6MOrderList(userNo);
		
	}

	public List<MyPage> selectMySOrderList(int userNo, String startDate, String endDate) {
		
		HashMap<String, Object> hmap = new HashMap();
		hmap.put("userNo", userNo);
		hmap.put("startDate", startDate);
		hmap.put("endDate", endDate);
		
		return mypageDAO.selectMySOrderList(hmap);
	}
	
	public List<OrderedGoods> selectOrderedList(int userNo) {
		
		return mypageDAO.selectOrderedList(userNo);
	}


	public List<TrackCompany> selectTrackCompany() {
		
		return mypageDAO.selectTrackCompany();
	}


	public int updateDelivery(OrderedGoods orderedGood) {
		
		return mypageDAO.updateDelivery(orderedGood);
	}

}
