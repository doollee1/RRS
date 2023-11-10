package bt.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.system.dao.AppDao;

@Service("AppService")
public class AppService {
	@Resource(name = "AppDao")
	private AppDao appDao;
	
	public List<BMap> selectProgInfo(BMap param) throws Exception{
		return appDao.selectProgInfo(param);
	}
	
	public Boolean saveProgInfo(BMap param, List<BMap> paramList) throws Exception{
		Boolean isValid = true;
		
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			map.put("G_COMP_CD", param.getString("G_COMP_CD"));
			map.put("LOGIN_USER", LoginInfo.getUserId());
			int cnt = appDao.selectProgCnt(map);
			if(cnt == 0){
				appDao.insertProgInfo(map);
			}else{
				if(map.getString("ROW_STATUS").equals("I")){
					isValid = false;
				}
				else{
					appDao.updateProgInfo(map);
				}
			}
		}
		return isValid;
	}
	
	public List<CodeVO> selectMiddleMenuCombo(BMap param) throws Exception{
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("LANG", LoginInfo.getLang());
		return appDao.selectMiddleMenuCombo(param);
	}
	
	public List<CodeVO> selectProgramCombo(BMap param) throws Exception{
		param.put("G_COMP_CD", LoginInfo.getCompCd());
		param.put("LANG", LoginInfo.getLang());
		return appDao.selectProgramCombo(param);
	}
}
