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

import tw.group5.admin.model.MemberBean;
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
	
	//where memberid=?
	public PairData findByMember(MemberBean member) {
		return pdRespository.findByMember(member);
	}
	
	//檢查今日是否配對過
	public DailyPairLog alreadyPairOrNot(PairData mainData) {
		//找自己的"配對"資料
		DailyPairLog checkSelfRepart = dailyplRespository.findByMainData(mainData);
		if(checkSelfRepart!=null) {
			return checkSelfRepart;
		}
		return null;
	}
	
	
	//回傳mainData配到的人+寫入dailypairlog
	public PairData matching(PairData mainData){
		//找到全部的人
		List<PairData> allpd = pdRespository.findAll();
		//找自己的"被配對"資料
		DailyPairLog checkRepart = dailyplRespository.findByPair(mainData);
		
		//檢查有沒有已經被分配到的
		if(checkRepart!=null) { //之前有人被分配到main
			PairData pair = checkRepart.getMainData();
			int ms = matchingScore(mainData,pair);
			double percent=(double)ms/(double)34;
			double a =1.0-percent;
			int count=(int) (a*100);
			pair.setMatchingScore(count);
			//新增一筆紀錄在dailylog
			dailyplRespository.save(new DailyPairLog(checkRepart.getPair(),pair));
			//回傳之前配到main的那位
			return pair;
		}
		for(PairData pd:allpd) {
			System.out.println(pd.getMember().getId());
			if(pd.getMember().getId().equals(mainData.getMember().getId())) {
				System.out.println("同一位抓");
				pd.setMatchingScore(35);
				continue;
			}
			System.out.println("給");
			//m=3*(|Gx-Gy|)+3*(|Rx-Ry|)+2*(|Tx-Ty|)+|Fx-Fy|+|Kx-Ky|+A
			int m = matchingScore(mainData,pd);
			pd.setMatchingScore(m);
		}
		//按分數排序
		Collections.sort(allpd, new Comparator<PairData>() {
			@Override //由小到大
			public int compare(PairData o1, PairData o2) {
				if(o2.getMatchingScore()==null ||o1.getMatchingScore()==null) {
					return 0;
				}else if(o1.getMatchingScore()>o2.getMatchingScore()) {
					return 1;
				}else if(o1.getMatchingScore()<o2.getMatchingScore()) {
					return -1;
				}
					return 0;
					
			}
		});
		
		//檢查順序
		for(PairData pd2: allpd) {
			System.out.println("sort:"+pd2.getPdId()+"/"+pd2.getMember().getMemberAccount()+"/"+pd2.getMatchingScore());
		}
		//寫入dailylog
		PairData result = new PairData();
		DailyPairLog save= new DailyPairLog();
		for(int j=0;j<allpd.size();j++) {
			if(dailyplRespository.findByPair(allpd.get(j))==null) {
				save= dailyplRespository.save(new DailyPairLog(mainData,allpd.get(j)));
				result = allpd.get(j);
				break;
			}
		}
		//交出去前把配對指數轉成百分比
		double percent=(double)result.getMatchingScore()/(double)34;
		double a =1.0-percent;
		int count=(int) (a*100);
		result.setMatchingScore(count);
		save.setPairScore(count);
		return result;
	}
	
	//算配對指數 //m=3*(|Gx-Gy|)+3*(|Rx-Ry|)+2*(|Tx-Ty|)+|Fx-Fy|+|Kx-Ky|+A
	public int matchingScore(PairData x,PairData y) {
		int gender=0;
		switch (y.getMember().getMemberDetail().getGender()) {
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
		int m=3*(Math.abs(x.getPairGender()-gender))
			+3*(Math.abs(x.getPairRelationship()-y.getRelationship()))
			+2*(Math.abs(x.getWorkoutTime()-y.getWorkoutTime()))
			+Math.abs(x.getWorkoutFrequency()-y.getWorkoutFrequency())
			+Math.abs(x.getWorkoutType()-y.getWorkoutType())
			+countlocation(x.getCurrentLocation(), y.getCurrentLocation());
		return m;
	}
	
	//算LOCATION
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
	
	//dailyPairLog where maindata=? and pairdata=?
	public DailyPairLog findByMainDataAndPair(int mainId, int partnerId) {
		PairData maindata = this.findById(mainId);
		PairData partner = this.findById(partnerId);
		return dailyplRespository.findByMainDataAndPair(maindata, partner);
	}
	
	//dailyPairLog update/save
	public DailyPairLog updateDailyPairLog(DailyPairLog dpl) {
		return dailyplRespository.save(dpl);
	}
}
