package tw.group5.gym.service;

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
			//m=3*(|Gx-Gy|)+3*(|Rx-Ry|)+2*(|Tx-Ty|)+|Fx-Fy|+|Kx-Ky|+A
			int m = 3*(Math.abs(mainData.getPairGender()-gender))
					+3*(Math.abs(mainData.getPairRelationship()-pd.getRelationship()))
					+2*(Math.abs(mainData.getWorkoutTime()-pd.getWorkoutTime()))
					+Math.abs(mainData.getWorkoutFrequency()-pd.getWorkoutFrequency())
					+Math.abs(mainData.getWorkoutType()-pd.getWorkoutType())
					+countlocation(mainData.getCurrentLocation(), pd.getCurrentLocation());
			
		}
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
