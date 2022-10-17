package tw.group5.admin.service;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {

    @Autowired
    private JavaMailSender mailSender;
    
    public void mimeMail(String fromEmail, List<String> toList, String subject, String html) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message);
            messageHelper.setFrom(fromEmail);
            for (String to : toList) {
                messageHelper.addTo(to);
            }
            messageHelper.setSubject(subject);
            messageHelper.setText(html, true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public void registerMimeMail(String fromEmail, List<String> toList, String subject, String html) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message);
            messageHelper.setFrom(fromEmail);
            for (String to : toList) {
                messageHelper.addTo(to);
            }
            messageHelper.setSubject(subject);
            messageHelper.setText(html, true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public void pairMimeMail(String fromEmail, List<String> toList, String subject, String html) {
    	try {
    		MimeMessage message = mailSender.createMimeMessage();
    		MimeMessageHelper messageHelper = new MimeMessageHelper(message);
    		messageHelper.setFrom(fromEmail);
    		for (String to : toList) {
    			messageHelper.addTo(to);
    		}
    		messageHelper.setSubject(subject);
    		messageHelper.setText(html, true);
    		mailSender.send(message);
    	} catch (MessagingException e) {
    		e.printStackTrace();
    	}
    }
}
