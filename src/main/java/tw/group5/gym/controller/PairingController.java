package tw.group5.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.group5.gym.service.PairingLogService;

@Controller
@RequestMapping("/group5/admin/pairing")
public class PairingController {
	
	@Autowired
	private PairingLogService pLogService;
	
	
	

}
