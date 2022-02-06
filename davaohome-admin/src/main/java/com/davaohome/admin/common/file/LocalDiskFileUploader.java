package com.davaohome.admin.common.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class LocalDiskFileUploader implements FileUploader {

	private String LOCAL_FILE_PATH = "";
	private String HTTP_FILE_URL = "";

	public UploadedFileInfo uploadFile(String category, MultipartFile f) throws IOException {

		String filename = f.getOriginalFilename();


		File saveFile = makeSaveFile(category, filename);

		FileOutputStream fos = new FileOutputStream(saveFile);
		fos.write(f.getBytes());

		UploadedFileInfo fileInfo = new UploadedFileInfo();
		fileInfo.setFilename(saveFile.getName());
		fileInfo.setFileUrl(HTTP_FILE_URL + category + "/" + saveFile.getName());

		return fileInfo;
	}

	private File makeSaveFile(String category, String filename) {

		String baseDirStr = LOCAL_FILE_PATH + (StringUtils.isNotEmpty(category) ? "/" + category : "");

		File baseDir = new File(baseDirStr);
		if (!baseDir.exists()) {
			baseDir.mkdir();
		}

		String newFileName = String.valueOf(System.currentTimeMillis()) + "_" + filename;

		return new File(baseDirStr + "/" + newFileName);
	}

}
