package bt.login.service;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import bt.btframework.common.vo.LoginVO;
import bt.btframework.utils.BMap;
import bt.login.dao.LoginDao;
import egovframework.com.utl.fcc.service.EgovStringUtil;

@Service("LoginService")
public class LoginService {
	@Resource(name="LoginDao")
	private LoginDao loginDao;
	
	@Autowired MessageSource messageSource;

	public LoginVO selectCmUserForContractReq(BMap param) throws Exception {

		Locale locale ;
		String lang = param.get("Language").toString();
		if(lang.equals("KO")){
			locale = Locale.KOREA;
		}else if(lang.equals("DE")){
			locale = Locale.GERMANY;
		}else if(lang.equals("FR")){
			locale = Locale.FRENCH;
		}else {
			locale = Locale.ENGLISH;
		}
		
		//아이디 확인
		if(loginDao.selectCmUserByUserId(param) == 0) {
			throw new Exception(messageSource.getMessage("errors.idpw", null, locale));	// 아이디 또는 비밀번호 오류입니다.
		}
		
		//아이디 삭제 여부 확인
		if(loginDao.selectCmUserByUseYn(param) == 0) {
			throw new Exception(messageSource.getMessage("errors.deluser", null, locale));
		}
		
		//아이디 계정 잠금 여부 확인
		if(loginDao.selectCmUserByAcntLockAt(param) > 0) {
			throw new Exception(messageSource.getMessage("errors.lock", null, locale)); 	// 계정이 잠겨있습니다.
		}
		
		//아이디 존재 여부
		if(loginDao.selectCmUserForContractReq(param) == 0) {
			
			BMap mapUser = loginDao.selectCmUserForAcntLockAt(param);			
			
			int loginFailrCnt = Integer.parseInt(EgovStringUtil.isNullToString(mapUser.get("WRONG_CNT"))) + 1;
			
			param.put("WRONG_CNT", EgovStringUtil.isNullToString(loginFailrCnt));
			
			if(loginFailrCnt >= 5) {
				param.put("LOCK_YN", "Y");
			} else {
				param.put("LOCK_YN", "N");
			}
			
			//사용자 로그인횟수 update
			//loginDao.updateCmUserForAcntLockAt(param);
						
			throw new Exception(messageSource.getMessage("errors.failcount", null, locale) +  loginDao.selectCmUserForLoginFailrCo(param)); 
		}
		
		param.put("WRONG_CNT", "0");
		//loginDao.updateCmUserForLoginFailrCo(param);
		
		LoginVO loginVO = loginDao.selectUserInfo(param);
		return loginVO;
	}
	
	public void insertCmSysConectByLogin(BMap map)throws Exception {
		loginDao.insertCmSysConectByLogin(map);		

		if(map.get("STATUS").equals("LOGIN")){
			loginDao.insertLoginDate(map);	
		}
	}
	
	public int chk_init(BMap map)throws Exception {
		return loginDao.chk_init(map);		
	}
}
