package bt.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.system.dao.AppAuthDao;

@Service("AppAuthService")
public class AppAuthService {
	@Resource(name = "AppAuthDao")
	private AppAuthDao appAuthDao;
	
	public List<BMap> selectAppAuthInfo(BMap param) throws Exception{
		return appAuthDao.selectAppAuthInfo(param);
	}
	
	public void saveAppAuthInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			param.put("LOGIN_USER", LoginInfo.getUserId());
			int cnt = appAuthDao.selectAppAuthCnt(param);
			if(cnt == 0){
				appAuthDao.insertAppAuthInfo(param);
			}else{
				appAuthDao.updateAppAuthInfo(param);
			}
		}
	}
	
	public void deleteAppAuthInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			appAuthDao.deleteAppAuthInfo(param);
		}
	}
}
