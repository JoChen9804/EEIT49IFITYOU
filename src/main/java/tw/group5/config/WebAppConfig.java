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
		
		
		//明企的~~~~
        registry.addResourceHandler("/styles/**").addResourceLocations("/WEB-INF/postfolder/styles/");
        registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/postfolder/js/");
        registry.addResourceHandler("/images/**").addResourceLocations("file:/D:/posts/");
        registry.addResourceHandler("/imagestest/**").addResourceLocations("/WEB-INF/postfolder/images/");
	}

}
