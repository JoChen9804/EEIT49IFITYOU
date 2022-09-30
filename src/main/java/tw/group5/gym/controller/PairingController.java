package tw.group5.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.PairingLog;
import tw.group5.gym.service.PairingLogService;

@Controller
@RequestMapping("/group5/admin/pairing")
public class PairingController {
	
	@Autowired
	private PairingLogService pLogService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/pairingMain")
	public String processAllMainAction(Model m) {
		String MatchingResult = pLogService.dailyMatching();
		
		System.out.println("controller內的查找cccccccccccccccc"+MatchingResult);
		List<PairingLog> pairingLogs = pLogService.findAll();
		m.addAttribute("pairingLogs",pairingLogs);
		return "gym/pairingTest";
	}
	
	
	

}
