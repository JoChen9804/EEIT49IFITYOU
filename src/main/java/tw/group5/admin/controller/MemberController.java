package tw.group5.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import net.bytebuddy.utility.RandomString;
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
			String detailId, Model m, HttpSession session) {

		String memberPhoto;
		Integer authority = 0;
		// 修改
		String modifyPassword;
		modifyPassword = originalRealPassword;

		MemberBean nowMember = (MemberBean) session.getAttribute("loginMember");
		System.out.println(nowMember);

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
	public ResponseEntity<String> memberAccountCheck(@RequestBody MemberBean mBean) {

		boolean status = adminService.findAccount(mBean.getMemberAccount());
		if (status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}

	@PostMapping(path = "/memberEmailCheck.controller") // 重複Email確認
	public ResponseEntity<String> memberEmailCheck(@RequestBody MemberBean mBean) {

		boolean status = adminService.findEmail(mBean.getEmail());
		if (status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}

	@PostMapping(path = "/memberReferralCheck.controller") // referralCode存在確認
	public ResponseEntity<String> memberReferralCheck(@RequestBody MemberDetail mDetail) {
		System.out.println("推薦碼");
		System.out.println(mDetail.getReferralCode());
		boolean status = adminService.findByReferralCode(mDetail.getReferralCode());
		if (status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}

	@PostMapping(path = "/register.controller")
	public String registerAction(String account, String pwd, String name, String email, String registerReferralCode,
			Model m) {
		System.out.println("開始創建會員");
		Integer authority = 99;
		String bcEncode = new BCryptPasswordEncoder().encode(pwd);
		MemberDetail mDetail = new MemberDetail();
		mDetail.setRegisterReferralCode(registerReferralCode);
		mDetail.setCreateDate(adminService.getDate());
		mDetail.setMute(0);
		mDetail.setPostPermission(0);
		mDetail.setPairWilling(0);
		String randomCode = RandomString.make(64);

		MemberBean mBean = new MemberBean(account, bcEncode, authority, name, email, mDetail);
		mBean.setVerificationCode(randomCode);

		MemberBean mBean1 = adminService.updateOne(mBean);
		System.out.println("會員創建成功(尚未驗證)");

		String referralCode = adminService.encode(mBean1.getId());
		// 生成推薦碼
		MemberDetail memberDetail = mBean1.getMemberDetail();
		memberDetail.setReferralCode(referralCode);
		adminService.updateCodeById(memberDetail);
		
		// 寄出驗證信
		adminService.sendRegisterMail(email, name, randomCode, "AdminMailtemplete", "I FIT YOU 新會員註冊開通信");
		
		// 有填推薦人，寄推薦碼給推薦人
		if (registerReferralCode != null && !registerReferralCode.isEmpty()) {
			MemberBean mBeanReff = adminService.findMemberByReferralCode(mDetail.getRegisterReferralCode());
			adminService.sendRegisterMail(mBeanReff.getEmail(), name, randomCode, "AdminReferralCode", "I FIT YOU 推薦人優惠碼發送");
		}
		
		
		return "admin/FrontStageMain";

	}

	@GetMapping("/verify")
	public String verifyUser(@Param("code") String code) {
		if (adminService.verify(code)) {
			System.out.println("會員驗證成功");
			return "admin/VerifySuccess";

		} else {

			System.out.println("會員驗證失敗");
			return "admin/VerifyFail";
		}

	}

}
