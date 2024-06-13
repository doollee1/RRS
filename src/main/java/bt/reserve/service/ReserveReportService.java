package bt.reserve.service;
import java.util.ArrayList;
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
			/*
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
			*/
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
		BMap inputBMap = new BMap();
		List<BMap> paramList = (List<BMap>) param.get("gridData");
		System.out.println("paramList : " + paramList);

		try {
			for(int i=0; i<paramList.size(); i++) {
				BMap map = new BMap(paramList.get(i));
				
				inputBMap.put("FROM_DT", param.getString("FROM_DT"));
				inputBMap.put("TO_DT",   param.getString("TO_DT"));
				inputBMap.put("REQ_DT",  param.getString("REQ_DT"));
				inputBMap.put("REQ_SEQ", param.getString("REQ_SEQ"));
				
				// 해당 기간의 데이터값 삭제
				reserveReportDao.deleteReserveInfo(inputBMap);
				
				List<BMap> list = new ArrayList<BMap>();

				for (String key : map.keySet()) {
					if(!map.getString(key).equals("")) {
						BMap detailMap = new BMap();
						String day     = map.getString(key);
						
						detailMap.put("FROM_DT", param.getString("FROM_DT"));
						detailMap.put("TO_DT",   param.getString("TO_DT"));
						detailMap.put("REQ_DT",  param.getString("REQ_DT"));
						detailMap.put("REQ_SEQ", param.getString("REQ_SEQ"));
						detailMap.put("LOGIN_USER", LoginInfo.getUserId());
						detailMap.put("BAS_DT", key.replace("day", ""));
						detailMap.put("PER_STR", day);
						
						list.add(detailMap);
					}					
				}	
				// 값이 있는 데이터 INSERT
				reserveReportDao.insertReserveInfo(list);
			}
			respData.put("message", "success");
		} catch(Exception e) {
			respData.put("message", e.getMessage());
		}
		return respData;
	}
	
}