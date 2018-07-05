package com.sweetk.web.common.utils;

import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

public class EmailSend {

    public static void main(String[] args){
        try{
        	EmailSend emailSend = new EmailSend();
        	emailSend.mailSend("hanjh@sweetk.co.kr","sweetk","Hi han","Hi han. What are you doing?");
        }catch(Exception e){
            System.out.println("Error");
        }
    }

	static Logger log = Logger.getLogger(EmailSend.class);

	public void mailSend(String toMail , String fromMain, String mailTitle, String mailBody) throws Exception {

		log.debug("############## EmailSend Start Time : "+ new Date());
		System.out.println("############## EmailSend Start Time : "+ new Date());

        Properties props = new Properties(); 
        props.setProperty("mail.transport.protocol", "smtp"); 
        //props.setProperty("mail.host", "smtp.gmail.com"); 
        props.setProperty("mail.host", "smtp.worksmobile.com"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.port", "465"); 
        props.put("mail.smtp.socketFactory.port", "465"); 
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        props.put("mail.smtp.socketFactory.fallback", "false"); 
        props.setProperty("mail.smtp.quitwait", "false"); 

		props.put("mail..debug", "true");

        Authenticator auth = new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() { 
                return new PasswordAuthentication("i.cou@sweetk.co.kr", "sweetk1004"); 
            }
        };
    
        Session session = Session.getDefaultInstance(props,auth);
		session.setDebug(true);
         
        MimeMessage message = new MimeMessage(session); 
        message.setFrom(new InternetAddress("i.cou@sweetk.co.kr")); 
        message.setSubject(mailTitle); 
 
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail)); 
         
        Multipart mp = new MimeMultipart();
        MimeBodyPart mbp1 = new MimeBodyPart();
        mbp1.setText(mailBody);
        mp.addBodyPart(mbp1);
 
        
       // 파일 첨부시 
        /*
        String filename = "f:\\test.xls";
        if(filename != null){
            if(fileSizeCheck(filename)){
                MimeBodyPart mbp2 = new MimeBodyPart();
                FileDataSource fds = new FileDataSource(filename);
                mbp2.setDataHandler(new DataHandler(fds));
                mbp2.setFileName(MimeUtility.encodeText(fds.getName(), "UTF-8", "B"));
             
                mp.addBodyPart(mbp2);
            }else{
                throw new Exception("file size overflow !");
            }
        }
        */
        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
        CommandMap.setDefaultCommandMap(mc);
         
        message.setContent(mp);
         
        Transport.send(message);

		log.debug("############## EmailSend End Time : "+ new Date());
		System.out.println("############## EmailSend End Time : "+ new Date());

	}
	
    protected boolean fileSizeCheck(String filename) {
        if (new File(filename).length() > (1024 * 1024 * 10)) {
            return false;
        }
        return true;
    }

}
