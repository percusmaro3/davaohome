package com.davaohome.bo.model.partner;

import com.davaohome.bo.model.base.RegisterUpdateInfo;
import com.davaohome.bo.model.common.YesNo;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

@Data
public class Partner extends RegisterUpdateInfo {


	private Integer partnerNo;
	@NotEmpty(message = "alert.member.memberId.notEmpty")
	@Size(max = 100, message = "alert.member.memberId.size")
	private String partnerName;
	private PartnerType partnerType;
	private String countryId;
	private String memo;
	private YesNo activeYn;

}
