package tw.group5.menu.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.sym.Name;

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
	
	//Query member
	public List<Menubean>  findByAccount(String exrAccount) {
		if(exrAccount == null) {
			return null;
		}
		List<Menubean> findresult = menuRepository.findByExrAccount(exrAccount);
		return findresult;
	}
	
	//Query menuTitle
	public List<Menubean>  findBymenuTitle(String menuTitle) {
		if(menuTitle == null) {
			return null;
		}
		List<Menubean> findresult = menuRepository.findBymenuTitle(menuTitle);
		return findresult;
	}
	
	//Query menuTitle 2 
	public List<Menubean> DistinctFindbyAccount(String exrAccount){
		List<Menubean> findresult = menuRepository.Distinctmenu(exrAccount);
		return findresult; 
		}
	
	
	
	
	//Remove Duplicate
	public static int remove_Duplicate_Elements(int arr[], int n){  
        if (n==0 || n==1){  
            return n;  
        }  
        int[] tempA = new int[n];  
        int j = 0;  
        for (int i=0; i<n-1; i++){  
            if (arr[i] != arr[i+1]){  
                tempA[j++] = arr[i];  
            }  
         }  
        tempA[j++] = arr[n-1];       
        for (int i=0; i<j; i++){  
            arr[i] = tempA[i];  
        }  
        return j;  
    }  

}

  
