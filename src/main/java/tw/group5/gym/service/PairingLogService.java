package tw.group5.gym.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.GymBean;
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
	
	
	public PairingLog findByMemberAndToday(MemberBean member) {
		return pLogRespository.findByMemberAndPairingDate(member,adminService.getDate());
	}
	
	public PairingLog findByPairingNoAndPairingDate(int pairingNo, PairingLog userPairing) {
		List<PairingLog> result = pLogRespository.findByPairingNoAndPairingDate(pairingNo,adminService.getDate());
		PairingLog pl=null;
		System.out.println(userPairing.getId());
		System.out.println(result.size());
		for(PairingLog p:result) {
			if(p.getId()!=userPairing.getId()) {
				System.out.println(p.getId());
				pl=p;
				break;
			}
		}
		return pl;
	
	}
	
	//目前還沒用到-0929
	public PairingLog updatePairingLog(PairingLog pLog) {
		return pLogRespository.save(pLog);
	}
	
	public List<PairingLog> findAll() {
		return pLogRespository.findAll();
	}
	
	//每日配對
	public String dailyMatching() {
		//今天日期
		String today=adminService.getDate();
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
			return "今日無配對需求";
		}
		
		System.out.println("清單insert2222222222");
		int count = (saveAll.size()%2==1?(saveAll.size()/2)+1:(saveAll.size()/2)); //配對次數
		System.out.println("!!!!!!!!!配對次數"+count);	
		int i=0;
		while(true) {
			i++;
			System.out.println("開始迴圈"+i);
			PairingLog pairOne = pLogRespository.findOnePair(today); //找到1號
			if(pairOne==null) {
				//已經配完了
				break;
			}
			List<GymLog> findByMember = gymLogService.findByMember(pairOne.getMember());
			List<GymBean> gymList = new ArrayList<GymBean>();
			for(GymLog gLog: findByMember) {
				gymList.add(gLog.getGym());
				System.out.println("heyyyyyyyyyyyyyyyyyyyyyyyyyy");
			}
			
			//如果1號沒收藏東西
			if(gymList.isEmpty()) {
				pairOne.setPairingNo(0);
				pLogRespository.save(pairOne);
				count++;
				continue; //再抽下一位1號
			}
						
			//開始處理2號
			PairingLog pairTwo = null;
			int gymListSize=1;
			while(true) {	
				//隨機挑選出健身房
				GymBean gym1 = gymList.get((int) Math.random()*gymList.size()); 
				//找到會員清單
				List<MemberBean> mList = gymLogService.findPairTwoGymLogs(gym1, pairOne.getMember());
				if(gymList.size()==1) {
					if(mList.isEmpty()) {
						System.out.println("AC");
						pairOne.setPairingNo(0);
						pLogRespository.save(pairOne);
						count++;
						break; //break while
					}
					System.out.println("AD");
					pairTwo = randomMember(mList);
					break;
				}else {
					if(mList.isEmpty()) {
						System.out.println("BC");
						if(gymListSize==gymList.size()) {
							//收藏的健身房都沒有可配對的
							pairOne.setPairingNo(0);
							pLogRespository.save(pairOne);
							count++;
							break; 
						}
						System.out.println("gymListSize"+gymListSize);
						gymListSize++;
						continue; //重抽gym
					}
					System.out.println("BD");
					pairTwo = randomMember(mList);
					break;
				}
			} //這個是while結束
			
			System.out.println("配對塞進資料庫");
			//將配對編號寫進資料庫
			
			if(pairTwo!=null) { 
				pairOne.setPairingNo(i);
				pLogRespository.save(pairOne);
			}else { //2號如果找不到的話1號也是配對失敗
				pairOne.setPairingNo(0);
				pLogRespository.save(pairOne);
			}
			if(pairTwo!=null) {
				System.out.println("pairTwoooooooo"+pairTwo.getPairingNo());
				pairTwo.setPairingNo(i);
				pLogRespository.save(pairTwo);			
			}
		} //這個是for結束
		return "配對完成";
	}
	
	
	//篩選出會員清單並抽出一個會員
	public PairingLog randomMember(List<MemberBean> mList) {
		System.out.println("in the random MEMBER");
		if(mList.isEmpty()) {
			return null;
		}
		MemberBean memberBean = mList.get((int) Math.random()*mList.size()); //隨機挑選出會員
		return pLogRespository.findTwoPairByMember(memberBean,adminService.getDate());
	}
	
}
