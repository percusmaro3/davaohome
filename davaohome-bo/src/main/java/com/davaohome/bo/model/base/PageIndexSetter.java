package com.davaohome.bo.model.base;

import lombok.Data;

@Data
public class PageIndexSetter {

	private Integer startRowIndex = 0;
	private Integer fetchCount;

}