package tw.group5.menu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.menu.model.MenuDeatilRepository;
import tw.group5.menu.model.MenuDetailbean;

@Service
@Transactional
public class MenuDetailService {
	
	@Autowired
	private MenuDeatilRepository mDetailRepository;
	
	public MenuDetailbean AddmainAction(MenuDetailbean mDetailbean) {
		return mDetailRepository.save(mDetailbean);
	}
	
	
	public List<MenuDetailbean> findAllOne(Integer setid){
		return mDetailRepository.findBySetid(setid);
		
	}
	
	public String deletebyId(Integer exrid) {
		try {
			mDetailRepository.deleteById(exrid);
			return "DEL OK!";
		} catch (Exception e) {
			return "DEL FAIL!";
		}	
	}
	
	

}
