package tw.group5.menu.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.gym.model.GymBean;
import tw.group5.menu.model.MenuDataRespository;
import tw.group5.menu.model.MenuDatabean;
import tw.group5.menu.model.Menubean;

@Service
@Transactional
public class MenuDataService {
	
	@Autowired
	private MenuDataRespository menuDataRespository;
	
	
	public List<MenuDatabean> findAll(){
		return menuDataRespository.findAll();
	}
	
	public List<MenuDatabean> findBypart(String part){
		return menuDataRespository.findByPart(part);
	}
	
	public List<MenuDatabean> find1(){
		return menuDataRespository.find1();
	}
	
	
	public List<MenuDatabean> find2(){
		return menuDataRespository.find2();
	}
	
	
	public MenuDatabean update(MenuDatabean mdbean) {
		return menuDataRespository.save(mdbean);
	}
	
	public MenuDatabean queryexerciseName(String exerciseName) {
		List<MenuDatabean> oneData = menuDataRespository.findByExercisename(exerciseName);
		if(oneData.isEmpty()) {
			return null;
		}
		return oneData.get(0);
	}
	
	public String delete(MenuDatabean mdbean) {
		try {
			menuDataRespository.delete(mdbean);
			return "刪除成功";
		} catch (Exception e) {
			return "刪除失敗";
		}
	}
	
	public String deletebyId(Integer id) {
		try {
		menuDataRespository.deleteById(id);
			return "完成刪除!";
		} catch (Exception e) {
			return "刪除失敗!";
		}	
	}
	
	
    public String addImages(MultipartFile mfs) {

        String sqlImage = "";
        String imgsrc = "D:/img/";
     
            String imageName = mfs.getOriginalFilename();
            if (imageName != null && imageName != "") {
                String newImageName =  imageName;
                try {
                    File file = new File(imgsrc, newImageName);

                    mfs.transferTo(file);
                    sqlImage += "/img" + "/" + newImageName;

                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }
 
        return sqlImage;
    }
	}


	
	
	


