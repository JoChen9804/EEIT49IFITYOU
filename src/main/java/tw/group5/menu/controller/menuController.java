package tw.group5.menu.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.menu.model.Menubean;
import tw.group5.menu.model.WriteIntoSQL;
import tw.group5.menu.service.MenuService;

@Controller
@RequestMapping("/group5")
public class menuController {

	private static final long serialVersionUID = 1L;

	@Autowired
	public MenuService menuService;
	
	/*
	 * Old JSP ver
	 */

	// 去組建菜單頁面
	@GetMapping("/menuBuildup.controller")
	public String processBuildupForm() {
		return "group5/menuBuildup";
	}

	// 去看目前菜單所有內容
	@GetMapping("/viewmenu.controller")
	public String processViewmymenuMainAction(Model m) {
		List<Menubean> selectAll = menuService.findall();
		m.addAttribute("view", selectAll);
		return "group5/viewMymenu";
	}

	// 點擊修改，導到修改介面
	@PostMapping("/updateMenu.controller")
	public String updatemenuAction(@RequestParam("editto") int id, Model m) {
		Menubean rid = menuService.selectById(id);
		m.addAttribute("rid", rid);
		return "group5/editform";
	}
    
	//修改介面修改，導回菜單*
	@PostMapping("/updateMenu2.controller")
	@ResponseBody
	public String updatemenuAction2(@RequestParam("id") int id, @RequestBody Menubean rid) {
		menuService.update(rid);
		return "group5/viewMymenu";
	}

	// 點擊刪除，導回菜單內容
	@GetMapping("/menuDeletebyId.controller")
	public String deletemenuAction(@RequestParam("deleteit") Integer id) {
		menuService.deletebyId(id);
		return "group5/viewMymenu";
	}
	
	/*
	 * spmvc ver
	 */
	@GetMapping("/mainmenu.controller")
	public String QueryAllPage(Model m) {
		List<Menubean> menuall = menuService.findall();
		m.addAttribute("menu_queryAll", menuall);
		m.addAttribute("page","menuall");
		return "menu/MenuAll";
	
	}
	
	@PostMapping("/mainmenu2.controller")
	public String QueryAllPage2(Model m) {
		List<Menubean> menuall = menuService.findall();
		m.addAttribute("menu_queryAll", menuall);
		m.addAttribute("page","menuall");
		return "menu/MenuAll";
	
	}
	
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
	
	@GetMapping("/menuDelete.controller")
	public String menuDelete(Model m, int id) {
	menuService.deletebyId(id);
	return "redirect:mainmenu.controller";
	}
	
	@GetMapping("/menuAdd.controller")
	public String menuAdd() {
		return "menu/MenuAdd";
	}
	
	@PostMapping("/menuAddAction.controller")
	@ResponseBody
	public Menubean menuAddAction(@RequestBody Menubean mbean) {
		return menuService.add(mbean);
	}
	
	@PostMapping("/menuAddAction2.controller")
	public String  menuAddAction2(@RequestParam("complete") String complete) {

		WriteIntoSQL intoSQL = new WriteIntoSQL();
		try {
			intoSQL.createConnection();
			boolean part2 = intoSQL.intodatabase(complete);
			if (part2 == true) {
				System.out.println("成功寫入sql!");
				return "redirect:mainmenu.controller";
			}
			
		} catch (SQLException e) {
			System.out.println("寫入失敗sql!");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:mainmenu.controller";
    }


	
	

}
