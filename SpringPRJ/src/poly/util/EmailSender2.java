package poly.util;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
 
 
@Component
public class EmailSender2  {
     
    @Autowired
    protected JavaMailSender mailSender2;
 
    public void SendEmail(Email2 sendEmail) throws Exception {
        MimeMessage msg = mailSender2.createMimeMessage();
        msg.setSubject(sendEmail.getSubject());
        msg.setContent(sendEmail.getContent(), "text/html; charset=UTF-8");
        msg.setRecipient(RecipientType.TO , new InternetAddress(sendEmail.getReciver()));
        
        mailSender2.send(msg);
    }
}