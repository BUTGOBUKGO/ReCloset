package com.kh.recloset.sellerInfo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.recloset.sellerInfo.model.service.SellerInfoService;
import com.kh.recloset.sellerInfo.model.vo.Review;

@Controller
public class SellerInfoController {

	@Autowired
	SellerInfoService sellerInfoService;
	
	@RequestMapping("/sellerInfo.do")
	public String sellerInfo() {
		
		return "sellerInfo/sellerInfo";
		
	}
	
	@RequestMapping("/default2.do")
	public String default2(@RequestParam(value="sellerUserNo", defaultValue = "0") int sUserNo,
							Model model) {
		System.out.println("userNo : " + sUserNo);
		List<Review> rList = new ArrayList<>();
		Review r = new Review();
		
		if(sUserNo != 0) {
			
			rList = sellerInfoService.selectReview(sUserNo);
			System.out.println(rList);
		}
		
		model.addAttribute("reviewList", rList);
		
		return "sellerInfo/default2";
		
	}
}
