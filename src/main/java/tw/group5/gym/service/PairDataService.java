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

import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairDataRespository;

@Service
@Transactional
public class PairDataService {

	@Autowired
	private PairDataRespository pdRespository;
	
	//新增或修改
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
	
	//回傳mainData配到的三個人
	public List<PairData> matching(PairData mainData){
		List<PairData> allpd = pdRespository.findAll();
		for(PairData pd:allpd) {
			if(pd.getMember().getId()==mainData.getMember().getId()) {
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
			//m=3*(|Rx-Ry|)+2*(|Tx-Ty|)+|Fx-Fy|+|Kx-Ky|
			int m = 3*(Math.abs(mainData.getPairRelationship()-pd.getRelationship()))
					+2*(Math.abs(mainData.getWorkoutTime()-pd.getWorkoutTime()))
					+Math.abs(mainData.getWorkoutFrequency()-pd.getWorkoutFrequency())
					+Math.abs(mainData.getWorkoutType()-pd.getWorkoutType());
			pd.setMatchingScore(m);
		}
		
		//按分數排序
		Collections.sort(allpd, new Comparator<PairData>() {
			@Override
			public int compare(PairData o1, PairData o2) {
				// 1是前者大於後者，-1是前者小於後者，0是維持
				if(o1.getMatchingScore()>o2.getMatchingScore()) {
					return 1;
				}else if(o1.getMatchingScore()<o2.getMatchingScore()) {
					return -1;
				}
					return 0;
					
			}
		});
		//選三個出來加進list
		List<PairData> newlist = new ArrayList<PairData>();
		int i=1;
		while(true) {
			int index = (int)Math.random()*10;
			if(allpd.get(index)!=null) {
				System.out.println("抓取次數"+i);
				newlist.add(allpd.get(index));
				i++;
			}
			if(i==4) {
				break;
			}
		}
		return newlist;
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
