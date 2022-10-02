package tw.group5.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.model.GymLogCount;
import tw.group5.gym.service.GymLogService;
import tw.group5.gym.service.GymService;

@Controller
@RequestMapping("/group5")
public class GymFrontController {
	
	@Autowired
	private GymService gymService;
	
	@Autowired
	private GymLogService gymLogService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/gym/search")
	public String showGymsDataPage(Model m) {
		List<GymBean> list =gymService.findGyms(new GymBean());
		m.addAttribute("searchAllGym",list);
		return "/gym/gymFrontAll";
	}
	
	
	//傳到detail頁面
	@PostMapping("/gym/searchDetail/{gName}")
	public String processDetailPageAction(@PathVariable("gName") String gName, int memberIdNow, Model m) {
		GymBean gym = gymService.queryName(gName);
		m.addAttribute("gymDetail", gym);
		System.out.println("memberidrrrrrrrrrrrrrrrrrrrrrrr"+memberIdNow);
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
	
	@PostMapping("/gym/countFavorite")
	@ResponseBody
	public GymLogCount processCountFavoriteAction(@RequestBody GymBean gym) {
		return gymLogService.countGymLog(gym);
	}
	
	
	//更新收藏狀態為true(1)
	@PostMapping("/user/gym/gymFavorite/{logId}")
	@ResponseBody
	public GymLog processUpdateFavoriteAction(@PathVariable("logId") int logId) {
		GymLog gymLog = gymLogService.findById(logId);
		gymLog.setGymId(gymLog.getGym().getGymId());
		if(gymLog.getFavorite()==null || gymLog.getFavorite()==0) {
			System.out.println("set true");
			gymLog.setFavorite(1);
			return gymLogService.updateGymLog(gymLog);
		}else {
			System.out.println("set false");
			gymLog.setFavorite(0);
			return gymLogService.updateGymLog(gymLog);
		}
	}
	
	//新增收藏
	@PostMapping("/user/gym/gymFavorite")
	@ResponseBody
	public GymLog processAddFavoriteAction(@RequestBody GymLog gLog) {
		gLog.setGym(gymService.findById(gLog.getGymId()));
		gLog.setMember(adminService.selectOneMember(gLog.getMemberId()));
		return gymLogService.addGymLog(gLog);
	}
	
	
	//更新評分
	@PostMapping("/user/gym/gymRating/{logId}/{rating}")
	@ResponseBody
	public GymLog processUpdateRatingAction(@PathVariable("logId") int logId,@PathVariable("rating") int rating) {
		GymLog gymLog = gymLogService.findById(logId);
		gymLog.setRating(rating);
		System.out.println(rating+"rattttttttttttttttttttttttting");
		GymLog gymLogResult = gymLogService.updateGymLog(gymLog);
		gymService.updateGymRating(gymLog.getGym().getGymId());
		return gymLogResult;
	}
	
	//新增評分
	@PostMapping("/user/gym/gymRating")
	@ResponseBody
	public GymLog processAddRatingAction(@RequestBody GymLog gLog) {
//		gLog.setGym(gymService.findById(gLog.getGymId()));
		System.out.println(gLog.getMemberId());
		gLog.setMember(adminService.selectOneMember(gLog.getMemberId()));
		GymLog gymLogResult = gymLogService.addGymLog(gLog);
		gymService.updateGymRating(gLog.getGymId());
		return gymLogResult;
	}
	
	
	@GetMapping("/user/gym/add")
	public String processAddGymFrontAction() {
		return "/gym/gymFrontAdd";
	}
	
}
