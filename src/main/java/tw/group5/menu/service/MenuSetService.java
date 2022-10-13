package tw.group5.menu.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.admin.model.MemberBean;
import tw.group5.menu.model.MenuSetRepository;
import tw.group5.menu.model.MenuSetbean;

@Service
@Transactional
public class MenuSetService {
	
	@Autowired
	public MenuSetRepository menuSetRepository;
	
	public String getTime() {
		Date date = new Date(System.currentTimeMillis());
		Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date);
	}
	
	public Set<MenuSetbean> findByuserAccount(MemberBean member){
		return menuSetRepository.findByUserAccount(member);
	}
	
	public List<MenuSetbean> findAll(){
		return menuSetRepository.findAll();
	}
	
	
	public String currentDateFormat() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
        String returnString = sdf.format(new Date());
        return returnString;
	}
	
	
	public String deletebyid(Integer setid) {
		menuSetRepository.deleteById(setid);
		return "del ok";
	}
	
	
	public MenuSetbean insertAdd(MenuSetbean msetbean) {
	 return	menuSetRepository.save(msetbean);
	}
	
	
	
	}
	
	
	
	
	


