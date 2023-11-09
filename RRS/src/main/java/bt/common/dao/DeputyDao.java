package bt.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("DeputyDao")
public class DeputyDao extends DBAbstractMapper {
	/**
	 * Approval ID List 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectApprovalIdList(BMap param) throws Exception{
		return list("DeputyMapper.selectApprovalIdList", param);
	}
	
	/**
	 * 결재자 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateDeputyMaster(BMap param) throws Exception{
		update("DeputyMapper.updateDeputyMaster", param);
	}
	/**
	 * 대체자 정보 추가
	 * @param param
	 * @throws Exception
	 */
	public void insertDeputyDetail(BMap param) throws Exception{
		insert("DeputyMapper.insertDeputyDetail", param);
	}
	
	/**
	 * 대체자 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateDeputyDetail(BMap param) throws Exception{
		update("DeputyMapper.updateDeputyDetail", param);
	}
	
	/**
	 * Deputy Detail List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectDeputyDetail(BMap param) throws Exception{
		return list("DeputyMapper.selectDeputyDetail", param);
	}

}