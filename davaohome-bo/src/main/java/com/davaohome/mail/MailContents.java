package com.davaohome.mail;

import lombok.Data;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Data
public class MailContents {

    private List<InternetAddress> toEmailList = new ArrayList<>();
    private List<InternetAddress> ccEmailList = new ArrayList<>();
    private InternetAddress fromEmail;
    private String title;
    private String body;
    private MailContentType bodyType = MailContentType.HTML;
    private List<File> attacheFileList = new ArrayList<>();
    private String charset = "utf-8";

    public void setFromEmail(String email) throws UnsupportedEncodingException, AddressException {
        fromEmail = new InternetAddress(email);
    }

    public void setFromEmail(String email, String name) throws UnsupportedEncodingException {
        fromEmail = new InternetAddress(email, name);
    }

    public String getFromEmailOnlyId(){
        String email = fromEmail.getAddress();
        return email.substring(0, email.indexOf("@"));
    }

    public void addToEmail(String toEmail) throws AddressException {
        toEmailList.add(new InternetAddress(toEmail));
    }

    public void setToEmailCommaStr(String emailCommaStr) throws UnsupportedEncodingException, AddressException {
        String[] toEmailArr = emailCommaStr.split(",");
        List<String> toEmailList = Arrays.asList(toEmailArr);

        for(String toEmail : toEmailList){
            addToEmail(toEmail.trim(), "");
        }
    }

    public String getToEmailCommaStr(){
        StringBuffer sb = new StringBuffer();

        if( toEmailList.size() > 0 ) {
            int index = 0;
            for(InternetAddress toEmailAddress : toEmailList){
                sb.append(toEmailAddress.getAddress());
                index++;
                if( index != toEmailList.size() ){
                    sb.append(",");
                }
            }
            return sb.toString();
        }else{
            return "";
        }
    }

    public void addToEmail(String toEmail, String toName) throws AddressException, UnsupportedEncodingException {
        toEmailList.add(new InternetAddress(toEmail, toName));
    }

    public void resetToEmail(){
        toEmailList.clear();
    }

    public String getFirstToEmail(){
        if( toEmailList.size() > 0 ) {
            return toEmailList.get(0).getAddress();
        }else{
            return "";
        }
    }

    public String getFirstToEmailName(){
        if( toEmailList.size() > 0 ) {
            return toEmailList.get(0).getPersonal();
        }else{
            return "";
        }
    }

    public InternetAddress[] getToEmailAddressArr(){
        InternetAddress[] itemsArray = new InternetAddress[toEmailList.size()];
        return (InternetAddress[])toEmailList.toArray(itemsArray);
    }

    public void addCcEmail(String ccEmail) throws AddressException {
        ccEmailList.add(new InternetAddress(ccEmail));
    }

    public void addCcEmail(String ccEmail, String ccName) throws AddressException, UnsupportedEncodingException {
        ccEmailList.add(new InternetAddress(ccEmail, ccName));
    }

    public void resetCcEmail(){
        ccEmailList.clear();
    }

    public InternetAddress[] getCcEmailAddressArr(){
        InternetAddress[] itemsArray = new InternetAddress[ccEmailList.size()];
        return (InternetAddress[])ccEmailList.toArray();
    }

    public void addAttacheFile(File attacheFile){
        attacheFileList.add(attacheFile);
    }

    public void resetAttacheFile(){
        attacheFileList.clear();
    }

    public List<MimeBodyPart> getMimeBodyPartList() throws MessagingException {
        List<MimeBodyPart> mimeBodyPartList = new ArrayList<>();

        for( File attacheFile : attacheFileList ) {
            FileDataSource fds = new FileDataSource(attacheFile);

            MimeBodyPart mbp = new MimeBodyPart();
            mbp.setDataHandler(new DataHandler(fds));
            mbp.setFileName(fds.getName());

            mimeBodyPartList.add(mbp);
        }

        return mimeBodyPartList;
    }
}
