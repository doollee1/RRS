package bt.login.dao;

import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.LoginVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("LoginDao")
public class LoginDao extends DBAbstractMapper {
	public LoginVO selectUserInfo(BMap param) throws Exception{
		return (LoginVO) selectByPk("LoginMapper.selectUserInfo", param);
	}
	/**
	 * 유저 조회
	 * @param map
	 * @return
	 */
	public int selectCmUserByUserId(BMap param) throws Exception {
		return (int) selectByPk("LoginMapper.selectCmUserByUserId", param);
	}
	
	/**
	 * 유저조회
	 * @param map
	 * @return
	 */
	public int selectCmUserByUseYn(BMap param) throws Exception {
		return (int) selectByPk("LoginMapper.selectCmUserByUseYn", param);
	}
	
	/**
	 * 유저조호
	 * @param map
	 * @return
	 */
	public int selectCmUserByAcntLockAt(BMap param) throws Exception {
		return (int) selectByPk("LoginMapper.selectCmUserByAcntLockAt", param);
	}
	
	/**
	 * 유저 조회
	 * @param map
	 * @return
	 */
	public int selectCmUserForContractReq(BMap param) throws Exception{
		return (int) selectByPk("LoginMapper.selectCmUserForContractReq", param);
	}
	
	/**
	 * 유저 이력 남기기 위해 조회(acnt_lock_at ,  login_failer_co)
	 * @param map
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public BMap selectCmUserForAcntLockAt(BMap param) throws Exception {
		return (BMap) selectByPk("LoginMapper.selectCmUserForAcntLockAt",param); 
	}
	
	/**
	 * 유저 조회
	 * @param map
	 * @return
	 */
	public int selectCmUserForLoginFailrCo(BMap param) throws Exception {
		return (int) selectByPk("LoginMapper.selectCmUserForLoginFailrCo", param);
	}
	
	/**
	 * 유저 수정
	 * @param map
	 * @return
	 */
	public int updateCmUserForLoginFailrCo(BMap param) throws Exception {
		return (Integer) update("LoginMapper.updateCmUserForLoginFailrCo", param);
	}
	
	/**
	 * 유저 로그인 시도시 잘못 입력 횟수
	 * @param map
	 * @return
	 */
	public int updateCmUserForAcntLockAt(BMap param) throws Exception {
		return update("LoginMapper.updateCmUserForAcntLockAt", param);
	}
	
	/**
	 * 접속이력 입력
	 * @param map
	 */
	public void insertCmSysConectByLogin(BMap param) throws Exception {
		insert("LoginMapper.insertCmSysConectByLogin", param);
	}
	
	/**
	 * 로그인 일자 등록
	 * @param map
	 */
	public void insertLoginDate(BMap param) throws Exception {
		update("LoginMapper.insertLoginDate", param);
	}
	
	/**
	 * 로그인 일자 등록
	 * @param map
	 */
	public int chk_init(BMap param) throws Exception {
		return (int) selectByPk("LoginMapper.chk_init", param);
	}
}
