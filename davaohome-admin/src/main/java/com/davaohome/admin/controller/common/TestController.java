package com.davaohome.admin.controller.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class TestController {

	@RequestMapping("/test/zip")
	public String index(HttpServletRequest request, Model model) throws IOException, Exception {

		return "/test";
	}

	@RequestMapping(value = "/test/unzip", method = RequestMethod.POST)
	public String testUnzip(HttpServletRequest request, MultipartHttpServletRequest mRequest, Model model) throws IOException, Exception {

		//		InputStream is = request.getInputStream();
		//		int i;
		//		while ((i = is.read()) != -1) {
		//			System.out.print(i);
		//			System.out.print(",");
		//		}
		//		byte[] byteArr = IOUtils.toByteArray(is);
		//		System.out.println("is byte arr : " + byteArr);

		GZIPInputStream zipInputStream = new GZIPInputStream(request.getInputStream());
		int i;
		while ((i = zipInputStream.read()) != -1) {
			System.out.print(i);
			System.out.print(",");

		}
		byte[] byteArr = IOUtils.toByteArray(zipInputStream);
		System.out.println("is byte arr : " + byteArr);


		InputStreamReader isr = new InputStreamReader(zipInputStream, "UTF-8");
		BufferedReader in = new BufferedReader(isr);
		StringBuilder sb = new StringBuilder();
		String read;
		while ((read = in.readLine()) != null) {
			sb.append(read);
		}
		String json = sb.toString();

		System.out.println("json str " + json);

		//		byte[] zipByteArr = IOUtils.toByteArray(zipInputStream);
		//		System.out.println("zip byte arr : " + zipByteArr);

		//String s = IOUtils.toString(zipInputStream, "UTF-8");
		//System.out.println("gzip string : " + s);

		//		InputStreamReader isr = new InputStreamReader(zipInputStream, "UTF-8");
		//		TestZip testZip = new Gson().fromJson(isr, TestZip.class);

		//		System.out.println("testZip : " + testZip);

		return "/testUnZip";
	}

	@RequestMapping(value = "/test/multipart", method = RequestMethod.POST)
	public String testMultipart(HttpServletRequest request, MultipartHttpServletRequest mRequest, Model model) throws IOException, Exception {

		String[] dataArr = request.getParameterValues("data");

		String dataOne = dataArr[0];
		int oneByte = dataOne.getBytes().length;

		System.out.println("data size : " + dataArr.length);
		System.out.println("data byte size : " + oneByte * dataArr.length);

		return "/testUnZip";
	}
}
