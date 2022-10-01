package tw.group5.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmailController {
	@Autowired
    private JavaMailSender javaMailSender;
	
	@GetMapping("/email")
	public String sendMail() {
		 SimpleMailMessage message = new SimpleMailMessage();
	        message.setFrom("eeit49group5@gmail.com");
	        message.setTo("ke62lly@gmail.com");
	        message.setSubject("測試信");
	        message.setText("測試測試測試");
	        System.out.println("目標信箱："+"ke62lly@gmail.com");
	        javaMailSender.send(message);
		return "mail";
	}
}
