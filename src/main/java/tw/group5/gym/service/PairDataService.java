package tw.group5.gym.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.admin.model.MemberBean;
import tw.group5.gym.model.DailyPairLog;
import tw.group5.gym.model.DailyPairLogRespository;
import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairDataRespository;
import tw.group5.gym.model.PairLog;
import tw.group5.gym.model.PairLogRespository;

@Service
@Transactional
public class PairDataService {

	@Autowired
	private PairDataRespository pdRespository;
	
	@Autowired
	private DailyPairLogRespository dailyplRespository;
	 
	@Autowired
	private PairLogRespository plogRespository;
	
	
	//pairData find all
	public List<PairData> findAllPairDatas(){
		return pdRespository.findAll();
	}
	
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
	
	
	//pairdata count
	public Map<String,Integer> countDatas(List<PairData> allDatas){
		Map<String, Integer> count = new HashMap<String, Integer>();
		int male=0, female=0, otherGender=0;
		int t1=0, t2=0, t3=0, t4=0, t5=0, t6=0, t7=0;
		int f0=0,f1=0, f2=0, f3=0, f4=0, f5=0, f6=0, f7=0;
		int wt1=0,wt2=0, wt3=0;
		for(PairData pd:allDatas) {
			switch (pd.getMember().getMemberDetail().getGender()) {
			case "男":
				male++;
				break;
			case "女":
				female++;
				break;
			default:
				otherGender++;
				break;
			}
			switch (pd.getWorkoutType()) {
			case 1:
				t1++;
				break;
			case 2:
				t2++;
				break;
			case 3:
				t3++;
				break;
			case 4:
				t4++;
				break;
			case 5:
				t5++;
				break;
			case 6:
				t6++;
				break;
			case 7:
				t7++;
				break;
			}
			switch (pd.getWorkoutFrequency()) {
			case 0:
				f0++;
				break;
			case 1:
				f1++;
				break;
			case 2:
				f2++;
				break;
			case 3:
				f3++;
				break;
			case 4:
				f4++;
				break;
			case 5:
				f5++;
				break;
			case 6:
				f6++;
				break;
			case 7:
				f7++;
				break;
			}
			switch (pd.getWorkoutTime()) {
			case 1:
				wt1++;
				break;
			case 2:
				wt2++;
				break;
			case 3:
				wt3++;
				break;
			}
		}
		count.put("male", male);
		count.put("female", female);
		count.put("otherGender", otherGender);
		count.put("t1",t1);
		count.put("t2",t2);
		count.put("t3",t3);
		count.put("t4",t4);
		count.put("t5",t5);
		count.put("t6",t6);
		count.put("t7",t7);
		count.put("f0",f0);
		count.put("f1",f1);
		count.put("f2",f2);
		count.put("f3",f3);
		count.put("f4",f4);
		count.put("f5",f5);
		count.put("f6",f6);
		count.put("f7",f7);
		count.put("wt1",wt1);
		count.put("wt2",wt2);
		count.put("wt3",wt3);
		return count;
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
			DailyPairLog save2 = dailyplRespository.save(new DailyPairLog(checkRepart.getPair(),pair));
			save2.setPairScore(count);
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
	
	
	//pairlog find by main or pair
	public boolean checkForExists(int mainPd, int pairPd) {
		PairLog result = plogRespository.checkForExists(mainPd, pairPd);
		if(result==null) {
			return false;
		}
		return true;
	
	}
	
	//pairlog update/save
	public PairLog savePlog(PairLog plog) {
		return plogRespository.save(plog);
	}
	
	//pairlog find all
	public List<PairLog> findAllPairLogs() {
		return plogRespository.findAll();
	}
}
