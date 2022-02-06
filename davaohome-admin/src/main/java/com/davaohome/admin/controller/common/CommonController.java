package com.davaohome.admin.controller.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.davaohome.bo.model.base.TranslateLanguage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.davaohome.bo.model.base.ActiveLanguage;
import com.davaohome.bo.service.google.service.GoogleTranslateService;

@Controller
public class CommonController {

	@Autowired
	GoogleTranslateService googleTranslateService;

	@RequestMapping("/")
	public String index() {

		return "redirect:/notice/noticeList";
	}

	@RequestMapping(value = "/common/translate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> translate(@RequestParam TranslateLanguage src, @RequestParam TranslateLanguage target,
										 @RequestParam String str) {
		String result = "";
		String code = "";
		try {
			result = googleTranslateService.doTranslate(src, target, str);
			code = "SUCESS";
		} catch (IOException e) {
			result = e.getMessage();
			code = "FAIL";
		}

		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("code", code);
		resultMap.put("result", result);

		return resultMap;
	}
}
