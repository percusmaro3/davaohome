/*
 * Created on 2003/11/09
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.davaohome.mailbak;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Properties;
import java.util.Vector;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class MailSender {

	Properties m_pro = new Properties();
	Authenticator m_auth;
	String m_host;
	String m_user;
	String m_password;
	Vector m_to = new Vector();
	Vector m_cc = new Vector();
	Vector m_bcc = new Vector();
	Address m_from;
	MimeBodyPart m_messageBody;
	String m_message;
	MailContentType bodyType;

	Vector m_attachFiles = new Vector();
	String m_subject = "";
	Hashtable m_header = new Hashtable();
	String m_charset = "utf-8";

	public MailSender() {

		setSMTPInfo(MailConstant.MAIL_SERVER, MailConstant.MAIL_SERVER_ID, MailConstant.MAIL_SERVER_PASSWORD);
	}

	private void setSMTPInfo(String host, String user, String password) {
		if (host == null) {
			throw new NullPointerException(" Given Host is Null");
		}
		m_pro.setProperty("mailbak.smtp.host", host);
		m_pro.setProperty("mailbak.smtp.port", "587");
		m_user = user;
		m_password = password;
		if (user != null) {
			m_auth = new TempAuth(m_user, m_password);
		}
	}

	public void setTo(Address addr) {
		m_to.clear();
		m_to.add(addr);
	}

	public void setTo(String mail) throws AddressException {
		setTo(new InternetAddress(mail));
	}

	public void setTo(String mail, String name)
			throws UnsupportedEncodingException, AddressException {
		setTo(new InternetAddress(mail, name));
	}

	public void setTo(List<Address> toList) {
		m_to.clear();
		m_to.addAll(toList);
	}

	public void addTo(Address addr) {
		m_to.add(addr);
	}

	public void addTo(String mail, String name)
			throws UnsupportedEncodingException {
		addTo(new InternetAddress(mail, name));
	}

	public void addCc(Address addr) {
		m_cc.add(addr);
	}

	public void addCc(String mail, String name)
			throws UnsupportedEncodingException {
		addCc(new InternetAddress(mail, name));
	}

	public void addBcc(Address addr) {
		m_bcc.add(addr);
	}

	public void addBcc(String mail, String name) throws UnsupportedEncodingException {
		addBcc(new InternetAddress(mail, name));
	}

	public void addHeader(String name, String value) {
		m_header.put(name, value);
	}

	public void setFrom(Address addr) {
		m_from = addr;
	}

	public void setFrom(String mail, String name)
			throws UnsupportedEncodingException {
		setFrom(new InternetAddress(mail, name));
	}

	public void setSubject(String subject) {
		m_subject = subject;
	}

	public void setMessage(String message) {
		setMessage(message, MailContentType.HTML);
	}

	public void setMessage(String message, MailContentType mbt) {
		m_message = message;
		this.bodyType = mbt;
	}

	public void setMessage(MimeBodyPart mbp) {
		m_messageBody = mbp;
	}

	public void addAttachFile(File attachFile)
			throws MessagingException {
		FileDataSource fds = new FileDataSource(attachFile);
		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setDataHandler(new DataHandler(fds));
		mbp.setFileName(fds.getName());
		m_attachFiles.add(mbp);
	}

	public void addAttachFile(MimeBodyPart mbp) {
		m_attachFiles.add(mbp);
	}

	public void removeAllAttachFiles() {
		m_attachFiles = new Vector();
	}

	public Authenticator getAuthenticator(String username, String password) {
		return new TempAuth(m_user, m_password);
	}

	public void sendMail()
			throws MessagingException {
		if (m_pro == null) {
			throw new NullPointerException("Not Assigned The Information of SMTP Host");
		}
		// set auth 
		if (m_auth != null) {
			m_pro.put("mailbak.smtp.auth", "true");
		}

		Session mailConn = Session.getInstance(m_pro, m_auth);
		MimeMessage msg = new MimeMessage(mailConn);

		// Header
		if (m_header.size() != 0) {
			Enumeration e = m_header.keys();
			while (e.hasMoreElements()) {
				String name = (String) e.nextElement();
				String value = (String) m_header.get(name);
				msg.addHeader(name, value);
			}
		}

		// From
		if (m_from == null) {
			throw new NullPointerException("Not Assigned The Information of From");
		}
		msg.setFrom(m_from);

		// To
		if (m_to.size() == 0) {
			throw new NullPointerException("Not Assigned The Information of TO");
		}
		msg.setRecipients(Message.RecipientType.TO, (Address[]) m_to.toArray(new Address[m_to.size()]));

		// CC
		if (m_cc.size() != 0) {
			msg.setRecipients(Message.RecipientType.CC, (Address[]) m_cc.toArray(new Address[m_cc.size()]));
		}

		if (m_bcc.size() != 0) {
			msg.setRecipients(Message.RecipientType.BCC, (Address[]) m_bcc.toArray(new Address[m_bcc.size()]));
		}

		// Subject
		if (m_charset != null) {
			msg.setSubject(m_subject, m_charset);
		} else {
			msg.setSubject(m_subject);
		}

		Multipart mp = new MimeMultipart();

		// Text
		BodyPart messageBodyPart = new MimeBodyPart();
		String bodyTypeStr = this.bodyType.getBodyTypeStr();
		messageBodyPart.setContent(m_message, bodyTypeStr + ";charset=utf-8");
		mp.addBodyPart(messageBodyPart);

		// Attached File
		if (m_attachFiles.size() != 0) {

			for (int i = 0; i < m_attachFiles.size(); i++) {
				mp.addBodyPart((MimeBodyPart) m_attachFiles.get(i));
			}
		}
		msg.setContent(mp);

		Transport.send(msg);
	}

	public class TempAuth extends Authenticator {
		String m_username;
		String m_password;

		public TempAuth(String username, String password) {
			super();
			m_username = username;
			m_password = password;
		}

		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(m_username, m_password);
		}
	}

	public static void main(String[] args) {
		try {

			String subject = "テストです。";
			String content = "Contentテストです。";
			String to = "percus@naver.com";
			String name = "日本語、国";
			String mailServer = "mailbak.wise-ss.jp";
			String id = "2ucall@wise-ss.jp";
			String password = "9999";
			String from = "2ucall@wise-ss.jp";

			MailSender ms = new MailSender();
			ms.setSMTPInfo(mailServer, id, password);

			ms.setFrom(from, "TUCall");
			ms.setTo(to, name);
			ms.setSubject(subject);
			ms.setMessage(content);
			ms.sendMail();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
