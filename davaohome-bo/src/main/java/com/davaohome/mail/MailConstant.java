package com.davaohome.mail;

import com.sun.jndi.cosnaming.IiopUrl;
import org.springframework.beans.factory.annotation.Value;

import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.util.ArrayList;
import java.util.List;

public class MailConstant {

    public static String MAIL_SERVER = "mail.wise-ss.jp";
    public static String MAIL_SERVER_ID  = "2ucall@wise-ss.jp";
    public static String MAIL_SERVER_PASSWORD = "w!se0406";

    public static List<InternetAddress> DEVELOPER_MAIL_LIST = new ArrayList<>();

    static{
        try {
            DEVELOPER_MAIL_LIST.add(new InternetAddress("usim@s-co.kr", "SCO"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
