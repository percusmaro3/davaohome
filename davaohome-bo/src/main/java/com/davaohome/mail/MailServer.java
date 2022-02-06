package com.davaohome.mail;

import lombok.Data;

@Data
public class MailServer {

    private static String MAIL_SERVER = "mail.wise-ss.jp";
    private static String MAIL_SERVER_PORT = "587";
    private static String MAIL_SERVER_ID  = "2ucall@wise-ss.jp";
    private static String MAIL_SERVER_PASSWORD = "w!se0406";

//    public static String MAIL_SERVER = "smtp.mailplug.co.kr";
//    private static String MAIL_SERVER = "mail.wise-ss.jp";
//    public static String MAIL_SERVER_PORT = "465";
//    public static String MAIL_SERVER_ID  = "2ucall@wise-ss.jp";
//    public static String MAIL_SERVER_PASSWORD = "w!se0406";

    private String mailServer;
    private String mailPort;
    private String mailId;
    private String mailPassword;

    public static MailServer getDefaultMailServer(){
        MailServer mailServer = new MailServer();

        mailServer.setMailServer(MAIL_SERVER);
        mailServer.setMailPort(MAIL_SERVER_PORT);
        mailServer.setMailId(MAIL_SERVER_ID);
        mailServer.setMailPassword(MAIL_SERVER_PASSWORD);

        return mailServer;
    }
}
