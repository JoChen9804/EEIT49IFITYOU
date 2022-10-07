package tw.group5.gym.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DailyPairLogRespository extends JpaRepository<DailyPairLog, Integer> {
	
	public DailyPairLog findByPair(PairData partner);

	public List<PairData> findByMainData(PairData main);
	
	public DailyPairLog findByMainDataAndPair(PairData maindata, PairData partner);
	
}
