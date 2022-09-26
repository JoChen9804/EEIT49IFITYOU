package tw.group5.admin.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.AdminRepository;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.model.MemberDetailRepository;
import tw.group5.admin.model.MemberRepository;

@Service(value = "adminService")
public class AdminService {

	@Autowired
	private AdminRepository adminRepo;

	@Autowired
	private MemberRepository memberRepo;

	@Autowired
	private MemberDetailRepository memberDetailRepo;

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
		Collections.addAll(memberTitleList, "修改", "刪除", "編號", "照片", "帳號", "密碼", "姓名", "email", "性別", "暱稱", "生日", "手機",
				"郵遞區號", "地址", "推薦碼", "推薦人代碼", "禁言", "貼文權限", "配對意願", "配對聯繫", "配對需求", "給建友的話", "最近登入日期");
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

}
