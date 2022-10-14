package tw.group5.menu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Flow.Publisher;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.service.AdminService;
import tw.group5.menu.model.MenuDatabean;
import tw.group5.menu.model.MenuDetailbean;
import tw.group5.menu.model.MenuSetbean;
import tw.group5.menu.service.MenuDataService;
import tw.group5.menu.service.MenuDetailService;

@Controller
@RequestMapping("/group5")
@SessionAttributes(names= {"userAdmin"})
public class MenuDetailController {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public MenuDataService mDataService;
	@Autowired
	public MenuDetailService mDetailService;
	@Autowired
	private AdminService adminService;
	@Autowired
	public MenuDataService mdService;
	
	
	@GetMapping("/menuwrap1")
	public String warp1Page(Model m) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		AdminBean admin = adminService.findByAccount(username);
		m.addAttribute("userAdmin", admin);
		return "menu/MenuWrap1Page";
	}
	
	@GetMapping("/mainAddExercise2")
	public String processmainAdd(MenuDetailbean mDetailbean , Integer setid) {
		
		System.out.println("insert into menu");
		mDetailService.AddmainAction(mDetailbean);
		return "redirect:wrapSelectleg";
	}
	
	@GetMapping("/mainAddExercise")
	 public String processmainAdd(MenuDetailbean mDetailbean ,MenuSetbean menuSetbean, Model m , Integer setid) {
	System.out.println("!!!!");
		System.out.println(mDetailbean.getExercisename());
	  mDetailbean.setMenuSetbean(menuSetbean);
	  //System.out.println(mDetailbean.getExrid());
	  //System.out.println(menuSetbean.getSetid());
	  mDetailService.AddmainAction(mDetailbean);
	  
	  
	  List<MenuDatabean> list = mdService.find1();
	  m.addAttribute("querySelect",list);
	  m.addAttribute("setid",setid);
	  return"menu/MenuWrap2Page";	
	 }
	
	@PostMapping("/BackLobby")
	public String processback() {
		return "redirect:MenuLobby";
	}
	
	@GetMapping("/BackWrap1")
	public String backWrap1(Model m,Integer setid) {
		System.out.println(setid);
		m.addAttribute("setid",setid);
		return"menu/MenuWrap1Page";
	}
	
	@GetMapping("/QueryOne")
	public String viewOneMenu(Model m,Integer setid) {
		System.out.println(setid);
		List<MenuDetailbean> list =  mDetailService.findAllOne(setid);
		
		for(MenuDetailbean lists : list) {
			String exercisename = lists.getExercisename();	
			
			if (exercisename !=null) {
				System.out.println(exercisename);
				MenuDatabean mDBean = mDataService.queryexerciseName(exercisename);
				
				lists.setImgnum(mDBean.getImageurl());
			}
			
		}
		
		System.out.println(list.get(0).getImgnum());
		m.addAttribute("setid",setid);
		m.addAttribute("queryOne",list);
		m.addAttribute("page","list");

		return "menu/MenuQueryOne";
		
	}
	
	@GetMapping("/QueryEditxxx")
	 public String processmainUpdate(MenuDetailbean mDetailbean ,MenuSetbean menuSetbean, Model m , Integer setid) {
	 System.out.println("<><><>");
		System.out.println(mDetailbean.getExercisename());
	  mDetailbean.setMenuSetbean(menuSetbean);
	  //System.out.println(mDetailbean.getExrid());
	  //System.out.println(menuSetbean.getSetid());
	  mDetailService.AddmainAction(mDetailbean);
	  
	  List<MenuDetailbean> list =  mDetailService.findAllOne(setid);
		System.out.println(list.get(0).getMenuSetbean().getSetid());
		m.addAttribute("setid",setid);
		m.addAttribute("queryOne",list);
		m.addAttribute("page","list");

		return viewOneMenu(m,setid);
	 }
	
	@GetMapping("ddel")
	public String delByexrid(Model m, Integer setid, Integer exrid) {
		
		System.out.println(setid);
		System.out.println("del start!");
		mDetailService.deletebyId(exrid);
		m.addAttribute("setid",setid);
		
		return viewOneMenu(m,setid);
		
	}
	
	
	
	
	
	
	
	
	

}
