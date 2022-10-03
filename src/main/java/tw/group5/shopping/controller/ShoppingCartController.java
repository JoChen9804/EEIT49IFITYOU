package tw.group5.shopping.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;
import tw.group5.shopping.model.ShoppingCartItem;
import tw.group5.shopping.sevice.ShoppingCartItemService;

@Controller
@SessionAttributes(names = {"shoppingCartItems","totalWithCoupon"})
@RequestMapping(path = "/group5/user")
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartItemService sCIService;
	
	private List<ShoppingCartItem> shoppingCartItems;
	
	
	//進購物車
	@RequestMapping(path = "/shopping.cart",method = RequestMethod.GET)
	public String processMainAction(Model m) {
		
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		
		shoppingCartItems = sCIService.findAllShoppingCartItems(account);
		m.addAttribute("shoppingCartItems", shoppingCartItems);
		
		return "shopping/shopping_cart";
	}
	
	//在購物車內增減數量:update資料庫
	@PostMapping(path = "/shopping.cart.changeQuantity")
	@ResponseBody
	public void changeQuantity(@RequestBody JSONObject jsonO) {
		Integer updateIdentityNumber = jsonO.getInt("updateIdentityNumber");
		int newQuantity = jsonO.getInt("newQuantity");
		int newSubtotal = (sCIService.findByIdentityNumber(updateIdentityNumber).getCommodityPrice())*newQuantity;
		sCIService.updateQuantityInCart(updateIdentityNumber, newQuantity, newSubtotal);
	}
	
	//在購物車內刪除:delete資料庫
	@PostMapping(path = "/shopping.cart.delete")
	@ResponseBody
	public String deleteByIdentityNumber(@RequestParam("deleteIdentityNumber")Integer deleteIdentityNumber) {
		
		//先刪除
		sCIService.deleteByIdentityNumber(deleteIdentityNumber);
		
		//取出該會員購物車內剩的
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		shoppingCartItems = sCIService.findAllShoppingCartItems(account);
		
		//算出剩幾個跟總金額
		int numberShow = shoppingCartItems.size();
		int total =0;
		for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
			total = shoppingCartItem.getSubtotal();
		}
		
		//做成JSON Object
		JSONObject jsonO = new JSONObject();
		jsonO.put("numberShow", numberShow);
		jsonO.put("total", total);

		return jsonO.toString();
	}
	
	
	//接到結帳頁面Step2:選付款及運送方式
	@PostMapping(path = "/shopping.cart/pay")
	public String processPayActionStep2(@RequestParam("totalWithCoupon")int totalWithCoupon, Model m) {
		
		m.addAttribute("totalWithCoupon", totalWithCoupon);
		
		return "shopping/payAndDelivery";
	}
	
	
	//接到結帳頁面Step3:填資料
	@PostMapping(path = "/shopping.cart/pay/orderInformation")
	public String processPayActionStep3(@RequestParam("formPayType")String payType, @RequestParam("finalshippingType")String shippingType,
										@RequestParam("formTotalWithDeliveryFee")int totalWithDeliveryFee, Model m) {
			
		System.out.println(payType);
		System.out.println(shippingType);
		System.out.println(totalWithDeliveryFee);
		
		
		return "";
			
	}
		
		

}
