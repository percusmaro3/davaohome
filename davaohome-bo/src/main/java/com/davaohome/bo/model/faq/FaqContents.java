package com.davaohome.bo.model.faq;

import com.davaohome.bo.model.base.CountryContents;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

@Data
public class FaqContents implements CountryContents {

	private Integer faqNo;
	private String language;

	@NotEmpty(message = "alert.notice.title.notEmpty")
	private String question;

	@NotEmpty(message = "alert.notice.content.notEmpty")
	private String answer;
}
