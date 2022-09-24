package tw.group5.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer{
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/group5/login").setViewName("admin/AdminLogin");
		registry.addViewController("/group5/admin/backstage").setViewName("admin/AdminBackstage");
		registry.addViewController("/group5/frontpage").setViewName("admin/FrontStageMain");
		registry.addViewController("/group5/admin/logout").setViewName("admin/FrontStageMAIN");
//		registry.addViewController("/admin/page").setViewName("logout");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/Path/**").addResourceLocations("file:/C:/images/admin/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		
		//貼文的~~~~
        registry.addResourceHandler("/images/**").addResourceLocations("file:/C:/images/posts/");
        registry.addResourceHandler("/group5/admin/imagestest/**").addResourceLocations("/WEB-INF/resources/postfolder/images/");
        registry.addResourceHandler("/group5/admin/styles/**").addResourceLocations("/WEB-INF/resources/postfolder/styles/");
        
		registry.addResourceHandler("/upload/**").addResourceLocations("file:C:/images/admin/");
		registry.addResourceHandler("/group5/**").addResourceLocations("/WEB-INF/resources/");
		registry.addResourceHandler("/group5/admin/**").addResourceLocations("/WEB-INF/resources/");
		registry.addResourceHandler("/group5/member/**").addResourceLocations("/WEB-INF/resources/");
	}

}
