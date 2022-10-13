package tw.group5.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;
import tw.group5.order.model.Order;
import tw.group5.order.service.OrderService;

@Controller
@SessionAttributes(names = {"allOrders"})
@RequestMapping(path = "/group5/admin")
public class OrderAdministrationController {
	
	@Autowired
	public OrderService oService;

	//顯示出後台訂單管理頁面
	@GetMapping(path = "/order_administration")
	public String processMainAction(Model m) {
		
		List<Order> allOrders = oService.findAllOrders();
		m.addAttribute("allOrders", allOrders);
		
		return "order/order_administration";
	}
	
	@PostMapping(path = "/order_administration.updateOrderStatus")
	@ResponseBody
	public String updateOrderStatus(@RequestBody JSONObject jsonO) {
		
		oService.updateOrderStatus(jsonO.getString("updateOrderNo"), jsonO.getString("newOrderStatus"));
		
		return "更新成功";
	}
	
	@PostMapping(path = "/order_administration.updatePayStatus")
	@ResponseBody
	public String updatePayStatus(@RequestBody JSONObject jsonO) {
		
		oService.updatePayStatus(jsonO.getString("updateOrderNo"), jsonO.getString("newPayStatus"));
		
		return "更新成功";
	}
	
}
