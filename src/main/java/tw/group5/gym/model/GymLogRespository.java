package tw.group5.gym.model;


import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.Nullable;

import tw.group5.admin.model.MemberBean;

public interface GymLogRespository extends JpaRepository<GymLog, Integer> {
	@Nullable
	public GymLog findByMemberAndGym(MemberBean memberBean, GymBean gymBean);
	
	public List<GymLog> findByGym(GymBean gymBean);
	
	public List<GymLog> findByMember(MemberBean member);
}