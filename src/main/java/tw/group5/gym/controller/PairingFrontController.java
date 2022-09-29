package tw.group5.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.group5.admin.model.MemberBean;
import tw.group5.gym.service.PairingLogService;

@Controller
@RequestMapping("/group5")
public class PairingFrontController {
	
	@Autowired
	private PairingLogService pLogService;
	
	@GetMapping("/pairing")
	public String showPairingPage(Model m) {
		System.out.println((MemberBean)m.getAttribute("loginMember"));
		
		return "/gym/pairingFront";
	}
}
