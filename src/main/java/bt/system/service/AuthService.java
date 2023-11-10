package bt.system.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.system.dao.AuthDao;

@Service("AuthService")
public class AuthService {
	@Resource(name = "AuthDao")
	private AuthDao authDao;
	
	public List<BMap> selectAuthInfo(BMap param) throws Exception{
		return authDao.selectAuthInfo(param);
	}
	
	public Boolean saveAuthInfo(BMap param,List<BMap> paramList) throws Exception{
		Boolean isValid = true;
		
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			map.put("G_COMP_CD", param.getString("G_COMP_CD"));
			map.put("LOGIN_USER", LoginInfo.getUserId());
			int cnt = authDao.selectAuthCnt(map);
			if(cnt == 0){
				insertAuthInfo(map);
			}else{
				if(map.getString("ROW_STATUS").equals("I")){
					isValid = false;
				}else{
					updateAuthInfo(map);
				}
			}
		}
		
		return isValid;
	}
	
	public void insertAuthInfo(BMap param) throws Exception{
		authDao.insertAuthInfo(param);
	}
	
	public void updateAuthInfo(BMap param) throws Exception{
		authDao.updateAuthInfo(param);
	}
	
	public void deleteAuthInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			authDao.deleteAuthInfo(param);
		}
	}
}
