package com.davaohome.mailbak;

import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class MailConstant {

    public static String MAIL_SERVER = "mailbak.wise-ss.jp";
    public static String MAIL_SERVER_ID  = "2ucall@wise-ss.jp";
    public static String MAIL_SERVER_PASSWORD = "w!se0406";

    public static List<Address> DEVELOPER_MAIL_LIST = new ArrayList<>();

    static{
        try {
            DEVELOPER_MAIL_LIST.add(new InternetAddress("usim@s-co.kr", "SCO"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

}
