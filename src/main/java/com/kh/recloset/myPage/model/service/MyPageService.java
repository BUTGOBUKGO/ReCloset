package com.kh.recloset.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.recloset.myPage.model.dao.MyPageDAO;


@Service
public class MyPageService {
	
	@Autowired
	MyPageDAO mypageDAO;

}
