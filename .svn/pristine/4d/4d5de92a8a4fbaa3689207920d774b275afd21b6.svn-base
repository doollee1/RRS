package bt.btframework.utils;

import java.io.Serializable;
import java.util.HashMap;

public class BRespData extends HashMap<String, Object> implements Serializable {
	private static final long serialVersionUID = 1L;

	private static final String STATUS = "CODE";
	private static final String MESSAGE = "MESSAGE";
	private static final String RESULT = "RESULT";
	
	public BRespData() {
		this.put(STATUS, ResponseStatus.OK.getStatus());
		this.put(MESSAGE, ResponseStatus.OK.getDescription());
	}
	
	public BRespData(ResponseStatus status) {
		this.put(STATUS, status.getStatus());
		this.put(MESSAGE, status.getDescription());
	}
	
	public BRespData(ResponseStatus status, Object result) {
		this.put(STATUS, status.getStatus());
		this.put(MESSAGE, status.getDescription());
		this.put(RESULT, result);
	}
	
	public void setURL(String url) {
		this.put("URL", url);
	}
	
	public void setStatus(ResponseStatus status) {
		this.put(STATUS, status.getStatus());
		this.put(MESSAGE, status.getDescription());
	}
	
	public void setData(Object result) { 
		this.put(RESULT, result);
	}
	
	public void setMessage(String message) {
		this.put(MESSAGE, message);
	}
}
