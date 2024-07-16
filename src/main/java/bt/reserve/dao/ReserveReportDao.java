package bt.reserve.dao;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository
public class ReserveReportDao extends DBAbstractMapper {
	private static final Logger logger = LoggerFactory.getLogger(ReserveReportDao.class);

	/**
	 * 예약현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> reserveReportSelectList(BMap param) throws Exception {
		return list("ReserveReportMapper.reserveReportSelectList", param);
	}
	
	/**
	 * 예약현황 일자별 인원수 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectListNumberOfReserveInMonth(BMap param) throws Exception {
		return list("ReserveReportMapper.selectListNumberOfReserveInMonth", param);
	}
	
	/**
	 * 예약현황 특정일자 인원수 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectInfoNumberOfReserve(BMap param) throws Exception {
		return list("ReserveReportMapper.selectInfoNumberOfReserve", param);
	}
	
	/**
	 * 예약현황 특정일자 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateReserveInfo(BMap param) throws Exception{
		update("ReserveReportMapper.updateReserveInfo", param);
	}
	
	/**
	 * 예약현황 특정일자 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertReserveInfo(List<BMap> list) throws Exception{
		insert("ReserveReportMapper.insertReserveInfo", list);
	}
	
	/**
	 * 예약현황 특정일자 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteReserveInfo(BMap param) throws Exception{
		delete("ReserveReportMapper.deleteReserveInfo", param);
	}
	
}
