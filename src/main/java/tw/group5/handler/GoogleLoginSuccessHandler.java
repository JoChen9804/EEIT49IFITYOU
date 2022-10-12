package tw.group5.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.model.MemberOauth2User;
import tw.group5.admin.service.AdminService;


@SessionAttributes(names = {"loginMember"})
@Component
public class GoogleLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Autowired 
	private AdminService adminService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("進到google跳轉");
		HttpSession session = request.getSession();
		MemberOauth2User oauthUser = (MemberOauth2User) authentication.getPrincipal();		
		String email = oauthUser.getEmail();
		MemberBean mBean = adminService.findMemberByEmail(email);
		
		if (mBean != null) {
			System.out.println("有找到使用者");
	        MemberDetail mDetail = mBean.getMemberDetail();
	        mDetail.setRecentLoginDate(adminService.getDate());
	        
	        adminService.encode(mBean.getId());
	        mBean.setMemberDetail(mDetail);
	        
	        adminService.updateOne(mBean);
			session.setAttribute("loginMember", mBean);
			response.sendRedirect("/group5/FrontStageMain");
			
		}else {
			System.out.println("沒有找到使用者，創建新使用者");
			MemberBean newMember = new MemberBean();
			newMember.setAuthority(0);
			newMember.setEmail(email);
			newMember.setMemberName(oauthUser.getName());
			String [] mAccount = email.split("@");
			newMember.setMemberAccount(mAccount[0]);
			MemberDetail mDetail = new MemberDetail();
			mDetail.setCreateDate(adminService.getDate());
			//google 登入 無須密碼
			newMember.setMemberPassword("googlelogin");
			newMember.setMemberPhoto(oauthUser.getPicture());
			System.out.println(oauthUser.getPicture());
			mDetail.setMute(0);
			mDetail.setPostPermission(0);
			mDetail.setPairWilling(0);
			mDetail.setRegisterReferralCode(null);
			newMember.setMemberDetail(mDetail);
			
			MemberBean addNewMember = adminService.insert(newMember);
			String referralCode = adminService.encode(addNewMember.getId());
			// 生成推薦碼
			MemberDetail memberDetail = addNewMember.getMemberDetail();
			memberDetail.setReferralCode(referralCode);
			adminService.updateCodeById(memberDetail);
			String randomCode = "000";
			session.setAttribute("loginMember", newMember);
			
			// 寄出第三方登入註冊信
			adminService.sendRegisterMail(email, oauthUser.getName(), randomCode, "AdminGoogleLogin", "I FIT YOU 新會員goole登入創建帳號成功信","");
			
			// 有填推薦人，寄推薦碼給推薦人
			response.sendRedirect("/group5/FrontStageMain");
		}
	}

}
