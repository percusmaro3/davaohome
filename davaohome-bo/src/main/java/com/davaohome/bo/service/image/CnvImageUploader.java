package com.davaohome.bo.service.image;

import com.davaohome.utils.AWSS3UploadUtils;
import com.davaohome.utils.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

public class CnvImageUploader {

	public static String UPLOAD_FOLDER = "up/";
	public static String UPLOAD_FOLDER_TEST = "up_test/";
	public static String SMARTEDITOR_FOLDER = "se/";

	public static final Integer DEFAULT_MAX_IMAGE_SIZE = 1048576;
	public static final Integer UNLIMITED_IMAGE_SIZE = -1;
	private static final Integer FOLDER_SIZE = 1000;

	public static String uploadImage(String folderName, String fileName, byte[] fileBytes) throws IOException {
		return uploadImage(folderName, fileName, fileBytes, DEFAULT_MAX_IMAGE_SIZE);
	}

	public static String uploadImage(String folderName, String fileName, byte[] fileBytes, byte[] originalBytes) throws IOException {
		return uploadImage(folderName, fileName, fileBytes, DEFAULT_MAX_IMAGE_SIZE);
	}

	public static String uploadImage(String folderName, String fileName, InputStream inputStream) throws IOException {
		return uploadImage(folderName, fileName, inputStream, DEFAULT_MAX_IMAGE_SIZE);
	}

	public static String uploadImage(String folderName, String fileName, InputStream inputStream, Integer maxSize)
			throws IOException {
		byte[] fileBytes = IOUtils.toByteArray(inputStream);
		return uploadImage(folderName, fileName, fileBytes, maxSize);
	}

	public static String uploadImage(String folderName, String fileName, byte[] fileBytes, Integer maxSize) throws UnsupportedEncodingException {
		return uploadImage(folderName, fileName, fileBytes, null, maxSize);
	}

	public static String uploadImage(String folderName, String fileName, byte[] fileBytes, byte[] originalBytes, Integer maxSize)
			throws UnsupportedEncodingException {

		// original image는 사이즈 체크하지 않음
		if (!checkImage(fileBytes, maxSize)) {
			return null;
		}

		String newFolderName = getNewFolderName(folderName, fileName);

		// 파일명 출처를 찾지 못하도록 파일명을 일련번호로 변경
		String extName = FileUtils.getExtName(fileName);
		String timeStr = String.valueOf(System.currentTimeMillis());

		// original image가 있으면 original 이미지를 백업 용도로 저장 _ORI_로 저장한다.
		if (originalBytes != null) {
			String originalFileName = timeStr + "_ORI." + extName;
			ByteArrayInputStream originalBis = new ByteArrayInputStream(originalBytes);
			AWSS3UploadUtils.uploadToAWS(originalBis, originalBytes.length, newFolderName, originalFileName, extName);
		}

		String newFileName = timeStr + "." + extName;
		ByteArrayInputStream bis = new ByteArrayInputStream(fileBytes);
		return AWSS3UploadUtils.uploadToAWS(bis, fileBytes.length, newFolderName, newFileName, extName);
	}

	private static boolean checkImage(byte[] fileBytes, Integer maxSize) {
		if (fileBytes == null) {
			return false;
		}
		if (maxSize < 0) {
			return true;
		}

		Integer checkMaxSize = maxSize != null ? maxSize : DEFAULT_MAX_IMAGE_SIZE;
		if (fileBytes.length > checkMaxSize) {
			throw new RuntimeException("Over the maxsize (" + maxSize + ") : " + fileBytes.length);
		}
		return true;
	}

	private static int getDivideFolderIndex(String fileName) {
		int hashcode = fileName.hashCode();
		int folderIndex = hashcode % FOLDER_SIZE;
		return Math.abs(folderIndex);
	}

	public static String getNewFolderName(String folderName, String fileName) {
		int folderIndex = getDivideFolderIndex(fileName);
		return folderName + folderIndex;
	}
}
