package tw.group5.menu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AdviceModeImportSelector;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.activity.model.ActivityActivity;
import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.service.AdminService;
import tw.group5.menu.model.MenuSetbean;
import tw.group5.menu.service.MenuSetService;

@Controller
@RequestMapping("/group5/admin")
@SessionAttributes(names= {"userAdmin"})
public class MenuSetController {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public MenuSetService mSetService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/MenuLobby")
	public String mainAction(Model m) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		AdminBean admin = adminService.findByAccount(username);
		m.addAttribute("userAdmin", admin);
		List<MenuSetbean> list = mSetService.findAll();
		m.addAttribute("page", "query");
		m.addAttribute("queryAll",list);
		return"menu/MenuLobby";
	}
	
	@GetMapping("/goWrap1")
	public String wrap1Actiom(Model m , Integer setid) {
		System.out.println(setid);
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		AdminBean admin = adminService.findByAccount(username);
		m.addAttribute("userAdmin", admin);
		m.addAttribute("setid",setid);
		
		return"menu/MenuWrap1Page";	
	}
	
	
	    @GetMapping("/msetAdd")
	    public String menuSetAdd(MenuSetbean msetbean ,Model m) {
		msetbean.setCreateDate(mSetService.currentDateFormat());
		mSetService.insertAdd(msetbean);
		return "redirect:MenuLobby";
	}
	    
	    @GetMapping("/msetDel")
	    public String menuSetDel(Integer setid) {  	
	    	mSetService.deletebyid(setid);
	    	return "redirect:MenuLobby";
	    }


	

	
	
	
	
	
	

}
