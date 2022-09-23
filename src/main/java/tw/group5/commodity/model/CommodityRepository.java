package tw.group5.commodity.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.Nullable;

public interface CommodityRepository extends JpaRepository<Commodity, Integer> {
	
	@Query(value = "select * from Commodity", nativeQuery = true)
	public List<Commodity> findAll();
	
	public List<Commodity> findBycommodityNameLike(String commodityName);

}
