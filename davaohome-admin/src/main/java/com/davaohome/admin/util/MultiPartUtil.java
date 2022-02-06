package com.davaohome.admin.util;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.davaohome.bo.service.image.CnvImageUploader;

@Service
public class MultiPartUtil {

	public static String uploadImage(MultipartRequest fileRequest, String fieldName, String beforeImageUrl, Integer maxSize) throws IOException {

		if (fileRequest.getFile(fieldName).isEmpty()) {
			return beforeImageUrl;
		}

		return uploadImage(fileRequest.getFile(fieldName), maxSize);
	}

	public static String uploadImage(MultipartFile file, Integer maxSize)
			throws IOException {

		if (file.isEmpty()) {
			return "";
		}

		String fileName = file.getOriginalFilename();
		byte[] fileByte = file.getBytes();

		return CnvImageUploader.uploadImage(CnvImageUploader.UPLOAD_FOLDER, fileName,
											fileByte, maxSize);
	}

}
