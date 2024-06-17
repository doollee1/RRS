package bt.common.service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.StringUtils;
import bt.common.dao.CommonCodeDao;

@Service("CommonCodeService")
public class CommonCodeService {
	@Resource(name="CommonCodeDao")
	private CommonCodeDao commonCodeDao;
	
	/**
	 * 공통코드 마스터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectCommonCodeMasterInfo(BMap param) throws Exception{
		return commonCodeDao.selectCommonCodeMasterInfo(param);
	}
	
	/**
	 * 공통코드 마스터, 디테일 저장
	 * @param master
	 * @param detail
	 * @throws Exception
	 */
	public Boolean saveCommonCodeMasterInfo(BMap master, List<BMap> detail) throws Exception{
		Boolean isValid = true;
		master.put("LOGIN_USER", LoginInfo.getUserId());
		if(!StringUtils.isNotEmpty(master.getString("HEAD_CD"))){
			master.put("HEAD_CD", commonCodeDao.selectCommonCodeHead(master));
		}
		int cnt = commonCodeDao.selectCommonCodeMasterCnt(master);
		if(cnt == 0){
			commonCodeDao.insertCommonCodeMasterInfo(master);
		}else{
			commonCodeDao.updateCommonCodeMasterInfo(master);
		}
		
		for(int i = 0; i < detail.size(); i++){
			BMap detailMap = new BMap(detail.get(i));
			detailMap.put("LOGIN_USER", LoginInfo.getUserId());
			if(!StringUtils.isNotEmpty(detailMap.getString("HEAD_CD"))){
				detailMap.put("HEAD_CD", master.getString("HEAD_CD"));
			}
			int detailCnt = commonCodeDao.selectCommonCodeDetailCnt(detailMap);
			if(detailCnt == 0){
				commonCodeDao.insertCommonCodeDetailInfo(detailMap);
			}else{
				if(detailMap.getString("ROW_STATUS").equals("I")){
					isValid = false;
				}else{
					commonCodeDao.updateCommonCodeDetailInfo(detailMap);
				}
			}
		}
		return isValid;
	}
	
	/**
	 * 공통코드 마스터 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteCommonCodeMasterInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			commonCodeDao.deleteCommonCodeMasterInfo(map); //마스터 삭제 마스터 삭제시 디테일도 함께 삭제
			deleteCommonCodeDetailInfo(map); //디테일 삭제
		}
	}
	
	/**
	 * 공통코드 디테일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteCommonCodeDetailInfo(BMap param) throws Exception{
		commonCodeDao.deleteCommonCodeDetailInfo(param); //디테일 삭제
	}
	
	/**
	 * 공통코드 디테일 삭제
	 * @param param
	 * @throws Exception
	 */
	public Boolean deleteCommonCodeDetailInfo(List<BMap> paramList) throws Exception{
		Boolean isValid = true;
		try {
			for(int i = 0; i < paramList.size(); i++){
				BMap map = new BMap(paramList.get(i));
				commonCodeDao.deleteCommonCodeDetailInfo(map); //디테일 삭제
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
	
	/**
	 * 공통코드 디테일 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectCommonCodeDetailInfo(BMap param) throws Exception{
		return commonCodeDao.selectCommonCodeDetailInfo(param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeList(Map<String, Object> param) throws Exception {
		List<String> codeList = (List<String>) param.get("code");
		if (codeList == null || codeList.size() == 0) {
			return Collections.emptyList();
		} else {
			param.put("languageCode", LoginInfo.getLang());
			return commonCodeDao.selectCommonCodeList(param);
		}
	}
	
	public List<BMap> selectCommonCodeByRef(Map<String, Object> param) throws Exception {
		param.put("languageCode", LoginInfo.getLang());
		return commonCodeDao.selectCommonCodeByRef(param);
	}
	
	/**
	 * common code popup search
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectCommPopup(BMap param) throws Exception{
		return commonCodeDao.selectCommPopup(param);
	}
	
	/**
	 * get code nm
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String getCodeNm(BMap param) throws Exception{
		return commonCodeDao.getCodeNm(param);
	}
	
	
	/**
	 * 항공편 조회
	 * @param param
	 * @return List<BMap>
	 * @throws Exception
	 */
	public List<BMap> selectFlightInfo(BMap param) throws Exception {
		return commonCodeDao.selectFlightInfo(param);
	}
	/**
	 * 항공편 추가
	 * @param code
	 * @return
	 * @throws Exception
	 */
	public Boolean insertFlightInfo(BMap paramData, List<BMap> insertParam) throws Exception {
		Boolean isValid = true;
		try {
			for(int i=0; i < insertParam.size();i++) {
				BMap detail = new BMap(insertParam.get(i));
				detail.put("LOGIN_USER", LoginInfo.getUserId());
				//중복되는 값이 있는지 체크
				if(commonCodeDao.selectCommonCodeDetailCnt(detail) == 0) {
					commonCodeDao.insertFlightInfo(detail);
				}
			}
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
	public Boolean updateFlightInfo(BMap paramData, List<BMap> updateParam) throws Exception {
		Boolean isValid = true;
		try {
			for(int i=0; i < updateParam.size();i++) {
				BMap detail = new BMap(updateParam.get(i));
				detail.put("LOGIN_USER", LoginInfo.getUserId());
				
				commonCodeDao.updateFlightInfo(detail);
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
				commonCodeDao.deleteFlightInfo(param);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
}
