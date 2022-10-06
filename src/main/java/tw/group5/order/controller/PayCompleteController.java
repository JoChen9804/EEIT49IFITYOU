package tw.group5.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/group5/user")
public class PayCompleteController {
	
	//{orderNo}  @PathVariable("orderNo")String orderNo
	@RequestMapping(path = "/myorder",method = RequestMethod.GET)
	public String processMainAction() {
		
		
		return "order/myorderDetail";
	}

}
