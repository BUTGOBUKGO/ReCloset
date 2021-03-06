package com.kh.recloset.websocket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebsoketController {
	// 채팅화면으로 화면만 이동하는 역할
	
	@RequestMapping("/chatting.do")
	public String chatting(Model model, HttpServletRequest request) {
		// 접속한 ip주소를 체크하여 사용자 비교하는 값 전달하기 
		model.addAttribute("host", request.getRemoteAddr());
		
		return "chat/chattingView";
		
	}
	
}
