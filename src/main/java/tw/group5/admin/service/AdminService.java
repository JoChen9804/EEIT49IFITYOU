package tw.group5.admin.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.activity.model.ActivityVoucher;
import tw.group5.activity.model.ActivityVoucherRepository;
import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.AdminRepository;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.model.MemberDetailRepository;
import tw.group5.admin.model.MemberRepository;

@Service(value = "adminService")
@Transactional
public class AdminService {

	@Autowired
	private AdminRepository adminRepo;

	@Autowired
	private MemberRepository memberRepo;

	@Autowired
	private MemberDetailRepository memberDetailRepo;
	
	@Autowired
	private TemplateServices templateService;

	@Autowired
	private MailService mailService;
	
	@Autowired
	private ActivityVoucherRepository voucherRepo;
	
	public AdminBean findByAccount(String loginUser) {
		Optional<AdminBean> op = adminRepo.findByAccount(loginUser);
		System.out.println(loginUser);
		if (op.isEmpty()) {
//			throw new UserNotFoundExcption("Can't find User");
		}
		return op.get();
	}

	public MemberBean findByAccountMember(String loginUser) {
		Optional<MemberBean> op = memberRepo.findByAccount(loginUser);

		if (op.isEmpty()) {
			return null;
//			throw new UserNotFoundExcption("Can't find User");
		}
		return op.get();
	}

	public List<AdminBean> selectAll() {
		return adminRepo.findAll();
	}

	public List<String> adminTitleList() {
		ArrayList<String> adminTitleList = new ArrayList<>();
		Collections.addAll(adminTitleList, "修改", "刪除", "編號", "照片", "帳號", "密碼", "權限");
		return adminTitleList;
	}

	public List<MemberBean> selectAllMember() {
		return memberRepo.findAll();
	}

	public MemberBean selectOneMember(Integer id) {
		Optional<MemberBean> optional = memberRepo.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public List<String> memberTitleList() {
		List<String> memberTitleList = new ArrayList<String>();
		Collections.addAll(memberTitleList, "修改", "刪除", "編號", "狀態","照片", "帳號", "密碼", "姓名", "email", "性別", "生日", "手機",
				"推薦碼", "郵遞區號", "地址",  "推薦人代碼", "禁言", "配對意願", "創建日期", "最近登入日期");
		return memberTitleList;
	}

	public AdminBean selectOne(Integer id) {
		Optional<AdminBean> optional = adminRepo.findById(id);
		if (optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public AdminBean insert(AdminBean adminBean) {
		return adminRepo.save(adminBean);

	}

	public MemberBean insert(MemberBean mBean) {
		return memberRepo.save(mBean);
	}

	public AdminBean updateOne(AdminBean adminBean) {
		return adminRepo.save(adminBean);
	}

	public MemberBean updateOne(MemberBean memberBean) {
		return memberRepo.save(memberBean);
	}

	public MemberDetail updateCodeById(MemberDetail memberDetail) {
		return memberDetailRepo.save(memberDetail);
	}

	public void deleteData(List<Integer> memberListInteger) {
		adminRepo.deleteByIdIn(memberListInteger);

	}

	public void deleteMemberData(List<Integer> memberListInteger) {
		memberRepo.deleteByIdIn(memberListInteger);
	}

	// 推薦碼自動生成
	public String encode(int uid) {
		char[] baseStrLists = { 'D', 'E', 'F', 'G', '3', 'H', 'M', 'J', '9', 'K', 'L', 'N', 'P', 'Q', 'R', 'S', 'T',
				'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '4', '5', '8', '6', '7', 'A', 'B', 'C' };
		int maxNum = baseStrLists.length;
		String referralCode = "";
		while (uid != 0) {
			int mod = uid % maxNum;
			uid = uid / maxNum;
			referralCode = baseStrLists[mod] + referralCode;
		}
		while (referralCode.length() < 6) {
			referralCode = "X" + referralCode;
		}
		return referralCode;
	}

	// 圖片處理
	public String imageProcess(String account, String modifyimage, MultipartFile mf, Boolean Member) {
		String adminPhoto;
		if (modifyimage.equals("false")) {
			adminPhoto = "/upload" + "/" + "DefaultImage.png";
			return adminPhoto;
		} else {
			// 根據時間戳建立頭像檔案
			String fileName;
			if (Member) {
				fileName = "M" + account + System.currentTimeMillis() + ".jpg";
			} else {
				fileName = account + System.currentTimeMillis() + ".jpg";
			}
			adminPhoto = "/upload" + "/" + fileName;
			// "C:/images/admin"
			String saveFileDir = "C:/images/admin";
			// 複製檔案
			File saveFilePath = new File(saveFileDir, fileName);

			try {
				mf.transferTo(saveFilePath);
			} catch (IllegalStateException | IOException e1) {
				e1.printStackTrace();
			}
		}
		return adminPhoto;

	}

	// 獲取現在日期
	public String getDate() {
		Date nowdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String s = sdf.format(nowdate);

		return s;
	}

	// ------------前台---------------------
	public boolean findAccount(String newUser) {
		Optional<MemberBean> op = memberRepo.findByAccount(newUser);
		if (op.isEmpty()) {
			return false;
		}
		return true;
	}
	//找email(存在確認)
	public boolean findEmail(String newEmail) {
		Optional<MemberBean> op = memberRepo.findByEmail(newEmail);
		if (op.isEmpty()) {
			return false;
		}
		return true;
	}
	
	//找email(回傳人)
	public MemberBean findMemberByEmail(String newEmail) {
		Optional<MemberBean> op = memberRepo.findByEmail(newEmail);
		if (op.isEmpty()) {
			return null;			
		}
		return op.get();
	}
	
	//找推薦碼(存在確認)
	public boolean findByReferralCode(String referralCode) {
		Optional<MemberDetail> op = memberDetailRepo.findByReferralCode(referralCode);
		if (op.isEmpty()) {
			return false;
		}
		return true;
	}
	//找推薦碼(回傳人)
	public MemberBean findMemberByReferralCode(String referralCode) {
		Optional<MemberDetail> op = memberDetailRepo.findByReferralCode(referralCode);
		if (op.isEmpty()) {
			return null;			
		}
		return op.get().getMember();
	}
	
	
	//寄註冊信
	public String sendRegisterMail(String toEmailAddress, String name, 
			String verificationCode, String templete, String subject, String mode) {
		String fromEmail = "eeit49group5@gmail.com";
		List<String> toEmail = new ArrayList<>();
		toEmail.add(toEmailAddress); //
		//取得優惠券
		Optional<ActivityVoucher> op = voucherRepo.findByVoucherTitle(85);
		String coupon = op.get().getVoucherNo();
		
		String verifyURL = "http://localhost:8080/group5" + mode + "?code=" + verificationCode;

		Map<String, String> params = new HashMap<>();
		params.put("name", name);
		params.put("verifyURL", verifyURL);
		params.put("coupon", coupon);
		
		String html = templateService.render(templete, params);
		
		mailService.registerMimeMail(fromEmail, toEmail, subject, html);
		
		return "email";
	}
	
	public boolean verify(String verificationCode) {
	    Optional<MemberBean> op = memberRepo.findByVerificationCode(verificationCode);
	    MemberBean mBean = op.get();
	    if ( mBean == null ) {
	        return false;
	        
	    } else {
	    	
	        mBean.setAuthority(0);
	        memberRepo.save(mBean);
	        return true;
	    }
	     
	}
	public boolean verifyPassword(String verificationCode, String pwd) {
	    Optional<MemberBean> op = memberRepo.findByVerificationCode(verificationCode);
	    MemberBean mBean = op.get();
	    if ( mBean == null ) {
	    	return false;
	        
	    } else {
	    	String bcEncode = new BCryptPasswordEncoder().encode(pwd);
	    	mBean.setMemberPassword(bcEncode);
	    	memberRepo.save(mBean);
	    	System.out.println("密碼修改成功");
	    	return true;
	    }
	}
	
	public boolean checkPassword (String id, String memberPassword, String newPassword) {
		Integer idInteger = Integer.parseInt(id);
		Optional<MemberBean> op = memberRepo.findById(idInteger);
		if (op.isEmpty()) {
			return false;
		}
		String encodedPassword = op.get().getMemberPassword();
		if (encodedPassword.equals("googlelogin")){
			return false;
		}
		if (matches(memberPassword, encodedPassword)) {
			MemberBean mBean = op.get();
			String bcEncode = new BCryptPasswordEncoder().encode(newPassword);
			System.out.println(newPassword);
			mBean.setMemberPassword(bcEncode);
			memberRepo.save(mBean);
			return true;
			
		}
		return false;
	}
	
	public boolean matches(String rawPassword, String encodedPassword) {
	    if (encodedPassword == null || encodedPassword.length() == 0) {
	        return false;
	    }

	    return BCrypt.checkpw(rawPassword, encodedPassword);
	}

}
