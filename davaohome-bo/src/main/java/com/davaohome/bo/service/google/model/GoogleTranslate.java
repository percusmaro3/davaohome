package com.davaohome.bo.service.google.model;

import lombok.Data;

import java.util.List;

@Data
public class GoogleTranslate {

	private TranslateData data;

	@Data
	class TranslateData {

		private List<Translations> translations;
	}

	@Data
	class Translations {

		private String translatedText;
	}

	public String getTranslatedStr() {

		StringBuffer sb = new StringBuffer();

		if (data != null && data.translations.size() != 0) {

			for (Translations t : data.translations) {
				sb.append(t.getTranslatedText());
			}
		}

		return sb.toString();
	}
}
