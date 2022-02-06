package com.davaohome.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageUtils {

	public static byte[] getBytes(BufferedImage bi, String extName) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			ImageIO.write(bi, extName, baos);
			baos.flush();
			return baos.toByteArray();
		} finally {
			baos.close();
		}
	}
}
