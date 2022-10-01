package tw.group5.admin.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface MemberRepository extends JpaRepository<MemberBean, Integer> {
	@Modifying
	@Transactional
//	@Query("delete from Admin where Admin.id in (?1)")
	void deleteByIdIn(List<Integer> memberListInteger);
	public Optional<MemberBean> findByAccount(String memberName);
	public Optional<MemberBean> findByEmail(String memberEmail);
	
}
