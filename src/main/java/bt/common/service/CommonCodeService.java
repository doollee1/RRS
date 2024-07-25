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

	/********************************************
	 * @Subject : 공통코드 마스터 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	public List<BMap> selectCommonCodeMasterInfo(BMap param) throws Exception{
		return commonCodeDao.selectCommonCodeMasterInfo(param);
	}

	/********************************************
	 * @Subject : 공통코드 마스터, 디테일 저장
	 * @Content : 기존에 저장된 마스터 값이 있으면 UPDATE, 없으면 INSERT
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
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

	/********************************************
	 * @Subject : 공통코드 마스터 삭제
	 * @Content : 마스터 삭제 마스터 삭제시 디테일도 함께 삭제
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	public void deleteCommonCodeMasterInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap map = new BMap(paramList.get(i));
			commonCodeDao.deleteCommonCodeMasterInfo(map);
			deleteCommonCodeDetailInfo(map);
		}
	}

	/********************************************
	 * @Subject : 공통코드 디테일 삭제
	 * @Content : 하나의 건만 삭제 할 때
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	public void deleteCommonCodeDetailInfo(BMap param) throws Exception{
		commonCodeDao.deleteCommonCodeDetailInfo(param);
	}

	/********************************************
	 * @Subject : 공통코드 디테일 삭제
	 * @Content : 여러 건의 디테일을 삭제 할 때
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
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

	/********************************************
	 * @Subject : 공통코드 디테일 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	public List<BMap> selectCommonCodeDetailInfo(BMap param) throws Exception{
		return commonCodeDao.selectCommonCodeDetailInfo(param);
	}

	/********************************************
	 * @Subject : 공통코드 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
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
}
