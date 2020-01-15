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

import com.kh.recloset.myPage.model.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "/myPage/myPage";
	}

	// 주문내역
	@RequestMapping ("/myList.do")
	public ModelAndView myList(HttpSession session, ModelAndView mav, Model model){
		
		
		// session에 저장된 userId
		String userId = (String)session.getAttribute("userId");
		
		// 주문내역조회에서 보여줄 주문수
		int numPerOrder = 5;
		
		System.out.println(numPerOrder);
		
		//Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> list = OrderService.selectList(numPerOrder);
		
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

		return mav;
	}
	
	
}
