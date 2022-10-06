package tw.group5.admin.model;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class MemberOauth2User implements OAuth2User{
	
	private OAuth2User oauth2User;
    
    public MemberOauth2User(OAuth2User oauth2User) {
		this.oauth2User = oauth2User;
	}

	@Override
    public Map<String, Object> getAttributes() {
        return oauth2User.getAttributes();
    }
 
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
    	String authority = "user,verified,ROLE_USER";
        return AuthorityUtils.commaSeparatedStringToAuthorityList(authority);
    }
 
    @Override
    public String getName() {  
        return oauth2User.getAttribute("name");
    }
 
    public String getEmail() {
        return oauth2User.<String>getAttribute("email");     
    }
    
    public String getPassword() {
    	return oauth2User.getAttribute("password");
    }
}
