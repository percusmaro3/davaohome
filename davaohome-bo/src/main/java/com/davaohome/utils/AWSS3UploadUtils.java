package com.davaohome.utils;

import java.io.InputStream;

import org.springframework.stereotype.Service;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;

@Service
public class AWSS3UploadUtils {

	//	private static final String S3_URL = "https://s3.ap-northeast-2.amazonaws.com/";
	private static final String CLOUDFRONT_URL = "http://d26apqlcq7r6zn.cloudfront.net/";
	private static final String BUCKET_NAME = "gg-trip/";
	private static final String ACCESS_KEY = "AKIAJTL7HCTPWAQRX6HA";
	private static final String SECRET_KEY = "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";
	private static AWSCredentials awsCredentials;

	static {
		awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
	}

	public static String uploadToAWS(InputStream inputStream, long contentLength, String folderName, String fileName, String extName) {
		AmazonS3 amazonS3 = null;
		try {
			amazonS3 = new AmazonS3Client(awsCredentials);

			ObjectMetadata om = new ObjectMetadata();
			om.setContentLength(contentLength);
			om.setContentType("image/" + extName);

			PutObjectRequest putObjectRequest =
					new PutObjectRequest(BUCKET_NAME + folderName, fileName, inputStream, om);

			putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
			PutObjectResult result = amazonS3.putObject(putObjectRequest); // upload file

			return CLOUDFRONT_URL + folderName + "/" + fileName;
		} finally {
			amazonS3 = null;
		}
	}

}
