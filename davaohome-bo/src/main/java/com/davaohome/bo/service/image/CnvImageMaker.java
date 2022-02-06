package com.davaohome.bo.service.image;

import lombok.Data;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.filters.Canvas;
import net.coobird.thumbnailator.geometry.Positions;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@Service
public class CnvImageMaker {

	private final static int WIDTH_DIRECTION = 1;
	private final static int HEIGHT_DIRECTION = 1;

	private enum ImageCompareType {
		BIG_BOTH_WIDTH, BIG_BOTH_HEIGHT, BIG_ONE_WIDTH, BIG_ONE_HEIGHT, SMALL_BOTH_LONG_WIDTH, SMALL_BOTH_LONG_HEIGHT
	}

	@Data
	private class WidthHeight {
		int width;
		int height;

		WidthHeight(int width, int height) {
			this.width = width;
			this.height = height;
		}
	}

	public void makeImage(CnvImageType imageType, InputStream imageInputStream, OutputStream outputStream) throws IOException {

		BufferedImage imageBuffer = ImageIO.read(imageInputStream);
		makeImage(imageType, imageBuffer, outputStream);
	}

	public void makeImageForKTO(CnvImageType imageType, BufferedImage imageBuffer, OutputStream outputStream) throws IOException {

		imageBuffer = cropWaterMark(imageBuffer);
		makeImage(imageType, imageBuffer, outputStream);
	}

	private BufferedImage cropWaterMark(BufferedImage imageBuffer) throws IOException {

		int newHeight = (int) (imageBuffer.getHeight() * 0.84);
		WidthHeight wh = new WidthHeight(imageBuffer.getWidth(), newHeight);
		return Thumbnails.of(imageBuffer)
						 .size(wh.getWidth(), wh.getHeight())
						 .crop(Positions.TOP_CENTER)
						 .keepAspectRatio(true)
						 .asBufferedImage();
	}

	public void makeImage(CnvImageType imageType, BufferedImage imageBuffer, OutputStream outputStream) throws IOException {

		double ration = imageBuffer.getWidth() / (double) imageBuffer.getHeight();

		ImageCompareType compareType = getImageCompareType(imageType, imageBuffer, ration);

		WidthHeight wh = null;
		double expantionRation = 1f;

		switch (compareType) {
			case BIG_BOTH_WIDTH: // 비율대로 썸네일을 만들고, 가로 튀어나온 부분을 crop
				wh = new WidthHeight((int) (ration * imageType.getHeight()), imageType.getHeight());
				makeImageByCrop(imageType, imageBuffer, wh, outputStream);
				break;

			case BIG_BOTH_HEIGHT: // 비율대로 썸네일을 만들고, 세로 튀어나온 부분을 crop
				wh = new WidthHeight(imageType.getWidth(), (int) (imageType.getWidth() / ration));
				makeImageByCrop(imageType, imageBuffer, wh, outputStream);
				break;

			case BIG_ONE_WIDTH: // 가로 튀어나온 부분을 crop한 후에 Canvas에 넣어서 검은색 배경 넣기
				wh = new WidthHeight(imageType.getWidth(), imageBuffer.getHeight());
				makeImageByCanvasCrop(imageType, imageBuffer, wh, outputStream);
				break;

			case BIG_ONE_HEIGHT: // 세로 튀어나온 부분을 crop한 후에 Canvas에 넣어서 검은색 배경 넣기
				wh = new WidthHeight(imageBuffer.getWidth(), imageType.getHeight());
				makeImageByCanvasCrop(imageType, imageBuffer, wh, outputStream);
				break;

			case SMALL_BOTH_LONG_WIDTH: // 가로에 맞게 확대 후, 검은색 배경 넣기
				expantionRation = imageType.getWidth() / (double) imageBuffer.getWidth();
				wh = new WidthHeight(imageType.getWidth(), (int) (imageBuffer.getHeight() * expantionRation));
				makeImageByCanvas(imageType, imageBuffer, wh, outputStream);
				break;

			case SMALL_BOTH_LONG_HEIGHT: // 세로에 맞게 확대 후, 검은색 배경 넣기
				expantionRation = imageType.getHeight() / (double) imageBuffer.getHeight();
				wh = new WidthHeight((int) (imageBuffer.getWidth() * expantionRation), imageType.getHeight());
				makeImageByCanvas(imageType, imageBuffer, wh, outputStream);
				break;
		}
	}

	private ImageCompareType getImageCompareType(CnvImageType imageType, BufferedImage imageBuffer, double ration) {

		boolean widthBig = imageBuffer.getWidth() > imageType.getWidth();
		boolean heightBig = imageBuffer.getHeight() > imageType.getHeight();

		boolean rationWidth = ration > imageType.getRatio();

		if (widthBig && heightBig) {
			return rationWidth ? ImageCompareType.BIG_BOTH_WIDTH : ImageCompareType.BIG_BOTH_HEIGHT;
		} else if (widthBig || heightBig) {
			return rationWidth ? ImageCompareType.BIG_ONE_WIDTH : ImageCompareType.BIG_ONE_HEIGHT;
		} else {
			return rationWidth ? ImageCompareType.SMALL_BOTH_LONG_WIDTH : ImageCompareType.SMALL_BOTH_LONG_HEIGHT;
		}
	}

	private BufferedImage makeResize(BufferedImage imageBuffer, WidthHeight wh) throws IOException {
		return Thumbnails.of(imageBuffer)
						 .size(wh.getWidth(), wh.getHeight())
						 .asBufferedImage();
	}

	private void makeImageByCrop(CnvImageType imageType, BufferedImage imageBuffer, WidthHeight wh, OutputStream outputStream)
			throws IOException {
		imageBuffer = makeResize(imageBuffer, wh);
		Thumbnails.of(imageBuffer)
				  .size(imageType.getWidth(), imageType.getHeight())
				  .outputQuality(0.7f)
				  .crop(Positions.CENTER)
				  .outputFormat("jpg")
				  .toOutputStream(outputStream);
	}

	private BufferedImage makeCrop(WidthHeight wh, BufferedImage imageBuffer) throws IOException {
		return Thumbnails.of(imageBuffer)
						 .size(wh.getWidth(), wh.getHeight())
						 .crop(Positions.CENTER)
						 .keepAspectRatio(true)
						 .asBufferedImage();
	}

	private void makeImageByCanvasCrop(CnvImageType imageType, BufferedImage imageBuffer, WidthHeight wh, OutputStream outputStream)
			throws IOException {
		imageBuffer = makeCrop(wh, imageBuffer);
		Thumbnails.of(imageBuffer)
				  .size(imageType.getWidth(), imageType.getHeight())
				  .outputQuality(0.7f)
				  .addFilter(new Canvas(imageType.getWidth(), imageType.getHeight(), Positions.CENTER))
				  .outputFormat("jpg")
				  .toOutputStream(outputStream);
	}

	private void makeImageByCanvas(CnvImageType imageType, BufferedImage imageBuffer, WidthHeight wh, OutputStream outputStream) throws IOException {

		Thumbnails.of(imageBuffer)
				  .size(wh.getWidth(), wh.getHeight())
				  .outputQuality(0.7f)
				  .addFilter(new Canvas(imageType.getWidth(), imageType.getHeight(), Positions.CENTER))
				  .outputFormat("jpg")
				  .toOutputStream(outputStream);
	}

}
