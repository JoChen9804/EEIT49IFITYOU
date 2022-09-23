package tw.group5.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebAppConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/Path/**").addResourceLocations("file:/C:/images/admin/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/resources/js/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/resources/css/");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//貼文的~~~~
        registry.addResourceHandler("/group5/styles/**").addResourceLocations("/WEB-INF/postfolder/styles/");
        registry.addResourceHandler("/group5/js/**").addResourceLocations("/WEB-INF/postfolder/js/");
        registry.addResourceHandler("/group5/imagestest/**").addResourceLocations("/WEB-INF/postfolder/images/");
        registry.addResourceHandler("/images/**").addResourceLocations("file:/C:/images/posts/");
        

	}

}
