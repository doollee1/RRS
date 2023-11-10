package bt.system.dao;

import java.util.List;

import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("SystemDao")
public class SystemDao extends DBAbstractMapper {
	/**
	 * 대메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectSystemInfo(BMap param) throws Exception {
		return list("SystemMapper.selectSystemInfo", param);
	}
	
	/**
	 * 대메뉴 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectSystemInfoForMenu(BMap param) throws Exception {
		return list("SystemMapper.selectSystemInfoForMenu", param);
	}
	
	/**
	 * 대메뉴 추가
	 * @param param
	 * @throws Exception
	 */
	public void insertSystemInfo(BMap param) throws Exception{
		insert("SystemMapper.insertSystemInfo", param);
	}
	
	/**
	 * 대메뉴 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateSystemInfo(BMap param) throws Exception{
		update("SystemMapper.updateSystemInfo", param);
	}
	
	/**
	 * 대메뉴 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteSystemMasterInfo(BMap param) throws Exception{
		delete("SystemMapper.deleteSystemMasterInfo", param);
		delete("SystemMapper.deleteProgMasterInfo", param);
	}
	
	/**
	 * 중메뉴 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteSystemDetailInfo(BMap param) throws Exception{
		delete("SystemMapper.deleteProgDetailInfo", param);
	}
	
	/**
	 * 대메뉴 정보 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectSystemCnt(BMap param) throws Exception{
		return (int)selectByPk("SystemMapper.selectSystemCnt", param);
	}
	
	public void excelSystemInfo(BMap param, ResultHandler<?> handler) throws Exception{
		listToOutUsingResultHandler("SystemMapper.selectSystemInfo", param, handler);
	}
	
	/**
	 * System Code Check
	 */
	public String checkSystemCode(BMap param)throws Exception{
		return (String)selectByPk("SystemMapper.checkSystemCode", param);
	}
}
