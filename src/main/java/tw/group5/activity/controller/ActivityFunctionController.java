package tw.group5.activity.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.activity.model.ActivityActivity;
import tw.group5.activity.model.ActivityVoucher;
import tw.group5.activity.service.ActivityActivityService;
import tw.group5.activity.service.ActivityVoucherService;

@Controller
@RequestMapping("/group5")
public class ActivityFunctionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
	 * voucher
	 */
	@Autowired
	public ActivityVoucherService vService;

	@GetMapping("/vouchermain.controller")
	public String processvoucherMainAction(Model m) {
		List<ActivityVoucher> voucher = vService.findAll();
		m.addAttribute("voucher_queryAll", voucher);
		m.addAttribute("page", "voucher");
		return "activity/ActivityQueryAll";
	}

	@PostMapping("/addvoucher.controller")
	public String voucherAdd(@ModelAttribute(name = "voucher") ActivityVoucher voucher, String add, MultipartFile photo, Model m)
			throws IllegalStateException, IOException {
		if (add.equals("新增")) {
			ActivityVoucher vAdd = new ActivityVoucher();
			m.addAttribute(vAdd);
			return "activity/ActivityVoucherAdd";
		} else {
			if(!photo.isEmpty()) {
				String imgName = vService.processImg(voucher.getVoucherNo(), photo);
				voucher.setPhotoData(imgName);
			}
			voucher.setReviseTime(vService.getTime());
			if (vService.insert(voucher)!=null) {
				m.addAttribute("add_voucher", vService.selectById(voucher.getVoucherId()));
				m.addAttribute("page", "voucher");
				return "activity/ActivityConfirm";
			}
			return "redirect:vouchermain.controller";
		}
	}

	@PostMapping("/updatevoucher.controller")
	public String voucherUpdate(@ModelAttribute(name = "voucher") ActivityVoucher voucher, String update, int dataId, String oldimg, MultipartFile photo, Model m )
			throws IllegalStateException, IOException {
		
		System.out.println(update+"測試");
		
		if (update.equals("修改")) {
			ActivityVoucher vUpdate = vService.selectById(dataId);
			m.addAttribute("update_voucher", vUpdate);
			return "activity/ActivityVoucherUpdate";
		} else {
			voucher.setReviseTime(vService.getTime());
			if (photo.isEmpty()) {
				voucher.setPhotoData(oldimg);
			} else {
				String imgName = vService.processImg(voucher.getVoucherNo(), photo);
				voucher.setPhotoData(imgName);
			}
			if (vService.update(voucher) != null) {
				m.addAttribute("update_voucher", voucher);
				m.addAttribute("page", "voucher");
				m.addAttribute("upd", true);
				return "activity/ActivityConfirm";
			}
			return "redirect:vouchermain.controller";
		}
	}

	@PostMapping("/deletevoucher.controller")
	public String voucherDelete(Model m, int dataId) {
		vService.delete(dataId);
		return "redirect:vouchermain.controller";
	}

	@PostMapping("/queryvoucher.controller")
	public String voucherQuery(@RequestParam("dataId") int id, Model m) {
		ActivityVoucher v = vService.selectById(id);
		m.addAttribute("query_voucher", v);
		m.addAttribute("page", "voucher");
		m.addAttribute("query", true);
		return "activity/ActivityConfirm";
	}
	
	/*
	 * Activity
	 */
	@Autowired
	private ActivityActivityService aService;
	
	@GetMapping("/activitymain.controller")
	public String processMainActivityAction(Model m) {
		List<ActivityActivity> activity = aService.findAll();
		m.addAttribute("activity_queryAll", activity);
		m.addAttribute("page", "activity");
		return "activity/ActivityQueryAll";
	}
	
	@PostMapping("/addactivity.controller")
	public String voucherAdd(@ModelAttribute(name = "activity") ActivityActivity activity, String add, MultipartFile photo, Model m)
			throws IllegalStateException, IOException {
		if (add.equals("新增")) {
			ActivityActivity aAdd = new ActivityActivity();
			m.addAttribute(aAdd);
			return "activity/ActivityActivityAdd";
		} else {
			if(!photo.isEmpty()) {
				String imgName = aService.processImg(activity.getActivityTitle(), photo);
				activity.setPhotoData(imgName);
			}
			activity.setReviseTime(aService.getTime());
			if (aService.insert(activity)!=null) {
				m.addAttribute("add_activity", aService.selectById(activity.getActivityId()));
				m.addAttribute("page", "activity");
				return "activity/ActivityConfirm";
			}
			return "redirect:activitymain.controller";
		}
	}
	
	@PostMapping("/updateactivity.controller")
	public String activityUpdate(@ModelAttribute(name = "activity") ActivityActivity activity, String update, int dataId, String oldimg, MultipartFile photo, Model m )
			throws IllegalStateException, IOException {
		if (update.equals("修改")) {
			ActivityActivity aaUpdate = aService.selectById(dataId);
			
			System.out.println("舊物件活動內容:"+aaUpdate.getActivityContent());
			
			m.addAttribute("update_activity", aaUpdate);
			return "activity/ActivityActivityUpdate";
		} else {
			
			System.out.println("更新資料ID : " + activity.getActivityId());
			
			activity.setReviseTime(aService.getTime());
			if (photo.isEmpty()) {
				activity.setPhotoData(oldimg);
			} else {
				String imgName = aService.processImg(activity.getActivityTitle(), photo);
				activity.setPhotoData(imgName);
			}
			if (aService.update(activity) != null) {
				m.addAttribute("update_activity", activity);
				m.addAttribute("page", "activity");
				m.addAttribute("upd", true);
				return "activity/ActivityConfirm";
			}
			return "redirect:activitymain.controller";
		}
	}
	
	@PostMapping("/deleteactivity.controller")
	public String activityDelete(Model m, int dataId) {
		aService.delete(dataId);
		return "redirect:activitymain.controller";
	}

	@PostMapping("/queryactivity.controller")
	public String activityQuery(@RequestParam("dataId") int id, Model m) {
		ActivityActivity aa = aService.selectById(id);
		m.addAttribute("query_activity", aa);
		m.addAttribute("page", "activity");
		m.addAttribute("query", true);
		return "activity/ActivityConfirm";
	}
	

}
