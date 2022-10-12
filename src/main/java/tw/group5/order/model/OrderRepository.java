package tw.group5.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface OrderRepository extends JpaRepository<Order, String> {
	
	//抓出該客人所有訂單
	@Query(value = "select * from order_information where account = ?1 order by orderTime DESC", nativeQuery = true)
	public List<Order> findAllOrders(String account);

}
