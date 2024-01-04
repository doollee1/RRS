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

		System.out.println("@@reserveReportSelectList");
		for (BMap bMap : list) {
			// System.out.println(bMap);
			
			String RND_CHG_YN1 = bMap.getString("RND_CHG_YN1");
			String RND_CHG_YN2 = bMap.getString("RND_CHG_YN2");
			double ROUNDING_SAT = bMap.getDouble("ROUNDING_SAT");
			double ROUNDING_SUN = bMap.getDouble("ROUNDING_SUN");
			
			if(RND_CHG_YN1.equals("Y")) {
				// 토 오전
				bMap.put("ROUNDING_SAT_MORNING", ROUNDING_SAT);
				bMap.put("ROUNDING_SAT_AFTERNOON", "-");
			} else {
				// 토 오후
				bMap.put("ROUNDING_SAT_MORNING", "-");
				bMap.put("ROUNDING_SAT_AFTERNOON", ROUNDING_SAT);
			}
		
			if(RND_CHG_YN2.equals("Y")) {
				// 일 오전
				bMap.put("ROUNDING_SUN_MORNING", ROUNDING_SUN);
				bMap.put("ROUNDING_SUN_AFTERNOON", "-");
			} else {
				// 일 오후
				bMap.put("ROUNDING_SUN_MORNING", "-");
				bMap.put("ROUNDING_SUN_AFTERNOON", ROUNDING_SUN);
			}
			
			// 일자별 인원수 데이터 조회
			BMap reserveMap = new BMap();
			reserveMap.put("REQ_DT", bMap.getString("REQ_DT"));
			reserveMap.put("REQ_SEQ", bMap.getString("SEQ"));
			List<BMap> numberOfReserveList = reserveReportDao.selectListNumberOfReserveInMonth(reserveMap);
			
			bMap.put("dayOfReservation", numberOfReserveList);
		}
		return list;
	}
	
}