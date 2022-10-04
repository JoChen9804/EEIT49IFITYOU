package tw.group5.gym.controller;

import java.security.KeyStore.Entry;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberRepository;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.service.GymLogService;
import tw.group5.gym.service.GymService;

@Controller
@RequestMapping("/group5/admin/gym")
public class GymController {
	
	@Autowired
	private GymService gymService;
	
	@Autowired
	private GymLogService gymLogService;
	
	@Autowired
	private AdminService adminService;
	
	//總表
	@GetMapping("/allMain")
	public String processAllMainAction(Model m) {
		List<GymBean> list =gymService.findGyms(new GymBean());
		m.addAttribute("queryAll",list);
		Map<Integer, Integer> countDel = new HashMap<Integer, Integer>();
		Map<Integer, Integer> countFavorite = new HashMap<Integer, Integer>();
		for(GymBean g: list) {
			countDel.put(g.getGymId(), gymLogService.countByGymDelAndGym(g));
			countFavorite.put(g.getGymId(), gymLogService.countGymLog(g).getNumberOfFavorite());
		}
		m.addAttribute("countDel",countDel);
		m.addAttribute("countFavorite",countFavorite);
		System.out.println(countDel);
		return "gym/gymAll";
	}
	
	//總表資料
	@PostMapping("/main/data")
	@ResponseStatus(HttpStatus.OK)
	public void processMainDataAction(Model m) {

//		Map<Integer, Integer> countDel = new HashMap<Integer, Integer>();
//		Map<Integer, Integer> countFavorite = new HashMap<Integer, Integer>();
//		for(GymBean g: list) {
//			countDel.put(g.getGymId(), gymLogService.countByGymDelAndGym(g));
//			countFavorite.put(g.getGymId(), gymLogService.countGymLog(g).getNumberOfFavorite());
//		}
//		m.addAttribute("countDel",countDel);
//		m.addAttribute("countFavorite",countFavorite);
		
	}
	
	//點編輯按鈕後
	@PostMapping("/allUpdate/{gname}")
	@ResponseBody
	public GymBean processQueryUpdate(@PathVariable("gname") String gymName) {
		GymBean result = gymService.queryName(gymName);		
		return result;
	}
	
	//編輯頁面送出
	@PostMapping("/allUpdateAction")
	@ResponseBody
	public GymBean processAllUpdateAction(@RequestBody GymBean gym1) {
		  return gymService.update(gym1);
	}
	
	//點刪除紐
	@PostMapping("/allDelete/{gname}")
	public String processAllDeleteAction(@PathVariable("gname") String gymName) {
		GymBean deletegym = gymService.queryName(gymName);
		List<GymLog> gymLogs = gymLogService.findByGym(deletegym);
		for(GymLog log: gymLogs) {
			gymLogService.deletelog(log);
		}
		String delete = gymService.delete(deletegym);
		System.out.println(delete);
		return "gymAll";
	}
	
	//傳到detail頁面
	@PostMapping("/gymDetail/{gName}")
	public String processDetailPageAction(@PathVariable("gName") String gName, int memberIdNow, Model m) {
		GymBean gym = gymService.queryName(gName);
		m.addAttribute("selectedGym", gym);		
		MemberBean member = adminService.selectOneMember(memberIdNow);		
		GymLog logStatus = gymLogService.findByMemberAndGym(member, gym);
		System.out.println(logStatus);
		if(logStatus!=null) {
			List<GymLog> memberlist = gymLogService.findByGym(gym);
			m.addAttribute("memberlist", memberlist);
			m.addAttribute("logStatus", logStatus);			
		}
		return "/gym/gymDetail";
	}
	
	
	
	//直接導到新增頁面
	@RequestMapping(path = "/addMain", method = RequestMethod.GET)
	public String processAddMainAction() {
		return "gym/gymAdd";
	}
	
	//新增頁面點擊送出
	@PostMapping("/addGymAction")
	@ResponseBody
	public GymBean processAddAction(@RequestBody GymBean gym1) {
		return gymService.add(gym1);
	}
}
