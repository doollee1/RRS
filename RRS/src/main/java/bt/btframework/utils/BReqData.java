package bt.btframework.utils;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class BReqData extends HashMap<String, Object> implements Serializable {
private static final long serialVersionUID = 1L;
	
	public BReqData() {
	}

	public String getSID() {
		return (String) super.get("sid");
	}
	
	/**
	 * 문자열 형태의 파라미터 받기
	 * @param key : 파라미터 키값
	 */
	public String getParamDataVal(String key) {
		String str = null;
		
		if (super.get(key) != null) {
			str = (String) super.get(key);
		}
		
		return str;
	}

	/**
	 * Map 형태의 파라미터 받기
	 * @param key : 파라미터 키값
	 */
	@SuppressWarnings("unchecked")
	public BMap getParamDataMap(String key) {
		BMap ldMap = null;
		
		if (super.get(key) != null) {
			ldMap = new BMap((HashMap<String, Object>) super.get(key));
			
//			ldMap.put("LOGIN_USERCD", LoginInfo.getUsercd());
			
			//jsp 페이지 별로 language param 생성 하는 코드 제거를 위함.
			ldMap.put("LANG", LoginInfo.getLang());
//			ldMap.put("LOGIN_IP", ClientInfo.getClntIP());
		}
		
		return ldMap;
	}
	
	/**
	 * List 형태의 파라미터 받기
	 * @param key : 파라미터 키값
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getParamDataList(String key) {
		List<BMap> ldList = null;
		
		if (super.get(key) != null) {
			ldList = (List<BMap>) super.get(key);
		}
		
		return ldList;
	}
}
