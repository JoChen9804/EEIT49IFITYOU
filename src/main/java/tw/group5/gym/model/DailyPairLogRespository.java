package tw.group5.gym.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DailyPairLogRespository extends JpaRepository<DailyPairLog, Integer> {
	
	public DailyPairLog findByPair(PairData partner);
}
