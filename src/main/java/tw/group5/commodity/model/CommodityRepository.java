package tw.group5.commodity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.Nullable;

public interface CommodityRepository extends JpaRepository<Commodity, Integer> {
	
	
	//商品管理頁面
	@Query(value = "select * from Commodity", nativeQuery = true)
	public List<Commodity> findAll();
	
	public List<Commodity> findBycommodityNameLike(String commodityName);
	
	
	
	
	//購物頁面
	@Query(value = "select * from Commodity where onShelf = 1", nativeQuery = true)
	public List<Commodity> findAllOnShelf();
	
	@Query(value = "select * from Commodity where commodityName Like ?1 and onShelf = 1", nativeQuery = true)
	public List<Commodity> findBycommodityNameLikeAndOnShelf(String commodityName);
	
	@Query(value = "select * from Commodity where commodityType = ?1 and onShelf = 1", nativeQuery = true)
	public List<Commodity> findBycommodityTypeAndOnShelf(String commodityType);
	
	

}
