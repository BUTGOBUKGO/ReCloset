package com.kh.recloset;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/termsofUse.do")
	public String termsofUsePage() {
		
		return "common/termsofUse";
		
	}
	
	@RequestMapping("/service.do")
	public String servicePage() {
		
		return "common/service";
	}
	
	@RequestMapping("/userterms.do")
	public String userPage() {
		
		return "common/userterms";
	}
	
	@RequestMapping("/gogogogo.do")
	public String gogogo() {
		
		return "common/NewFile";
	}
	
}
