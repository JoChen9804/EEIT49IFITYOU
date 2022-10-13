package tw.group5.gym.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PairLogRespository extends JpaRepository<PairLog, Integer> {

	
	@Query(value = "select * from pairlog where (mainPId=?1 and pairId=?2) or (mainPId=?2 and pairId=?1)", nativeQuery = true)
	public PairLog checkForExists(int mainPdId, int pairPdId);
	
}
