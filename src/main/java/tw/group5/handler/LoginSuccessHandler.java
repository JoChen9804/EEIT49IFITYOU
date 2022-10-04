package tw.group5.handler;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.service.AdminService;

@SessionAttributes(names = {"loginMember"})
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Autowired 
	private AdminService adminService;
//	AdminService adminService = SpringContextHolder.getBean(AdminService.class);

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		HttpSession session = request.getSession();
        String name = authentication.getName();
		if (roles.contains("ROLE_ADMIN")){
        	System.out.println("抓到了"+name);
			
        	AdminBean aBean = adminService.findByAccount(name);
        	session.setAttribute("loginMember", aBean);
            response.sendRedirect("admin/backstage");

        }
        System.out.println("抓到了"+name);
        MemberBean mBean = adminService.findByAccountMember(name);
        session.setAttribute("loginMember", mBean);		
        response.sendRedirect("FrontStageMain");
	}

}
