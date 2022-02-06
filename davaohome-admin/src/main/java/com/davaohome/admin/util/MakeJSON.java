package com.davaohome.admin.util;

import java.util.HashMap;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Component
public class MakeJSON {

	private static final Logger log = LoggerFactory.getLogger(MakeJSON.class);

	public String makeMapper(Object obj) {
		ObjectMapper mapper = new ObjectMapper();
		String val = "";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("message", "success");
		map.put("result", obj);

		try {
			val = mapper.writeValueAsString(map);
		} catch (Exception ex) {
			log.error("[CATCH_EXCEPTION]", ex);
			throw new RuntimeException(ex);
		}

		return val;
	}

	//	public JsonResult make(Object obj) {
	//		JsonResult result = new JsonResult(0, "success", obj);
	//		return result;
	//	}

}
