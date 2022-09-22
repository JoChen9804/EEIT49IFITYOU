package tw.group5.activity.model;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivityPromotionsRepository extends JpaRepository<ActivityPromotions, Integer> {

	public Set<AdminMember> findByVoucher(ActivityVoucher voucher);
	
	public Set<ActivityVoucher> findByMember(AdminMember member);
	
	public ActivityPromotions findByMemberAndVoucher(AdminMember member, ActivityVoucher voucher);
		
}
