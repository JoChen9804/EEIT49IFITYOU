package tw.group5.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

@Service
public class TemplateServices {

    @Autowired
    private SpringTemplateEngine templateEngine;
    
    public String render(String template, Map<String, ?> params) {
        Context context = new Context(LocaleContextHolder.getLocale());
        context.setVariables((Map<String, Object>) params);
        return (templateEngine).process(template, context);
    }
}
