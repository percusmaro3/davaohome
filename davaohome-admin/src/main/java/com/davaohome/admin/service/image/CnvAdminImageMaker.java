package com.davaohome.admin.service.image;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

import com.amazonaws.util.IOUtils;
import com.davaohome.admin.common.CnvAdminConstant;
import com.davaohome.bo.service.image.CnvImageMaker;
import com.davaohome.bo.service.image.CnvImageType;
import com.davaohome.bo.service.image.CnvImageUploader;

@Service
public class CnvAdminImageMaker {

	private final static int WIDTH_DIRECTION = 1;
	private final static int HEIGHT_DIRECTION = 1;

	private enum ImageCompareType {
		BIG_BOTH_WIDTH, BIG_BOTH_HEIGHT, BIG_ONE_WIDTH, BIG_ONE_HEIGHT, SMALL_BOTH
	}

	@Autowired
	CnvImageMaker cnvImageMaker;

	@Data
	private class WidthHeight {
		int width;
		int height;

		WidthHeight(int width, int height) {
			this.width = width;
			this.height = height;
		}
	}

	public String makeImage(CnvImageType imageType, MultipartFile multipartFile, String beforeImageUrl) throws IOException {

		if (multipartFile.isEmpty()) {
			return beforeImageUrl;
		}

		return makeImage(imageType, multipartFile);
	}


	public String makeImage(CnvImageType imageType, MultipartFile multipartFile) throws IOException {
		ByteArrayOutputStream byteOutputStream = new ByteArrayOutputStream();

		byte[] originalImage = IOUtils.toByteArray(multipartFile.getInputStream());
		ByteArrayInputStream bis = new ByteArrayInputStream(originalImage);

		cnvImageMaker.makeImage(imageType, bis, byteOutputStream);
		return CnvImageUploader.uploadImage(CnvImageUploader.UPLOAD_FOLDER, multipartFile.getOriginalFilename(),
											byteOutputStream.toByteArray(), originalImage, CnvAdminConstant.BASIC_IMAGE_SIZE);
	}

}
