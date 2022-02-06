package com.davaohome.bo.model.faq;

import com.davaohome.bo.model.base.PageIndexSetter;
import lombok.Data;

@Data
public class FaqSearchParam extends PageIndexSetter {

	private String language;
}
