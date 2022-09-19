package tw.group5.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.model.ActivityActivity;
import tw.group5.model.ActivityVoucher;
import tw.group5.service.ActivityActivityService;
import tw.group5.service.ActivityVoucherService;

@Controller
public class ActivityFunctionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
	 * voucher
	 */
	@Autowired
	public ActivityVoucherService vSerrvice;

	@GetMapping("/vouchermain.controller")
	public String processvoucherMainAction(Model m) {
		List<ActivityVoucher> voucher = vSerrvice.findAll();
		m.addAttribute("voucher_queryAll", voucher);
		m.addAttribute("page", "voucher");
		return "ActivityQueryAll";
	}

	@PostMapping("/addvoucher.controller")
	public String voucherAdd(@ModelAttribute(name = "voucher") ActivityVoucher voucher, String add, MultipartFile photo, Model m)
			throws IllegalStateException, IOException {
		if (add.equals("新增")) {
			ActivityVoucher vAdd = new ActivityVoucher();
			m.addAttribute(vAdd);
			return "ActivityVoucherAdd";
		} else {
			String imgName = vSerrvice.processImg(voucher.getVoucherNo(), photo);
			voucher.setReviseTime(vSerrvice.getTime());
			voucher.setPhotoData(imgName);
			if (vSerrvice.insert(voucher)!=null) {
				m.addAttribute("add_voucher", vSerrvice.selectById(voucher.getVoucherId()));
				return "ActivityVoucherConfirm";
			}
			return "redirect:vouchermain.controller";
		}
	}

	@PostMapping("/updatevoucher.controller")
	public String voucherUpdate(@ModelAttribute(name = "voucher") ActivityVoucher voucher, String update, int dataId, String oldimg, MultipartFile photo, Model m )
			throws IllegalStateException, IOException {
		if (update.equals("修改")) {
			ActivityVoucher vUpdate = vSerrvice.selectById(dataId);
			m.addAttribute("update_voucher", vUpdate);
			return "ActivityVoucherUpdate";
		} else {
			voucher.setReviseTime(vSerrvice.getTime());
			if (photo.isEmpty()) {
				voucher.setPhotoData(oldimg);
			} else {
				String imgName = vSerrvice.processImg(voucher.getVoucherNo(), photo);
				voucher.setPhotoData(imgName);
			}
			if (vSerrvice.update(voucher) != null) {
				m.addAttribute("update_voucher", voucher);
				m.addAttribute("upd", true);
				return "ActivityVoucherConfirm";
			}
			return "redirect:vouchermain.controller";
		}
	}

	@PostMapping("/deletevoucher.controller")
	public String voucherDelete(Model m, int dataId) {
		vSerrvice.delete(dataId);
//		List<ActivityVoucher> voucher = vSerrvice.findAll();
//		m.addAttribute("voucher_queryAll", voucher);
		return "redirect:vouchermain.controller";
	}

	@PostMapping("/queryvoucher.controller")
	public String voucherQuery(@RequestParam("dataId") int id, Model m) {
		ActivityVoucher v = vSerrvice.selectById(id);
		m.addAttribute("query_voucher", v);
		return "ActivityVoucherQuery";
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
		return "ActivityQueryAll";
	}
	

}
