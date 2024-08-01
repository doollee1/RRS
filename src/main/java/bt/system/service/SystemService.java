package bt.system.service;

import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.excel.ExcelDataListRowHandler;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.system.dao.SystemDao;

@Service("SystemService")
public class SystemService {
	@Resource(name = "SystemDao")
	private SystemDao systemDao;

	public List<BMap> selectSystemInfo(BMap param) throws Exception{
		return systemDao.selectSystemInfo(param);
	}

	public List<CodeVO> selectSystemInfoForMenu(BMap param) throws Exception{
		param.put("LANG", LoginInfo.getLang());
		return systemDao.selectSystemInfoForMenu(param);
	}

	public void saveSystemInfo(BMap param,List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			map.put("G_COMP_CD", param.getString("G_COMP_CD"));
			map.put("LOGIN_USER", LoginInfo.getUserId());
			int cnt = systemDao.selectSystemCnt(map);
			if(cnt == 0){
				insertSystemInfo(map);
			}else{
				updateSystemInfo(map);
			}
		}
	}

	public void insertSystemInfo(BMap param) throws Exception{
		systemDao.insertSystemInfo(param);
	}

	public void updateSystemInfo(BMap param) throws Exception{
		systemDao.updateSystemInfo(param);
	}

	public void deleteSystemMasterInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			systemDao.deleteSystemMasterInfo(map);
		}
	}

	public void deleteSystemDetailInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			systemDao.deleteSystemDetailInfo(map);
		}
	}

	public void excelSystemInfo(String title, LinkedHashMap<String,Object> header, HttpServletResponse response, BMap param) throws Exception {
		ExcelDataListRowHandler handler = null;
		try {
			handler = new ExcelDataListRowHandler(title, header, response);
			systemDao.excelSystemInfo(param, handler);
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}finally{
			if(handler != null){
				try{ handler.close();}catch(Exception ex){}
			}
		}
	}

	/**
	 * System Dup Code Check.
	 */
	public String checkSystemCode(BMap param,List<BMap> paramList) throws Exception{
		String rtnStr = "";

		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			if("I".equals(map.get("ROW_STATUS"))){
				map.put("G_COMP_CD", param.getString("G_COMP_CD"));
				map.put("LOGIN_USER", LoginInfo.getUserId());
				rtnStr = systemDao.checkSystemCode(map);
				if(null != rtnStr && !"".equals(rtnStr)){
					break;
				}
			}
		}
		return rtnStr;
	}
}
