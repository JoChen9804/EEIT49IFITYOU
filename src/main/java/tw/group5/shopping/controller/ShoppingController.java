package tw.group5.shopping.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.commodity.model.Commodity;
import tw.group5.commodity.service.CommodityService;
import tw.group5.shopping.model.ShoppingCartItem;
import tw.group5.shopping.sevice.ShoppingCartItemService;

@Controller
@SessionAttributes(names = {"shoppingDemonstration","orderItems","banner","commodityDetail","shoppingCartItems"})
@RequestMapping(path = "/group5")
public class ShoppingController {
	
	@Autowired
	private CommodityService cService;
	
	@Autowired
	private ShoppingCartItemService sCIService;
	
	private List<Commodity> shoppingDemonstration;
	
	private List<ShoppingCartItem> shoppingCartItems;
	
	
	@RequestMapping(path = "/shopping",method = RequestMethod.GET)
	public String processMainAction(HttpServletRequest request, Model m) throws SQLException {
		
        shoppingDemonstration = cService.findAllOnShelf();
		
        String searchCommodity = request.getParameter("searchCommodity");
		
		if (searchCommodity != null) {
			shoppingDemonstration = cService.findBycommodityNameLikeAndOnShelf(searchCommodity);
		}
		
		m.addAttribute("banner", "main");
		
		m.addAttribute("shoppingDemonstration", shoppingDemonstration);
		return "shopping/shopping";
		
	}
	
	@RequestMapping(path = "/shopping/{commodityType}",method = RequestMethod.GET)
	public String processCommodityShowAll(@PathVariable("commodityType")String commodityType, Model m) throws SQLException {
		
		if (commodityType.equals("protein")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("乳清蛋白");
		}else if(commodityType.equals("clothes")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("服飾");
		}else if(commodityType.equals("accessory")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("配件");
		}else if(commodityType.equals("equipment")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("器材");
		}
		
		m.addAttribute("banner", commodityType);
		
		m.addAttribute("shoppingDemonstration", shoppingDemonstration);
		return "shopping/shopping";
		
	}
	
	@RequestMapping(path = "/shopping.detail/{commodityNo}",method = RequestMethod.GET)
	public String processCommodityShowDetail(@PathVariable("commodityNo")Integer commodityNo, Model m) throws SQLException {
		
		Commodity commodityShowDetail = cService.selectCommodityById(commodityNo);
		
		
		m.addAttribute("commodityDetail", commodityShowDetail);
		
		return "shopping/shoppingDetail";
	}
	
	
	@PostMapping(path = "/shopping.addToCart" )
	@ResponseBody
	public String processAddToCart(@RequestBody ShoppingCartItem shoppingCartItem, Model m) {
		
		//先判斷有無登入
		//有登入
		if(SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {
			
			//判斷是否加過相同商品
			String account = shoppingCartItem.getAccount();
			Integer commodityNo = shoppingCartItem.getCommodityNo();
			
			ShoppingCartItem whichCartItem = sCIService.findSameItemInCart(account, commodityNo);
	
			//若沒有
			if(whichCartItem == null) {
			
				//直接新增進入資料庫
				sCIService.insertShoppingCartItem(shoppingCartItem);
				
			//若原本就有該商品
			}else if (whichCartItem != null) {
				
				//取得原數量
				int originalQuantity = whichCartItem.getQuantity();
				//取得要新增數量並算出新總和數量
				int plusQuantity = shoppingCartItem.getQuantity();
				int newQuantity = originalQuantity+plusQuantity;
				//用新數量算出新小計
				int newSubtotal = (shoppingCartItem.getCommodityPrice())*newQuantity;
				
				//做數量更新
				sCIService.updateQuantityInCart(whichCartItem.getIdentityNumber(), newQuantity, newSubtotal);
				
			}
			
			shoppingCartItems = sCIService.findAllShoppingCartItems(account);
			m.addAttribute("shoppingCartItems", shoppingCartItems);
	
		//未登入的
		}else if(SecurityContextHolder.getContext().getAuthentication().getName() == "anonymousUser") {
			
			//沒加入過的 新創List，將商品放入List後，並將List放入session
			if(m.getAttribute("shoppingCartItems")==null) {
				List<ShoppingCartItem> shoppingCartItems = new ArrayList<>();
				shoppingCartItems.add(shoppingCartItem);
				m.addAttribute("shoppingCartItems", shoppingCartItems);
				
			//已加入過的 從session內取出List
			}else if (m.getAttribute("shoppingCartItems")!=null) {
				shoppingCartItems = (List<ShoppingCartItem>) m.getAttribute("shoppingCartItems");
				
				//判斷session內的是否有重複商品
				
				//1.先創一個只有商品編號的List
				List<Integer> commodityNos = new ArrayList<>();
				for (ShoppingCartItem shoppingCartItemInSession : shoppingCartItems) {
					commodityNos.add(shoppingCartItemInSession.getCommodityNo());
				}
				
				//2.判斷新加入的有無重複的商品編號
				//若有重複
				if (commodityNos.contains(shoppingCartItem.getCommodityNo())) {
					//看是第幾個
					int index = commodityNos.indexOf(shoppingCartItem.getCommodityNo());
					//取出該重複的商品並得到原本的數量
					int originalQuantity = shoppingCartItems.get(index).getQuantity();
					//計算新總和及新小計
					int newQuantity = originalQuantity + shoppingCartItem.getQuantity();
					int newSubtotal = (shoppingCartItem.getCommodityPrice())*newQuantity;
					//從session中移出該商品
					shoppingCartItems.remove(index);
					//將商品數量更新為新總和新小計後再加回
					shoppingCartItem.setQuantity(newQuantity);
					shoppingCartItem.setSubtotal(newSubtotal);
					shoppingCartItems.add(shoppingCartItem);
					
					m.addAttribute("shoppingCartItems", shoppingCartItems);
					
				//若無重複
				}else if (!commodityNos.contains(shoppingCartItem.getCommodityNo())) {
					//直接加入即可
					shoppingCartItems.add(shoppingCartItem);
					m.addAttribute("shoppingCartItems", shoppingCartItems);
				}
			}
		}
		
		return "商品加入成功!";	
	}
	
	

}
