package tw.group5.menu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MenuDeatilRepository extends JpaRepository<MenuDetailbean, Integer> {
	
	@Query(value = "select * from menuDetail where setid =?;",nativeQuery = true)
	public List<MenuDetailbean> findBySetid(Integer setid);
	
	

	

}
