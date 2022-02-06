package com.davaohome.utils.datatype;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author nhnent
 */
public class MaskingUtil {
	private static final Logger LOGGER = LoggerFactory.getLogger(MaskingUtil.class);

	public static String maskingId(String id) {
		String userId = id;
		if (StringUtils.isEmpty(id)) {
			return id;
		}
		if (userId.indexOf("@") >= 0) {
			userId = MaskingUtil.maskingEmailId(userId);
		} else {
			userId = MaskingUtil.maskingCountryMobileNoComplex(userId);
		}
		return userId;
	}

	public static String maskingEmailId(String id) {
		if (StringUtils.isEmpty(id)) {
			return id;
		}

		if (id.contains("@") == false) {
			return id;
		}

		String email = id.substring(id.indexOf("@"), id.length());
		LOGGER.debug("id :" + id);

		id = id.substring(0, id.indexOf("@"));

		if (id.length() == 1) {

		} else if (id.length() == 2 || id.length() == 3) {
			id = id.substring(0, (id.length() - 1)) + "*";
		} else if (id.length() == 4) {
			id = id.substring(0, (id.length() - 2)) + "**";
		} else if (id.length() > 8) {
			id = id.substring(0, 8);
			id = id.substring(0, (id.length() - 3)) + "***";
		} else {
			id = id.substring(0, (id.length() - 3)) + "***";
		}
		LOGGER.debug("masking id :" + id);

		return id + email;
	}

	/* 핸드폰 가운데와 마지막 자리의 두글자 마스킹
	 * mobileNo input value, 숫자만 받음.
	 *   ex:01011112222 => 010-**01-**01,  0104396070 => 010-**1-**01
	 *    */
	public static String maskingMobileNoComplex(String mobileNo) {
		if (StringUtils.isEmpty(mobileNo)) {
			return mobileNo;
		}

		if (NumberUtils.isNumber(mobileNo) == false) {
			return mobileNo;
		}

		if (mobileNo.length() == 10) {
			return mobileNo.subSequence(0, 3) + "-**" + mobileNo.subSequence(5, 6) + "-**"
				+ mobileNo.subSequence(mobileNo.length() - 2, mobileNo.length());
		} else {
			return mobileNo.subSequence(0, 3) + "-**" + mobileNo.subSequence(5, 7) + "-**"
				+ mobileNo.subSequence(mobileNo.length() - 2, mobileNo.length());
		}
	}

	/* 국가코드 제외(국가코드는 두글자라고 가정. 한국 먼저 런칭)
	 * 입력: 821011112222 -> 01011112222 으로 변환 -> 마스킹
	 **/
	public static String maskingCountryMobileNoComplex(String mobileNo) {
		if (StringUtils.isEmpty(mobileNo)) {
			return mobileNo;
		}

		if (NumberUtils.isNumber(mobileNo) == false) {
			return mobileNo;
		}

		mobileNo = "0" + mobileNo.substring(2);

		if (mobileNo.length() == 10) {
			return mobileNo.subSequence(0, 3) + "-**" + mobileNo.subSequence(5, 6) + "-**"
				+ mobileNo.subSequence(mobileNo.length() - 2, mobileNo.length());
		} else {
			return mobileNo.subSequence(0, 3) + "-**" + mobileNo.subSequence(5, 7) + "-**"
				+ mobileNo.subSequence(mobileNo.length() - 2, mobileNo.length());
		}
	}

	/* 세번째 공백 이후는 마스킹:
	 * 서울특별시 성동구 마장동 사거리 227-8 화광빌딩 4층 403호 -> 서울특별시 성동구 마장동 ***
	 **/
	public static String maskingAddress(String address) {
		if (StringUtils.isEmpty(address)) {
			return address;
		}

		int spaceCount = StringUtils.countMatches(address, " ");

		if (spaceCount < 3) {
			return address;
		}

		int thirdSpaceIndex = address.indexOf(' ', address.indexOf(' ', address.indexOf(' ') + 1) + 1);

		if (thirdSpaceIndex < 1) {
			return address;
		}

		return address.substring(0, thirdSpaceIndex) + " ***";
	}

	public static String maskingMembershipNo(String membershipNo) {
		if (StringUtils.isEmpty(membershipNo)) {
			return membershipNo;
		}

		if (NumberUtils.isNumber(membershipNo) == false) {
			return membershipNo;
		}

		if (membershipNo.length() <= 5) {
			return membershipNo;
		}

		int len = membershipNo.length();
		membershipNo = membershipNo.substring(0, len - 4) + "**" + membershipNo.substring(len - 2, len);

		return membershipNo;
	}

	public static String maskingAccountNo(String accountNo) {
		if (StringUtils.isEmpty(accountNo)) {
			return accountNo;
		}

		//if (NumberUtils.isNumber(accountNo) == false) {
		//	return accountNo;
		//}

		int len = accountNo.length();
		int offset = 5;
		String maskResult = "";
		String maskString = "";
		for (int i = 0; i < offset; i++) {
			maskString += "*";
		}

		maskResult = accountNo.substring(0, len - offset) + maskString;

		return maskResult;
	}
}
