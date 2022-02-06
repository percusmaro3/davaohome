package com.davaohome.log;

import com.davaohome.mailbak.MailConstant;
import com.davaohome.mailbak.MailContentType;
import com.davaohome.mailbak.MailSender;

import javax.mail.MessagingException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;

public class MailLog {

	private static String EXCEPTION_MAIL_TITLE = "Exception : ";

	public static void sendAlertMailToDeveloper(String title, String contents) throws UnsupportedEncodingException, MessagingException {
		MailSender ms = createMailSenderByDeveloperMode();

		ms.setSubject(title);
		ms.setMessage(contents, MailContentType.HTML);

		ms.sendMail();
	}

	public static void sendExceptionToDeveloper(Exception e) throws MessagingException, UnsupportedEncodingException {
		MailSender ms = createMailSenderByDeveloperMode();

		ms.setSubject(EXCEPTION_MAIL_TITLE + e.getMessage());

		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		e.printStackTrace(pw);

		ms.setMessage(sw.toString(), MailContentType.HTML);

		ms.sendMail();
	}

	private static MailSender createMailSenderByDeveloperMode() throws UnsupportedEncodingException {

		MailSender ms = new MailSender();

		ms.setFrom(MailConstant.MAIL_SERVER_ID, "SYSTEM");
		ms.setTo(MailConstant.DEVELOPER_MAIL_LIST);

		return ms;
	}

}
