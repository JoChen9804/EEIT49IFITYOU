package tw.group5.activity.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.activity.model.ActivityPromotions;
import tw.group5.activity.model.ActivityPromotionsRepository;
import tw.group5.activity.model.ActivityVoucher;
import tw.group5.admin.model.MemberBean;

@Service
@Transactional
public class ActivityPromotionsService {

	@Autowired
	private ActivityPromotionsRepository pRepository;
	
	/*
	 * 時間處理
	 * 回傳sql date格式字串
	 */
	public String getTime() {
		Date date = new Date(System.currentTimeMillis());
		Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date);
	}
	
	public ActivityPromotions insert(ActivityPromotions promotions) {
		return pRepository.save(promotions);
	}
	
	public void update(ActivityPromotions promotions) {
		
	}
	
	public void delete(int id) {
		pRepository.deleteById(id);
	}
	
	public Set<ActivityPromotions> findByVoucher(ActivityVoucher voucher){
		return pRepository.findByVoucher(voucher);
	}
	
	public Set<ActivityPromotions> findByMember(MemberBean member){
		return pRepository.findByMember(member);
	}
	
	public ActivityPromotions findByMemberAndVoucher(MemberBean member, ActivityVoucher voucher) {
		return pRepository.findByMemberAndVoucher(member, voucher);
	}
	
	public List<ActivityPromotions> findAll() {
		return pRepository.findAll();
	}
	
}
