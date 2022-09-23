package tw.group5.handler;

import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

/**
 * 以靜態變量保存Spring ApplicationContext, 可在任何代碼任何地方任何時候取出ApplicaitonContext.
 * 
 */
@Service
@Lazy(false)
public class SpringContextHolder implements ApplicationContextAware, DisposableBean {

    private static ApplicationContext applicationContext = null;


    /**
     * 取得存儲在靜態變量中的ApplicationContext.
     */
    public static ApplicationContext getApplicationContext() {
        assertContextInjected();
        return applicationContext;
    }

    /**
     * 從靜態變量applicationContext中取得Bean, 自動轉型為所賦值對象的類型.
     */
    @SuppressWarnings("unchecked")
    public static <T> T getBean(String name) {
        assertContextInjected();
        return (T) applicationContext.getBean(name);
    }

    /**
     * 從靜態變量applicationContext中取得Bean, 自動轉型為所賦值對象的類型.
     */
    public static <T> T getBean(Class<T> requiredType) {
        assertContextInjected();
        return applicationContext.getBean(requiredType);
    }

    /**
     * 清除SpringContextHolder中的ApplicationContext為Null.
     */
    public static void clearHolder() {
        applicationContext = null;
    }

    /**
     * 實現ApplicationContextAware接口, 註入Context到靜態變量中.
     */
    @Override
    public void setApplicationContext(ApplicationContext appContext) {
        applicationContext = appContext;
    }

    /**
     * 實現DisposableBean接口, 在Context關閉時清理靜態變量.
     */
    @Override
    public void destroy() throws Exception {
        SpringContextHolder.clearHolder();
    }

    /**
     * 檢查ApplicationContext不為空.
     */
    private static void assertContextInjected() {
        Validate.validState(applicationContext != null, "applicaitonContext屬性未註入, 請在applicationContext.xml中定義SpringContextHolder.");
    }
}