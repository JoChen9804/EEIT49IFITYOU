package tw.group5.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberRepository;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.DailyPairLog;
import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairingLog;
import tw.group5.gym.service.PairDataService;
import tw.group5.gym.service.PairingLogService;

@Controller
@RequestMapping("/group5/user/pairing")
public class PairingFrontController {
	
	@Autowired
	private PairingLogService pLogService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private PairDataService pDataService;
	
	
	@GetMapping("/want2pair")
	public String processPrePair() {
		return "gym/pairingFront01";
	}
	
	@PostMapping("/save1")
	@ResponseBody
	public PairData processFitFilter(@RequestBody PairData pData) {
		System.out.println(pData.getMemberId());
		MemberBean member = adminService.selectOneMember(pData.getMemberId());
		member.getMemberDetail().setPairContactInfo(pData.getConnection());
		member.getMemberDetail().setPairInfo(pData.getToPartner());
		MemberBean insert = adminService.insert(member);
		pData.setMember(insert);
		return pDataService.savePairData(pData);
	}
	
	@PostMapping("/whofitme")
	public String processFitFilter(int pdid,Model m) {
		m.addAttribute("pdid", pdid);
		return "gym/pairingFront02";
	}
	
	@PostMapping("/save2")
	@ResponseBody
	public PairData processFitFilter2(@RequestBody PairData pData) {
		int pdId = pData.getPdId();
		PairData result = pDataService.findById(pdId);
		result.setPairGender(pData.getPairGender());
		result.setPairRelationship(pData.getPairRelationship());
		return pDataService.savePairData(result);
	}
	
	@PostMapping("/start2pair")
	public String processMatching(int mainPid,Model m) {
		PairData mainPD = pDataService.findById(mainPid);
		PairData matching = pDataService.matching(mainPD);
		if(matching==null) {
			return "gym/pairingFront04";
		}
		m.addAttribute("matching", matching);
		m.addAttribute("mainPD", mainPD);
		return "gym/pairingFront03";
	}
	
	@PostMapping("/pairmove")
	@ResponseBody
	public String processPairMoveAction(int main,int partner,String ans2pair) {
		DailyPairLog result = pDataService.findByMainDataAndPair(main, partner);
		if(ans2pair.equals("yes")) {
			result.setResult(1);
			pDataService.updateDailyPairLog(result);
			//確認對方有沒有先同意了
			DailyPairLog result2 = pDataService.findByMainDataAndPair(partner, main);
			if(result2==null) {
				return "wait"; //對方還沒回應
			}else if(result2.getResult()==1) {
				return "show"; //對方同意
			}else{
				return "end"; //對方不要
			}
		}
		result.setResult(0); //我說不要
		pDataService.updateDailyPairLog(result);
		return "end";
	}
	
	@GetMapping("/pairedit")
	public String processEditPairData() {
		return "gym/pairingFrontEdit";
	}
	
}
