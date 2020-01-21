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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.myPage.model.service.MyPageService;
import com.kh.recloset.myPage.model.vo.MyPage;
import com.kh.recloset.myPage.model.vo.OrderedGoods;
import com.kh.recloset.myPage.model.vo.TrackCompany;
import com.kh.recloset.order.model.vo.Delivery;


@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;

	// 마이페이지메인
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
	
	@RequestMapping ("/myPage/myorder1m.do")
	@ResponseBody
	public List<MyPage> myorder1m(HttpSession session){
		Member m = (Member)session.getAttribute("member");	
		return myPageService.select1MOrderList(m.getUserNo());
	}
	
	@RequestMapping ("/myPage/myorder3m.do")
	@ResponseBody
	public List<MyPage> myorder3m(HttpSession session){
		Member m = (Member)session.getAttribute("member");
		return myPageService.select3MOrderList(m.getUserNo());
	}
	
	@RequestMapping ("/myPage/myorder6m.do")
	@ResponseBody
	public List<MyPage> myorder6m(HttpSession session){
		Member m = (Member)session.getAttribute("member");
		return myPageService.select6MOrderList(m.getUserNo());
	}
	
	@RequestMapping ("/myPage/myorderS.do")
	@ResponseBody
	public List<MyPage> myorderS(String startDate, String endDate, HttpSession session){
		Member m = (Member)session.getAttribute("member");
		
		return myPageService.selectMySOrderList(m.getUserNo(), startDate, endDate);
	}
	
	// 주문내역상세보기
	@RequestMapping ("/myPage_O.do")
	public String myList_oder(HttpSession session, Model model){
		
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		int userNo = m.getUserNo();
		
		List<MyPage> myList = myPageService.selectMyOrderList(userNo);
		
		System.out.println(myList);
		
		model.addAttribute("myList", myList);
		
		return "/myPage/myPage_order";
	}
	
	// 주문된 상품 보는 페이지
	@RequestMapping("/sellerPage.do")
	public String sellerPage(Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		
		List<OrderedGoods> list = myPageService.selectOrderedList(m.getUserNo());
		List<TrackCompany> trlist = myPageService.selectTrackCompany();
		
		model.addAttribute("list", list)
			 .addAttribute("trlist", trlist);
		
		return "/sellerPage/sellerPage";
		
	}
	
	@RequestMapping("/myPage/deliveryUpdate.do")
	@ResponseBody
	public int deliveryUpdate(@RequestParam String deliveryNo, 
			                  @RequestParam String trCode,
			                  @RequestParam String trackingNo) {
		
		OrderedGoods orderedGood = new OrderedGoods();
		
		orderedGood.setDeliveryNo(deliveryNo);
		orderedGood.setTrackingNo(trackingNo);
		orderedGood.setTrCode(trCode);
		
		System.out.println(orderedGood);
		int result = myPageService.updateDelivery(orderedGood);
		
		return result;
	}
	
}
