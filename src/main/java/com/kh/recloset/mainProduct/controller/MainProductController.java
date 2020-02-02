package com.kh.recloset.mainProduct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.mainProduct.model.service.MainProductService;
import com.kh.recloset.product.model.vo.Goods;

@Controller
public class MainProductController {

	@Autowired
	MainProductService mainProductService;
	
	@RequestMapping("/mainProduct/selectMainWomanGoods.do")
	public String selectMainWomanGoods(Model model) {
		
		int limit = 12;
		
		List<Goods> list = mainProductService.selectMainWomanGoods(limit);
		
		model.addAttribute("goods", list);

		return "product/productList";
	}
	
	@RequestMapping("/mainProduct/selectMainManGoods.do")
	public String selectMainManGoods(Model model) {
		
		int limit = 12;
		
		List<Goods> list = mainProductService.selectMainManGoods(limit);
		
		model.addAttribute("goods", list);

		return "product/productList";
	}
	
	@RequestMapping("/mainProduct/selectMainAcGoods.do")
	public String selectMainAcGoods(Model model) {
		
		int limit = 12;
		
		List<Goods> list = mainProductService.selectMainAcGoods(limit);
		
		model.addAttribute("goods", list);

		return "product/productList";
	}
	
	@RequestMapping("/mainProduct/selectMainAllGoods.do")
	@ResponseBody
	public List selectMainAllGoods() {
		
		int limit = 12;
		
		List<Goods> list = mainProductService.selectMainAllGoods(limit);


		return list;
	}
}
