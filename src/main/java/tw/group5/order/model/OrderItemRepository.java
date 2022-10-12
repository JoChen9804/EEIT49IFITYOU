package tw.group5.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
	
	@Query(value = "select * from order_item where orderNo = ?1", nativeQuery = true)
	public List<OrderItem> findAllOrderItems(String orderNo);

}
