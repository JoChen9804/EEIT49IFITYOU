package tw.group5.shopping.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;



public interface ShoppingCartItemRepository extends JpaRepository<ShoppingCartItem, Integer> {
	
	//抓出該客人所有購物車內資料
	@Query(value = "select * from shopping_cart_item where account = ?1", nativeQuery = true)
	public List<ShoppingCartItem> findAllShoppingCartItems(String account);
	
	@Query(value = "select * from shopping_cart_item where account = ?1 and commodityNo = ?2", nativeQuery = true)
	public ShoppingCartItem findSameItemInCart(String account, Integer commodityNo);
	
	//更新購物車內數量與小計
	@Modifying
	@Query(value = "update shopping_cart_item set quantity = ?2 , subtotal = ?3 where identityNumber = ?1", nativeQuery = true)
	public void updateQuantityInCart(Integer identityNumber, int newQuantity, int newSubtotal);
	
	//結帳時清空該人購物車
	@Modifying
	@Query(value = "delete from shopping_cart_item where account = ?1", nativeQuery = true)
	public void deleteByAccount(String account);

}
