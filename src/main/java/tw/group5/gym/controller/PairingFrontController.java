package tw.group5.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberRepository;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.PairingLog;
import tw.group5.gym.service.PairingLogService;

@Controller
@RequestMapping("/group5")
//@SessionAttributes(names = {"uPair"})
public class PairingFrontController {
	
	@Autowired
	private PairingLogService pLogService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberRepository mRepository;
	
	
	@GetMapping("/pairing")
	public String showPairingPage(Model m) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println("catcha!"+username);
		//找到使用者id
		MemberBean user = adminService.findByAccountMember(username);
		System.out.println(user.getMemberName());
//		m.addAttribute("currentUser", user);
		
		//找今日配對編號userPairingLog.getPairingNo();
		PairingLog userPairingLog = pLogService.findByMemberAndToday(user);
		
		//確認有沒有真的配到對（配對編號=0時，表示沒有配到對）
		Integer pairingNo = userPairingLog.getPairingNo();
		if(pairingNo!=0) {
			//找到對方
			PairingLog uPairLog = pLogService.findByPairingNoAndPairingDate(pairingNo,userPairingLog);
			System.out.println("uuuuuuuuuuur"+uPairLog.getId());
			MemberBean uPair = uPairLog.getMember();
			System.out.println(uPair.getMemberName());
			m.addAttribute("uPair", uPair);
		}else {
			m.addAttribute("singleOne", "今日無配對健友");
		}
		
		return "/gym/pairingFront";
	}
}
