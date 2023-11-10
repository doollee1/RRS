package bt.btframework.utils;

/**
 * 소스에서 쓰이는 상수값 정의
 */
public class Constants {
	//METHOD_ID
	public static final String METHOD_ID = "METHOD_ID";
	
	//빈 문자열
	public static final String EMPTY_STRING = "";
	
	//AJAX
	public static final String AJAX = "AJAX";
	
	public static final String EXTENDWHITELIST = "jpg,jpeg,png,gif,xls,xlsx,doc,docx";
	public static final int MAXFILESIZE = 524288000;
	
	//파일 임시 저장경로
	//public static final String TEMPPATH = "C:\\OMS\\apache-tomcat-8.0.47\\webapps\\OMS\\files\\temp";	//개발서버
	public static final String TEMPPATH = "C:\\OMS\\OMS\\src\\main\\webapp\\files\\temp";	//로컬
		
	//공지사항 이미지 첨부 경로
	//public static final String NOTICE_IMAGEPATH = "C:\\OMS\\apache-tomcat-8.0.47\\webapps\\OMS\\files\\noticeImg";  //개발서버
	public static final String NOTICE_IMAGEPATH = "C:\\OMS\\OMS\\src\\main\\webapp\\files\\\noticeImg";  //로컬
	public static final String NOTICE_VIEW_IMAGEPATH = "/files/noticeImg/";
	
	//공지사항 첨부파일 경로
	//public static final String NOTICE_ATTACHFILEPATH = "C:\\OMS\\apache-tomcat-8.0.47\\webapps\\OMS\\files\\noticeFile";  //개발서버
	public static final String NOTICE_ATTACHFILEPATH = "C:\\OMS\\OMS\\src\\main\\webapp\\files\\noticeFile";  //로컬
	public static final String NOTICE_VIEW_ATTACHFILEPATH = "/files/noticeFile/";
}
