package sms;

import com.sun.mail.util.MailSSLSocketFactory;


import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import utility.SystemGlobals;

public class NICMailer {
    public NICMailer() {
    }
    
    // email global setting 
    
     public static final String email_MAIL_SERVER = SystemGlobals.getMail_server();
     public static final String email_USERNAME = SystemGlobals.getEmail_usernm();
     public static final String email_PASSWORD = SystemGlobals.getEmail_pwd();
     public static final int smtp_port = SystemGlobals.getSmtp_port();
     String email_Address=SystemGlobals.getEmail_address();

  

    public static String doSendMail(String mmsg, String toAddress, 
                                    String subject){
        String status = "N";
        try {
            String fromAddress = email_USERNAME;
            String message = "" + mmsg;
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            // System.setProperty("javax.net.debug", "ssl,handshake");
            Properties properties = System.getProperties();
            properties.put("mail.smtp.host", email_MAIL_SERVER);
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.ssl.enable", "true");
            // properties.put(" mail.smtp.ssl.checkserveridentity", "true");
            // properties.put("mail.debug", "true");
            //properties.put("mail.smtp.port", "465");
             properties.put("mail.smtp.port", smtp_port);
            // properties.put("javax.net.debug","ssl,handshake");
            // System.setProperty("javax.net.debug", "ssl,handshake");
            //  properties.put("mail.smtp.ssl.protocols","SSLv3 TLSv1");
            properties.put("mail.smtp.ssl.socketFactory", sf);
            //   properties.put("mail.smtp.ssl.socketFactory", "javax.net.ssl.SSLSocketFactory");
            Session session = Session.getInstance(properties);
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromAddress));
            msg.addRecipients(Message.RecipientType.TO, toAddress);
            msg.setSubject(subject);
            msg.setText(message);

            Transport tr = session.getTransport("smtp");
           // tr.connect(MAIL_SERVER, USERNAME, PASSWORD);
            tr.connect(email_MAIL_SERVER, email_USERNAME, email_PASSWORD);
            tr.sendMessage(msg, msg.getAllRecipients());
            tr.close();
            status = "Y";
        } catch (AddressException ex) {
            System.out.println("mail Address Exception :"+ex.getMessage());
            
        } catch (MessagingException ex) {
            System.out.println("mail messaging Exception :"+ex.getMessage());
            
        } catch (Exception e) {
  System.out.println("Mail Exception :"+e.getMessage());
        }
        return status;
    }

    
}
