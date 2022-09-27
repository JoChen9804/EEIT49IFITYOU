package tw.group5.menu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.menu.model.Menubean;
import tw.group5.menu.model.WriteIntoSQL;
import tw.group5.menu.service.MenuService;

@Controller
@RequestMapping("/group5/admin")
public class menuController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Autowired
	public MenuService menuService;
	
	/*
	 * spring boot - MVC
	 */
	
	//前往 users' main menu
	
	@GetMapping("/mainmenu.controller")
	public String QueryAllPage(Model m) {
		List<Menubean> menuall = menuService.findall();
		m.addAttribute("menu_queryAll", menuall);
		m.addAttribute("page","menuall");
		return "menu/MenuAll";
	}
	
	//main menu: 修改，到修改頁後返回
	
	@PostMapping("/updateMenuForm.controller")
	public String menuUpdate(@ModelAttribute(name = "menu") Menubean menu, String update, int dataId, Model m )
			throws IllegalStateException, IOException {
		if (update.equals("修改")) {
			Menubean mUpdate = menuService.selectById(dataId);
			
			m.addAttribute("update_menu", mUpdate);
			
			return "menu/MenuUpdate";
		}
		if(menuService.update(menu) != null) {
				m.addAttribute("update_menu", menu);
				m.addAttribute("page", "menu");
				m.addAttribute("update1", true);
				return "redirect:mainmenu.controller";
			}	
		      return "redirect:mainmenu.controller";
	}
	
	//main menu: 刪除，刪除後返回
	
	@GetMapping("/menuDelete.controller")
	public String menuDelete(Model m, int id) {
	menuService.deletebyId(id);
	return "redirect:mainmenu.controller";
	}
	
	//main menu: build up page
	
	@GetMapping("/menuAdd.controller")
	public String menuAdd() {
		return "menu/MenuAdd";
	}
	
	//main menu: add, use intoSQL temporary
	
	@PostMapping("/menuAddAction.controller")
	@ResponseBody
	public Menubean menuAddAction(@RequestBody Menubean mbean) {
		return menuService.add(mbean);
	}
	
	//main menu: build, insert JSON string data (session test ING...)
	
	@PostMapping("/menuAddAction2.controller")
	public String  menuAddAction2(@RequestParam("complete") String complete) {

		WriteIntoSQL intoSQL = new WriteIntoSQL();
		try {
			intoSQL.createConnection();
			boolean part2 = intoSQL.intodatabase(complete);
			if (part2 == true) {
				System.out.println("INSERT SQL SUCCESS!!!");
				return "redirect:mainmenu.controller";
			}
			
		} catch (SQLException e) {
			System.out.println("INSERT SQL FAULT!! NO!!");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:mainmenu.controller";
    }
	
	@GetMapping("/menuQuery.controller/{exrAccount}")
	public String QueryMembermenus(@PathVariable("exrAccount") String exrAccount,Model m) {
		List<Menubean> queryresult = menuService.findByAccount(exrAccount);
		
//	for(int i = 0 ; i < queryresult.size()-1 ;i++) {
//		for(int j = queryresult.size()-1 ; j >i ; j--) {
//				if(queryresult.get(j).getExrAccount() == queryresult.get(i).getExrAccount()){
//				queryresult.remove(j);
//				}
//		}
//		}
//	System.out.println(queryresult);
//		System.out.println("one");
//		for(Menubean one : queryresult) {
//			System.out.println(one.getExrAccount());
//		}
//		System.out.println("two");
		m.addAttribute("menu_queryAccount", queryresult);
		m.addAttribute("page","queryresult");
		return "menu/MenuQuery";
	}
	
	
	@PostMapping("/menuQueryDistinct.controller/{exrAccount}")
	public String QueryDistinctMembermenus(@PathVariable("exrAccount") String exrAccount,Model m) {
		List<Menubean> queryresult = menuService.DistinctFindbyAccount(exrAccount);
		m.addAttribute("menu_queryAccount", queryresult);
		m.addAttribute("page","queryresult");
		return "menu/MenuQuery";
	}
	
	
	
	@GetMapping("/menutitlequery.controller/{menuTitle}")
	public String QueryMenuTitle(@PathVariable("menuTitle") String menuTitle, Model m) {
		
		List<Menubean> menuall = menuService.findBymenuTitle(menuTitle);
		m.addAttribute("menu_queryAll", menuall);
		m.addAttribute("page","menuall");
		return "menu/MenuAll";
	}
	
	
	@PostMapping("/oneallxxmenu.controller")
	public String allmenu(Model m) {
		List<Menubean> queryresult = menuService.findall();
		m.addAttribute("menu_queryAccount", queryresult);
		m.addAttribute("page","queryresult");
		return "menu/MenuQuery";
	}
	
	
	


	
	

}
