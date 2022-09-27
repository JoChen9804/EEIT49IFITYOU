package tw.group5.admin.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberDetailRepository extends JpaRepository<MemberDetail, Integer>{
	
	public List<MemberDetail> findByPairWilling(Integer pairWilling);
	
}
