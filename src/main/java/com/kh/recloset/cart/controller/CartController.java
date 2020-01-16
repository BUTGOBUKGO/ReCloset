package com.kh.recloset.cart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.cart.model.service.CartService;
import com.kh.recloset.cart.model.vo.Cart;
import com.kh.recloset.product.model.vo.Goods;


@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@RequestMapping("/cart/insertCart.do")
	@ResponseBody
	public int insertCart(@RequestParam("userNo") int userNo, 
				@RequestParam("goodsNo") int goodsNo) {
		
		Cart c = new Cart();
		c.setUserNo(userNo);
		c.setGoodsNo(goodsNo);
		
		int result = 0;
		int chk = cartService.selectCartExist(c);
		
		if(chk == 0) {
			result = cartService.insertCart(c);
		} 
		
		return result;
	}
	
	@RequestMapping("/cart/cartQty.do")
	@ResponseBody
	public int cartQty(@RequestParam(value="userNo", defaultValue = "0") int userNo) {
		int result = 0;
		
		if(userNo != 0) {
			result = cartService.selectCartQty(userNo);
		}
		
		return result;
	}
	
	// 장바구니 페이지에서 카트 리스트 불러오는 ajax
	@RequestMapping("/cart/cartList.do")
	@ResponseBody
	public List<Goods> cartList(@RequestParam("userNo") int userNo) {
		
		System.out.println(userNo);
		List<Integer> goodsNolist = cartService.cartList(userNo);
		List<Goods> list = new ArrayList<>();
		
		
		for(int goodsNo : goodsNolist) {
			
			Goods goods = new Goods();
			
			goods = cartService.selectGoods(goodsNo);
			
			list.add(goods);
		}
		return list;
	}
	
	// 장바구니 페이지 불러오는 메소드
	@RequestMapping("/cart/features.do")
	public String featuresPage() {
		
		return "features/features";
		
	}
	
	// 장바구니의 카트 리스트에서 상품 삭제하는 메소드
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public int deleteCart(@RequestParam("userNo") int userNo, @RequestParam("goodsNo") int goodsNo) {
		Cart c = new Cart();
		c.setUserNo(userNo);
		c.setGoodsNo(goodsNo);
		
		int result = cartService.deleteCart(c);
		
		return result; 
	}
	
}
