package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("MainDao")
public class MainDao extends DBAbstractMapper {
	/**
	 * 메인화면 공지사항 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMainNotice(BMap param) throws Exception{
		return list("MainMapper.selectMainNotice", param);
	}
	
	/**
	 * 메인화면 Order Status
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectOrderStatus(BMap param) throws Exception{
		return list("MainMapper.selectOrderStatus", param);
	}
	
	/**
	 * 메인화면 Quotation
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectQuotationStatus(BMap param) throws Exception{
		return list("MainMapper.selectQuotationStatus", param);
	}
	
}