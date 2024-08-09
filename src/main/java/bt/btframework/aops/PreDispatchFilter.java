/**
 * 
 */
package bt.btframework.aops;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.filter.GenericFilterBean;

import bt.btframework.common.vo.LoginVO;
import bt.btframework.utils.Constants;
import bt.btframework.utils.StringUtils;

/**
 * 디스패처 필터
 * 
 * @author DOOLLEE2
 *
 */
public class PreDispatchFilter extends GenericFilterBean {

	private static final Logger logger = LoggerFactory.getLogger(PreDispatchFilter.class);

	
	/**
	 * 인터셒터 기능을 Filter에서 구현
	 */
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		logger.info("====== PreDispatchFilter ======");
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
				
		
		LoginVO userInfo = (LoginVO) request.getSession().getAttribute("loginVO");		
		String requestURI = request.getRequestURI().toLowerCase().trim();
		
		if (userInfo != null) {
			logger.info("[USER ID: " + userInfo.getUserId() + "][REQUEST URI: " + requestURI + "]");
		}
		
		
		if (requestURI.indexOf("/") < 0 &&
			requestURI.indexOf("/login/login.do") < 0 && 
			requestURI.indexOf("/index.do") < 0 &&
			requestURI.indexOf("/login/actionLogin.do") < 0 &&
			requestURI.indexOf("/login/sessionout.do") < 0 && 
			requestURI.indexOf("/login/logout.do") < 0) {
				
			// 정상적인 세션정보가 없으면 로그인페이지로 이동				
			if (userInfo == null) {
														
				logger.info("======= Header METHOD_ID : "+request.getHeader(Constants.METHOD_ID));				
				logger.info("====== sessionout 페이지로 이동");
				
				if (StringUtils.isNotEmpty(request.getHeader(Constants.METHOD_ID))) {
					
					// Ajax일 경우
					response.sendError(991);																			
				}  else {
					
					//세션아웃 페이지로 이동
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login/sessionout.jsp");
					dispatcher.forward(request, response);
					return;	
				}
			}				
		} 
		
		response.addHeader(Constants.METHOD_ID, StringUtils.NULL(request.getHeader(Constants.METHOD_ID)));
		chain.doFilter(req, res);
	}

}
