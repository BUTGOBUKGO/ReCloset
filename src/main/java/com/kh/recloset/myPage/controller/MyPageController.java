package com.kh.recloset.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.myPage.model.service.MyPageService;
import com.kh.recloset.myPage.model.vo.MyPage;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;


	// 주문내역
	@RequestMapping ("/myPage.do")
	public String myList(HttpSession session, Model model){
		
		
		// session에 저장된 userId
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		int userNo = m.getUserNo();
		// 주문내역조회에서 보여줄 주문수
//		int numPerOrder = 5;
		
		//Map<String, Object> map = new HashMap<String, Object>();
		
		List<MyPage> myList = myPageService.selectMyOrderList(userNo);
		
		System.out.println(myList);
		model.addAttribute("myList", myList);
		
		return "/myPage/myPage";
		
		/*
		// 주문 정보
		List<OrderList> = orderService.listOrder(userId);
		// 주문 총액
		int totalCost = orderService.totoalCost(userId);
		
		
		// ??
		map.put("list", list);
		map.put("totalCost" totalCost);
		mav.setViewName("myPage/myList");
		mav.addObject("map", map);
		return mav;
		
		
		// ????
	 	model.addAttribute("list", list)
		     .addAttribute("totalCost", totalCost)
		     .addAttribute("numPerOrder", numPerOrder)
		
		*/

	}
	
	
}
