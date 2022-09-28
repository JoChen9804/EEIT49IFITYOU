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
	
	
//	public PairingLog findByMember(MemberBean member) {
//		return pLogRespository.findByMember(member);
//	}
	
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
			List<GymBean> gymList = new List<GymBean>();
			for(GymLog glog:gymLogService.findByMember(md.getMember())) {
				gymList.add(glog.getGym());
			}
			pl.setGymList(gymList);
			pl.setPairingDate(adminService.getDate());
			pList.add(pl);
		}
		//新的清單塞到pairlog裡
		List<PairingLog> saveAll = pLogRespository.saveAll(pList);
		
		if(saveAll.isEmpty()) {
			System.out.println("fuckkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk!");
			return "今日無配對需求";
		}else {
			System.out.println("清單insert2222222222");
			int count = saveAll.size()/2; //配對次數
			
			MemberBean singleMember = null;
			for(int i = 1;i<=count;i++) {
				System.out.println("開始迴圈"+i);
				PairingLog pairOne = pLogRespository.findOnePair(today); //找到1號
				List<GymBean> gymList = pairOne.getGymList(); //1號收藏的健身房
				PairingLog pairTwo = null;
				if(gymList==null) {
					//1號沒有收藏任何健身房，0代表沒有配對
					pairOne.setPairingNo(0);
					//抽下一位
					continue;
				}else {
					//在1號收藏的健身房中隨機挑選1間
					GymBean gym1=gymList.get((int) Math.random()*gymList.size());
					//在該間健身房內隨機挑選1位會員(2號)>找到2號的gymlog
					GymLog gLog2=gymLogService.findPairTwoGymLogs(gym1, pairOne.getMember());
					//判斷這間健身房是不是只有1號收
					if(gLog2==null) {
						//這間健身房只有1號收
						pairOne.setPairingNo(0);
					}else{
						//這間健身房不只有1號收(1號只收1間健身房)或是當1號收不只1間健身房時
						while(true) {
							//透過2號gymlog找到member2
							MemberBean member2 = gLog2.getMember();
							if(member2.getMemberDetail().getPairWilling()==1) {
								//確認配對意願為true
								//member2在pairlog中的位置>>找到pairTwo
								pairTwo = pLogRespository.findTwoPairByMember(member2,today);
								if(i==--count && pairTwo.getPairingNo()!=null) {
									System.out.println("breakontwo"+i);
									singleMember=pairOne.getMember();
								}
								break;
							}else {
								//確認配對意願為false，重抽新的2號gymlog
								gLog2=gymLogService.findPairTwoGymLogs(gym1, pairOne.getMember());
								//確認新的和舊的是不同人
								if(gLog2.getMember()==member2) {
									break;
								}
							}
						}
						//while迴圈結束
					}
				}
				System.out.println("配對完!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				//將配對編號寫進資料庫
				pairOne.setPairingNo(i);
				pairTwo.setPairingNo(i);
				pLogRespository.save(pairOne);
				pLogRespository.save(pairTwo);
				System.out.println("!!!!!!!!!!!!!塞完資料"+i);
			}
			System.out.println("要跳出方法了");
			return singleMember;
//		}
//		return null;
	}
	
	
}
