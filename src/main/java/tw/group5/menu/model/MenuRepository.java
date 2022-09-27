package tw.group5.menu.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MenuRepository extends JpaRepository<Menubean, Integer> {
	
	public List<Menubean> findByExrAccount(String exrAccount);
	
	public List<Menubean> findBymenuTitle(String menuTitle);
	
	@Query(value = "SELECT　DISTINCT menutitle FROM menu where exrAccount = ?;",nativeQuery = true)
	public List<Menubean> Distinctmenu(@Param("exrAccount") String exrAccount);
	
	
	

}
