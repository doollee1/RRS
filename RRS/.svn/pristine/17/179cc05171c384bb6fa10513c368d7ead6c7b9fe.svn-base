package bt.common.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bt.btframework.excel.ExcelDataListRowHandler;
import bt.btframework.excel.POIExcelUpload;
import bt.btframework.utils.BMap;
import bt.common.dao.SampleDao;

@Service("SampleService")
public class SampleService {
	@Resource(name = "SampleDao")
	private SampleDao sampleDao;
	
	/**
	 * 프로그램 리스트 엑셀 다운로드 위한 조회
	 * @param title
	 * @param header
	 * @param response
	 * @param param
	 * @throws Exception
	 */
	public void excelSample(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception {
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			sampleDao.excelSample(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
	}
	
	/**
	 * 엑셀을 업로드하여 읽어와 list화 시켜 리턴
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public List<BMap> uploadExcelSample(HttpServletRequest req) throws Exception{
		POIExcelUpload upload = new POIExcelUpload();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;  //업로드한 파일들의 Rquest 변환
		String[] header = new String[]{"COMP_CD","POLICY_CD","POLICY_NM","POLICY_DSC","STATUS"};  //엑셀 해더 Array
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		List<BMap> result = new ArrayList<BMap>();
		for(MultipartFile file : files){
			List<BMap> list = upload.excelUpload(file, header);   // 업로드한 엑셀 파일을 읽어와 리스트에 담음.
			for(int i = 0; i < list.size(); i++){
				result.add(list.get(i));
			}
		}
		
		return result;
	}
}
