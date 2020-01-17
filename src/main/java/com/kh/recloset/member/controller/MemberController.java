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

import com.kh.recloset.email.model.service.EmailService;
import com.kh.recloset.member.exception.MemberException;
import com.kh.recloset.member.model.service.MemberService;
import com.kh.recloset.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member member, String Email02, 
								  String phon, String phon2, String birthday, Model model) {
		member.setEmail(member.getEmail() + "@" + Email02);
		member.setPhone(phon + phon2);
		String userPwd = member.getUserPwd();
		System.out.println("암호화 전 비밀번호 : " + userPwd);
		
		String encUserPwd = bcryptPasswordEncoder.encode(userPwd);
		System.out.println("암호화 후 비밀번호 : " + encUserPwd);
		
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = memberService.insertMember(member);
	
		// 화면 처리 시작
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "반갑습니다! 어서오세요."; // 회원가입 성공!
			loc = "/";
		} else {
			msg = "회원가입 실패!";
			loc = "/member/memberEnrollEnd.do";
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
	public ModelAndView memberLogin(Member member, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		try {
			Member m = memberService.selectOneMember(member);
			
			String msg = "";
			String loc = "";
			
			if(m != null && bcryptPasswordEncoder.matches(member.getUserPwd(), m.getUserPwd())) {
				msg = "로그인 성공!";
				loc = "/";
				session.setAttribute("member", m);
				mv.addObject("member", m);
			} else if(m != null) {
				msg = "비밀번호 틀렸습니다.";
				loc = "/member/loginForm.do";
			} else {
				msg = "로그인 실패!";
				loc = "/member/loginForm.do";
			}
			
			mv.addObject("msg",msg).addObject("loc", loc);
			mv.setViewName("common/msg");
			
		}catch (Exception e) {
			throw new MemberException("로그인 시도 중 에러 발생!");
		}
		
		return mv;
	}
	
	@RequestMapping("/member/logout.do")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView(Model model, HttpSession session) { 
		Member member = (Member)session.getAttribute("member");
		
		model.addAttribute("member", member);
		
		return "member/memberView";
	}
	
	@RequestMapping("member/memberUpdate.do")
	public String memberUpdate(Member member, Model model, HttpSession session) {
		
		// 1. 비밀번호 입력 받은 것 확인
		if(member.getUserPwd().length() > 0) {
		// 2. 입력 받은 비밀번호를 암호화 하기 (bcryptPasswordEncoder의 encode 사용)
			String encUserpwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		// 3. member 객체의 비밀번호 변경하기
			member.setUserPwd(encUserpwd);
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
		Member member = (Member)session.getAttribute("member");
		String userId = member.getUserId();
		String Email = member.getEmail();

		int result = memberService.deleteMember(userId);
		int result2 = emailService.deleteEmail(Email);
		
		System.out.println(Email);
		System.out.println(result2);
		
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
	      
	      boolean isUsable = memberService.checkIdDuplicate(userId) == 0 ? true : false;
	      
	      Map<String, Object> map = new HashMap<>();
	      map.put("isUsable", isUsable);
	      
	      return map;
	   }
	   
	

}




























