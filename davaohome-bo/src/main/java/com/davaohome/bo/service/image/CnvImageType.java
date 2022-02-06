package com.davaohome.bo.service.image;

public enum CnvImageType {
	PLACE_LIST(1030, 338, 3.047f),
	PLACE_SMALL(300, 300, 1),
	PLACE_DETAIL(1030, 602, 1.710f),
	TEST(300, 100, 3f);

	private Integer width;
	private Integer height;
	private float ratio;

	CnvImageType(Integer width, Integer height, float ratio) {
		this.width = width;
		this.height = height;
		this.ratio = ratio;
	}

	public Integer getWidth() {
		return this.width;
	}

	public Integer getHeight() {
		return this.height;
	}

	public float getRatio() {
		return this.ratio;
	}
}
