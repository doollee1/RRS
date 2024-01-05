package bt.reserve.service;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.ResponseStatus;
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
	
	/**
	 * 에약현황 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public BRespData saveReserveList(BMap param) throws Exception{
		BRespData respData = new BRespData();
		
		List<BMap> paramList = (List<BMap>) param.get("gridData");
		
		try {
			for(int i=0; i<paramList.size(); i++) {
				BMap map = new BMap(paramList.get(i));
				for (String key : map.keySet()) {
					if(key.contains("day") && !map.getString(key).equals("")) {
						// 키값에 day가 있고 && 그 value값이 빈값이 아니라면 => update
						String SEARCH_DT = param.getString("SEARCH_DT");
						String day = map.getString(key);

						BMap inputBMap = new BMap();
						inputBMap.put("REQ_DT", map.getString("REQ_DT"));
						inputBMap.put("REQ_SEQ", map.getString("SEQ"));
						inputBMap.put("BAS_YM", SEARCH_DT.substring(0,6));
						inputBMap.put("DD", key.substring(3));
						inputBMap.put("PER_STR", day.replace("day", ""));
						inputBMap.put("LOGIN_USER", LoginInfo.getUserId());
						
						// select 해서 값 비교
						// 값이 다르면 업데이트
						List<BMap> infoList = reserveReportDao.selectInfoNumberOfReserve(inputBMap);
						if(infoList.size()>0 && !infoList.get(0).getString("PER_STR").equals(inputBMap.getString("PER_STR"))) {
							reserveReportDao.updateReserveInfo(inputBMap);
						}
					}
				}
			}
			respData.put("message", "success");
		} catch(Exception e) {
			respData.put("message", e.getMessage());
		}
		return new BRespData();
	}
	
}