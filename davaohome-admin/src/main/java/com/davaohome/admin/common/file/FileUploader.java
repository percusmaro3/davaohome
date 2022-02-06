package com.davaohome.admin.common.file;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileUploader {

	public UploadedFileInfo uploadFile(String category, MultipartFile f) throws IOException;

}
