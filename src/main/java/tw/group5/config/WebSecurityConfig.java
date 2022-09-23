package tw.group5.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.group5.admin.service.AuthUserDetailService;
import tw.group5.handler.LoginSuccessHandle;


@SuppressWarnings("deprecation") //讓黃線不要顯示
@EnableWebSecurity
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthUserDetailService auDetailService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(auDetailService)
			.passwordEncoder(new BCryptPasswordEncoder());
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		String[] staticResources  =  {
                "/resources/**",
        };
		http
		  .authorizeRequests()
		  .antMatchers(staticResources).permitAll()
		  .antMatchers(HttpMethod.GET, "/group5/admin/**").authenticated()
		  .antMatchers(HttpMethod.GET).permitAll() //get網址
		  .antMatchers(HttpMethod.POST,"/group5/admin/**").authenticated()
		  .antMatchers(HttpMethod.POST).permitAll() //post表單
		  .anyRequest().authenticated()
		  .and()                            //有效時間40分鐘
		  .rememberMe().tokenValiditySeconds(2400).key("rememberMe-key")
		  .and()
		  .csrf().disable()
		  .formLogin()
		  // loginpage.html 表單 action 內容
		  .loginPage("/group5/login")
		  //登入成功要造訪的頁面，使用Handle實現跳轉前後台
		  .defaultSuccessUrl("/group5").successHandler(new LoginSuccessHandle())
		  // 登入失敗後要造訪的頁面
		  .failureForwardUrl("/group5/admin/fail");
		  // 登出
		   
		   http.logout()
		  //刪除cookies
		  .deleteCookies("JSESSIONID")
		  // 設定觸發登出功能的 URL，預設為 /logout
		  .logoutUrl("/group5/logout")                   
		  //登出後會重新導向的 URL，預設是 /login?logout
          .logoutSuccessUrl("/group5/login");
			
	}

}