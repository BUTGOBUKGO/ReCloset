package com.kh.recloset;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/default.do")
	public String defaultPage() {
		
		return "default/default";
		
	}
	
}
