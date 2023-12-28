package bt.reserve.service;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.reserve.dao.ReserveReportDao;

@Service
public class ReserveReportService {
	private static final Logger logger = LoggerFactory.getLogger(ReserveReportService.class);
	
	@Resource
	private ReserveReportDao reserveReportDao;

	/**
	 * 예약현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> reserveReportSelectList(BMap param) throws Exception {
		List<BMap> list = reserveReportDao.reserveReportSelectList(param);
		for (BMap bMap : list) {
			double rounding = (double) bMap.get("ROUNDING_SAT");
			bMap.get("RND_CHG_YN1");
		}
		
		return list;
	}
	
}