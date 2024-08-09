package bt.btframework.aops;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bt.btframework.common.vo.LoginVO;
import bt.btframework.utils.Constants;
import bt.btframework.utils.StringUtils;

/**
 * 서비스 인터셉터
 * 
 * @author DOOLLEE2
 *
 */
public class ServiceInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(ServiceInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		LoginVO userInfo = (LoginVO) request.getSession().getAttribute("loginVO");

		String requestURI = request.getRequestURI(); // 요청 URI
		
		if (userInfo != null) {
			logger.info("[USER ID: " + userInfo.getUserId() + "][REQUEST URI: " + requestURI + "]");
		}
		
		if ( requestURI.indexOf("/login/login.do") < 0 && 
			 requestURI.indexOf("/index.do") < 0 &&
			 requestURI.indexOf("/login/actionLogin.do") < 0 &&
			 requestURI.indexOf("/login/sessionout.do") < 0 ) {
			
			// 정상적인 세션정보가 없으면 로그인페이지로 이동
			logger.info("======= userInfo : "+userInfo);			
			
			if (userInfo == null) {
				
				logger.info("======= Header METHOD_ID : "+request.getHeader(Constants.METHOD_ID));
				
				if (request.getHeader(Constants.METHOD_ID) != null) {
					
					// Ajax일 경우
					response.sendError(991);					
															
				} else {
					
					//세션아웃 페이지로 이동
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login/sessionout.jsp");
					dispatcher.forward(request, response);					
											 					
				}
																
			}
			
		}

		response.addHeader("METHOD_ID", StringUtils.NULL(request.getHeader(Constants.METHOD_ID)));
		return super.preHandle(request, response, handler);
	}
}
