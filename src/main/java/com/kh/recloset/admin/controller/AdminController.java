
package com.kh.recloset.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.admin.model.service.AdminService;
import com.kh.recloset.admin.model.vo.MemSearch;
import com.kh.recloset.member.model.vo.Member;
import com.kh.recloset.myPage.model.vo.MyPage;
import com.kh.recloset.report.model.vo.Report;

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
	public String adminPage_M() {
		
		return "/adminPage/adminPage_memM";
	}
	
	// 신고 관리
	@RequestMapping("/adminPage_R.do")
	public String adminPage_R(Model model) {
		
		List<Report> list = adminService.selectList();
		model.addAttribute("list", list);
		
		return "/adminPage/adminPage_report";
	}
		
	// 블랙리스트 관리
	@RequestMapping("/adminPage_B.do")
	public String adminPage_B() {
		
		return "/adminPage/adminPage_blockM";
	}
		
	
	
	// 회원검색
	@RequestMapping ("/admin/memSearch.do")
	@ResponseBody
	public List<MemSearch> searchMember(HttpSession session, 
								@RequestParam("userCodeNo") int userCodeNo, String userId,
								Model model){
		
		
		System.out.println("filter : " + userCodeNo);
		System.out.println("userId : " + userId);
		Member m = (Member)session.getAttribute("member");
		
		MemSearch ms = new MemSearch();
		ms.setSearchId(userId);
		ms.setUserCodeNo(userCodeNo);
		 
		List<MemSearch> searchMember = adminService.searchMember(ms);
		
	//model.addAttribute("list", searchMember);
		
		return searchMember;
	}

	// 회원등급조정
	@RequestMapping ("/admin/memUpgrade.do")
	@ResponseBody
	public int updateSeller(String userId) {
		
		int result = 0;
		
		result = adminService.updateSeller(userId);
		
		return result;
		
	}
	
	// 회원 계정정지
	@RequestMapping ("/admin/memBlock.do")
	@ResponseBody
	public int updateMemBlock(String userId) {
		
		int result = 0;
		
		result = adminService.updateMemBlock(userId);
		
		return result;
		
	}
	
	// 회원 블락해제
	@RequestMapping ("/admin/memUnBlock.do")
	@ResponseBody
	public int updateUnBlock(String userId) {
		
		int result = 0;
		
		result = adminService.updateUnBlock(userId);
		
		return result;
		
	}
	
	// 회원삭제
	@RequestMapping ("/admin/deleteMember.do")
	@ResponseBody
	public int deleteMember(String userId) {
		
		int result = 0;
		
		result = adminService.deleteMember(userId);
		
		return result;
		
	}
	
	
		
}
