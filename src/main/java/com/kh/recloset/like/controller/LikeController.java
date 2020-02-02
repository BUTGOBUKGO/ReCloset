package com.kh.recloset.like.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.like.model.service.LikeService;
import com.kh.recloset.like.model.vo.Like;
import com.kh.recloset.product.model.vo.Goods;

@Controller
public class LikeController {
	
	@Autowired
	LikeService likeService;
	
	@RequestMapping("/like/likePage.do")
	public String golikePage() {
		
		return "like/likePage";
	}
	
	
	 
		@RequestMapping("/like/likeList.do")
		@ResponseBody
		public List<Goods> cartList(@RequestParam("userNo") int userNo) {
			
			System.out.println(userNo);
			List<Integer> goodsNolist = likeService.likeList(userNo);
			List<Goods> list = new ArrayList<>();
			
			
			for(int goodsNo : goodsNolist) {
				
				Goods goods = new Goods();
				
				goods = likeService.selectGoods(goodsNo);
				
				list.add(goods);
			}
			return list;
		}
	 

	
	@RequestMapping("/like/checkLike.do")
	@ResponseBody
	public Map<String, Object> likecheck(Like like) {
		
		Like checkLike = likeService.selectLike(like);
		
		if(checkLike == null) {
			checkLike = new Like();
		}
		
		Map<String, Object> map = new HashMap();
	      
	      map.put("like", checkLike);
	      
	      return map;
	}
	
	
	  @RequestMapping("like/likeInsert.do")
	  @ResponseBody public int likeInsert(@RequestParam String lStatus, 
			  @RequestParam int userNo, @ RequestParam int goodsNo) {
		  
		  int result = 0;
	      int insertLike = 0;
	      int updateLike = 0;
	      
	      Like like = new Like();
	      
	      like.setGoodsNo(goodsNo);
	      like.setUserNo(userNo);
	      
	      if(lStatus == "") {
	         lStatus = null;
	      }
	      
	      if(lStatus == null) {
	         
	    	  insertLike = likeService.insertLike(like);
	         
	      } else {
	         
	         like.setlStatus(lStatus);
	         updateLike = likeService.updateLike(like);
	         
	      }
	      
	      if(insertLike == 1 || updateLike == 1) {
	         result = 1;
	      }
	      
	      return result;
		  
		  
	  }
	  
	  @RequestMapping("/like/cancelLike.do")
	   @ResponseBody
	   public int cancelLike(Like like) {
	      int result = likeService.cancelLike(like);
	      
	      return result;
	   }
	  
	  @RequestMapping("/like/likeNumber.do")
	   @ResponseBody
	   public int likeNumber(@RequestParam int goodsNo) {
	      int result = likeService.likeCount(goodsNo);
	      
	      return result;
	   }
	
	  
	  
	
	  // 장바구니의 카트 리스트에서 상품 삭제하는 메소드
	  
	  @RequestMapping("/like/likeDelete.do")
	  
	 @ResponseBody public int likeDelete(@RequestParam("userNo") int userNo,
			 @RequestParam("goodsNo") int goodsNo) 
	  { Like l = new Like();
	  l.setUserNo(userNo); l.setGoodsNo(goodsNo);
	  
	  int result = likeService.deleteLike(l);
	  
	  return result; 
	  }
	  
	  @RequestMapping("/like/myLikeCount.do")
	   @ResponseBody
	   public int myLikeCount(@RequestParam int userNo) {
	      int result = likeService.myLikeCount(userNo);
	      
	      return result;
	   }
	 
	  
	  
}
