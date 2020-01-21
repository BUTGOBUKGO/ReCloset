package com.kh.recloset.sellerInfo.controller;
  
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.product.model.vo.Goods;
import com.kh.recloset.sellerInfo.model.service.SellerInfoService;
import com.kh.recloset.sellerInfo.model.vo.Review;

@Controller
public class SellerInfoController {

	@Autowired
	SellerInfoService sellerInfoService;

	
	@RequestMapping("/sellerInfo.do")
	public String sellerInfo(HttpSession session, @RequestParam("userId") String userId,
			Model model) {

		List<Review> rList = new ArrayList<>();
		
		List<Goods> sgList = new ArrayList<>();
		
		Member ms = new Member();
		
		if(userId != null) {
		
			ms = sellerInfoService.selectUserNo(userId); // 판매자
			rList = sellerInfoService.selectReview(ms.getUserNo());
			sgList = sellerInfoService.selectSellerGoods(ms.getUserNo());
			
		}
		
		String rating = "";
		int ravg = 0;
		int cnt = 0;
		if(rList != null) {
			for(Review r : rList) {
				
				switch(r.getRating()) {
					case 1:
						r.setRatingStar("★☆☆☆☆");
						break;
					case 2:
						r.setRatingStar("★★☆☆☆");
						break;
					case 3:
						r.setRatingStar("★★★☆☆");
						break;
					case 4:
						r.setRatingStar("★★★★☆");
						break;
					default:
						r.setRatingStar("★★★★★");
				}
				
				ravg += r.getRating();
				cnt++;
			}
		}
		
		if(ravg != 0) {
			ravg = ravg / cnt;
			System.out.println("ravg : " + ravg);
		}
		
		switch(ravg) {
			case 1:
				rating = "★☆☆☆☆";
				break;
			case 2:
				rating = "★★☆☆☆";
				break;
			case 3:
				rating = "★★★☆☆";
				break;
			case 4:
				rating = "★★★★☆";
				break;
			case 5:
				rating = "★★★★★";
				break;
			default:
				rating = "☆☆☆☆☆";
		}
		
		List<Goods> gList = new ArrayList<>();
		Member m = (Member)session.getAttribute("member");
		
		gList = sellerInfoService.selectOrderList(m.getUserNo());
		
		System.out.println(gList); // 왜 날짜 못불러오징..?
		
		/*
		 * Goods g = new Goods(); int result =
		 * sellerInfoService.selectGoodsQty(ms.getUserNo());
		 */
		
		model.addAttribute("reviewList", rList);
		model.addAttribute("sellerGoodsList", sgList); // 판매자의 판매상품 목록
		model.addAttribute("seller", ms);
		model.addAttribute("goodsList", gList); // 현재 로그인한 유저의 주문내역 목록
		model.addAttribute("ratingAverage", rating);
		
		return "sellerInfo/sellerInfo";
		
	}
	
	
	
	@RequestMapping("addReview.do")
	@ResponseBody
	public List<Review> insertReview(HttpSession session, Review r) {
		
		Member m = (Member)session.getAttribute("member");
		r.setUserNo(m.getUserNo());
		
		List<Review> rList = new ArrayList<>();
		int result = sellerInfoService.insertReview(r);
		
		if(result > 0) {
			rList = sellerInfoService.selectReview(m.getUserNo());
		}
		
		// ORDERGOODS테이블의 RSTATUS컬럼 값 'O'로 바꾸는 쿼리실행
		result = sellerInfoService.updateOrderGoods(r.getOrderGoodsNo());
		
		return rList;
	}
	
	@RequestMapping("/sellerProductList.do")
	public String selectProuctList(@RequestParam(value="cCode", defaultValue = "0") int categoryCode, 
									@RequestParam("userNo") int userNo, Model model) {
		
		List<Goods> list = new ArrayList<>();
		Goods g = new Goods();
		g.setUserNo(userNo);
		g.setCategoryCode(categoryCode);
		System.out.println("g : " + g);
		
		if(categoryCode == 0) {
			list = sellerInfoService.selectGoodsListAll(userNo);
		} else {
			list = sellerInfoService.selectGoodsList(g);
		}
		
		model.addAttribute("goods", list);

		return "product/productList";
	}
	
	
}
