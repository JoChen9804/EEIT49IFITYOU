package tw.group5.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberRepository;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.DailyPairLog;
import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairLog;
import tw.group5.gym.service.PairDataService;

@Controller
@RequestMapping("/group5/user/pairing")
public class PairingFrontController {
	
	
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
	public String processMatching(Integer mainPid,Model m) {
		if(mainPid==null) {
			return "redirect:/group5/user/pairing/want2pair";
		}
		PairData mainPD = pDataService.findById(mainPid);
		// 因為今天已經配過對過了，要加個attribute讓jsp知道要顯示配對進度
		DailyPairLog alreadyPairOrNot = pDataService.alreadyPairOrNot(mainPD);
		if(alreadyPairOrNot!=null) {
			alreadyPairOrNot.getPair().setMatchingScore(alreadyPairOrNot.getPairScore());
			m.addAttribute("matching", alreadyPairOrNot.getPair());
			m.addAttribute("already",alreadyPairOrNot.getResult());
		}else {
			PairData matching = pDataService.matching(mainPD);
			m.addAttribute("matching", matching);
		}
		m.addAttribute("mainPD", mainPD);
		return "gym/pairingFront03";
	}
	
	@PostMapping("/pairmove")
	@ResponseBody
	public String processPairMoveAction(int main,int partner,String ans2pair) {
		System.out.println("main"+main+"partner"+partner);
		DailyPairLog result = pDataService.findByMainDataAndPair(main, partner);
		if(ans2pair.equals("yes")) {
			result.setResult(1);
			pDataService.updateDailyPairLog(result);
			//確認對方有沒有先同意了
			DailyPairLog result2 = pDataService.findByMainDataAndPair(partner, main);
			if(result2==null||result2.getResult()==null) {
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
	
	
	@PostMapping("/querydata")
	@ResponseBody
	public PairData processQueryData(@RequestParam("memberid") Integer memberId) {
		System.out.println(memberId);
		MemberBean member = adminService.selectOneMember(memberId);
		return pDataService.findByMember(member);
	}
	
	@PostMapping("/update1")
	@ResponseBody
	public PairData processPairDataUpdate(@RequestBody PairData pData) {
		MemberBean member = adminService.selectOneMember(pData.getMemberId());
		member.getMemberDetail().setPairContactInfo(pData.getConnection());
		member.getMemberDetail().setPairInfo(pData.getToPartner());
		MemberBean update = adminService.updateOne(member);
		pData.setMember(update);
		return pDataService.savePairData(pData);
	}
	
	@PostMapping("/memberfind")
	@ResponseBody
	public PairData processFindPData(@RequestBody MemberBean memberBean) {
		return pDataService.findByMember(memberBean);
	}
	
	@PostMapping("save2pairlog")
	@ResponseBody
	public PairLog processSavePairLog(@RequestBody PairLog plog) {
		if(!pDataService.checkForExists(plog.getMainPd().getPdId(), plog.getPairPd().getPdId())) {
			//true表示存在，false表示不存在要insert
			return pDataService.savePlog(plog);
		}
		return null;
	}
	
}
