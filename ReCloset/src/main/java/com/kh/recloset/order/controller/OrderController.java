package com.kh.recloset.order.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.recloset.order.model.service.OrderService;
import com.kh.recloset.order.model.vo.Delivery;
import com.kh.recloset.order.model.vo.Order;
import com.kh.recloset.product.model.vo.Goods;


@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	// 도현씨, 이게 주문서작성 페이지로 넘어가는 메소드에요~
	@RequestMapping("/order/orderForm.do")
	public String orderForm(@RequestParam("userNo") int userNo, Model model) {
		
		List<Delivery> deliveryList = orderService.addressList(userNo);
		
		model.addAttribute("deliveryList", deliveryList);
		
		return "order/orderForm";
	}
	
	/*
	@RequestMapping("/order/payForm.do")
	public String payForm(Delivery delivery, Model model, HttpSession session) {
		System.out.println("delivery1 : " + delivery);
		session.setAttribute("delivery", delivery);
		
		return "order/payForm";
	}
	
	@RequestMapping("/order/orderSuccess.do")
	public String orderSuccess(HttpSession session, @RequestParam("userNo") int userNo, Model model) {
		
		List<Integer> goodsNolist = orderService.cartList(userNo);
		List<Goods> list = new ArrayList<>();
		
		for(int goodsNo : goodsNolist) {
			
			Goods goods = new Goods();
			
			goods = orderService.selectGoods(goodsNo);
			
			list.add(goods);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Order o = new Order();
		int result = 0;
		
		for(Goods g : list) {
			
			o.setUserNo(userNo);
			o.setGoodsNo(g.getGoodsNo());
			
			result = orderService.insertOrder(o);
		}
		
		if(result > 0) {
			o = orderService.selectOrder(userNo);
		}
		Delivery d = (Delivery)session.getAttribute("delivery");
		
		d.setOrderNo(o.getOrderNo());
		d.setUserNo(userNo);
		
		System.out.println("delivery2 : " + d);
		
		result = orderService.insertDelivery(d);
		
		if(result > 0) {
			d = orderService.selectDelivery(o.getOrderNo());
		}
		
		model.addAttribute("order", o);
		model.addAttribute("delivery", d);
		
		return "order/orderSuccess";
	}*/
}
