package utility;

import com.sun.mail.util.MailSSLSocketFactory;

import java.util.Properties;
    import javax.activation.DataHandler;
    import javax.activation.DataSource;
    import javax.activation.FileDataSource;
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

    public class MailAttachment {
        public MailAttachment() {
        }
        public static void main(String[] args) {
            MailAttachment nm=new MailAttachment();
            try{
            System.out.println("starting");
           // nm.sendEmailCon("test", "zephain@gmail.com");
            nm.doSendMail("I am testing body message, check Class1.java open in jdeveloper", "zephain@gmail.com","Test Mails","JHRKHDCTAX_Settlement_20140721.xml");
            //  nm.sendEmailCon("Third", "zephain@gmail.com");
            System.out.println("SUCCS");
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
           
        }
        public static String doSendMail(String mmsg, String toAddress,String subject,String filnme) throws Exception{
           String status="N";
          try {
          String fromAddress = "support.ctax-jhr@nic.in";
          String messages = ""+mmsg;
         
         MailSSLSocketFactory sf = new MailSSLSocketFactory();
          sf.setTrustAllHosts(true);
          Properties properties = System.getProperties();
          properties.put("mail.smtp.host", "mail.nic.in");
          properties.put("mail.smtp.auth", "true");
          properties.put("mail.smtp.ssl.enable","true");
        
          properties.put("mail.smtp.port", "465");
          properties.put("mail.smtp.ssl.socketFactory", sf);
          Session session = Session.getInstance(properties);
          MimeMessage msg = new MimeMessage(session);

          msg.setFrom(new InternetAddress(fromAddress));
          msg.addRecipients(Message.RecipientType.TO, toAddress);
          msg.setSubject(subject);
          msg.setText(messages);


              Message message = new MimeMessage(session);

              // Set From: header field of the header.
              message.setFrom(new InternetAddress(fromAddress));

              // Set To: header field of the header.
              message.setRecipients(Message.RecipientType.TO,
                 InternetAddress.parse(toAddress));

              // Set Subject: header field
              message.setSubject(subject);

              BodyPart messageBodyPart = new MimeBodyPart();

              // Now set the actual message
              messageBodyPart.setText(messages);
              Multipart multipart = new MimeMultipart();

                 // Set text message part
                 multipart.addBodyPart(messageBodyPart);

                 // Part two is attachment
                 messageBodyPart = new MimeBodyPart();
                 //String filename = "C:/JHRKHDCTAX_Settlement_20140721.xml";
                  String filename = "C:/"+filnme;
                  System.out.println(filename);
                 DataSource source = new FileDataSource(filename);
                 messageBodyPart.setDataHandler(new DataHandler(source));
                 //messageBodyPart.setFileName("JHRKHDCTAX_Settlement_20140721.xml");
                 messageBodyPart.setFileName(filnme);
                 multipart.addBodyPart(messageBodyPart);
              
                 // Send the complete message parts
                 message.setContent(multipart);



          Transport tr = session.getTransport("smtp");
          tr.connect("mail.nic.in", "support.ctax-jhr@nic.in", "Vz#$5d9*pnK");
          tr.sendMessage(message, message.getAllRecipients());
          tr.close();
          status="Y";
          } catch (AddressException ex) {
          System.out.println(ex.getMessage());
          throw new Exception("Address not Valid");
          } catch (MessagingException ex) {
          System.out.println(ex.getMessage());
              throw new Exception("Mail sending fail "+ex.getMessage());
          }catch(Exception e){
              throw new Exception("Mail sending fail "+e.getMessage());
          }
          return status;
          }
    }




