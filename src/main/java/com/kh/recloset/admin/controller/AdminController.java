package com.kh.recloset.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.admin.model.service.AdminService;
import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.myPage.model.vo.MyPage;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	// 관리자메인페이지
	@RequestMapping("/adminPage.do")
	public String adminPage(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		int userNo = m.getUserNo();
		
		return "/adminPage/adminPage";
	}
	
	
	// 회원관리
	@RequestMapping("/adminPage_M.do")
	public String adminPage_M(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("member");
		String userId = m.getUserId();
		int userNo = m.getUserNo();
		
		return "/adminPage/adminPage_memM";
	}
	
//	@RequestMapping ("/adminPage_M.do")
//	@ResponseBody
//	public List<adminPage> adminPage_Serch(HttpSession session){
//		Member m = (Member)session.getAttribute("member");
//		
//		return mav;
//	}
//	

}
