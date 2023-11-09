package bt.external.service;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import bt.btframework.excel.ExcelDataListRowHandler;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.external.dao.ExternalModuleDao;

@Service("ExternalModuleService")
public class ExternalModuleService {
	
	@Resource(name = "ExternalModuleDao")
	private ExternalModuleDao externalModuleDao;
	
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectModuleList(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());		
		return externalModuleDao.selectModuleList(param);
	}
		
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectBOSList(Map<String, Object> param) throws Exception{		
		param.put("LANG", LoginInfo.getLang());
		return externalModuleDao.selectBOSList(param);
	}
	
	
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> updateModule(Map<String, Object> param) throws Exception {
		
		externalModuleDao.updateModule(param);
		
		Map<String, Object> map =  (Map<String, Object>)param.get("searchlist");	
		return this.selectModuleList(map);
	}
	
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> removeModule(Map<String, Object> param) throws Exception {
		
		externalModuleDao.removeModule(param);
		
		Map<String, Object> map =  (Map<String, Object>)param.get("searchlist");	
		return this.selectModuleList(map);
	}
	
	
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> updateBOS(Map<String, Object> param) throws Exception {
		
		externalModuleDao.updateBOS(param);
		
		Map<String, Object> map =  (Map<String, Object>)param.get("searchlist");	
		return this.selectBOSList(map);
	}
	
	/**
	 * BOM 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> removeBOS(Map<String, Object> param) throws Exception {
		
		externalModuleDao.removeBOS(param);
		
		Map<String, Object> map =  (Map<String, Object>)param.get("searchlist");	
		return this.selectBOSList(map);
	}
	
	/**
	 * Product PopUp List 조회.
	 */
	public List<BMap> selectMatlPopList(BMap param) throws Exception{
		return externalModuleDao.selectMatlPopList(param);
	}
	
	
	/**
	 * 엑셀 BOM정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void selectModuleListAll(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception{
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			externalModuleDao.selectModuleListAll(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
		
	}
	
	
	/**
	 * external common code
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectCommonCodeList(Map<String, Object> param) throws Exception {
		param.put("LANG", LoginInfo.getLang());		
		return externalModuleDao.selectCommonCodeList(param);
	}
	
	
}
