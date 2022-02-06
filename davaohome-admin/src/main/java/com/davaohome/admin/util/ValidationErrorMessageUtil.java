package com.davaohome.admin.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

@Component
public class ValidationErrorMessageUtil {

	//	@Autowired
	//	MessageSource messageSource;

	private static final int ERROR_MESSAGES_SIZE = 30;

	public List<String> getErrorMessageList(Errors errors) {

		if (!errors.hasErrors()) {
			return null;
		}

		List<String> errorMessages = new ArrayList<String>(ERROR_MESSAGES_SIZE);

		List<FieldError> fieldErrors = errors.getFieldErrors();

		//		for (int i = 0; i < fieldErrors.size(); i++) {
		//			errorMessages.add(
		//					MessageSource.getMessage(fieldErrors.get(i).getCode() + '.' + fieldErrors.get(i).getObjectName() + '.'
		//											 + fieldErrors.get(i).getField()));
		//		}

		return errorMessages;
	}
}
