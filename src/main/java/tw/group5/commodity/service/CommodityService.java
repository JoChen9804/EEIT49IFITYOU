package tw.group5.commodity.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.commodity.model.Commodity;
import tw.group5.commodity.model.CommodityRepository;

@Service
@Transactional
public class CommodityService {
	
	@Autowired
	private CommodityRepository cRepo;
	
	//新增新商品
	public Commodity insert(Commodity newCommodity) {
		return cRepo.save(newCommodity);
	}
	
	//修改商品
	public Commodity update(Integer commodityNo, String commodityType, String commodityName, int commodityPrice, int commodityInventory, boolean onShelf) {
		
		Optional<Commodity> optional = cRepo.findById(commodityNo);
		
		if (optional != null) {
			
			Commodity commodity = optional.get();
			
			commodity.setCommodityType(commodityType);
			commodity.setCommodityName(commodityName);
			commodity.setCommodityPrice(commodityPrice);
			commodity.setCommodityInventory(commodityInventory);
			commodity.setOnShelf(onShelf);
			return commodity;
		}
		return null;
	}
	
	//刪除商品
	public void deleteById(Integer id) {
		cRepo.deleteById(id);
	}
	
	//查找全部商品
	public List<Commodity> findAll() {
		return cRepo.findAll();
	}
	
	//以名子查找
	public List<Commodity> findBycommodityNameLike(String commodityName) {
		String SQLSearchCommodityName = "%"+commodityName+"%";
		return cRepo.findBycommodityNameLike(SQLSearchCommodityName);
	}

}
