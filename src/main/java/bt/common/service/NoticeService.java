package bt.common.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.util.Streams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bt.btframework.common.FileManager;
import bt.btframework.common.fileupload.FileExtFilter;
import bt.btframework.common.fileupload.FileMaxUploadFilter;
import bt.btframework.common.fileupload.FileTransferManager;
import bt.btframework.utils.BMap;
import bt.btframework.utils.Constants;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.StringUtils;
import bt.common.dao.NoticeDao;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("NoticeService")
@PropertySource("classpath:/egovframework/properties/common.properties")
public class NoticeService {
	@Resource(name = "NoticeDao")
	private NoticeDao noticeDao;
	
	@Resource(name = "FileService")
	private FileService fileService;

    @Autowired
    private Environment env;
    
    private static final Logger logger = LoggerFactory.getLogger(NoticeService.class);
    
	/**
	 * 공지사항 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectNoticeInfo(BMap param) throws Exception {
		return noticeDao.selectNoticeInfo(param);
	}
	
	/**
	 * 공지사항 이미지 업로드
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public List<BMap> noticeUploadImage(HttpServletRequest req) throws Exception{

		String fuid = req.getParameter("fileuid");
		if (fuid == null) {
			fuid = StringUtils.getUUID();
		}
		
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
	    List<BMap> list = new ArrayList<BMap>();
		
		for(MultipartFile file : files){
			BMap map = new BMap();
			CommonsMultipartFile cmf = (CommonsMultipartFile) file;			
			String filename = cmf.getOriginalFilename();			
//			System.out.println(filename+": fname");
			
			long filesize = cmf.getSize();
//			System.out.println(filesize+": filesize");
			
	    	String temp = StringUtils.getUUID();	    	
	    	String ext = FileManager.getExtension(filename);	    	
	    	String nFileName = temp + "." + ext;
	    				
	    	// 임시로 파일 저장
	    	FileManager.mkDir(env.getProperty("TEMPPATH"));	    	
	    	File temfile = new File(env.getProperty("TEMPPATH") + nFileName);
	        FileOutputStream fos = new FileOutputStream(temfile);
	    	Streams.copy(cmf.getInputStream(), fos, true);
	    	req.getInputStream().close();
	    	fos.close();
					
			// 파일 업로더 처리
	    	FileManager.mkDir(env.getProperty("NOTICE_IMAGEPATH"));	    
	    	FileTransferManager transferManager = new FileTransferManager(env.getProperty("NOTICE_IMAGEPATH"));    	
	    	
	    	transferManager.addFilter( new FileExtFilter(env.getProperty("EXTENDWHITELIST"), filename) ); // 확장자 필터링	    	
	    	transferManager.addFilter( new FileMaxUploadFilter(Integer.parseInt(env.getProperty("MAXFILESIZE")), temfile.length())); // 업로더 최대 용량 필터링
	    	
	    	if ( transferManager.upload(nFileName, temfile) ) {	    
				map.put("UID", fuid);
				map.put("FILE_PATH", filename);
				map.put("REAL_FILE_PATH", env.getProperty("NOTICE_VIEW_IMAGEPATH") + nFileName);
				map.put("FLAG", "success");
				list.add(map);
	    	}else{
	    		map.put("UID", fuid);
	    		map.put("FILE_PATH", filename);
	    		map.put("FLAG", "fail");
				list.add(map);
	    	}
		}
		
		return list;
	}
	
	/**
	 * 공지사항 첨부파일 업로드
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public List<BMap> noticeFileUpload(HttpServletRequest req) throws Exception{
		String fuid = req.getParameter("fileuid");
		if (!StringUtils.isNotEmpty(fuid)) {
			fuid = StringUtils.getUUID();
		}
		
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
	    List<BMap> list = new ArrayList<BMap>();
		int cnt = 0;
		for(MultipartFile file : files){
			cnt++;
			BMap map = new BMap();
			CommonsMultipartFile cmf = (CommonsMultipartFile) file;			
			String filename = cmf.getOriginalFilename();			
//			System.out.println(filename+": fname");
			
			long filesize = cmf.getSize();
//			System.out.println(filesize+": filesize");
			
	    	String temp = StringUtils.getUUID();	    	
	    	String ext = FileManager.getExtension(filename);	    	
	    	String nFileName = temp + "." + ext;
	    				
	    	// 임시로 파일 저장
	    	FileManager.mkDir(env.getProperty("TEMPPATH"));	    	
	    	File temfile = new File(env.getProperty("TEMPPATH")+ nFileName);
	        FileOutputStream fos = new FileOutputStream(temfile);
	    	Streams.copy(cmf.getInputStream(), fos, true);
	    	req.getInputStream().close();
	    	fos.close();
					
			// 파일 업로더 처리
	    	FileManager.mkDir(env.getProperty("NOTICE_ATTACHFILEPATH"));	    
	    	FileTransferManager transferManager = new FileTransferManager(env.getProperty("NOTICE_ATTACHFILEPATH"));    	
	    	
	    	transferManager.addFilter( new FileExtFilter(env.getProperty("EXTENDWHITELIST"), filename) ); // 확장자 필터링	    	
	    	transferManager.addFilter( new FileMaxUploadFilter(Integer.parseInt(env.getProperty("MAXFILESIZE")), temfile.length())); // 업로더 최대 용량 필터링
	    	
	    	if ( transferManager.upload(nFileName, temfile) ) {	    
				map.put("FILE_UID", fuid);
				map.put("SRC_FILE_NM", filename);
				map.put("NEW_FILE_NM", nFileName);
				map.put("FILE_SEQ", cnt);
				map.put("FILE_SIZE", filesize);
				map.put("REAL_FILE_PATH", env.getProperty("NOTICE_ATTACHFILEPATH") + nFileName);
				map.put("FLAG", "success");
				fileService.insertFileInfo(map);
				list.add(map);
	    	}else{
	    		map.put("FILE_UID", fuid);
	    		map.put("SRC_FILE_NM", filename);
	    		map.put("FLAG", "fail");
				list.add(map);
	    	}
		}
		
		return list;
	}
	
	/**
	 * 공지사항 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertNoticeInfo(BMap param) throws Exception{
		param.put("LOGIN_USER", LoginInfo.getUserId());
		if(!StringUtils.isNotEmpty(param.getString("NOTICE_NO"))){
			noticeDao.insertNoticeInfo(param);
		}else{
			noticeDao.updateNoticeInfo(param);
		}
	}
	
	/**
	 * 공지사항 첨부파일 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	public void downloadNoticeAttach(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String filename = req.getParameter("f");        
        //String filename = new String(fname.getBytes("iso-8859-1"),"UTF-8");
        String of = req.getParameter("of"); //인코딩 서버 기본값 ("iso-8859-1")
        
        System.out.println("filename="+filename);
        System.out.println("uploadedFilneName="+of);
        
        String dirid = req.getParameter("dirid");
		if(dirid == null || "".equals(dirid)){
			dirid = "common";
		}
        
        if(filename==null||filename.trim().equals("")){
            return;
        }
        
        //업로드 경로와 파일이름을 가지고 File인스턴스 생성
        File downloadFile = new File(env.getProperty("NOTICE_ATTACHFILEPATH") + filename);
        
        String userAgent 	= req.getHeader("User-Agent");
		if(userAgent.indexOf("MSIE") > -1){
			filename = URLEncoder.encode(filename, "utf-8");
		}else if (userAgent.indexOf("Trident") > -1) { //MS IE 11
			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "\\ ");
	    }else{
	    	filename = new String(filename.getBytes("utf-8"), "iso-8859-1");
		}

        //웹브라우저가 파일을 다운로드 받로록 하려면 다음과 같이 컨테츠타입지정
        resp.setContentType("application/octet-stream");
        //response.setContentType("application/download; charset=utf-8");         
        resp.setContentLength((int)downloadFile.length());//콘텐트 크기 지정
        //Content-Disposition헤더를 이용해서 전송되는 파일의 이름을 명시
        resp.setHeader("Content-Disposition", "attachment; filename=\""+ of +"\"");
        //전송되는 데이터의 인코딩이 바이너리 타입이라는것을 명시
        resp.setHeader("Content-Transfer-Encoding","binary");
        resp.setHeader("Pragma",  "no-cache;");
        resp.setHeader("Expires", "-1;");
        
        OutputStream out = resp.getOutputStream();         
        FileInputStream fis = null;         
        try {             
            fis = new FileInputStream(downloadFile);             
            FileCopyUtils.copy(fis, out);
        } catch(FileNotFoundException e){
        	System.out.println(e.getMessage());
        } catch(Exception e) {             
        	System.out.println(e.getMessage());             
        } finally {             
            if (fis != null) {                 
                try { fis.close(); } catch (Exception e) {}
            }             
        }
         
        out.flush();
	}
	
	/**
	 * 공지사항 첨부파일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteNoticeAttach(BMap param) throws Exception{
		fileService.deleteFileInfo(param);
	}
	
	/**
	 * 공지사항 조회수 +1
	 * @param param
	 * @throws Exception
	 */
	public void updateNoticeCnt(BMap param) throws Exception{
		noticeDao.updateNoticeCnt(param);
	}
	
	
	/**
	 * 공지사항 삭제 
	 * 
	 * @param param
	 * @throws Exception
	 */
	public int deleteNoticeInfo(BMap param) throws Exception{
		
		logger.info("============= 공지사항 삭제처리 서비스=============");
		
		return noticeDao.deleteNoticeInfo(param);
	}
}
