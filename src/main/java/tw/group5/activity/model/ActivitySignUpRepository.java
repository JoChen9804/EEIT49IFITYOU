package tw.group5.activity.model;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ActivitySignUpRepository extends JpaRepository<ActivitySignUp, Integer> {

	public Set<ActivitySignUp> findByActivity(ActivityActivity activity);
	
	public List<ActivitySignUp> findByMemberId(int memberId);
	
	@Query(value= "SELECT COUNT(signupid) FROM signup WHERE activityid= ?1", nativeQuery=true)
	public Integer countSignUpMember(Integer activityId);
}
