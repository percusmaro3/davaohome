package com.davaohome.bo.service.google.service;

import com.davaohome.bo.model.base.ActiveLanguage;
import com.davaohome.bo.model.base.TranslateLanguage;
import com.davaohome.bo.service.google.model.GoogleTranslate;
import com.davaohome.http.FluentHCWrapper;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import org.springframework.stereotype.Service;

import java.io.IOException;


@Service
public class GoogleTranslateService {

	public static final String GOOGLE_SERVER_API_KEY = "AIzaSyA3o5c56Md8ZLsNBCwpVcekNF_P3J8dCFk";
	private static final String GOOGLE_TRANSLATE_URL = "https://translation.googleapis"
													   + ".com/language/translate/v2?";

	public String doTranslateByGet(ActiveLanguage srcLangage, ActiveLanguage targetLangauge, String str) throws IOException {
		StringBuffer sb = new StringBuffer();

		sb.append(GOOGLE_TRANSLATE_URL)
		  .append("key=").append(GOOGLE_SERVER_API_KEY).append("&");

		sb.append("source=").append(srcLangage.name()).append("&")
		  .append("target=").append(targetLangauge.name()).append("&")
		  .append("q=").append(str);

		GoogleTranslate googleTranslate = FluentHCWrapper.executeJson(sb.toString(), GoogleTranslate.class);

		return googleTranslate.getTranslatedStr();
	}

	public String doTranslate(TranslateLanguage srcLangage, TranslateLanguage targetLangauge, String str) throws IOException {

		Translate translate = TranslateOptions.newBuilder().setApiKey(GOOGLE_SERVER_API_KEY).build()
											  .getService();

		Translation translation =
				translate.translate(
						str,
						Translate.TranslateOption.sourceLanguage(srcLangage.getGoogleLanguageCode()),
						Translate.TranslateOption.targetLanguage(targetLangauge.getGoogleLanguageCode()));

		return translation.getTranslatedText();
	}

	public String doTranslate(String srcLangage, String targetLangauge, String str) throws IOException {

		Translate translate = TranslateOptions.newBuilder().setApiKey(GOOGLE_SERVER_API_KEY).build()
				.getService();

		Translation translation =
				translate.translate(
						str,
						Translate.TranslateOption.sourceLanguage(srcLangage),
						Translate.TranslateOption.targetLanguage(targetLangauge));

		return translation.getTranslatedText();
	}
}
