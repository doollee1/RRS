package bt.reserve.dao;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import bt.btframework.common.vo.CodeVO;
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
	
}
