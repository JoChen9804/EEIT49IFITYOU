package tw.group5.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.group5.admin.service.MailService;
import tw.group5.admin.service.TemplateServices;

@RestController
public class EmailController {
	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private TemplateServices templateService;

	@Autowired
	private MailService mailService;
	//普通文字信件
	@GetMapping("/email")
	public String sendMail() {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("eeit49group5@gmail.com");
		message.setTo("ke62lly@gmail.com");
		message.setSubject("測試信");
		message.setText("測試測試測試");
		System.out.println("目標信箱：" + "ke62lly@gmail.com");
		javaMailSender.send(message);
		return "mail";
	}
	
	@GetMapping("/email2")	
	public String sendMail2() {
		String fromEmail = "eeit49group5@gmail.com";
		List<String> toEmail = new ArrayList<>();
		toEmail.add("ke62lly@gmail.com"); //不要一直寄給我喔~~
		String subject = "模板測試信";
		Map<String, String> params = new HashMap<>();
		params.put("name", "阿洵");
		String html = templateService.render("AdminMailtemplete", params);
		mailService.mimeMail(fromEmail, toEmail, subject, html);

		return "email";
	}
}
