package tw.group5.gym.model;


import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.Nullable;

public interface GymLogRespository extends JpaRepository<GymLog, Integer> {
	@Nullable
	public GymLog findByMemberIdAndGym(int memberId, GymBean gymBean);
	
	
	public Set<GymLog> findByGym(GymBean gymBean);
}