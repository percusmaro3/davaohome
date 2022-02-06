package com.davaohome.bo.model.admin;

import com.davaohome.bo.model.base.PageIndexSetter;
import lombok.Data;

@Data
public class AdminMemberSearchParam extends PageIndexSetter {

	private String adminMemberId;
	private String countryId;
	private String partnerNo;

}
