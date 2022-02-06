package com.davaohome.admin.exception;

import com.davaohome.admin.message.MessageHelper;

public class ImageMaxSizeUploadException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public ImageMaxSizeUploadException(long size) {
		super(MessageHelper.getMessage("common.imageUploadMaxSizeOver") + size);
	}
}
