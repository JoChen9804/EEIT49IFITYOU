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
			session.setAttribute("loginMember", mBean);
			response.sendRedirect("/group5/FrontStageMain");
			
		}else {
			System.out.println("沒有找到使用者，創建新使用者");
			MemberBean newMember = new MemberBean();
			newMember.setAuthority(0);
			newMember.setEmail(email);
			newMember.setMemberName(oauthUser.getName());
			newMember.setMemberAccount(email);
			MemberDetail mDetail = new MemberDetail();
			mDetail.setCreateDate(adminService.getDate());
			//google 登入 無須密碼
			newMember.setMemberPassword("googlelogin");
			mDetail.setMute(0);
			mDetail.setPostPermission(0);
			mDetail.setPairWilling(0);
			mDetail.setRegisterReferralCode(null);
			newMember.setMemberDetail(mDetail);
			adminService.insert(newMember);
			session.setAttribute("loginMember", newMember);
			response.sendRedirect("/group5/FrontStageMain");
		}
	}

}
