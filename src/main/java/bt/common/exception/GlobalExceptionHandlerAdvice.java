package bt.common.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


import bt.btframework.utils.BRespData;
import bt.btframework.utils.ResponseStatus;

@ControllerAdvice
public class GlobalExceptionHandlerAdvice {
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandlerAdvice.class);
	
	
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public BRespData handleRuntimeException(Exception e) {
		logger.error(e.getLocalizedMessage());
		
		ResponseStatus status = ResponseStatus.Internal_Server_Error;
		status.setDescription(e.getLocalizedMessage());
		return new BRespData(status);
	}
}
