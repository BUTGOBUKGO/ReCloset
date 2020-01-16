package com.kh.recloset.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.recloset.cart.model.vo.Cart;
import com.kh.recloset.order.model.service.OrderService;
import com.kh.recloset.order.model.vo.Delivery;
import com.kh.recloset.order.model.vo.Order;
import com.kh.recloset.order.model.vo.OrderGoods;
import com.kh.recloset.product.model.vo.Goods;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/order/orderFormOne.do")
	public String orderFormOne(@RequestParam("userNo") int userNo, 
						@RequestParam("goodsNo") int goodsNo, Model model) {
		Goods goods = new Goods();
		List<Goods> gList = new ArrayList<>();
		
		int subtotal = 0;
		
		goods = orderService.selectGoods(goodsNo);
		
		subtotal = goods.getgPrice();
		
		gList.add(goods);
		
		List<Delivery> deliveryList = orderService.addressList(userNo);
		
		model.addAttribute("goodsList", gList);
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("subtotal", subtotal);
		
		return "order/orderForm";
	}
	
	@RequestMapping("/order/orderForm.do")
	public String orderForm(@RequestParam("userNo") int userNo, Model model) {
		
		List<Integer> goodsNolist = orderService.cartList(userNo);
		List<Goods> gList = new ArrayList<>();
		int subtotal = 0;
		// Goods goods = new Goods();
		
		for(int goodsNo : goodsNolist) {
			
			Goods goods = new Goods();
			
			goods = orderService.selectGoods(goodsNo);
			
			subtotal += goods.getgPrice();
			gList.add(goods);
		}
		
		List<Delivery> deliveryList = orderService.addressList(userNo);
		
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("goodsList", gList);
		model.addAttribute("subtotal", subtotal);
		
		return "order/orderForm";
	}
	
	@RequestMapping("/order/payForm.do")
	public String payForm(Delivery delivery, Order order, Model model, HttpSession session) {
		
		System.out.println("delivery : " + delivery);
		
		session.setAttribute("delivery", delivery);
		session.setAttribute("order", order);
		
		return "order/payForm";
	}
	
	@RequestMapping("/order/orderSuccess.do")
	public String orderSuccess(HttpSession session, @RequestParam("userNo") int userNo, Model model) {
		
		List<Integer> goodsNolist = orderService.cartList(userNo);
		List<Goods> glist = new ArrayList<>();
		Goods g = new Goods();
		Cart c = new Cart();
		
		for(int goodsNo : goodsNolist) {
			
			g = orderService.selectGoods(goodsNo);
			
			glist.add(g);
		}
		
		OrderGoods og = new OrderGoods();
		Delivery d = new Delivery();
		
		Order o = (Order)session.getAttribute("order");
		System.out.println("o : " + o);
		o.setUserNo(userNo);
		int result = orderService.insertOrder(o);
		
		if(result > 0) {
			o = orderService.selectOrder(userNo);
		}
		
		for(Goods good : glist) {
			
			og.setOrderNo(o.getOrderNo());
			og.setGoodsNo(good.getGoodsNo());
			
			result = orderService.insertOrderGoods(og);
		}
		
		if(result > 0) {
			d = (Delivery)session.getAttribute("delivery");
			
			d.setOrderChkNo(o.getOrderNo());
			d.setUserNo(userNo);
		}
		
		result = orderService.insertDelivery(d);
		
		if(result > 0) {
			d = orderService.selectDelivery(o.getOrderNo());
			
		}
		
		c.setUserNo(userNo);
		result = orderService.deleteCart(c);
		
		model.addAttribute("order", o);
		model.addAttribute("goodsList", glist);
		model.addAttribute("delivery", d);
		
		return "order/orderSuccess";
		
	}
	
}
