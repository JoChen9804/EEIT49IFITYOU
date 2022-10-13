package tw.group5.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;


public interface OrderRepository extends JpaRepository<Order, String> {
	
	//抓出該客人所有訂單(客人看的)
	@Query(value = "select * from order_information where account = ?1 order by orderTime DESC", nativeQuery = true)
	public List<Order> findAllOrders(String account);
	
	//抓出所有訂單(顯示在後台)
	@Query(value = "select * from order_information order by orderTime DESC", nativeQuery = true)
	public List<Order> findAllOrders();
	
	//更新單筆訂單的訂單狀態
	@Modifying
	@Query(value = "update order_information set orderStatus= ?2 where orderNo= ?1 ", nativeQuery = true)
	public void updateOrderStatus(String orderNo, String orderStatus);
	
	//更新單筆訂單的付款狀態
	@Modifying
	@Query(value = "update order_information set payStatus= ?2 where orderNo= ?1 ", nativeQuery = true)
	public void updatePayStatus(String orderNo, String payStatus);

}
