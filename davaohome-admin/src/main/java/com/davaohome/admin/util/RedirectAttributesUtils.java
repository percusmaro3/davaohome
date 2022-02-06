package com.davaohome.admin.util;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class RedirectAttributesUtils {
	public static void setAttributes(RedirectAttributes redirectAttributes, Object... arg) {
		for (int i = 0; i < arg.length; i = i + 2) {
			if (arg[i + 1] != null) {
				redirectAttributes.addAttribute(arg[i].toString(), arg[i + 1].toString());
			}
		}
	}
}
