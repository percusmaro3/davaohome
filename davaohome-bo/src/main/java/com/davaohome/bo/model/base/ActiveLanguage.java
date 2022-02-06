package com.davaohome.bo.model.base;


public enum ActiveLanguage {
	en("language.en", "en"),
	ko("language.ko", "ko"),
	ja("language.ja", "ja"),
	zh("language.zh", "zh"),  // 중국어 간체
	zhTW("language.zh-TW", "zh-TW"),  // 중국어 번체
	th("language.th", "th");

	String languageDisplayName;
	String googleLanguageCode;

	private ActiveLanguage(String languageDisplayName, String googleLanguageCode) {
		this.languageDisplayName = languageDisplayName;
		this.googleLanguageCode = googleLanguageCode;
	}

	public String getLanguageDisplayName() {
		return this.languageDisplayName;
	}

	public String getGoogleLanguageCode() {
		return this.googleLanguageCode;
	}

	public static String getAvaliableLanguage(String languageStr) {

		try {
			ActiveLanguage al = ActiveLanguage.valueOf(languageStr);

			return al.name();
		} catch (Throwable e) {
			return en.name();
		}
	}

}
