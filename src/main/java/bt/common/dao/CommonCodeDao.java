package bt.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("CommonCodeDao")
public class CommonCodeDao extends DBAbstractMapper {
	/**
	 * 공통코드 마스터 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeMasterInfo(BMap param) throws Exception{
		return list("CommonCodeMapper.selectCommonCodeMasterInfo", param);
	}
	
	/**
	 * 공통코드 마스터 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertCommonCodeMasterInfo(BMap param) throws Exception{
		insert("CommonCodeMapper.insertCommonCodeMasterInfo", param);
	}
	
	/**
	 * 공통코드 마스터 수정 
	 * @param param
	 * @throws Exception
	 */
	public void updateCommonCodeMasterInfo(BMap param) throws Exception{
		update("CommonCodeMapper.updateCommonCodeMasterInfo", param);
	}
	
	/**
	 * 공통코드 마스터 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteCommonCodeMasterInfo(BMap param) throws Exception{
		delete("CommonCodeMapper.deleteCommonCodeMasterInfo", param);
	}
	
	/**
	 * 공통코드 마스터 중복체크 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectCommonCodeMasterCnt(BMap param) throws Exception{
		return (int)selectByPk("CommonCodeMapper.selectCommonCodeMasterCnt", param);
	}
	
	/**
	 * 공통코드 마스터의 HEAD_CD 조회(코드생성)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectCommonCodeHead(BMap param )throws Exception{
		return (String)selectByPk("CommonCodeMapper.selectCommonCodeHead", param);
	}
	
	/**
	 * 공통코드 디테일 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeDetailInfo(BMap param) throws Exception{
		return list("CommonCodeMapper.selectCommonCodeDetailInfo", param);
	}
	
	/**
	 * 공통코드 디테일 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertCommonCodeDetailInfo(BMap param) throws Exception{
		insert("CommonCodeMapper.insertCommonCodeDetailInfo", param);
	}
	
	/**
	 * 공통코드 디테일 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateCommonCodeDetailInfo(BMap param) throws Exception{
		update("CommonCodeMapper.updateCommonCodeDetailInfo", param);
	}
	
	/**
	 * 공통코드 디테일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteCommonCodeDetailInfo(BMap param) throws Exception{
		delete("CommonCodeMapper.deleteCommonCodeDetailInfo", param);
	}
	
	/**
	 * 공통코드디테일 중복 체크 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectCommonCodeDetailCnt(BMap param) throws Exception{
		return (int) selectByPk("CommonCodeMapper.selectCommonCodeDetailCnt", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeList(Map<String, Object> param) throws Exception {
		return list("CommonCodeMapper.selectCommonCodeList", param);
	}
	
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommonCodeByRef(Map<String, Object> param) throws Exception {
		return list("CommonCodeMapper.selectCommonCodeByRef", param);
	}

	/**
	 * common code popup search
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectCommPopup(Map<String, Object> param) throws Exception {
		return list("CommonCodeMapper.selectCommPopup", param);
	}
	
	/**
	 * get code nm
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String getCodeNm(Map<String, Object> param) throws Exception {
		return (String) selectByPk("CommonCodeMapper.getCodeNm", param);
	}
	
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
	public int insertFlightInfo(BMap detail) throws Exception {
		return insert("CommonCodeMapper.insertFlightInfo", detail);
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