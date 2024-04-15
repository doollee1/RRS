package bt.btframework.utils.dataSource;


import java.util.Base64;

/** <PRE>
 * Base64유틸리티 클래스
 * 
 * 클래스 : Base64Util
 * 작성일 : 2008. 11. 16. 오후 07:05:58
 * 작성자 : 정의석
 * </PRE> */
public final class Base64Util {
	/**
	 * 입력받은 문자열을 Base64인코딩 하여 반환.
	 * @param str str
	 */
	public static String encode(String str) {
		String rtnVal = null;
		
		try{
			byte[] plainText = null;
			plainText = str.getBytes();
			
			//BASE64Encoder encoder = new BASE64Encoder();
			//rtnVal encoder.encode(plainText);
			rtnVal = Base64.getEncoder().encodeToString(plainText);
		}catch(Exception e){
			return "";
		}

		return rtnVal;
	}

	public static String encode(byte[] str) {
		String rtnVal = null;

		try{
			byte[] plainText = null;
			plainText = str;

			//BASE64Encoder encoder = new BASE64Encoder();
			//rtnVal = encoder.encode(plainText);
			rtnVal = Base64.getEncoder().encodeToString(plainText);
		}catch(Exception e){
			return "";
		}

		return rtnVal;
	}

	/**
	 * 입력받은 문자열을 Base64디코딩 하여 반환.
	 * @param str str
	 */
	public static String decode(String str) {
		String rtnVal = null;

		try{
			byte[] plainText = null;

			//BASE64Decoder decoder = new BASE64Decoder();
			//plainText = decoder.decodeBuffer(str);
			
			plainText = Base64.getDecoder().decode(str);
			rtnVal = new String(plainText);
		}catch(Exception e){
			return "";
		}

		return rtnVal;
	}

	public static byte[] base64Decode(String str) {
		byte[] plainText = null;
		String rtnVal = null;
		try{

			//BASE64Decoder decoder = new BASE64Decoder();
			//plainText = decoder.decodeBuffer(str);
			
			plainText = Base64.getDecoder().decode(str);
			rtnVal = new String(plainText);
		}catch(Exception e){
			return plainText;
		}

		return plainText;
	}
	
	public static void main(String[] args){
		System.out.println(encode("8103|zetman|a2468|kbkbno1no1"));
		System.out.println(encode("8103|zetman|a2468|"));
		System.out.println(encode("8103|zetman|11111|"));	//잘못된 계정비밀번호
		System.out.println(encode("8103|zetman|a2468|11111111"));	//잘못된 공인인증서 비밀번호
		System.out.println(decode("ODEwM3xqb2Nob2kzOHxhMjQ2OHxrYmtibm8xbm8x"));
		System.out.println(decode("ODEwM3xqb2Nob2kzOHxhMjQ2OHw="));
		System.out.println(decode("ODEwM3xqb2Nob2kzOHwxMTExMXw="));	//잘못된 계정비밀번호
		System.out.println(decode("ODEwM3xqb2Nob2kzOHxhMjQ2OHwxMTExMTExMQ=="));	//잘못된 공인인증서 비밀번호
	}
}