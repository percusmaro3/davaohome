package com.davaohome.bo.model.base;

import lombok.Data;

import java.util.List;

@Data
public class PagerResult {

	private Integer totalResultCount;
	private List<? extends Object> result;

}
