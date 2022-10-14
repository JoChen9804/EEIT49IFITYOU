package tw.group5.menu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.group5.gym.model.GymBean;

public interface MenuDataRespository extends JpaRepository<MenuDatabean, Integer> {
	
	@Query(value = "select * from menuIMGData where part =?;",nativeQuery = true)
	public List<MenuDatabean> findByPart(String part);
	
	@Query(value = "select * from menuIMGData where part ='leg';",nativeQuery = true)
	public List<MenuDatabean> find1();
	
	@Query(value = "select * from menuIMGData where part ='core';",nativeQuery = true)
	public List<MenuDatabean> find2();
	
	public List<MenuDatabean> findByExercisename(String exerciseName);
	
	

	
	

}
