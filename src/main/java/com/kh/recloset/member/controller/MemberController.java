package com.kh.recloset.member.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.recloset.member.exception.MemberException;
import com.kh.recloset.member.model.service.MemberService;
import com.kh.recloset.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/signUp.do")
	public String signUp() {
		
		return "member/signUp";
	}
	
	
	@RequestMapping("/member/signUpEnd.do")
	public String signUpEnd(Member member, String birthday, Model model) {
		
		
		// 비밀번호 암호화 시작
		String userPwd = member.getUserPwd();
		System.out.println("암호화 전 비밀번호 : " + userPwd);
		
		String encUserPwd = bcryptPasswordEncoder.encode(userPwd);
		System.out.println("암호화 후 비밀번호 : " + encUserPwd );
		
		member.setUserPwd(encUserPwd);
		// 비밀번호 암호화 끝
		
		// 주소 (공사중)
		
		// 생년월일
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		Date parsed;
		
		try {
			parsed = df.parse(birthday);
	        java.sql.Date sql = new java.sql.Date(parsed.getTime());
	
			member.setBirthday(sql);
			
			System.out.println(sql);

		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		int result = memberService.insertMember(member);
		System.out.println(member);
	
		// 화면 처리 시작
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "반갑습니다! 어서오세요."; // 회원가입 성공!
			loc = "/";
		} else {
			msg = "회원가입 실패!";
			loc = "/";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/loginForm.do")
	public String memberLoginForm() {
		return "member/loginForm";
	}
	

	@RequestMapping("/member/login.do")
	public ModelAndView login(Member member, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		try {
			Member m = memberService.selectOneMember(member);
			
			String msg = "";
			String loc = "/";
			
			if(m != null && bcryptPasswordEncoder.matches(member.getUserPwd(), m.getUserPwd())) {
				msg = "로그인 성공!";
				
				session.setAttribute("member", m);
				mv.addObject("member", m);
			} else if(m != null) {
				msg = "비밀번호 틀렸습니다.";
			} else {
				msg = "로그인 실패!";
			}
			
			mv.addObject("msg",msg).addObject("loc", loc);
			mv.setViewName("common/msg");
			
		}catch (Exception e) {
			throw new MemberException("로그인 시도 중 에러 발생!");
		}
		
		System.out.println(mv);
		return mv;
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String userId, Model model) {
		Member member = memberService.memberView(userId);
		
		model.addAttribute("member", member);
		
		return "member/memberView";
	}
	
	@RequestMapping("member/memberUpdate.do")
	public String memberUpdate(Member member, Model model, HttpSession session) {
		
		// 1. 비밀번호 입력 받은 것 확인
		if(member.getUserPwd().length() > 0) {
		// 2. 입력 받은 비밀번호를 암호화 하기 (bcryptPasswordEncoder의 encode 사용)
			String encUserPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		// 3. member 객체의 비밀번호 변경하기
			member.setUserPwd(encUserPwd);
		} else {
			member.setUserPwd(null);
		}
		
		// 4. update 실행하기 (memberService 활용)
		int result = memberService.updateMember(member);
		
		member = memberService.selectOneMember(member);
		
		String msg = "";
		String loc ="/";
		
		if(result > 0) {
			msg = "회원 정보 수정 성공!";
			session.setAttribute("member", member);
		} else {
			msg = "회원 정보 수정 실패!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(HttpSession session, Model model) {
		String userId = ((Member)session.getAttribute("member")).getUserId();
		
		int result = memberService.deleteMember(userId);
		
		String msg = "";
		String loc ="/";
		
		if(result > 0) {
			msg = "회원 탈퇴 성공!";
			session.invalidate();
		} else {
			msg = "회원 탈퇴 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/member/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(@RequestParam String userId){
		boolean isUsable = memberService.checkIdDuplicate(userId) == 0? true : false;
		
		Map<String, Object> map = new HashMap();
		map.put("isUsable", isUsable);
		System.out.println(map);
		return map;
	}
}


