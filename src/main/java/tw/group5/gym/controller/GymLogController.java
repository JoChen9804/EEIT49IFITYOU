package tw.group5.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.service.AdminService;
import tw.group5.gym.model.GymBean;
import tw.group5.gym.model.GymLog;
import tw.group5.gym.service.GymLogService;
import tw.group5.gym.service.GymService;

@Controller
@RequestMapping("/group5/admin/gym")
public class GymLogController {
	
	@Autowired
	private GymLogService gLogService;
	
	@Autowired
	private GymService gymService;
	
	@Autowired
	private AdminService adminService;
	
	//更新收藏狀態為true(1)
	@PostMapping("/gymFavorite/{logId}")
	@ResponseBody
	public GymLog processUpdateFavoriteAction(@PathVariable("logId") int logId) {
		GymLog gymLog = gLogService.findById(logId);
		gymLog.setGymId(gymLog.getGym().getGymId());
		if(gymLog.getFavorite()==null || gymLog.getFavorite()==0) {
			System.out.println("set true");
			gymLog.setFavorite(1);
			return gLogService.updateGymLog(gymLog);
		}else {
			System.out.println("set false");
			gymLog.setFavorite(0);
			return gLogService.updateGymLog(gymLog);
		}
	}
	
	//新增收藏
	@PostMapping("/gymFavorite")
	@ResponseBody
	public GymLog processAddFavoriteAction(@RequestBody GymLog gLog) {
		gLog.setGym(gymService.findById(gLog.getGymId()));
		return gLogService.addGymLog(gLog);
	}
	
	
	//更新評分
	@PostMapping("/gymRating/{logId}/{rating}")
	@ResponseBody
	public GymLog processUpdateRatingAction(@PathVariable("logId") int logId,@PathVariable("rating") int rating) {
		GymLog gymLog = gLogService.findById(logId);
		gymLog.setRating(rating);
		GymLog gymLogResult = gLogService.updateGymLog(gymLog);
		gymService.updateGymRating(gymLog.getGym().getGymId());
		return gymLogResult;
	}
	
	//新增評分
	@PostMapping("/gymRating")
	@ResponseBody
	public GymLog processAddRatingAction(@RequestBody GymLog gLog) {
		gLog.setGym(gymService.findById(gLog.getGymId()));
		gLog.setMember(adminService.selectOneMember(gLog.getMemberId()));
		GymLog gymLogResult = gLogService.addGymLog(gLog);
		gymService.updateGymRating(gLog.getGymId());
		return gymLogResult;
	}
}
