package com.davaohome.admin.controller.monitor;

import java.io.File;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/monitor")
public class L7HealthCheckController {
	
	@Value("#{config['l7StopFile']}")
	private String L7STOP_FILE = "";
	
	@RequestMapping("/l7check")
	public String l7HealthCheck(HttpServletResponse response){
		
		if( StringUtils.isEmpty(L7STOP_FILE) )
			return null;
		
		File f = new File(L7STOP_FILE);
		
		if( f.exists() ){
			response.setStatus(503); // Service Unavailable
		}
		
		return null;
	}
	
}
