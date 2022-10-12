package tw.group5.shopping.sevice;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.shopping.model.ShoppingCartItem;
import tw.group5.shopping.model.ShoppingCartItemRepository;

@Service
@Transactional
public class ShoppingCartItemService {
	
	@Autowired
	private ShoppingCartItemRepository sCIRepo;
	
	//抓出該客人所有購物車內資料
	public List<ShoppingCartItem> findAllShoppingCartItems(String account){
		return sCIRepo.findAllShoppingCartItems(account);
	}
	
	//新增進購物車
	public ShoppingCartItem insertShoppingCartItem(ShoppingCartItem newShoppingCartItem) {
		return sCIRepo.save(newShoppingCartItem);
	}
	
	//判斷購物車內是否有相同商品
	public ShoppingCartItem findSameItemInCart(String account, Integer commodityNo) {
		return sCIRepo.findSameItemInCart(account,commodityNo);
	}
	
	//更新購物車內數量與小計
	public void updateQuantityInCart(Integer identityNumber, int newQuantity, int newSubtotal) {
		sCIRepo.updateQuantityInCart(identityNumber,newQuantity,newSubtotal);
	}
	
	//從購物車刪除
	public void deleteByIdentityNumber(Integer identityNumber) {
		sCIRepo.deleteById(identityNumber);
	}
	
	public ShoppingCartItem findByIdentityNumber(Integer identityNumber) {
		Optional<ShoppingCartItem> optional = sCIRepo.findById(identityNumber);
		return optional.get();
	}
	
	
	//結帳時清空該人購物車
	public void deleteByAccount(String account) {
		sCIRepo.deleteByAccount(account);
	}
	
	

}
