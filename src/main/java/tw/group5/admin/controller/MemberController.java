package tw.group5.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.service.AdminService;

@SessionAttributes(names = { "loginMember" })
@Controller
@RequestMapping("/group5")
public class MemberController {
	@Autowired
	private AdminService adminService;
	
	@PostMapping(path = "/user/memberModify.controller") // 修改
	private String modifyUserAction(String account, String pwd, String modifyimage, String sub, String idNumString,
			String name, String email, String gender, String nickname, String birthday, String cellphone,
			String zipcode, String address, String registerReferralCode, String match, String pairContactInfo,
			String pairRequest, String pairInfo, String nowimage, @RequestParam("mute") String muteModify,
			@RequestParam("referralCode") String referralCodeModify, String originalRealPassword,
			@RequestParam("postPermission") String postPermissionModify, String hrefSubmit,
			@RequestParam("recentLoginDate") String recentLoginDateModify, @RequestParam("filepath") MultipartFile mf,
			String detailId, Model m) {

		String memberPhoto;
		Integer authority = 0;
		// 修改
		String modifyPassword;
//		System.out.println(originalRealPassword);
//		System.out.println(pwd);
//		System.out.println(detailId);
//		System.out.println(match);
//		System.out.println(pairContactInfo);
//		System.out.println(hrefSubmit);

		modifyPassword = originalRealPassword;

		String referralCode = referralCodeModify;
		Integer mute = Integer.parseInt(muteModify);
		Integer postPermission = Integer.parseInt(postPermissionModify);
		String recentLoginDate = recentLoginDateModify;
		MemberDetail mDetail = new MemberDetail(gender, nickname, birthday, cellphone, zipcode, address, referralCode,
				registerReferralCode, mute, postPermission, Integer.parseInt(match), pairContactInfo, pairRequest,
				pairInfo, recentLoginDate);
		mDetail.setId(Integer.parseInt(detailId));
		MemberBean mBean;
		if (modifyimage.equals("true")) {
			memberPhoto = adminService.imageProcess(account, modifyimage, mf, false);
			mBean = new MemberBean(account, modifyPassword, authority, name, memberPhoto, email, mDetail);
		} else {
			mBean = new MemberBean(account, modifyPassword, authority, name, nowimage, email, mDetail);
		}
		Integer idNum = Integer.parseInt(idNumString);
		mBean.setId(idNum);

		MemberBean member = adminService.updateOne(mBean);
		m.addAttribute("loginMember", member);
		System.out.println("會員修改成功");
		return "admin/UserCenter";
	}
	
	
	@PostMapping(path = "/memberAccountCheck.controller") // 重複帳號確認
	public ResponseEntity<String> memberAccountCheck(@RequestBody MemberBean mBean){

		boolean status = adminService.findAccount(mBean.getMemberAccount());
		if(status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}
	
	@PostMapping(path = "/memberEmailCheck.controller") // 重複Email確認
	public ResponseEntity<String> memberEmailCheck(@RequestBody MemberBean mBean){

		boolean status = adminService.findEmail(mBean.getEmail());
		if(status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}
	
	@PostMapping(path = "/memberReferralCheck.controller") // referralCode存在確認
	public ResponseEntity<String> memberReferralCheck(@RequestBody MemberDetail mDetail){
		System.out.println("推薦碼");
		System.out.println(mDetail.getReferralCode());
		boolean status = adminService.findByReferralCode(mDetail.getReferralCode());
		if(status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}
	

//	@PostMapping(path = "/user/memberPassword.controller") // 修改
//	private ResponseEntity<String> modifyUserPasswordAction() {
//		Boolean rlt = todoService.updateTodo(id ,todo);
//        if (!rlt) {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Status 欄位不能為空");
//        }
//        return ResponseEntity.status(HttpStatus.OK).body("");
//    }return null;
//}
	
}
