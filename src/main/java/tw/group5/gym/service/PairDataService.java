package tw.group5.gym.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.gym.model.DailyPairLog;
import tw.group5.gym.model.DailyPairLogRespository;
import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairDataRespository;

@Service
@Transactional
public class PairDataService {

	@Autowired
	private PairDataRespository pdRespository;
	
	@Autowired
	private DailyPairLogRespository dailyplRespository;
	
	//pairData新增或修改
	public PairData savePairData(PairData pairData) {
		return pdRespository.save(pairData);
	}
	
	//where pdid=?
	public PairData findById(int id) {
		 Optional<PairData> opt = pdRespository.findById(id);
		 if(opt.isEmpty()) {
			 return null;
		 }
		 return opt.get();
	}
	
	//回傳mainData配到的人
	public PairData matching(PairData mainData){
		//找到全部的人
		List<PairData> allpd = pdRespository.findAll();
		//檢查有沒有已經被分配到的
		DailyPairLog checkRepart = dailyplRespository.findByPair(mainData);
		if(checkRepart!=null) { //之前有人被分配到main
			dailyplRespository.save(new DailyPairLog())
			return 
		}
		for(PairData pd:allpd) {
			System.out.println(pd.getMember().getId());
			if(pd.getMember().getId().equals(mainData.getMember().getId())) {
				System.out.println("同一位抓");
				pd.setMatchingScore(35);
				continue;
			}
			int gender=0;
			switch (pd.getMember().getMemberDetail().getGender()) {
			case "男":
				gender=1;
				break;
			case "女":
				gender=3;
				break;
			default:
				gender=2;
				break;
			}
			//m=3*(|Gx-Gy|)+3*(|Rx-Ry|)+2*(|Tx-Ty|)+|Fx-Fy|+|Kx-Ky|+A
			int m = 3*(Math.abs(mainData.getPairGender()-gender))
					+3*(Math.abs(mainData.getPairRelationship()-pd.getRelationship()))
					+2*(Math.abs(mainData.getWorkoutTime()-pd.getWorkoutTime()))
					+Math.abs(mainData.getWorkoutFrequency()-pd.getWorkoutFrequency())
					+Math.abs(mainData.getWorkoutType()-pd.getWorkoutType())
					+countlocation(mainData.getCurrentLocation(), pd.getCurrentLocation());
			pd.setMatchingScore(m);
		}
		
		//按分數排序
		Collections.sort(allpd, new Comparator<PairData>() {
			@Override //由小到大
			public int compare(PairData o1, PairData o2) {
				if(o1.getMatchingScore()>o2.getMatchingScore()) {
					return 1;
				}else if(o1.getMatchingScore()<o2.getMatchingScore()) {
					return -1;
				}
					return 0;
					
			}
		});
		
		//把
		for(PairData pd2: allpd) {
			System.out.println("sort:"+pd2.getPdId()+"/"+pd2.getMember().getMemberAccount()+"/"+pd2.getMatchingScore());
		}
		//交出去前把配對指數轉成百分比
		PairData result = allpd.get(0);
		result.setMatchingScore((int) (1-(result.getMatchingScore()/34))*100);
		return result;
	}
	
	public int countlocation(String mainLocation, String pdLocation) {
		String[] pdsplit = pdLocation.split("、");
		int i=0;
		for(String area: pdsplit) {
			if(mainLocation.indexOf(area)!=(-1)) {
				i++;
			}
		}
		System.out.println(i+"符合地點數");
		return i;
	}
	
	
}
