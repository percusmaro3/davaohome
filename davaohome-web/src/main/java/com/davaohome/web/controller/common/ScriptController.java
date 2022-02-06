package com.davaohome.web.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/script")
public class ScriptController {

	@RequestMapping("/alertRedirect")
	public String alertRedirect(HttpServletRequest request, Model model) {

		model.addAttribute("alertMsg", request.getParameter("alertMsg"));
		model.addAttribute("redirectUrl", request.getParameter("redirectUrl"));

		return "/common/alertRedirect";
	}

	//	@RequestMapping
	//	public String alertPopup(String message, String redirectURL, String width, String height, String windowName,
	//							 String popupYn,
	//							 Model model) {
	//
	//		model.addAttribute("message", message);
	//		model.addAttribute("redirectURL", redirectURL);
	//		model.addAttribute("width", width);
	//		model.addAttribute("height", height);
	//		model.addAttribute("windowName", windowName);
	//		model.addAttribute("popupYn", popupYn);
	//		return "/common/alertPopup";
	//	}
}
