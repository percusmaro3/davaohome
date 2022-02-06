package com.davaohome.bo.model.admin;

import com.davaohome.bo.model.base.RegisterUpdateInfo;
import com.davaohome.bo.model.common.YesNo;
import com.davaohome.bo.model.partner.PartnerType;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

@Data
public class AdminMember extends RegisterUpdateInfo {

	@NotEmpty(message = "alert.member.memberId.notEmpty")
	@Size(max = 100, message = "alert.member.memberId.size")
	private String adminMemberId;
	private String countryId;

	private String password;
	private Integer partnerNo;
	private PartnerType partnerType;
	private AdminMemberType adminMemberType;
	private YesNo activeYn;


	private String partnerName;
}
