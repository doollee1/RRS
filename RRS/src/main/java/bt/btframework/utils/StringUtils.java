package bt.btframework.utils;

public class StringUtils {
	/**
	 * 문자열 null일때 defaultValue 반환
	 * @param source
	 * @param defaultValue
	 * @return
	 */
	public static String NULL(String source, String defaultValue) {
		if ("null".equals(source))
			return defaultValue;
		return source;
	}
	/**
	 * 문자열 null일때 defaultValue 반환
	 * @param source
	 * @param defaultValue
	 * @return
	 */
	public static String NULL(Object source, String defaultValue) {
		if (null == source || "".equals(source.toString()))
			return defaultValue;
		return source.toString();
	}
	/**
	 * 문자열 null일때 defaultValue 반환
	 * @param source
	 * @return
	 */
	public static String NULL(Object source) {
		if (null == source)
			return Constants.EMPTY_STRING;
		return source.toString();
	}
	/**
	 * null인지 체크
	 * @param source
	 * @return
	 */
	public static boolean isNotEmpty(String source) {
		return ("".equals(NULL(source)) ? false : true);
	}
	
	/**
	 * 변수가 null이거나 빈값 여부
	 * @param {Object} obj : 검사할 값
	 * @return {boolean} true : null 또는 빈값, false : 값 존재
	 */
	public static boolean isEmpty(Object obj) {
		boolean flag = false;
		
		if (obj == null) {
			flag = true;
		} else {
			if (obj.toString().length() < 1)
				flag = true;
		}
		
		return flag;
	}
	/**
	 * 복호화
	 * @param value
	 * @param key
	 * @return
	 */
	public static String decrypted(String value, String key){
		Aria aria = new Aria(key);

		//암호화
		String str = aria.Decrypt(value);
		return str;
	}
	/**
	 * 암호화
	 * @param value
	 * @param key
	 * @return
	 */
	public static String encrypted(String value, String key){
		Aria aria = new Aria(key);

		//암호화
		String str = aria.Encrypt(value);
		return str;
	}
	
	/**
	 * 파일명 생성 위한 랜덤 String 생성
	 * @return
	 */
	public static String getUUID () {
		long unixtime = System.currentTimeMillis();
		
		String result  = String.valueOf(unixtime)  + String.valueOf( (int)(Math.random() * 1000));
		
		return result;
	}
	
	/**
	 * LPadding
	 * @return
	 */
	public static String LPadding(String str, char paddChar, int cnt) {
		return String.format("%"+ String.valueOf(cnt) +"s", str).replace(' ', paddChar);
	} 
	
	/**
	 * LPadding
	 * @return
	 */
	public static String RPadding(String str, char paddChar, int cnt) {
		return String.format("%"+ String.valueOf(-cnt) +"s", str).replace(' ', paddChar);
	}
}
