package com.davaohome.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator {

    String userName;
    String password;

    public MailAuthenticator(String username, String password) {
        super();
        this.userName = username;
        this.password = password;
    }

    public MailAuthenticator(MailServer mailServer) {
        super();
        this.userName = mailServer.getMailId();
        this.password = mailServer.getMailPassword();
    }

    public PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
    }
}
