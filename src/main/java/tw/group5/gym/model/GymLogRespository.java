package tw.group5.gym.model;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.Nullable;

public interface GymLogRespository extends JpaRepository<GymLog, Integer> {
	@Nullable
	public GymLog findByMemberIdAndGymId(int memberId, int gymId);
}
