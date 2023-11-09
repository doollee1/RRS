package bt.external.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;

@Repository("ExternalModuleDao")
public class ExternalModuleDao extends DBAbstractMapper {
	
	/**
	 * BOM 정보 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectModuleList(Map<String, Object> param)throws Exception{
		return list("ExternalModuleMapper.selectModuleList", param);
	}
	
	/**
	 * BOM 정보 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectBOSList(Map<String, Object> param)throws Exception{
		return list("ExternalModuleMapper.selectBOSList", param);
	}


	/**
	 * insert module
	 */
	@SuppressWarnings("unchecked")
	public void updateModule(Map<String, Object> param) throws Exception {		 
		String userid = LoginInfo.getUserId();
		String langCd = LoginInfo.getLang();
		param.put("LANG", langCd);

		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("modulelist");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				
				// company, matcd
				Map<String, Object> item = list.get(i);				
				List<Map<String, Object>> originlist = list("ExternalModuleMapper.selectModuleList", item);
				if (originlist != null && originlist.size() < 1) {
					item.put("USER_ID", userid);
					insert("ExternalModuleMapper.insertModule", item);
				}
			}
		}		
	}
	
	
	/**
	 * insert module
	 */
	@SuppressWarnings("unchecked")
	public void removeModule(Map<String, Object> param) throws Exception {		 

		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("modulelist");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				super.delete("ExternalModuleMapper.deleteModule", list.get(i));
			}
		}		
	}
	
	
	/**
	 * insert module
	 */
	@SuppressWarnings("unchecked")
	public void updateBOS(Map<String, Object> param) throws Exception {		 
		String userid = LoginInfo.getUserId();
		String langCd = LoginInfo.getLang();
		param.put("LANG", langCd);

		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("boslist");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				
				// company, matcd
				Map<String, Object> item = list.get(i);		
				String companycd = (String)item.get("COUNTRY_CD");
				String flag = (String)item.get("FLAG");
				if (! "".equals(companycd)) {// not blank
						if ("Y".equals(flag)) {
							item.put("USER_ID", userid);
							update("ExternalModuleMapper.updateBOS", item);
						}
						else
						{
							List<Map<String, Object>> originlist = list("ExternalModuleMapper.selectBOSList", item);
							if (originlist != null && originlist.size() < 1) {
								item.put("USER_ID", userid);
								insert("ExternalModuleMapper.insertBOS", item);
							}
						}
				}				
			}
		}		
	}
	
	
	/**
	 * insert module
	 */
	@SuppressWarnings("unchecked")
	public void removeBOS(Map<String, Object> param) throws Exception {		 

		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("boslist");
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				super.delete("ExternalModuleMapper.deleteBOS", list.get(i));
			}
		}		
	}
	
	/**
	 * Product PopUp List 조회.
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMatlPopList(BMap param)throws Exception{
		return list("ExternalModuleMapper.selectMatlPopList", param);
	}
	
	/**
	 * 엑셀 BOM정보 조회
	 */
	public void selectModuleListAll(BMap param, ResultHandler<?> handler)throws Exception{
		listToOutUsingResultHandler("ExternalModuleMapper.selectModuleListAll", param, handler);
	}	
	
	/**
	 * BOM 정보 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeList(Map<String, Object> param)throws Exception {
		return list("ExternalModuleMapper.selectCommonCodeList", param);
	}
}
