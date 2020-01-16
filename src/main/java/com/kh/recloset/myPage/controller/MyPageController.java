package com.kh.recloset.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.recloset.myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "/myPage/myPage";
	}
	
	
}
