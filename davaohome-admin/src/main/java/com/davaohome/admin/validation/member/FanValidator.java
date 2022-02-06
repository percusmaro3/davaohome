package com.davaohome.admin.validation.member;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;
import org.springframework.validation.DefaultMessageCodesResolver;
import org.springframework.validation.Errors;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;


@Component
public class FanValidator implements Validator {

	private static final MessageCodesResolver codesResolver = new DefaultMessageCodesResolver();
	private static final Locale DEFAULT_LOCALE = Locale.KOREA;

	@Autowired
	private MessageSource messageSource;

	@Override
	public boolean supports(Class<?> clazz) {
		//		return clazz.isAssignableFrom(Fan.class);

		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {

		//		Fan fan = (Fan)target;
		//
		//		validateUniqueParams(fan, errors);
		//		validateDateParams(fan, errors);
		//생년월일 벨리데이션 제거 http://ticketlink.dooray.com/task/projects/공연-전시Web/885
		//validateBirthday(fan, errors);
	}

	//	public void validateFan(Fan fan) {
	//		validateTypeConstraints(fan);
	//		validateUniqueParams(fan);
	//		validateDateParams(fan);
	//		//생년월일 벨리데이션 제거 http://ticketlink.dooray.com/task/projects/공연-전시Web/885
	//		//validateBirthday(fan);
	//	}
	//
	//	private void validateTypeConstraints(Fan fan) {
	//		if (fan.getFanclubNo() == null) {
	//			throwExceptionWithMessage("NotNull", "fan", "fanclubNo", Integer.class);
	//		}
	//
	//		if (fan.getFanclubNo() < 1) {
	//			throwExceptionWithMessage("DecimalMin", "fan", "fanclubNo", Integer.class);
	//		}
	//	}
	//
	//	private <T> void throwExceptionWithMessage(String errorCode, String objectName, String field, Class<T> type) {
	//
	//		throw new IllegalArgumentException(
	//			messageSource.getMessage(
	//				new DefaultMessageSourceResolvable(
	//					codesResolver.resolveMessageCodes(errorCode, objectName, field, type)), DEFAULT_LOCALE));
	//	}
	//
	//	private void validateBirthday(Fan fan, Errors errors) {
	//		if (StringUtils.isBlank(fan.getBirthday())) {
	//			return;
	//		}
	//
	//		if (!RegexpUtil.matches(fan.getBirthday(), RegexpUtil.BIRTHDAY_8_PATTERN)) {
	//			errors.rejectValue("birthday", "field.pattern");
	//		}
	//	}
	//
	//	private void validateBirthday(Fan fan) {
	//		if (StringUtils.isBlank(fan.getBirthday())) {
	//			return;
	//		}
	//
	//		if (!RegexpUtil.matches(fan.getBirthday(), RegexpUtil.BIRTHDAY_8_PATTERN)) {
	//			throwExceptionWithMessage("field.pattern", "fan", "birthday", String.class);
	//		}
	//	}
	//
	//	private void validateDateParams(Fan fan, Errors errors) {
	//
	//		if (fan.getJoinDate() == null || fan.getWithdrawalDate() == null) {
	//			return;
	//		}
	//
	//		if (fan.getJoinDate().after(fan.getWithdrawalDate())) {
	//			errors.rejectValue("joinDate", "field.compare");
	//			errors.rejectValue("withdrawalDate", "field.compare");
	//		}
	//	}
	//
	//	private void validateDateParams(Fan fan) {
	//
	//		if (fan.getJoinDate() == null || fan.getWithdrawalDate() == null) {
	//			return;
	//		}
	//
	//		if (fan.getJoinDate().after(fan.getWithdrawalDate())) {
	//			throwExceptionWithMessage("field.compare", "fan", "joinDate", String.class);
	//		}
	//	}
	//
	//	private void validateUniqueParams(Fan fan, Errors errors) {
	//		if (areUniqueParamsNull(fan)) {
	//			errors.rejectValue("fanName", "field.required");
	//			errors.rejectValue("birthday", "field.required");
	//			errors.rejectValue("phoneNo", "field.required");
	//			errors.rejectValue("email", "field.required");
	//			errors.rejectValue("fanclubMemberNo", "field.required");
	//		}
	//	}
	//
	//	private void validateUniqueParams(Fan fan) {
	//		if (areUniqueParamsNull(fan)) {
	//			throwExceptionWithMessage("field.required", "fan", "fanName", String.class);
	//		}
	//	}
	//
	//	private boolean areUniqueParamsNull(Fan fan) {
	//
	//		return StringUtils.isBlank(fan.getFanName())
	//			&& StringUtils.isBlank(fan.getBirthday())
	//			&& StringUtils.isBlank(fan.getPhoneNo())
	//			&& StringUtils.isBlank(fan.getEmail())
	//			&& StringUtils.isBlank(fan.getFanclubMemberNo());
	//	}
}
