package com.davaohome.bo.model.faq;

import com.davaohome.bo.model.base.RegisterUpdateInfo;
import com.davaohome.bo.model.common.YesNo;
import lombok.Data;

import java.util.Map;

@Data
public class Faq extends RegisterUpdateInfo {

	private Integer faqNo;
	private YesNo activeYn;

	private Map<String, FaqContents> contentsMap;
}
