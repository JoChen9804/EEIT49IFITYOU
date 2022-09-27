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
	
	public List<PairingLog> findAll() {
		return pLogRespository.findAll();
	}
	
	//每日配對
	public MemberBean dailyMatching() {
		//今日要配對清單
		List<MemberDetail> mdList = adminService.findByPairWilling(1);
		System.out.println("拿到清單111111111");
		List<PairingLog> pList = new ArrayList<PairingLog>();
		for(MemberDetail md: mdList) {
			PairingLog pl = new PairingLog();
			pl.setMember(md.getMember());
			pl.setPairingDate(adminService.getDate());
			pList.add(pl);
		}
		//新的清單塞到pairlog裡
		List<PairingLog> saveAll = pLogRespository.saveAll(pList);
		
		if(saveAll.isEmpty()) {
			System.out.println("fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk!");
		}
		
		System.out.println("清單insert2222222222");
		int count = saveAll.size()/2; //配對次數
		MemberBean singleMember = null;
		for(int i = 0;i<count;i++) {
			PairingLog pairOne = pLogRespository.findOnePair(adminService.getDate()); //找到1號
			List<GymLog> gLogs1 = gymLogService.findByMember(pairOne.getMember()); //1號收藏的健身房
			//在1號收藏的健身房中隨機挑選1間
			int n1= (int) Math.random()*gLogs1.size();
			GymLog gymLog = gLogs1.get(n1);
			//在該間健身房內隨機挑選1位會員(2號)
//			List<GymLog> gLogs2 = gymLogService.findByGym(gymLog.getGym());
//			int n2 = (int) Math.random()*gLogs2.size();
//			MemberBean member2 = gLogs2.get(n2).getMember();
			GymLog gLog2 = gymLogService.findPairTwoGymLogs(gymLog.getGym(), pairOne.getMember());
			PairingLog pairTwo = pLogRespository.findByMember(gLog2.getMember());
			if(pairTwo.getPairingNo()!=null) {
				singleMember=pairOne.getMember();
				break;
			}
			System.out.println("配對完");
			//將配對編號寫進資料庫
			pairOne.setPairingNo(i);
			pairTwo.setPairingNo(i);
			pLogRespository.save(pairOne);
			pLogRespository.save(pairTwo);
		}
		
		return singleMember;
	}
	
	
	
}
