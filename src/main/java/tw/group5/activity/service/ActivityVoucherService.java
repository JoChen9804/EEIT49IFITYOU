package tw.group5.activity.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.activity.model.ActivityVoucher;
import tw.group5.activity.model.ActivityVoucherRepository;

@Service
@Transactional
public class ActivityVoucherService {
	
	@Autowired
	private ActivityVoucherRepository voucherReps;

	/*
	 * 時間處理
	 * 回傳sql date格式字串
	 */
	public String getTime() {
		Date date = new Date(System.currentTimeMillis());
		Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date);
	}
	
	/*
	 * 新增
	 */
	public ActivityVoucher insert(ActivityVoucher voucher) {
		return voucherReps.save(voucher);
	}
	
	/*
	 * 修改
	 */
	public ActivityVoucher update(ActivityVoucher voucher) {
		return voucherReps.save(voucher);
	}
	
	/*
	 * 刪除
	 */
	public void delete(Integer vId) {
		voucherReps.deleteById(vId);
	}
	
	/*
	 * 用id查詢
	 */
	public ActivityVoucher selectById(Integer vId) {
		Optional<ActivityVoucher> optional = voucherReps.findById(vId);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	/*
	 * 用優惠券號尋找
	 */
	 public ActivityVoucher findByVoucherNo(String voucherNo) {
	  return voucherReps.findByVoucherNo(voucherNo);
	 }
	
	/*
	 * 查詢全部資料回傳List
	 */
	public List<ActivityVoucher> findAll(){
		return voucherReps.findAll();
	}
	
	/*
	 * 用優惠券號尋找
	 */
	public ActivityVoucher findByVoucherNo(String voucherNo) {
		return voucherReps.findByVoucherNo(voucherNo);
	}
	
}
