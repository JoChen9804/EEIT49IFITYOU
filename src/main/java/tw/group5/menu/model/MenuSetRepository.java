package tw.group5.menu.model;


import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.group5.admin.model.MemberBean;

public interface MenuSetRepository extends JpaRepository<MenuSetbean, Integer> {
	
	public Set<MemberBean> findByMenuName(MenuSetbean menuset);
	
	public Set<MenuSetbean> findByUserAccount(MemberBean member);
	
	

	
	
	
	
	


}
