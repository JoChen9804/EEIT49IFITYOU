package tw.group5.gym.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.model.GymLogRespository;
import tw.group5.gym.model.GymRespository;


@Service
@Transactional
public class GymService{
	
	@Autowired
	private GymRespository gymRespository;

	//新增，屬性id須為空
	public GymBean add(GymBean gymBean) {
		return gymRespository.save(gymBean);
	}

	//更新，屬性id需不可為空
	public GymBean update(GymBean gymBean) {
		return gymRespository.save(gymBean);
	}
	
	//deleteById若id為null會拋出exception，id不存在會拋出org.springframework.dao.EmptyResultDataAccessException
	//delete
	public String delete(GymBean gym) {
		try {
			gymRespository.delete(gym);
			return "刪除成功";
		} catch (Exception e) {
			return "刪除失敗";
		}
	}

	//find
	public List<GymBean> findGyms(GymBean gymBean) {
		if(gymBean.getGymName()==null) {
			gymBean.setGymName("");
		}
		if(gymBean.getGymAddress()==null) {
			gymBean.setGymAddress("");
		}
		return gymRespository.findByGymNameLikeAndGymAddressLike("%"+gymBean.getGymName()+"%","%"+gymBean.getGymAddress()+"%");
	}
	
	public GymBean queryName(String name) {
		if(name==null) {
			return null;
		}
		List<GymBean> single = gymRespository.findByGymName(name);
		if (single.isEmpty()) {
			return null;
		}
		return single.get(0);
	}
	
	//update average rating
	public GymBean updateGymRating(int gymId) {
		return gymRespository.updateGymRating(gymId);
	}
	
	public GymBean findById(Integer gymId) {
		 Optional<GymBean> result = gymRespository.findById(gymId);
		 if (result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	
	//圖片處理>>上傳檔案至資料夾並回傳檔名
	public String processImg(int gymId, MultipartFile photoData)throws IllegalStateException, IOException {
		String fileName = "gym-"+gymId+".jpg";
		String saveFileDir = "./src/main/webapp/WEB-INF/resources/images/"+fileName;
		File saveFilePath = new File(saveFileDir);
		photoData.transferTo(saveFilePath.getAbsoluteFile());
		return fileName;
	}
	
}