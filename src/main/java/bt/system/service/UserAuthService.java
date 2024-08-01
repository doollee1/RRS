package bt.system.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.system.dao.UserAuthDao;

@Service("UserAuthService")
public class UserAuthService {
	@Resource(name = "UserAuthDao")
	private UserAuthDao userAuthDao;

	/**
	 * 사용자 권한 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectUserAuthInfo(BMap param) throws Exception{
		return userAuthDao.selectUserAuthInfo(param);
	}

	/**
	 * 사용자 권한 정보 저장
	 * @param paramList
	 * @throws Exception
	 */
	public void saveUserAuthInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			param.put("LOGIN_USER", LoginInfo.getUserId());
			int cnt = userAuthDao.selectUserAuthCnt(param);  //사용자 권한 등록 여부 체크
			if(cnt == 0){
				userAuthDao.insertUserAuthInfo(param);  //사용자 권한 등록
			}else{
				userAuthDao.updateUserAuthInfo(param);  //사용자 권한 수정
			}
		}
	}

	/**
	 * 사용자 권한 정보 삭제
	 * @param paramList
	 * @throws Exception
	 */
	public void deleteUserAuthInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			userAuthDao.deleteUserAuthInfo(param);
		}
	}
}
