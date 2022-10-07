package tw.group5.activity.model;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ActivitySignUpRepository extends JpaRepository<ActivitySignUp, Integer> {

	public Set<ActivitySignUp> findByActivity(ActivityActivity activity);
	
	@Query(value= "SELECT COUNT(signupid) FROM signup WHERE activityid= ?1", nativeQuery=true)
	public Integer countSignUpMember(Integer activityId);
}
