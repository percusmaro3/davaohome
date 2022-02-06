/*
 * Created on 2003/11/09
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.davaohome.mail;

import org.apache.commons.lang.StringUtils;

import javax.mail.*;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;


public class MailSender {

	Authenticator mailAuth;
	Properties mailProperties = new Properties();
	MailContents mailContents;
	Map<String, String> mailHeader = new Hashtable<>();

	public MailSender() {
		this(MailServer.getDefaultMailServer());
	}

	public MailSender(MailServer mailServer){
		setMailAuth(mailServer);
		setMailProperties(mailServer);
	}

	private void setMailAuth(MailServer mailServer) {
		mailAuth = new MailAuthenticator(mailServer);
	}

	private void setMailProperties(MailServer mailServer) {
		mailProperties.setProperty("mail.smtp.host", mailServer.getMailServer());
		mailProperties.setProperty("mail.smtp.port", mailServer.getMailPort());
		mailProperties.put("mail.smtp.auth", "true");

//		mailProperties.put("mail.smtp.ssl.enable", "true");
//		mailProperties.put("mail.smtp.ssl.trust", mailServer.getMailServer());

//		mailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//		mailProperties.put("mail.smtp.socketFactory.port", "587");
//		mailProperties.put("mail.smtp.socketFactory.fallback", "false");
//		mailProperties.put("mail.smtp.starttls.enable", "true");
	}

	public void addHeader(String name, String value) {
		mailHeader.put(name, value);
	}

	public void setMailContents(MailContents mailContents){
		this.mailContents = mailContents;
	}

	public void sendMail() throws MessagingException {

		validate();

		MimeMessage mimeMessage = getMimeMessage();
		Multipart multipart = getMultipart();

		mimeMessage.setContent(multipart);
		Transport.send(mimeMessage);
	}

	private void validate() {
		if( mailContents == null ){
			throw new NullPointerException("Mail Contents is null");
		}
		if( mailContents.getFromEmail() == null ){
			throw new NullPointerException("From email is null");
		}
		if( StringUtils.isEmpty(mailContents.getTitle()) ){
			throw new NullPointerException("Title is null");
		}
		if( StringUtils.isEmpty(mailContents.getBody()) ){
			throw new NullPointerException("Body is null");
		}
		if( mailContents.getToEmailList().size() == 0 ){
			throw new NullPointerException("To Email is null");
		}
	}

	private MimeMessage getMimeMessage() throws MessagingException {
		Session mailConn = Session.getInstance(mailProperties, mailAuth);
		MimeMessage mimeMessage = new MimeMessage(mailConn);

		for( String headerName : mailHeader.keySet() ){
			mimeMessage.addHeader(headerName, mailHeader.get(headerName));
		}

		mimeMessage.setFrom(mailContents.getFromEmail());
		mimeMessage.setRecipients(Message.RecipientType.TO, mailContents.getToEmailAddressArr());
		if (mailContents.getCcEmailList().size() != 0) {
			mimeMessage.setRecipients(Message.RecipientType.CC, mailContents.getCcEmailAddressArr());
		}

		mimeMessage.setSubject(mailContents.getTitle(), mailContents.getCharset());
		return mimeMessage;
	}

	public Multipart getMultipart() throws MessagingException {
		Multipart multipart = new MimeMultipart();

		// Text
		BodyPart messageBodyPart = new MimeBodyPart();
		String bodyTypeStr = mailContents.getBodyType().getBodyTypeStr();
		messageBodyPart.setContent(mailContents.getBody(), bodyTypeStr + ";charset=" + mailContents.getCharset());
		multipart.addBodyPart(messageBodyPart);

		for (MimeBodyPart mimeBodyPart : mailContents.getMimeBodyPartList()) {
			System.out.println("mimeBodyPart : "+mimeBodyPart);
			multipart.addBodyPart(mimeBodyPart);
		}
		return multipart;
	}
}
