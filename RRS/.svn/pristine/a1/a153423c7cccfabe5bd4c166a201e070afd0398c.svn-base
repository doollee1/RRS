package bt.btframework.support;

import javax.servlet.ServletRequestEvent;
import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.util.WebUtils;

public class RequestContextListener extends org.springframework.web.context.request.RequestContextListener {

	@Override
	public void requestInitialized(ServletRequestEvent requestEvent) {
		super.requestInitialized(requestEvent);

		String lang = requestEvent.getServletRequest().getParameter("lang");

		if (lang != null) {
			WebUtils.setSessionAttribute((HttpServletRequest) requestEvent.getServletRequest(), SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, StringUtils.parseLocaleString(lang));
		}
	}
}
