package tw.group5.controller;

import java.io.IOException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import tw.group5.model.ActivityVoucher;
import tw.group5.service.ActivityVoucherService;

@Controller
public class ActivityFunctionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	public ActivityVoucherService vSerrvice;

	@GetMapping("/activitymain.controller")
	public String processMainAction(Model m) {
		List<ActivityVoucher> voucher = vSerrvice.findAll();
		m.addAttribute("voucher_queryAll", voucher);
		return "ActivityVoucherQueryAll";
	}

	@PostMapping("/addvoucher.controller")
	public String voucherAdd(@ModelAttribute ActivityVoucher voucher, String add, MultipartFile photo, Model m)
			throws IllegalStateException, IOException {
		if (add.equals("新增")) {
			ActivityVoucher vAdd = new ActivityVoucher();
			m.addAttribute(vAdd);
			return "ActivityVoucherAdd";
		} else {
			String imgName = vSerrvice.processImg(voucher.getVoucherId(), photo);
			voucher.setReviseTime(getTime());
			voucher.setPhotoData(imgName);
			if (vSerrvice.insert(voucher)!=null) {
				m.addAttribute("add_voucher", vSerrvice.selectById(voucher.getVoucherId()));
				return "ActivityVoucherConfirm";
			}
			return "ActivityVoucherQueryAll";
		}
	}

	@PostMapping("/updatevoucher.controller")
	public String voucherUpdate(@ModelAttribute ActivityVoucher voucher, String update, int dataId, String oldimg, MultipartFile photo, Model m )
			throws IllegalStateException, IOException {
		if (update.equals("修改")) {
			ActivityVoucher vUpdate = vSerrvice.selectById(dataId);
			m.addAttribute("update_voucher", vUpdate);
			return "ActivityVoucherUpdate";
		} else {
			voucher.setReviseTime(getTime());
			if (photo.isEmpty()) {
				voucher.setPhotoData(oldimg);
			} else {
				String imgName = vSerrvice.processImg(voucher.getVoucherId(), photo);
				voucher.setPhotoData(imgName);
			}
			if (vSerrvice.update(voucher) != null) {
				m.addAttribute("update_voucher", voucher);
				m.addAttribute("upd", true);
				return "ActivityVoucherConfirm";
			}
			return "ActivityVoucherQueryAll";
		}
	}

	@PostMapping("/deletevoucher.controller")
	public String voucherDelete(Model m, int dataId) {
		vSerrvice.delete(dataId);
		List<ActivityVoucher> voucher = vSerrvice.findAll();
		m.addAttribute("voucher_queryAll", voucher);
		return "ActivityVoucherQueryAll";
	}

	@PostMapping("/queryvoucher.controller")
	public String voucherQuery(@RequestParam("dataId") int id, Model m) {
		ActivityVoucher v = vSerrvice.selectById(id);
		m.addAttribute("query_voucher", v);
		return "ActivityVoucherQuery";
	}

	public String getTime() {
		Date date = new Date(System.currentTimeMillis());
		Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date);
	}

}
