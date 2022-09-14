package tw.group5.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.model.ActivityVoucher;
import tw.group5.model.ActivityVoucherRepository;

@Service
@Transactional
public class ActivityVoucherService {
	
	@Autowired
	private ActivityVoucherRepository voucherReps;

	public String processImg(int voucherId, MultipartFile photoData)throws IllegalStateException, IOException {
		String fileName = voucherId+System.currentTimeMillis()+".jpg";
		String saveFileDir = "C:/images/admin";
		File saveFilePath = new File(saveFileDir, fileName);
		photoData.transferTo(saveFilePath);
		return fileName;
	}
	
	public ActivityVoucher insert(ActivityVoucher voucher) {
		return voucherReps.save(voucher);
	}
	
	public ActivityVoucher update(ActivityVoucher voucher) {
		return voucherReps.save(voucher);
	}
	
	public void delete(Integer vId) {
		voucherReps.deleteById(vId);
	}
	
	public ActivityVoucher selectById(Integer vId) {
		Optional<ActivityVoucher> optional = voucherReps.findById(vId);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public List<ActivityVoucher> findAll(){
		return voucherReps.findAll();
	}
	
}
