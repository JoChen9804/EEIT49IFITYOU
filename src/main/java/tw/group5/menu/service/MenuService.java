package tw.group5.menu.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.group5.menu.model.MenuRepository;
import tw.group5.menu.model.Menubean;

@Service
@Transactional
public class MenuService {

	@Autowired
	private MenuRepository menuRepository;

	// 新增
	public Menubean add(Menubean menubean) {
		return menuRepository.save(menubean);
	}

	// 修改
	public Menubean update(Menubean menubean) {
		return menuRepository.save(menubean);
	}

	// 刪除
	public String deletebyId(Integer id) {
		try {
			menuRepository.deleteById(id);
			return "完成刪除!";
		} catch (Exception e) {
			return "刪除失敗!";
		}	
	}
	
	//查詢 BY ID
	public Menubean selectById(Integer id) {
		Optional<Menubean> optional = menuRepository.findById(id);
		
		if(optional.isPresent()) {
			return optional.get();
		}else {
			return null;
		}
	}
	
	//Query ALL
	public List<Menubean> findall(){
		return menuRepository.findAll();
	}

}
