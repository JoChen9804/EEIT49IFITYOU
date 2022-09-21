package tw.group5.gym.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymRespository;


@Service
@Transactional
public class GymService{
	
	@Autowired
	private GymRespository gymRespository;

	//屬性id須為空
	public GymBean add(GymBean gymBean) {
		gymBean.setAdmin("group5");
		return gymRespository.save(gymBean);
	}

	//屬性id需不可為空
	public GymBean update(GymBean gymBean) {
		gymBean.setAdmin("group5");
		return gymRespository.save(gymBean);
	}
	
	//若id為null會拋出exception，id不存在會拋出org.springframework.dao.EmptyResultDataAccessException
	public String delete(Integer id) {
		try {
			gymRespository.deleteById(id);
			return "刪除成功";
		} catch (Exception e) {
			return "刪除失敗";
		}
	}

	
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

}