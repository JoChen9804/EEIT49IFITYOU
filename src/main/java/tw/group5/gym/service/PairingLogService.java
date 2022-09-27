package tw.group5.gym.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.model.PairingLog;
import tw.group5.gym.model.PairingLogRespository;

@Service
@Transactional
public class PairingLogService {
	
	@Autowired
	private PairingLogRespository pLogRespository;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private GymLogService gymLogService;
	
	
	public PairingLog findByMember(MemberBean member) {
		return pLogRespository.findByMember(member);
	}
	
	public PairingLog updatePairingLog(PairingLog pLog) {
		return pLogRespository.save(pLog);
	}
	
	public void dailyMatching() {
		List<MemberDetail> mdList = adminService.findByPairWilling(1);
		List<PairingLog> pList = new ArrayList<PairingLog>();
		for(MemberDetail md: mdList) {
			PairingLog pl = new PairingLog();
			pl.setMember(md.getMember());
			pl.setPairingDate(adminService.getDate());
			pList.add(pl);
		}
		List<PairingLog> saveAll = pLogRespository.saveAll(pList);
		int count = saveAll.size()/2;
		for(int i = 0;i<(count/2);i++) {
			PairingLog pairOne = pLogRespository.findOnePair(adminService.getDate());
			List<GymLog> gLogs1 = gymLogService.findByMember(pairOne.getMember());
			int n1= (int) Math.random()*gLogs1.size();
			GymLog gymLog = gLogs1.get(n1);
			List<GymLog> gLogs2 = gymLogService.findByGym(gymLog.getGym());
			int n2 = (int) Math.random()*gLogs2.size();
			MemberBean member2 = gLogs2.get(n2).getMember();
			PairingLog pairTwo = pLogRespository.findByMember(member2);
			pairOne.setPairingNo(i);
			pairTwo.setPairingNo(i);
			pLogRespository.save(pairOne);
			pLogRespository.save(pairTwo);
		}
	}
	
	
}
