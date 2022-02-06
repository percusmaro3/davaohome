package com.davaohome.bo.model.notice;


import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

@Data
public class NoticeSingleContents extends Notice {

	private String language;

	@NotEmpty(message = "alert.notice.title.notEmpty")
	@Size(max = 255, message = "alert.notice.title.size")
	private String title;

	@NotEmpty(message = "alert.notice.content.notEmpty")
	private String content;
}
