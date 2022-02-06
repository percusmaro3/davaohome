package com.davaohome.utils.datatype;

import com.davaohome.utils.LogUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("boDisplayUtil")
public class DisplayUtil {

	public static final String tel = "/^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4}/";

	public static String changeTelType(String telInfo) {

		if (telInfo == null) {
			return null;
		}

		if (telInfo.startsWith("82")) {
			telInfo = "0" + telInfo.substring(2, telInfo.length());
		}

		String patternRegex = "(^02.{0}|^01.|[0-9]{3})([0-9]+)([0-9]{4})";
		Pattern p = Pattern.compile(patternRegex);
		Matcher m = p.matcher(telInfo);
		String newTelInfo = m.replaceAll("$1-$2-$3");

		return newTelInfo;

	}

	public static String maskingCellPhoneNo(String cellPhoneNo) {

		if (StringUtils.isBlank(cellPhoneNo)) {
			return null;
		}

		StringBuffer masked = new StringBuffer(cellPhoneNo.substring(0, 3));
		for (int i = 3; i < cellPhoneNo.length() - 2; i++) {
			masked.append("*");
		}
		masked.append(cellPhoneNo.substring(cellPhoneNo.length() - 2, cellPhoneNo.length()));

		return masked.toString();
	}

	public static String changeZipCodeFormat(String zipCode) {

		if (zipCode == null || zipCode.length() < 6) {
			return zipCode;
		}
		return zipCode.substring(0, 3) + "-" + zipCode.substring(3, 6);
	}

	public static String getPriceStr(Integer price) {

		return (new DecimalFormat("##,###").format(price)) + "원";
	}

	public static String transTimestampToString(Long timestamp, String format) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(timestamp);
	}

	/* yyyyMMdd 포맷을 java.util.Date 타입으로 변환  */
	public static Date stringToDateFormat(String strdate) {

		//return stringToDate(strdate, "yyyy/MM/dd");
		return stringToDateFormat(strdate, "yyyyMMdd");
	}

	public static Date stringToDateFormat(String strdate, String pattern) {

		try {

			if (strdate == "") {

				return null;
			} else {

				return FastDateFormat.getInstance(pattern, Locale.KOREA).parse(strdate);
			}
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	static public String substrByte(String strData, int iStartPos, int iByteLength) {
		byte[] bytTemp = null;
		int iRealStart = 0;
		int iRealEnd = 0;
		int iLength = 0;
		int iChar = 0;

		try {
			// UTF-8로 변환하는경우 한글 2Byte, 기타 1Byte로 떨어짐
			bytTemp = strData.getBytes("EUC-KR");
			iLength = bytTemp.length;

			for (int iIndex = 0; iIndex < iLength; iIndex++) {
				if (iStartPos <= iIndex) {
					break;
				}
				iChar = (int)bytTemp[iIndex];
				if ((iChar > 127) || (iChar < 0)) {
					// 한글의 경우(2byte 통과처리)
					// 한글은 2Byte이기 때문에 다음 글자는 볼것도 없이 스킵한다
					iRealStart++;
					iIndex++;
				} else {
					// 기타 글씨(1Byte 통과처리)
					iRealStart++;
				}
			}

			iRealEnd = iRealStart;
			int iEndLength = iRealStart + iByteLength;
			for (int iIndex = iRealStart; iIndex < iEndLength; iIndex++)
			{
				iChar = (int)bytTemp[iIndex];
				if ((iChar > 127) || (iChar < 0)) {
					// 한글의 경우(2byte 통과처리)
					// 한글은 2Byte이기 때문에 다음 글자는 볼것도 없이 스킵한다
					iRealEnd++;
					iIndex++;
				} else {
					// 기타 글씨(1Byte 통과처리)
					iRealEnd++;
				}
			}
		} catch (Exception e) {
			LogUtils.error("[CATCH_EXCEPTION]", e);
			throw new RuntimeException(e);
		}

		return strData.substring(iRealStart, iRealEnd);
	}


	/**
	 * email형식 아이디에서 맨 앞 두자리와, 호스트부분 두자리를 표기하고 나머지는 *로 처리
	 * ex) heejun.oh@nhnent.com -> he***@nh
	 * @param emailId
	 * @return
	 */
	public static String maskingAsterisktedEmailId(String emailId) {

		if (StringUtils.isEmpty(emailId)) {
			return emailId;
		}

		int idxOfAmpersat = emailId.indexOf("@");
		int lengthOfMemberId = emailId.length();
		String markedMemberId;

		if (idxOfAmpersat != -1) {
			if (idxOfAmpersat >= 3) {
				markedMemberId = emailId.substring(0, 2) + "***" + emailId.substring(idxOfAmpersat, idxOfAmpersat + 3);
			} else {
				markedMemberId = emailId.substring(0, idxOfAmpersat) + "***" + emailId.substring(idxOfAmpersat,
						idxOfAmpersat + 3);
			}
		} else {
			if (lengthOfMemberId < 3) {
				markedMemberId = emailId + "***";
			} else {
				markedMemberId = emailId.substring(0, 2) + "***";
			}
		}
		return markedMemberId;
	}

}
