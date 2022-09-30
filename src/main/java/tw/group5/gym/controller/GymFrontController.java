package tw.group5.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.service.GymLogService;
import tw.group5.gym.service.GymService;

@Controller
@RequestMapping("/group5/gym")
public class GymFrontController {
	
	@Autowired
	private GymService gymService;
	
	@Autowired
	private GymLogService gymLogService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/search")
	public String showGymsDataPage(Model m) {
		List<GymBean> list =gymService.findGyms(new GymBean());
		m.addAttribute("searchAllGym",list);
		return "/gym/gymFrontAll";
	}
	
	
	//傳到detail頁面
	@PostMapping("/searchDetail/{gName}")
	public String processDetailPageAction(@PathVariable("gName") String gName, int memberIdNow, Model m) {
		GymBean gym = gymService.queryName(gName);
		m.addAttribute("gymDetail", gym);
		System.out.println(memberIdNow);
		if(memberIdNow!=0) {
			MemberBean member = adminService.selectOneMember(memberIdNow);		
			GymLog logStatus = gymLogService.findByMemberAndGym(member, gym);
			System.out.println(logStatus);
			if(logStatus!=null) {
				List<GymLog> memberlist = gymLogService.findByGym(gym);
				m.addAttribute("memberlist", memberlist);
				m.addAttribute("logStatus", logStatus);			
			}
		}
		return "/gym/gymFrontDetail";
	}
}
