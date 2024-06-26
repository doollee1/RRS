package bt.common.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.CommonCodeDao;
import bt.common.dao.FlightDao;

@Service("FlightService")
public class FlightService {
	
	@Resource(name="CommonCodeDao")
	private CommonCodeDao commonCodeDao;
	
	@Resource(name="FlightDao")
	private FlightDao flightDao;
	
	/**
	 * 항공편 조회
	 * @param param
	 * @return List<BMap>
	 * @throws Exception
	 */
	public List<BMap> selectFlightInfo(BMap param) throws Exception {
		return flightDao.selectFlightInfo(param);
	}
	/**
	 * 항공편 추가
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public Boolean insertFlightInfo(List<BMap> insertParam) throws Exception {
		Boolean isValid = true;
		List<BMap> list = new ArrayList<BMap> ();
		try {
			for(int i=0; i < insertParam.size();i++) {
				BMap detail = new BMap(insertParam.get(i));
				detail.put("LOGIN_USER", LoginInfo.getUserId());
				
				list.add(detail);
			}
			
			flightDao.insertFlightInfo(list);
		}
		catch (Exception e) {
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	/**
	 * 항공편 수정
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public Boolean updateFlightInfo(List<BMap> updateParam) throws Exception {
		Boolean isValid = true;
		try {
			for(int i=0; i < updateParam.size();i++) {
				BMap detail = new BMap(updateParam.get(i));
				detail.put("LOGIN_USER", LoginInfo.getUserId());
				
				flightDao.updateFlightInfo(detail);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	/**
	 * 항공편 삭제
	 * @param param
	 * @return 
	 * @throws Exception
	 */
	public Boolean deleteFlightInfo(List<BMap> paramList) throws Exception {
		Boolean isValid = true;
		try {
			for(int i = 0; i < paramList.size(); i++){
				BMap param = new BMap(paramList.get(i));
				flightDao.deleteFlightInfo(param);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
}