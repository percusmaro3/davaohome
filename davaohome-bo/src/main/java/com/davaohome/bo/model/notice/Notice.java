package com.davaohome.bo.model.notice;

import com.davaohome.bo.model.base.RegisterUpdateInfo;
import com.davaohome.bo.model.common.YesNo;
import lombok.Data;

import java.util.Map;

@Data
public class Notice extends RegisterUpdateInfo {

	private Integer noticeNo;
	private YesNo activeYn;

	private Map<String, NoticeContents> contentsMap;
}
