package bt.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.DeptDao;

@Service("DeptService")
public class DeptService {
	@Resource(name = "DeptDao")
	private DeptDao deptDao;

	private final String V_NEW_TRUE = "1";
	/**
	 * 부서 정보 조회
	 */
	public List<BMap> selectDeptPopup(BMap param) throws Exception{
		return deptDao.selectDeptPopup(param);
	}

	/**
	 * 부서 조회(계층)
	 */
	public List<BMap> getDeptList(BMap param) throws Exception {
		return deptDao.getDeptList(param);
	}
	
	
	/**
	 * 부서상세 조회
	 */
	public BMap getDeptDetail(BMap param) throws Exception {
		return deptDao.getDeptDetail(param);
	}
	
	/**
	 * 부서별 사용자 리스트 조회
	 */
	public List<BMap> getDeptUser(BMap param) throws Exception {
		return deptDao.getDeptUser(param);
	}
	
	/**
	 * 부서 저장
	 */
	public Boolean saveDeptInfo(BMap param) throws Exception {
		Boolean isValid = true;
		
		BMap ckData = deptDao.getDeptDetail(param);
		param.put("LOGIN_USER", LoginInfo.getUserId());
		
		if(ckData == null){
				deptDao.insertDeptInfo(param);
		}else {
			String a = param.getString("ISNEW");
			if(a.equals("0")){
				isValid = false;
			}else{
				deptDao.updateDeptInfo(param);
			}
		}
		return isValid;
	}

}
