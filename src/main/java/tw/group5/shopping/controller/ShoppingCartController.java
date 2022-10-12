package tw.group5.shopping.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import tw.group5.activity.model.ActivityVoucher;
import tw.group5.activity.service.ActivityVoucherService;
import tw.group5.shopping.model.ShoppingCartItem;
import tw.group5.shopping.sevice.ShoppingCartItemService;

@Controller
@SessionAttributes(names = {"shoppingCartItems"})
@RequestMapping(path = "/group5/user")
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartItemService sCIService;
	
	@Autowired
	public ActivityVoucherService vService;
	
	private List<ShoppingCartItem> shoppingCartItems;
	
	
	//進購物車呈現
	@RequestMapping(path = "/shopping.cart",method = RequestMethod.GET)
	public String processMainAction(Model m) {
		
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		
		shoppingCartItems = sCIService.findAllShoppingCartItems(account);
		m.addAttribute("shoppingCartItems", shoppingCartItems);
		
		return "shopping/shopping_cart";
	}
	
	//在購物車內增減數量:update資料庫內數量及小計
	@PostMapping(path = "/shopping.cart.changeQuantity")
	@ResponseBody
	public String changeQuantity(@RequestBody JSONObject jsonO) {
		Integer updateIdentityNumber = jsonO.getInt("updateIdentityNumber");
		int newQuantity = jsonO.getInt("newQuantity");
		int newSubtotal = (sCIService.findByIdentityNumber(updateIdentityNumber).getCommodityPrice())*newQuantity;
		sCIService.updateQuantityInCart(updateIdentityNumber, newQuantity, newSubtotal);
		
		
		//取出該會員購物車內剩的
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		shoppingCartItems = sCIService.findAllShoppingCartItems(account);
		
		//算出總金額
		int totalShow =0;
		for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
			totalShow += shoppingCartItem.getSubtotal();
		}
		
		//旁邊subtotal及下面總金額做成JSON Object
		JSONObject returnjsonO = new JSONObject();
		returnjsonO.put("newSubtotal", newSubtotal);
		returnjsonO.put("totalShow", totalShow);

		//丟回前台做畫面更新
		return returnjsonO.toString();
	}
	
	//在購物車內刪除:delete資料庫內資料
	@PostMapping(path = "/shopping.cart.delete")
	@ResponseBody
	public String deleteByIdentityNumber(@RequestParam("deleteIdentityNumber")Integer deleteIdentityNumber) {
		
		//先刪除
		sCIService.deleteByIdentityNumber(deleteIdentityNumber);
		
		//取出該會員購物車內剩的
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		shoppingCartItems = sCIService.findAllShoppingCartItems(account);
		
		//算出剩幾個商品跟總金額
		int numberShow = shoppingCartItems.size();
		int totalShow =0;
		for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
			totalShow += shoppingCartItem.getSubtotal();
		}
		
		//做成JSON Object
		JSONObject jsonO = new JSONObject();
		jsonO.put("numberShow", numberShow);
		jsonO.put("totalShow", totalShow);

		//丟回前台做畫面更新
		return jsonO.toString();
	}
	
	//在購物車內輸入優惠碼
	@PostMapping(path = "/shopping.cart.voucher")
	@ResponseBody
	public String inputVoucherNo(@RequestParam("voucherNo")String voucherNo) {
		
		ActivityVoucher voucher = vService.findByVoucherNo(voucherNo);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String inputTime = format.format(now);
		
		//取出該會員購物車內剩的
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		shoppingCartItems = sCIService.findAllShoppingCartItems(account);
				
		//算出總金額
		int totalWithoutCoupon =0;
		for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
			totalWithoutCoupon += shoppingCartItem.getSubtotal();
		}
		
		
		//做JSON Object
		JSONObject jsonO = new JSONObject();
		
		//先判斷該優惠碼是否存在
		if (voucher != null) {
			//再判斷是否已啟用 && 
			if ( inputTime.compareTo(voucher.getReviseTime())>0) {
				System.out.println(inputTime.compareTo(voucher.getReviseTime())>0);
				//再判斷是否已過期
				if (inputTime.compareTo(voucher.getExpiryTime())<0) {
					jsonO.put("result", "套用成功!!");
					jsonO.put("voucherTitle", voucher.getVoucherTitle());
					
					double totalWithCouponPercent = 0.01;
					totalWithCouponPercent = ((double)totalWithoutCoupon) / ((double)100);
					
					double totalWithCouponDouble = totalWithCouponPercent*voucher.getVoucherTitle();
					int totalWithCoupon = (int)totalWithCouponDouble;
					
					System.out.println(totalWithCoupon);
					int voucherDiscount = totalWithoutCoupon - totalWithCoupon;
					jsonO.put("totalWithCoupon", totalWithCoupon);
					jsonO.put("voucherDiscount", voucherDiscount);
					
				}else {
					jsonO.put("result", "此優惠碼已過期!!");
					jsonO.put("totalWithoutCoupon", totalWithoutCoupon);
				}
			}else {
				jsonO.put("result", "此優惠碼尚未啟用!!");
				jsonO.put("totalWithoutCoupon", totalWithoutCoupon);
			}
		}else {
			jsonO.put("result", "此優惠碼不存在!!");
			jsonO.put("totalWithoutCoupon", totalWithoutCoupon);
		}
		return jsonO.toString();
	}
	
		
		

}
