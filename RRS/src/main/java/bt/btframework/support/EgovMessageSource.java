package bt.btframework.support;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.MessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class EgovMessageSource extends ReloadableResourceBundleMessageSource implements MessageSource {

	private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;

	/**
	 * getReloadableResourceBundleMessageSource() 
	 * @param reloadableResourceBundleMessageSource - resource MessageSource
	 * @return ReloadableResourceBundleMessageSource
	 */	
	public void setReloadableResourceBundleMessageSource(ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource) {
		this.reloadableResourceBundleMessageSource = reloadableResourceBundleMessageSource;
	}
	
	/**
	 * getReloadableResourceBundleMessageSource() 
	 * @return ReloadableResourceBundleMessageSource
	 */	
	public ReloadableResourceBundleMessageSource getReloadableResourceBundleMessageSource() {
		return reloadableResourceBundleMessageSource;
	}
	
	/**
	 * 정의된 메세지 조회
	 * @param code - 메세지 코드
	 * @return String
	 */	
	public String getMessage(String code) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		
		Object locale = session.getAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE");
		
		if(locale == null) {
			return getReloadableResourceBundleMessageSource().getMessage(code, null, Locale.GERMAN);
		} else {
			return getReloadableResourceBundleMessageSource().getMessage(code, null, (Locale) locale);
		}
	}

	/**
	 * 정의된 메세지 조회
	 * @param code - 메세지 코드
	 * @return String, String[]
	 */	
	public String getMessage(String code, String[] param) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		
		Object locale = session.getAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE");
		
		if(locale == null) {
			return getReloadableResourceBundleMessageSource().getMessage(code, param, Locale.GERMAN);
		} else {
			return getReloadableResourceBundleMessageSource().getMessage(code, param, (Locale) locale);
		}
	}

}