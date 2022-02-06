package com.davaohome.admin.controller.developer;

import java.io.ByteArrayOutputStream;

import javax.servlet.http.HttpServletRequest;

import com.davaohome.bo.model.base.TranslateLanguage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.davaohome.admin.common.CnvAdminConstant;
import com.davaohome.bo.service.google.service.GoogleTranslateService;
import com.davaohome.bo.service.image.CnvImageMaker;
import com.davaohome.bo.service.image.CnvImageType;
import com.davaohome.bo.service.image.CnvImageUploader;

@Controller
@RequestMapping("/developer")
public class DeveloperController {

	private static final Logger log = LoggerFactory.getLogger(DeveloperController.class);

	@Autowired
	CnvImageMaker cnvImageMaker;
	@Autowired
	GoogleTranslateService googleTranslateService;

	@RequestMapping(value = "/testBed")
	public String testBed(Model model) throws Exception {

		return "/developer/testBed";
	}

	@RequestMapping(value = "/makeImage")
	public String makeImage(MultipartRequest fileRequest, Model model) throws Exception {

		MultipartFile multipartFile = fileRequest.getFile("imageFile");

		ByteArrayOutputStream byteOutputStream = new ByteArrayOutputStream();
		cnvImageMaker.makeImage(CnvImageType.TEST, multipartFile.getInputStream(), byteOutputStream);


		String imageUrl = CnvImageUploader.uploadImage(CnvImageUploader.UPLOAD_FOLDER, "makedImage.jpg",
													   byteOutputStream.toByteArray(), CnvAdminConstant.BASIC_IMAGE_SIZE);

		model.addAttribute("imageUrl", imageUrl);

		return "/developer/testBed";
	}

	@RequestMapping(value = "/translate")
	public String translate(HttpServletRequest request, Model model) throws Exception {

		String src = request.getParameter("src");

		String result = googleTranslateService.doTranslate(TranslateLanguage.en, TranslateLanguage.ko, src);
		model.addAttribute("result", result);

		return "/developer/testBed";
	}

}
