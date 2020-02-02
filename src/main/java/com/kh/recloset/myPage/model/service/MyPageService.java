package com.kh.recloset.myPage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.myPage.model.dao.MyPageDAO;
import com.kh.recloset.myPage.model.vo.MyPage;

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
		
		return mypageDAO.select3MOrderList(userNo);
		
	}
	
	public List selectMySOrderList(MyPage my) {
		
		return mypageDAO.selectMySOrderList(my);
		
	}

}
