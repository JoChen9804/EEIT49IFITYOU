package tw.group5.shopping.sevice;

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
	
	//新增進購物車
	public ShoppingCartItem insertShoppingCartItem(ShoppingCartItem newShoppingCartItem) {
		return sCIRepo.save(newShoppingCartItem);
	}

}
