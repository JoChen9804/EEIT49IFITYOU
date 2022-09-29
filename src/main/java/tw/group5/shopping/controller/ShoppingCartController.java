package tw.group5.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/group5/user")
public class ShoppingCartController {
	
	@RequestMapping(path = "/shopping.cart",method = RequestMethod.GET)
	public String processMainAction() {
		
		return "shopping/shopping_cart";
	}

}
