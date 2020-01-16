package com.kh.recloset.email.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.recloset.email.model.service.EmailService;
import com.kh.recloset.email.model.vo.Email;
import com.kh.recloset.member.model.service.MemberService;
import com.kh.recloset.member.model.vo.Member;

@Controller
public class EmailController {

		@Autowired
		EmailService emailService;
		
		@Autowired
		MemberService memberService;
		
		@RequestMapping("/email/checkEmail.do")
		@ResponseBody
		public int checkEmail(@RequestParam String email, String userId) throws Exception {
			int result = 0;
			
			result = emailService.checkEmail(email, userId);
			
			return result;
		}
		
		@RequestMapping("/email/emailConfirm.do")
		@ResponseBody
		public int emailConfirm(@RequestParam String email, @RequestParam String key, Model model) {
			
			int result = emailService.emailConfirm(email, key);
			
			return result;
		}
		
		
}
