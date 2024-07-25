package bt.common.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


import bt.btframework.utils.BRespData;
import bt.btframework.utils.ResponseStatus;

/**
 * 전역예외핸들러 클래스
 * 
 * @author DOOLLEE2
 *
 */
@ControllerAdvice
public class GlobalExceptionHandlerAdvice {
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandlerAdvice.class);
	
	
	/**
	 * 전역예외 핸들러
	 * 
	 * @param e
	 * @return
	 */
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public BRespData handleRuntimeException(Exception e) {
		
		logger.info("===== 전역에외핸들러 =====");
		logger.info("===== 예외명 : "+e.getClass().getSimpleName());
		logger.error("===== handleRuntimeException : "+e.getLocalizedMessage());
		e.printStackTrace();
		
		
		if("IllegalStateException".equals(e.getClass().getSimpleName())) {
				
			logger.info("===== response 초기화 필요=====");			
		}
		
		ResponseStatus status = ResponseStatus.Internal_Server_Error;
		status.setDescription(e.getLocalizedMessage());
		return new BRespData(status);
	}
	
}
