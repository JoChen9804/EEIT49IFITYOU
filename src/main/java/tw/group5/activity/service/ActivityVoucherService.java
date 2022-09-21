package tw.group5.activity.service;

import java.io.File;
import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.activity.model.ActivityVoucher;
import tw.group5.activity.model.ActivityVoucherRepository;

@Service
@Transactional
public class ActivityVoucherService {
	
	@Autowired
	private ActivityVoucherRepository voucherReps;

	/*
	 * 圖片處理
	 * 上傳檔案至資料夾並回傳檔名
	 */
	public String processImg(String voucherNo, MultipartFile photoData)throws IllegalStateException, IOException {
		String fileName = voucherNo+System.currentTimeMillis()+".jpg";
		String saveFileDir = "C:/images/admin";
		File saveFilePath = new File(saveFileDir, fileName);
		photoData.transferTo(saveFilePath);
		return fileName;
	}
	
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
	 * 查詢全部資料回傳List
	 */
	public List<ActivityVoucher> findAll(){
		return voucherReps.findAll();
	}
	
}
