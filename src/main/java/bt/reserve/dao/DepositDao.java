/**
 * 
 */
package bt.reserve.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

/**
 * 입금관리 DAO
 * 
 * @author DOOLLEE2
 *
 */
@Repository
public class DepositDao extends DBAbstractMapper {

	private static final Logger logger = LoggerFactory.getLogger(DepositDao.class);	
	
	
	/**
	 * 입금상단정보 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectDepositHdrInfo(BMap param) throws Exception {
		return (BMap) selectByPk("DepositMapper.selectDepositHdrInfo", param);
	}
	
	/**
	 * 입금목록 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectDepositList(BMap param) throws Exception {
		return list("DepositMapper.selectDepositList", param);
	}
	
	
	/**
	 * 누적금액 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectAccuAmt(BMap param) throws Exception {
		return (String) selectByPk("DepositMapper.selectAccuAmt", param);
	}
	
	
	/**
	 * 누적금액 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectPayAccuAmt(BMap param) throws Exception {
		return (String) selectByPk("DepositMapper.selectPayAccuAmt", param);
	}
	
	
	/**
	 * 비용상세 등록
	 * 
	 * @param param
	 * @throws Exception
	 */
	public int insertTbReqFeeD(BMap param) throws Exception{
		return insert("DepositMapper.insertTbReqFeeD", param);
	}
	
	
	/**
	 * 비용테이블 업데이트
	 * 
	 * @param param
	 * @throws Exception
	 */
	public int updateTbReqFee(BMap param) throws Exception{
		return update("DepositMapper.updateTbReqFee", param);
	}
	
	
	/**
	 * 입금예약정보 업데이트
	 * 
	 * @param param
	 * @throws Exception
	 */
	public int updatePayDepInfo(BMap param) throws Exception{
		return update("DepositMapper.updatePayDepInfo", param);
	}
	
	
	/**
	 * 예약상태  수정
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updatePrcSts(BMap param) throws Exception{
		return update("DepositMapper.updatePrcSts", param);
	}
	
	
	/**
	 * 예약상태명 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectPrcStsNm(BMap param) throws Exception {
		return (String) selectByPk("DepositMapper.selectPrcStsNm", param);
	}
	
	
	/**
	 * 입금상세갯수 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectTbReqFeeDCnt(BMap param) throws Exception {
		return (String) selectByPk("DepositMapper.selectTbReqFeeDCnt", param);
	}
	
	
	/**
	 * 마지막 비용상세정보 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectLastTbReqFeedInfo(BMap param) throws Exception {
		return (BMap) selectByPk("DepositMapper.selectLastTbReqFeedInfo", param);
	}
}
