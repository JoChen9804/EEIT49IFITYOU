package tw.group5.order.controller;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import net.sf.json.JSONObject;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberRepository;
import tw.group5.admin.service.AdminService;
import tw.group5.order.model.Order;
import tw.group5.order.model.OrderItem;
import tw.group5.order.service.OrderItemService;
import tw.group5.order.service.OrderService;
import tw.group5.shopping.model.ShoppingCartItem;
import tw.group5.shopping.sevice.ShoppingCartItemService;

@Controller
@SessionAttributes(names = {"order","myorder","subtotalWithoutDiscount","memeberName","memberPhone"})
@RequestMapping(path = "/group5/user")
public class PayCompleteController {
	
	@Autowired
	private ShoppingCartItemService sCIService;
	
	@Autowired
	private OrderService oService;
	
	@Autowired
	private OrderItemService oIService;
	
	@Autowired
	private AdminService adminService;
	
	
	//Step3先確認收貨人資料到order物件內(宅配的)
	@RequestMapping(path = "/pay/order_pickerInformation1",method = RequestMethod.POST)
	@ResponseBody
	public void pickerInformationAction1(@RequestBody JSONObject jsonO ,Model m) {
		
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date now = new Date();
		String orderTime = format.format(now);
		
		Order order = (Order)m.getAttribute("order");
		order.setPickerName(jsonO.getString("pickerName"));
		order.setPickerCellphone(jsonO.getString("pickerCellphone"));
		order.setDeliveryAddress(jsonO.getString("deliveryAddress"));
		order.setOrderTime(orderTime);
		
		m.addAttribute("order", order);
		
	}
	
	//Step3先確認收貨人資料到order物件內(超商取貨的)
	@RequestMapping(path = "/pay/order_pickerInformation2",method = RequestMethod.POST)
	@ResponseBody
	public void pickerInformationAction2(@RequestBody JSONObject jsonO ,Model m) {
			
		DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date now = new Date();
		String orderTime = format.format(now);
			
		Order order = (Order)m.getAttribute("order");
		order.setPickerName(jsonO.getString("pickerName"));
		order.setPickerCellphone(jsonO.getString("pickerCellphone"));
		order.setOrderTime(orderTime);
			
		m.addAttribute("order", order);
			
	}
	
	
	//綠界支付完返回結果
	@RequestMapping(path = "/order_result",method = RequestMethod.POST)
	public String processMainAction(@RequestParam("RtnCode")int payStatus, @RequestParam("PaymentDate")String payTime, 
									@RequestParam("TradeNo")String ecTradeNo, Model m) {
		
	
		Order order = (Order)m.getAttribute("order");
		
		//付款成功時
		if (payStatus == 1) {
			order.setPayStatus("已付款");
			order.setPayTime(payTime);
			order.setEcTradeNo(ecTradeNo);
			order.setOrderStatus("訂單確認中");
		}else {
			order.setPayStatus("付款失敗");
			order.setPayTime(null);
			order.setOrderStatus("訂單錯誤");
		}
		
		//將原本購物車的東西存進訂orderItem內
		Set<OrderItem> orderItems = new HashSet<OrderItem>();
		
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<ShoppingCartItem> shoppingCartItems = sCIService.findAllShoppingCartItems(account);
		
		for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
			OrderItem orderItem = new OrderItem();
			orderItem.setCommodityNo(shoppingCartItem.getCommodityNo());
			orderItem.setCommodityPrice(shoppingCartItem.getCommodityPrice());
			orderItem.setQuantity(shoppingCartItem.getQuantity());
			orderItem.setSubtotal(shoppingCartItem.getSubtotal());
			orderItem.setAccount(account);
			
			//兩邊都要做連動
			
			//1.連動OrderItem到Order
			orderItem.setOrderNo(order);
			
			//2.將OrderItem加到Set內，等等最後連動
			orderItems.add(orderItem);
		}
		//3.連動Order到OrderItem
		order.setOrderItems(orderItems);
		
		
		//清空購物車
		sCIService.deleteByAccount(account);
		
		
		//新增該筆訂單資料進SQL(因有cascade所以OrderItem會一起)
		oService.insert(order);
		
		
		
		return "order/order_result";
	}
	
	//貨到付款的返回結果
	@RequestMapping(path = "/order_result2",method = RequestMethod.POST)
	public String processMainAction2(Model m) {
			
		
		Order order = (Order)m.getAttribute("order");
		
		order.setPayStatus("尚未付款");
		order.setOrderStatus("訂單確認中");
		
			
		//將原本購物車的東西存進訂orderItem內
		Set<OrderItem> orderItems = new HashSet<OrderItem>();
			
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<ShoppingCartItem> shoppingCartItems = sCIService.findAllShoppingCartItems(account);
			
		for (ShoppingCartItem shoppingCartItem : shoppingCartItems) {
			OrderItem orderItem = new OrderItem();
			orderItem.setCommodityNo(shoppingCartItem.getCommodityNo());
			orderItem.setCommodityPrice(shoppingCartItem.getCommodityPrice());
			orderItem.setQuantity(shoppingCartItem.getQuantity());
			orderItem.setSubtotal(shoppingCartItem.getSubtotal());
			orderItem.setAccount(account);
				
			//兩邊都要做連動
				
			//1.連動OrderItem到Order
			orderItem.setOrderNo(order);
				
			//2.將OrderItem加到Set內，等等最後連動
			orderItems.add(orderItem);
		}
		//3.連動Order到OrderItem
		order.setOrderItems(orderItems);
			
			
		//清空購物車
		sCIService.deleteByAccount(account);
			
			
		//新增該筆訂單資料進SQL(因有cascade所以OrderItem會一起)
		oService.insert(order);
			
			
			
		return "order/order_result";
	}

	
	
	@RequestMapping(path = "/myorder/{orderNo}",method = RequestMethod.GET)
	public String procesOrderDetailAction(@PathVariable("orderNo")String orderNo, Model m) {
		
		Order myorder = oService.findOrder(orderNo);
		m.addAttribute("myorder", myorder);
		
		int subtotalWithoutDiscount = myorder.getOrderTotal()-myorder.getVoucherDiscount();
		m.addAttribute("subtotalWithoutDiscount", subtotalWithoutDiscount);
		
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		MemberBean loginMember = adminService.findByAccountMember(account);
		
		String memeberName = loginMember.getMemberName();
		m.addAttribute("memeberName", memeberName);
		
		String memberPhone = loginMember.getMemberDetail().getCellphone();
		m.addAttribute("memberPhone", memberPhone);


		return "order/myorderDetail";
	}
	
	
	@RequestMapping(path = "/myorder",method = RequestMethod.GET)
	public String procesAllOrderAction(Model m) {
		
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Order> myorders = oService.findAllOrders(account);
		m.addAttribute("myorders", myorders);
		

		return "order/myorder";
	}

}
