package tw.group5.activity.model;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivitySignUpRepository extends JpaRepository<ActivitySignUp, Integer> {

	public Set<ActivitySignUp> findByActivity(ActivityActivity activity);
	
}
