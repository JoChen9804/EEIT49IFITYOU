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

import tw.group5.activity.model.ActivityActivity;
import tw.group5.activity.model.ActivityActivityRepository;

@Service
@Transactional
public class ActivityActivityService {

	@Autowired
	private ActivityActivityRepository aaRepository;
	
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
	public ActivityActivity insert(ActivityActivity aa) {
		return aaRepository.save(aa);
	}
	
	/*
	 * 修改
	 */
	public ActivityActivity update(ActivityActivity aa) {
		return aaRepository.save(aa);
	}
	
	/*
	 * 刪除
	 */
	public void delete(Integer id) {
		aaRepository.deleteById(id);
	}
	
	/*
	 * 查詢
	 */
	public ActivityActivity selectById(Integer id) {
		Optional<ActivityActivity> op = aaRepository.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	/*
	 * 查詢全部
	 */
	public List<ActivityActivity> findAll() {
		return aaRepository.findAll();
	}
	
	/*
	 * 抓前三多報名人數活動
	 */
	public List<ActivityActivity> selectImgToShow() {
		return aaRepository.selectImgToShow();
	} 
	
}
