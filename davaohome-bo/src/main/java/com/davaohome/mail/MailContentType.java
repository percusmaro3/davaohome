package com.davaohome.mail;

public enum MailContentType {
	TEXT("text/plain"), HTML("text/html");

	private String bodyTypeStr;
	MailContentType(String bodyTypeStr) {
		this.bodyTypeStr = bodyTypeStr;
	}

	public String getBodyTypeStr() {
		return this.bodyTypeStr;
	}
}
