package bt.rrs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.rrs.dao.RrsUserDao;
import egovframework.com.utl.sim.service.EgovFileScrty;

@Service("RrsUserService")
public class RrsUserService {
	@Resource(name = "RrsUserDao")
	private RrsUserDao rrsUserDao;
	
	/**
	 * 회원 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectUserInfo(BMap param) throws Exception{
		return rrsUserDao.selectUserInfo(param);
	}
	
	/**
	 * 멤버회원 정보 조회
	 */
	public List<BMap> selectMemberUserInfo(BMap param) throws Exception{
		return rrsUserDao.selectMemberUserInfo(param);
	}
	
	/**
	 * 멤버회원 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public Boolean saveMemberUserInfo(BMap param) throws Exception{
		Boolean isValid = true;
		
		int cnt = rrsUserDao.selectMemberUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트 
		// param.put("LOGIN_USER", LoginInfo.getUserId());
		// param.put("PW_CURR", EgovFileScrty.encryptPassword("oms1234", param.getString("USER_ID")));  //최초 아이디 등록시 패스워드 oms1234
		if(cnt == 0){
			rrsUserDao.insertMemberUserInfo(param); //등록되지 않았을 때 등록
		}else{
			if(param.getString("ISNEW").equals("0")){
				isValid = false;
			}else{
				rrsUserDao.updateMemberUserInfo(param); //등록된 사용자 정보 수정
			}
		}
		return isValid;
	}
}
