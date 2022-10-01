package tw.group5.gym.service;


import java.util.ArrayList;
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
import tw.group5.gym.model.GymLogCount;

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
	public List<MemberBean> findPairTwoGymLogs(GymBean gym, MemberBean member){
		Set<GymLog> gymLogsRaw = gymLogRespository.findPairTwoGymLogs(gym,member);
		List<MemberBean> result = new ArrayList<MemberBean>();
		for(GymLog glog:gymLogsRaw) {
			if(glog.getMember().getMemberDetail().getPairWilling()==1) {
				result.add(glog.getMember());
			}
		}
		return result;
	}
	
	//where favorite=1 and gymNo=?
	public GymLogCount countGymLog(GymBean gym) {
		List<GymLog> result = gymLogRespository.findByFavoriteAndGym(1, gym);
		int male=0;
		int female=0;
		for(GymLog gl: result) {
			if(gl.getMember().getMemberDetail().getGender()=="男") {
				male++;
			}else if(gl.getMember().getMemberDetail().getGender()=="女"){
				female++;
			}
		}
		return new GymLogCount(result.size(),male,female);

	}
}
