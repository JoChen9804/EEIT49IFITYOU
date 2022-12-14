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
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("????????????");
		}else if(commodityType.equals("clothes")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("??????");
		}else if(commodityType.equals("accessory")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("??????");
		}else if(commodityType.equals("equipment")) {
			shoppingDemonstration = cService.findBycommodityTypeAndOnShelf("??????");
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
		
		//?????????????????????
		//?????????
		if(SecurityContextHolder.getContext().getAuthentication().getName() != "anonymousUser") {
			
			//??????????????????????????????
			String account = shoppingCartItem.getAccount();
			Integer commodityNo = shoppingCartItem.getCommodityNo();
			
			ShoppingCartItem whichCartItem = sCIService.findSameItemInCart(account, commodityNo);
	
			//?????????
			if(whichCartItem == null) {
			
				//???????????????????????????
				sCIService.insertShoppingCartItem(shoppingCartItem);
				
			//????????????????????????
			}else if (whichCartItem != null) {
				
				//???????????????
				int originalQuantity = whichCartItem.getQuantity();
				//?????????????????????????????????????????????
				int plusQuantity = shoppingCartItem.getQuantity();
				int newQuantity = originalQuantity+plusQuantity;
				//???????????????????????????
				int newSubtotal = (shoppingCartItem.getCommodityPrice())*newQuantity;
				
				//???????????????
				sCIService.updateQuantityInCart(whichCartItem.getIdentityNumber(), newQuantity, newSubtotal);
				
			}
			
			shoppingCartItems = sCIService.findAllShoppingCartItems(account);
			m.addAttribute("shoppingCartItems", shoppingCartItems);
	
		//????????????
		}else if(SecurityContextHolder.getContext().getAuthentication().getName() == "anonymousUser") {
			
			//??????????????? ??????List??????????????????List????????????List??????session
			if(m.getAttribute("shoppingCartItems")==null) {
				List<ShoppingCartItem> shoppingCartItems = new ArrayList<>();
				shoppingCartItems.add(shoppingCartItem);
				m.addAttribute("shoppingCartItems", shoppingCartItems);
				
			//??????????????? ???session?????????List
			}else if (m.getAttribute("shoppingCartItems")!=null) {
				shoppingCartItems = (List<ShoppingCartItem>) m.getAttribute("shoppingCartItems");
				
				//??????session???????????????????????????
				
				//1.?????????????????????????????????List
				List<Integer> commodityNos = new ArrayList<>();
				for (ShoppingCartItem shoppingCartItemInSession : shoppingCartItems) {
					commodityNos.add(shoppingCartItemInSession.getCommodityNo());
				}
				
				//2.?????????????????????????????????????????????
				//????????????
				if (commodityNos.contains(shoppingCartItem.getCommodityNo())) {
					//???????????????
					int index = commodityNos.indexOf(shoppingCartItem.getCommodityNo());
					//????????????????????????????????????????????????
					int originalQuantity = shoppingCartItems.get(index).getQuantity();
					//???????????????????????????
					int newQuantity = originalQuantity + shoppingCartItem.getQuantity();
					int newSubtotal = (shoppingCartItem.getCommodityPrice())*newQuantity;
					//???session??????????????????
					shoppingCartItems.remove(index);
					//??????????????????????????????????????????????????????
					shoppingCartItem.setQuantity(newQuantity);
					shoppingCartItem.setSubtotal(newSubtotal);
					shoppingCartItems.add(shoppingCartItem);
					
					m.addAttribute("shoppingCartItems", shoppingCartItems);
					
				//????????????
				}else if (!commodityNos.contains(shoppingCartItem.getCommodityNo())) {
					//??????????????????
					shoppingCartItems.add(shoppingCartItem);
					m.addAttribute("shoppingCartItems", shoppingCartItems);
				}
			}
		}
		
		return "??????????????????!";	
	}
	
	

}
