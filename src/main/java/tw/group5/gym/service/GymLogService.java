package tw.group5.gym.service;


import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.admin.model.MemberBean;
import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.model.GymLogRespository;

@Service
@Transactional
public class GymLogService {
	
	@Autowired
	private GymLogRespository gymLogRespository;
	
	//新增收藏或評分
	public GymLog addGymLog(GymLog gLog) {
		return gymLogRespository.save(gLog);
	}
	
	//修改收藏狀態或評分
	public GymLog updateGymLog(GymLog gLog) {
		return gymLogRespository.save(gLog);
	}
	
	//where gymId=? and memberId=?
	public GymLog findByMemberAndGym(MemberBean member, GymBean gym){
		return gymLogRespository.findByMemberAndGym(member, gym);
	}
	
	public GymLog findById(int logId) {
		 Optional<GymLog> result = gymLogRespository.findById(logId);
		 if(result.isPresent()) {
			 return result.get();
		 }
		 return null;
	}
	
	//where gymNo=? 
	public List<GymLog> findByGym(GymBean gym){
		return gymLogRespository.findByGym(gym);
	}
	
	//刪除log
	public void deletelog(GymLog gLog) {
		gymLogRespository.delete(gLog);
	}
	
	//where memberId=? 
	public List<GymLog> findByMember(MemberBean member){
		return gymLogRespository.findByMember(member);
	}
	
	//where gymNo=? and memberId<>?
	public GymLog findPairTwoGymLogs(GymBean gym, MemberBean member){
		return gymLogRespository.findPairTwoGymLogs(gym,member);
	}
	
}
