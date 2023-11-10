package bt.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("AppDao")
public class AppDao extends DBAbstractMapper{
	/**
	 * 프로그램 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectProgInfo(BMap param) throws Exception{
		return list("AppMapper.selectProgInfo", param);
	}
	
	/**
	 * 프로그램 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertProgInfo(BMap param) throws Exception{
		insert("AppMapper.insertProgInfo", param);
	}
	
	/**
	 * 프로그램 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateProgInfo(BMap param) throws Exception{
		update("AppMapper.updateProgInfo", param);
	}
	
	/**
	 * 프로그램 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteProgInfo(BMap param) throws Exception{
		delete("AppMapper.deleteProgInfo", param);
	}
	
	/**
	 * 프로그램 정보 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectProgCnt(BMap param) throws Exception{
		return (int)selectByPk("AppMapper.selectProgCnt", param);
	}
	
	/**
	 * 프로그램 중간 메뉴 리스트(select박스용)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectMiddleMenuCombo(BMap param) throws Exception{
		return list("AppMapper.selectMiddleMenuCombo", param);
	}
	
	/**
	 * 프로그램 리스트(select박스용)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectProgramCombo(BMap param) throws Exception{
		return list("AppMapper.selectProgramCombo", param);
	}
}
