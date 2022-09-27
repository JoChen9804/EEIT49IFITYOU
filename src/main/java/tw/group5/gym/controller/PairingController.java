package tw.group5.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.group5.admin.model.MemberBean;
import tw.group5.gym.model.PairingLog;
import tw.group5.gym.service.PairingLogService;

@Controller
@RequestMapping("/group5/admin/pairing")
public class PairingController {
	
	@Autowired
	private PairingLogService pLogService;
	
	@GetMapping("/pairingMain")
	public String processAllMainAction(Model m) {
		MemberBean MatchingResult = pLogService.dailyMatching();
		if(MatchingResult==null) {
			m.addAttribute("SinglePair",MatchingResult);
		}
		List<PairingLog> pairingLogs = pLogService.findAll();
		m.addAttribute("pairingLogs",pairingLogs);
		return "gym/pairingTest";
	}
	

}
