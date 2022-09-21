package tw.group5.activity.service;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.activity.model.ActivityPromotions;
import tw.group5.activity.model.ActivityPromotionsRepository;
import tw.group5.activity.model.ActivityVoucher;
import tw.group5.activity.model.AdminMember;

@Service
@Transactional
public class ActivityPromotionsService {

	@Autowired
	private ActivityPromotionsRepository pRepository;
	
	public ActivityPromotions insert(ActivityPromotions promotions) {
		return pRepository.save(promotions);
	}
	
	public void update(ActivityPromotions promotions) {
		
	}
	
	public void delete(ActivityPromotions promotions) {
		pRepository.delete(promotions);
	}
	
	public Set<AdminMember> findByVoucher(ActivityVoucher voucher){
		return pRepository.findByVoucher(voucher);
	}
	
	public Set<ActivityVoucher> findByMember(AdminMember member){
		return pRepository.findByMember(member);
	}
	
	public List<ActivityPromotions> finAll() {
		return pRepository.findAll();
	}
	
}
