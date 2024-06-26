package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("FlightDao")
public class FlightDao extends DBAbstractMapper {
	/**
	 * 항공편 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectFlightInfo(BMap param) throws Exception {
		return list("CommonCodeMapper.selectFlightInfo", param);
	}
	/**
	 * 항공편 추가
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int insertFlightInfo(List<BMap> list) throws Exception {
		return insert("CommonCodeMapper.insertFlightInfo", list);
	}
	/**
	 * 항공편 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateFlightInfo(BMap detail) throws Exception {
		return update("CommonCodeMapper.updateFlightInfo", detail);
	}
	/**
	 * 항공편 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int deleteFlightInfo(BMap param) throws Exception {
		return delete("CommonCodeMapper.deleteFlightInfo", param);
	}
}
