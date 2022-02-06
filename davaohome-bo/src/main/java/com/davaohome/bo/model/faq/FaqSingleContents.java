package com.davaohome.bo.model.faq;


import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

@Data
public class FaqSingleContents extends Faq {

	private String language;

	@NotEmpty(message = "alert.notice.title.notEmpty")
	private String question;

	@NotEmpty(message = "alert.notice.content.notEmpty")
	private String answer;
}
