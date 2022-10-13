package tw.group5.gym.controller;

import java.io.IOException;
import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		System.out.println(gLog.getMemberId());
		gLog.setMember(adminService.selectOneMember(gLog.getMemberId()));
		GymLog gymLogResult = gymLogService.addGymLog(gLog);
		gymService.updateGymRating(gLog.getGym().getGymId());
		return gymLogResult;
	}
	
	//導至新增頁面
	@GetMapping("/user/gym/add")
	public String processAddGymFront() {
		return "/gym/gymFrontAdd";
	}
	
	
	//新增頁面
	@PostMapping("/user/gym/addGym")
	@ResponseBody
	public GymBean processAddAction(@RequestBody GymBean gym1) {
		return gymService.add(gym1);
	}
	
	//圖片上傳處理+寫進資料庫
	@PostMapping("/user/gym/addPicture")
	public String processPictureAction(int gymId, MultipartFile photo) {
		GymBean gym1 = gymService.findById(gymId);
		if(photo.isEmpty()) {
			gym1.setGymPicture("/group5/images/gym-default.png");
		}else {
			String imgName;
			try {
				imgName = gymService.processImg(gymId, photo);
				gym1.setGymPicture("/group5/images/"+imgName);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		gymService.update(gym1);
		return "/gym/gymFrontAdd";
	}
	
	//前端編輯頁面
	@GetMapping("/user/gym/edit/{gymId}")
	public String processUpdate(@PathVariable("gymId") int gymId,Model m) {
		GymBean result = gymService.findById(gymId);
		m.addAttribute("update", result);
		return "/gym/gymFrontEdit";
	}
	
	@PostMapping("/user/gym/editAction")
	@ResponseBody
	public GymBean processUpdateAction(@RequestBody GymBean gym1) {
		return gymService.update(gym1);
	}
	//圖片修改
	@PostMapping("/user/gym/editPicture")
	public String processPictureAction2(int gymId, MultipartFile photo, Model m) {
		GymBean gym1 = gymService.findById(gymId);
		if(!photo.isEmpty()) {
			String imgName;
			try {
				imgName = gymService.processImg(gymId, photo);
				System.out.println(imgName);
				gym1.setGymPicture("/group5/images/"+imgName);
				GymBean update = gymService.update(gym1);
				m.addAttribute("update", update);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "/gym/gymFrontEdit";
	}
	
	//刪除申請
	@PostMapping("/user/gym/delete")
	@ResponseBody
	public String processDelete(@RequestBody GymLog gymLog,Model m) {
		System.out.println(gymLog.getLogId());
		gymLogService.updateGymLog(gymLog);
		return "申請刪除成功";
	}
	
	@PostMapping("/user/gym/delete/{logId}")
	@ResponseBody
	public String processDelete2(@PathVariable("logId")Integer logId,Model m) {
		GymLog glog2 = gymLogService.findById(logId);
		glog2.setGymDel(1);
		gymLogService.updateGymLog(glog2);
		return "申請刪除成功";
	}
	
}
