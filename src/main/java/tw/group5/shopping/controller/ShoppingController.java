package tw.group5.shopping.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.commodity.model.Commodity;
import tw.group5.commodity.service.CommodityService;

@Controller
@SessionAttributes(names = {"shoppingDemonstration","orderItems","banner"})
@RequestMapping(path = "/group5")
public class ShoppingController {
	
	@Autowired
	private CommodityService cService;
	
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
	public String processCommodityShow(@PathVariable("commodityType")String commodityType, Model m) throws SQLException {
		
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
	
	

}
