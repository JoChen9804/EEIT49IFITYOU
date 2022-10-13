package tw.group5.menu.controller;

import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.service.AdminService;
import tw.group5.menu.model.MenuDatabean;
import tw.group5.menu.service.MenuDataService;


@Controller
@RequestMapping("/group5")
@SessionAttributes(names= {"userAdmin"})
public class MenuDataController {
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public MenuDataService mdService;
	@Autowired
	private AdminService adminService;
	
	/*
	 * back page
	 */
	
	@GetMapping("/admin/insertandadd")
	public String processMainAction(Model m) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		AdminBean admin = adminService.findByAccount(username);
		m.addAttribute("userAdmin", admin);
		List<MenuDatabean> list = mdService.findAll();
		m.addAttribute("queryAll",list);
		return"menu/menuFrontPage";	
	}

	
	@GetMapping("/admin/insertandadd2")
	public String processMainAction2(Model m) {
		System.out.println("find leg!");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MenuDatabean> list = mdService.find1();
		m.addAttribute("queryAll",list);
		return"menu/menuFrontPage";	
	}

	
	
	@GetMapping("/findbyPart/{part}")
	public String findBypart(@PathVariable("part") String part, Model m) {
		System.out.println("load legs");
		List<MenuDatabean> list = mdService.findBypart(part);
		m.addAttribute("queryAll",list);
		return"menu/menuFrontPage";	
	}
	
	
	@PostMapping("/allUpdate/{name}")
	@ResponseBody
	public MenuDatabean processQueryUpdate(@PathVariable("name") String name) {
		System.out.println("修改傳送");
		MenuDatabean result = mdService.queryexerciseName(name);
		System.out.println(result);
		return result;
	}
	@PostMapping("/UpdateAction")
    @ResponseBody
	public MenuDatabean processAllUpdateAction(@RequestBody MenuDatabean mdbean) {
		System.out.println("111");
		  return mdService.update(mdbean);
	}
	
	@PostMapping("/admin/UpdateAction2")
	public String processAllUpdateAction2(MenuDatabean mdbean,@RequestParam("chamgeimages") MultipartFile mfs) {	
		System.out.println(mfs.getOriginalFilename());
		  String mb2 = mdService.addImages(mfs);
		  mdbean.setImageurl(mb2);
		  mdService.update(mdbean);
		  return "redirect:insertandadd";
	}
	
	@PostMapping("/allDelete/{name}")
	public String processAllDeleteAction(@PathVariable("name") String name) {
		System.out.println("開始刪除");
		MenuDatabean mdbean = mdService.queryexerciseName(name);	
		String delete = mdService.delete(mdbean);
		System.out.println(delete);
		return "insertandadd";
	}
	
	@PostMapping("/ALLdeleteAction2")
	public String processALLdeleteAction2(MenuDatabean mdbean) {
		System.out.println("test del");
		  mdService.delete(mdbean);
		  return "redirect:insertandadd";
	}
	
	@GetMapping("/admin/ALLdeleteAction3")
	public String menuDelete(Model m, int id) {
	mdService.deletebyId(id);
	return "redirect:insertandadd";
	}
	
/*
 *  front page	
 */

	@GetMapping("/wrapSelectleg")
	public String processSelectLeg(Model m , Integer setid) {
		System.out.println("find leg!");
		System.out.println(setid);
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MenuDatabean> list = mdService.find1();
		
		for (MenuDatabean menuDatabean : list) {
			System.out.println("測動作細項"+menuDatabean.getExerciseName());
		}
		
//		AdminBean admin = adminService.findByAccount(username);
		MemberBean member = adminService.findByAccountMember(username);
		m.addAttribute("userAdmin", member);
		m.addAttribute("setid",setid);
		m.addAttribute("querySelect",list);
		return"menu/MenuWrap2Page";	
	}
	
	
	@GetMapping("/wrapSelectcore")
	public String processSelectCore(Model m , Integer setid) {
		System.out.println("find Core!");
		System.out.println(setid);
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		List<MenuDatabean> list = mdService.find2();
		
		for (MenuDatabean menuDatabean : list) {
			System.out.println("測動作細項"+menuDatabean.getExerciseName());
		}
		
//		AdminBean admin = adminService.findByAccount(username);
		MemberBean member = adminService.findByAccountMember(username);
		m.addAttribute("userAdmin", member);
		m.addAttribute("setid",setid);
		m.addAttribute("querySelect",list);
		return"menu/MenuWrap3Page";	
	}

	
	
	
	
	
	
	

}
