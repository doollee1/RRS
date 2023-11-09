package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("DeptDao")
public class DeptDao extends DBAbstractMapper {
	

	/**
	 * 부서 정보 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectDeptPopup(BMap param )throws Exception{
		return list("DeptMapper.selectDeptPopup", param);
	}
	
	/**
	 * 부서 조회(계층)
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getDeptList(BMap param )throws Exception{
		return list("DeptMapper.getDeptList", param);
	}
	
	
	/**
	 * 부서상세 조회
	 */
	public BMap getDeptDetail(BMap param) throws Exception {
		return (BMap) selectByPk("DeptMapper.getDeptDetail", param);
	}
	
	/**
	 * 부서별 사용자 리스트 조회 (SELECT)
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getDeptUser(BMap param) throws Exception {
		return list("DeptMapper.getDeptUser", param);
	}
	
	/**
	 * 부서 정보 추가 (INSERT)
	 */
	public void insertDeptInfo(BMap param) {
		insert("DeptMapper.insertDeptInfo", param);
	}

	/**
	 * 부서 정보 수정 (UPDATE)
	 */
	public void updateDeptInfo(BMap param) {
		update("DeptMapper.updateDeptInfo", param);
	}

}
