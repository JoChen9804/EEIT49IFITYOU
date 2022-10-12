package tw.group5.activity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ActivityActivityRepository extends JpaRepository<ActivityActivity, Integer> {

	@Query(value = "select top 3 * from activity order by totalsignup desc;", nativeQuery = true)
	public List<ActivityActivity> selectImgToShow();
	
	@Query(value = "select * from activity order by starttime asc;", nativeQuery = true)
	public List<ActivityActivity> orderByDate();
	
	@Query(value = "select count(activityid) from activity where startTime like ?", nativeQuery = true)
	public Integer countMonthActivity(String month);
	
}
