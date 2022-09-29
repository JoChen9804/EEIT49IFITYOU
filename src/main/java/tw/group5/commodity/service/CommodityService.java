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
	
	
	
	
	//查詢所有上架商品(供購物頁面使用)
	public List<Commodity> findAllOnShelf() {
		return cRepo.findAllOnShelf();
	}
	
	//以名子查找上架商品(供購物頁面使用)
	public List<Commodity> findBycommodityNameLikeAndOnShelf(String commodityName) {
		String SQLSearchCommodityName = "%"+commodityName+"%";
		return cRepo.findBycommodityNameLikeAndOnShelf(SQLSearchCommodityName);
	}
	
	//以商品類別查找上架商品(供購物頁面使用)
		public List<Commodity> findBycommodityTypeAndOnShelf(String commodityType) {
			return cRepo.findBycommodityTypeAndOnShelf(commodityType);
		}
		
	//以commodityNo找單一商品(供單項商品詳情呈現)
		public Commodity selectCommodityById(Integer commodityNo) {
			Optional<Commodity> selectedCommodity = cRepo.findById(commodityNo);
			
			if (selectedCommodity.isPresent()) {
				return selectedCommodity.get();
			}
			return null;
		}
		
		
		

}
