package com.davaohome.admin.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public class PrintString {

	public void writeAlert(HttpServletResponse response, String message, String redirectUrl) throws IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script>");
		if (!"".equals(message)) {
			out.print("alert('" + message + "');");
		}

		if (redirectUrl != null) {
			out.print("document.location.href='" + redirectUrl + "'");
		}

		out.print("</script>");

	}

}
