package tw.group5.commodity.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.commodity.model.Commodity;
import tw.group5.commodity.service.CommodityService;

@Controller
@SessionAttributes(names = {"commodityAdministrationDemonstration"})
@RequestMapping(path = "/group5/admin")
public class CommodityAdministrationController {
	
	@Autowired
	private CommodityService cService;
	
	private List<Commodity> commodityAdministrationDemonstration;
	
	
	//商品呈現
	@GetMapping(path = "/commodity_administration")
	public String processMainAction(HttpServletRequest request, Model m) throws SQLException {
		
		commodityAdministrationDemonstration = cService.findAll();
		
		String searchCommodity = request.getParameter("searchCommodity");
		
		if (searchCommodity != null) {
			commodityAdministrationDemonstration = cService.findBycommodityNameLike(searchCommodity);
		}
		
		m.addAttribute("commodityAdministrationDemonstration", commodityAdministrationDemonstration);
		return "commodity/commodity_administration";
	}
	
	
	//商品刪除
	@PostMapping(path = "/commodity_administration.delete" )
	@ResponseBody
	public String deleteCommodity(@RequestParam("deleteCommodityNo")Integer deleteCommodityNo, Model m) {
		cService.deleteById(deleteCommodityNo);
		
		commodityAdministrationDemonstration = cService.findAll();
		m.addAttribute("commodityAdministrationDemonstration", commodityAdministrationDemonstration);
		return "成功刪除!";
	}
	
	
	//商品更新
	@GetMapping(path ="/commodity_administration.update")
	public String updateCommodity(@RequestParam("updateCommodityNo")Integer updateCommodityNo, @RequestParam("updateCommodityType")String updateCommodityType, 
			                      @RequestParam("updateCommodityName")String updateCommodityName, @RequestParam("updateCommodityPrice")int updateCommodityPrice,
			                      @RequestParam("updateCommodityInventory")int updateCommodityInventory, @RequestParam("updateCommodityOnShelf")Boolean updateCommodityOnShelf, Model m) {
		
		cService.update(updateCommodityNo, updateCommodityType, updateCommodityName, updateCommodityPrice, updateCommodityInventory, updateCommodityOnShelf);
		
		commodityAdministrationDemonstration = cService.findAll();
		m.addAttribute("commodityAdministrationDemonstration", commodityAdministrationDemonstration);
		return "commodity/commodity_administration";
	}
	

	

}
