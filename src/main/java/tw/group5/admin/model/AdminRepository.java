package tw.group5.admin.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

public interface AdminRepository extends JpaRepository<AdminBean, Integer> {

	@Modifying
	@Transactional
//	@Query("delete from Admin where Admin.id in (?1)")
	void deleteByIdIn(List<Integer> memberListInteger);
	

//	@Query("select * from Admin where admin_name =")
//	public AdminBean findByAccountAndPassword(String adminName, String adminPwd);


	public Optional<AdminBean> findByAccount(String adminName);
	
	
}
