package com.davaohome.admin.model;

import lombok.Data;

import com.davaohome.bo.model.base.ActiveLanguage;

@Data
public class TranslateRequest {

	private ActiveLanguage src;
	private ActiveLanguage target;
	private String str;
}
