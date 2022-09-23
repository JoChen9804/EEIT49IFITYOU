package tw.group5.activity.model;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.group5.admin.model.MemberBean;

public interface ActivityPromotionsRepository extends JpaRepository<ActivityPromotions, Integer> {

	public Set<MemberBean> findByVoucher(ActivityVoucher voucher);
	
	public Set<ActivityVoucher> findByMember(MemberBean member);
	
	public ActivityPromotions findByMemberAndVoucher(MemberBean member, ActivityVoucher voucher);
		
}
