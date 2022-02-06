package com.davaohome.bo.model.common;

import lombok.Data;

@Data
public class ImageSize {

	private Integer width;
	private Integer height;

	public ImageSize(Integer width, Integer height) {
		this.width = width;
		this.height = height;
	}
}
