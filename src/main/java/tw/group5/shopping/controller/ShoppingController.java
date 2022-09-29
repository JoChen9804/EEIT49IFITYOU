package tw.group5.shopping.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	private ShoppingCartItemService sCIService;
	
	private List<Commodity> shoppingDemonstration;
	
	
	
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
	public void processAddToCart(@RequestParam("commodityNo")Integer commodityNo, @RequestParam("commodityPrice")int commodityPrice, 
									@RequestParam("quantity")int quantity, Model m) {
		
		int subtotal = commodityPrice*quantity;
		
		//先判斷有無登入
		//有登入
		if(SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
			
			//先取得帳號
			String account = SecurityContextHolder.getContext().getAuthentication().getName();
			
			//產生有帳號的ShoppingCartItem物件
			ShoppingCartItem shoppingCartItem = new ShoppingCartItem(account, commodityNo, commodityPrice, quantity, subtotal);
			
			//新增進入資料庫
			sCIService.insertShoppingCartItem(shoppingCartItem);
			
			
		//未登入的
		}else if(!SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
			
			//產生無帳號的ShoppingCartItem物件
			ShoppingCartItem shoppingCartItem = new ShoppingCartItem(null, commodityNo, commodityPrice, quantity, subtotal);
			
			//放入List
			if(m.getAttribute("shoppingCartItems")==null) {
				List<ShoppingCartItem> shoppingCartItems = new ArrayList<>();
				shoppingCartItems.add(shoppingCartItem);
				m.addAttribute("shoppingCartItems", shoppingCartItems);
			}else if (m.getAttribute("orderItems")!=null) {
				List<ShoppingCartItem> shoppingCartItems = (List<ShoppingCartItem>) m.getAttribute("shoppingCartItems");
				shoppingCartItems.add(shoppingCartItem);
				m.addAttribute("shoppingCartItems", shoppingCartItems);
			}
			
			
		}
		
		
	}
	
	

}
