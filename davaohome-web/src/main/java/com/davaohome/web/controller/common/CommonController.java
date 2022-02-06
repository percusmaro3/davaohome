package com.davaohome.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CommonController {

	@RequestMapping("/")
	public String index(HttpServletRequest request) {

		return "redirect:/ko/home";

//		if( isTest(request) )
//			return "redirect:/en/main";
//		else
//			return "/notice/renewal";
	}

	private boolean isTest(HttpServletRequest request){

		String requestURL = request.getRequestURL().toString();
		return requestURL.indexOf("test.") != -1;
	}

}
