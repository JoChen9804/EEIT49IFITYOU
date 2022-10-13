package tw.group5.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer{
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/group5/").setViewName("admin/FrontStageMain");
		registry.addViewController("/group5/login").setViewName("admin/AdminLogin");
		registry.addViewController("/group5/admin/backstage").setViewName("admin/AdminBackstage");
		registry.addViewController("/group5/FrontStageMain").setViewName("admin/FrontStageMAIN");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/Path/**").addResourceLocations("file:/C:/images/admin/");
		
		//貼文的~~~~
        registry.addResourceHandler("/images/**").addResourceLocations("file:/C:/images/posts/");
        registry.addResourceHandler("/group5/admin/imagestest/**").addResourceLocations("/WEB-INF/resources/postfolder/images/");
        registry.addResourceHandler("/group5/admin/styles/**").addResourceLocations("/WEB-INF/resources/postfolder/styles/");
        
		registry.addResourceHandler("/upload/**").addResourceLocations("file:C:/images/admin/");
		registry.addResourceHandler("/group5/**").addResourceLocations("/WEB-INF/resources/");
		registry.addResourceHandler("/group5/admin/**").addResourceLocations("/WEB-INF/resources/");
		registry.addResourceHandler("/group5/user/**").addResourceLocations("/WEB-INF/resources/");
		
		//商品管理圖片
		registry.addResourceHandler("/group5/commodityImages/**").addResourceLocations("/WEB-INF/resources/commodityImages/");

		
		//購物圖片
		registry.addResourceHandler("/group5/shoppingBanners/**").addResourceLocations("/WEB-INF/resources/shoppingBanners/");
		//購物Css
		registry.addResourceHandler("/shoppingCss/**").addResourceLocations("/WEB-INF/resources/css/shopping/");

	}

}
