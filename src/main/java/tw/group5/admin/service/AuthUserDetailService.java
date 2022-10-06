package tw.group5.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;


@Service
public class AuthUserDetailService implements UserDetailsService {

	@Autowired
	private AdminService adminService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username);
		String[]usernameAndRole = username.split(",");
		String userName = usernameAndRole[0];
		String role = usernameAndRole[1];
		String authority = null;
		try {
			//"on" 會員登入，權限設定
			if (role.equals("on")){
				MemberBean mBean = adminService.findByAccountMember(userName);
//			System.out.println("username: " + username + "password" + mBean.getMemberPassword());
				if (mBean.getAuthority() == 0) {
					authority = "user,verified,ROLE_USER";
				}
				if (mBean.getAuthority() == 99) {
					authority = "user,unverified,ROLE_VISITOR";
				}
				return new User(mBean.getMemberAccount(),mBean.getMemberPassword(), AuthorityUtils.commaSeparatedStringToAuthorityList(authority));
				//"off" 管理員登入，權限設定
			}else {
				AdminBean aBean = adminService.findByAccount(userName);
				if (aBean.getAuthority() == 2) {
					authority = "admin,normal,ROLE_ADMIN";
				}else {
					authority = "normal,ROLE_ADMIN";
				}
				System.out.println("username: " + username + "password" + aBean.getAdminPwd());
				return new User(aBean.getAdminName(), aBean.getAdminPwd(),  AuthorityUtils.commaSeparatedStringToAuthorityList(authority));

			}	
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}

}
