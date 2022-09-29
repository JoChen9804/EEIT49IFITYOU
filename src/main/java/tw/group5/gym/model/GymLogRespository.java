package tw.group5.gym.model;


import java.util.List;
import java.util.Set;

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
	
	
	@Query(value = "select * from GymLog where gymno= :gym And memberid<> :member and favorite=1", nativeQuery = true)
	public Set<GymLog> findPairTwoGymLogs(@Param("gym") GymBean gymBean, @Param("member") MemberBean member);
}