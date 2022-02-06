package com.davaohome.bo.model.notice;

import com.davaohome.bo.model.base.PageIndexSetter;
import lombok.Data;

@Data
public class NoticeSearchParam extends PageIndexSetter {

	private String language;
}
