package tw.group5.gym.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairLog;
import tw.group5.gym.service.PairDataService;


@Controller
@RequestMapping("/group5/admin/pairing")
public class PairingController {
	
	@Autowired
	public PairDataService pdService;
	
	@GetMapping("/success")
	public String processSucessLog(Model m) {
		List<PairLog> allpl = pdService.findAllPairLogs();
		m.addAttribute("allSP", allpl);
		return "/gym/pairingSuccess";
	}
	
	@GetMapping("/pairMembers")
	public String processPairMember(Model m) {
		List<PairData> allDatas = pdService.findAllPairDatas();
		m.addAttribute("all", allDatas);
		Map<String, Integer> count = pdService.countDatas(allDatas);
		System.err.println(count.get("male"));
		m.addAttribute("count", count);
		return "/gym/pairingAll";
	}
	

}
