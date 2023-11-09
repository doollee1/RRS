package bt.common.service;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.UserDao;
import bt.login.dao.LoginDao;
import egovframework.com.utl.sim.service.EgovFileScrty;

@Service("UserService")
public class UserService {
	@Resource(name = "UserDao")
	private UserDao userDao;
	
	@Resource(name = "LoginDao")
	private LoginDao loginDao;
	
	@Autowired MessageSource messageSource;
	
	/**
	 * 사용자 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectUserInfo(BMap param) throws Exception{
		return userDao.selectUserInfo(param);
	}
	
	/**
	 * 사용자 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public Boolean saveUserInfo(BMap param) throws Exception{
		Boolean isValid = true;
		
		int cnt = userDao.selectUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트 
		param.put("LOGIN_USER", LoginInfo.getUserId());
		param.put("PW_CURR", EgovFileScrty.encryptPassword("oms1234", param.getString("USER_ID")));  //최초 아이디 등록시 패스워드 oms1234
		if(cnt == 0){
			userDao.insertUserInfo(param); //등록되지 않았을 때 등록
		}else{
			if(param.getString("ISNEW").equals("0")){
				isValid = false;
			}else{
				userDao.updateUserInfo(param); //등록된 사용자 정보 수정
			}
		}
		return isValid;
	}
	
	/**
	 * 사용자 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteUserInfo(BMap param) throws Exception{
		userDao.deleteUserInfo(param);
	}
	
	public void changePw(BMap param) throws Exception{
		param.put("PASSWORD", param.getString("CURR_PASSWORD"));
		int cnt = loginDao.selectCmUserForContractReq(param);
		
		Locale locale ;
		String lang = param.get("LANG").toString();
		if(lang.equals("KO")){
			locale = Locale.KOREA;
		}else if(lang.equals("DE")){
			locale = Locale.GERMANY;
		}else if(lang.equals("FR")){
			locale = Locale.FRENCH;
		}else {
			locale = Locale.ENGLISH;
		}
		
		if(cnt == 0){
			throw new Exception(messageSource.getMessage("error.pwconfirm", null, locale));	// 비밀번호를 확인해 주십시오.
		}
		
		if(!param.getString("NEW_PASSWORD").equals(param.getString("CONF_PASSWORD"))){
			throw new Exception(messageSource.getMessage("errors.differPasswd", null, locale));	// 신규 비밀번호와 신규 패스워드 확인을 확인해 주십시오.
		}
		
		cnt = userDao.selectPastPassword(param);
		if(cnt > 0){
			throw new Exception(messageSource.getMessage("errors.pastpwd", null, locale));	// 과거 사용했던 패스워드는 당분간 사용하실 수 없습니다.
		}
		
		userDao.updatePassword(param);
	}
	
	public void initPw(BMap param) throws Exception{
		userDao.updatePassword(param);
		userDao.updateLockyn(param);
	}
}
