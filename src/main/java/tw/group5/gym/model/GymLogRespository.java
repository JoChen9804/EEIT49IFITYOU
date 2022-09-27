package tw.group5.gym.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.lang.Nullable;

import tw.group5.admin.model.MemberBean;

public interface GymLogRespository extends JpaRepository<GymLog, Integer> {
	@Nullable
	public GymLog findByMemberAndGym(MemberBean memberBean, GymBean gymBean);
	
	public List<GymLog> findByGym(GymBean gymBean);
	
	public List<GymLog> findByMember(MemberBean member);
	
	@Query(value = "select top 1 * from GymLog where Gym= :gym And Member<> :member order by newid()", nativeQuery = true)
	public GymLog findPairTwoGymLogs(@Param("gym") GymBean gymBean, @Param("member") MemberBean member);
}