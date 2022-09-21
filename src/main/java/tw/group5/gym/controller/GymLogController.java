package tw.group5.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.group5.gym.model.GymLog;
import tw.group5.gym.service.GymLogService;

@Controller
@RequestMapping("/gym")
public class GymLogController {
	
	@Autowired
	private GymLogService gLogService;
	
	//更新收藏狀態為true(1)
	@PostMapping("/gymFavorite/{logId}")
	@ResponseBody
	public GymLog processUpdateFavoriteAction(@PathVariable("logId") int logId) {
		GymLog gymLog = gLogService.findById(logId);
		if(gymLog.getFavorite()==null || gymLog.getFavorite()==1) {
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
		return gLogService.addGymLog(gLog);
	}
	
	
	//更新評分
	@PostMapping("/gymRating/{logId}/{rating}")
	@ResponseBody
	public GymLog processUpdateRatingAction(@PathVariable("logId") int logId,@PathVariable("rating") int rating) {
		GymLog gymLog = gLogService.findById(logId);
		gymLog.setRating(rating);
		return gLogService.updateGymLog(gymLog);
	}
	
	//新增評分
	@PostMapping("/gymRating")
	@ResponseBody
	public GymLog processAddRatingAction(@RequestBody GymLog gLog) {
		return gLogService.addGymLog(gLog);
	}
}
