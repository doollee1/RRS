package bt.btframework.support;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bt.api.aop.RereadableRequestWrapper;

//@WebFilter(urlPatterns = {"/api/*"}, description = "CORS")
public class CORSFilter implements Filter {
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse response = (HttpServletResponse) res;
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type, Access-Control-Allow-Headers, Authorization, Accept, Accept-Language, User-Agent");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		HttpServletRequest request = (HttpServletRequest ) req;
		RereadableRequestWrapper rereadableRequestWrapper = new RereadableRequestWrapper(request);
		chain.doFilter(rereadableRequestWrapper , response);
	}
	
	public void init(FilterConfig filterConfig) {
	}
	
	public void destroy() {
	}
}