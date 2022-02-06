package com.davaohome.bo.model.common;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class CnvBoConstant {

	public static Phase boPhase;

	@Value("#{config['bo.phase']}")
	public void setBoPhase(String phase) {

		if (StringUtils.isEmpty(phase)) {
			phase = "REAL";
		}
		boPhase = Phase.valueOf(phase);
	}
}
