package com.davaohome.admin.controller.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.davaohome.admin.exception.ImageMaxSizeUploadException;
import com.davaohome.bo.service.image.CnvImageUploader;


@Controller
@RequestMapping("/common")
public class FileUploadController {

	private static final Logger log = LoggerFactory.getLogger(FileUploadController.class);
	private static String UPLOAD_FOLDER = "se/";

	@RequestMapping("/updatePhoto")
	public String updatePhoto(MultipartRequest multipartRequest, HttpServletRequest request, Model model) throws IOException {
		String return1 = request.getParameter("callback");
		String return2 = "?callback_func=" + request.getParameter("callback_func");
		String return3 = "";
		String errorStr = "";

		String fileName = "";
		String fileUrl = "";
		try {
			if (multipartRequest.getFile("uploadFile").getSize() > 1048576) {
				throw new ImageMaxSizeUploadException(multipartRequest.getFile("uploadFile").getSize());
			}

			MultipartFile mf = multipartRequest.getFile("uploadFile");
			fileName = mf.getOriginalFilename();
			//			fileName = URLEncoder.encode(fileName, "utf-8");
			byte[] bytes = multipartRequest.getFile("uploadFile").getBytes();

			System.out.println("updatePhoto 1 fileName : " + fileName);

			fileUrl = CnvImageUploader.uploadImage(CnvImageUploader.SMARTEDITOR_FOLDER, fileName, bytes);

		} catch (ImageMaxSizeUploadException e) {
			errorStr = "&errstr=" + URLEncoder.encode(e.getMessage(), "UTF-8");
			log.warn(e.getMessage());
		}

		model.addAttribute("fcode", fileUrl);
		model.addAttribute("filename", fileName);

		return3 += "&bNewLine=true";
		return3 += "&sFileName=" + fileName;
		return3 += "&sFileURL=" + fileUrl;
		return "redirect:" + return1 + return2 + errorStr + return3;

	}

	@RequestMapping("/updatePhotoMulti")
	public void updatePhotoMulti(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String sFileInfo = "";
		InputStream inputStream;
		String fileUrl = "";

		inputStream = request.getInputStream();
		String fileName = getFilename(request);

		System.out.println("updatePhotoMulti fileName : " + fileName);

		fileUrl = CnvImageUploader.uploadImage(CnvImageUploader.SMARTEDITOR_FOLDER, fileName, inputStream);

		sFileInfo += "&bNewLine=true";
		sFileInfo += "&sFileName=" + fileName;
		sFileInfo += "&sFileURL=" + fileUrl;
		PrintWriter print = response.getWriter();
		print.print(sFileInfo);
		print.flush();
		print.close();

		if (inputStream != null) {
			inputStream.close();
		}
	}

	private String getFilename(HttpServletRequest request) throws UnsupportedEncodingException {
		String fileName = URLDecoder.decode(request.getHeader("file-name"), "UTF-8");
		//		fileName = URLEncoder.encode(fileName, "utf-8");
		//		return String.valueOf(System.currentTimeMillis()) + "_" + fileName;

		return fileName;
	}

}
