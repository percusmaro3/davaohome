package com.davaohome.admin.util;

import org.springframework.ui.Model;

import java.util.Map;

public class ResponseUtil {

    public static String getModelParamStr(Model model){
        Map<String, Object> modelMap = model.asMap();
        StringBuffer sb = new StringBuffer();

        sb.append("?");
        for( String key : modelMap.keySet() ){
            sb.append(key)
              .append("=")
              .append(modelMap.get(key))
              .append("&");
        }

        return sb.toString();
    }
}
