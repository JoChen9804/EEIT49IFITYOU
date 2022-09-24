package tw.group5.gym.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface GymRespository extends JpaRepository<GymBean, Integer> {
	
	public List<GymBean> findByGymName(String name);
	
	public List<GymBean> findByGymNameLikeAndGymAddressLike(String name, String address);
	
	@Query(value = "exec getgymrating @gymno=?1", nativeQuery = true)
	public GymBean updateGymRating(int gymId);
}
