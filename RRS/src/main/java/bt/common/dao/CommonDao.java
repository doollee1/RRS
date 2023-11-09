package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("CommonDao")
public class CommonDao extends DBAbstractMapper {
	/**
	 * 그리드 컬럼 정보 추가 (INSERT)
	 */
	public void insertGridColInfo(BMap param) throws Exception {
		insert("CommonMapper.insertGridColInfo", param);
	}

	/**
	 * 그리드 컬럼 정보 삭제 (DELETE)
	 */
	public void deleteGridColInfo(BMap param) throws Exception {
		delete("CommonMapper.deleteGridColInfo", param);
	}
	
	/**
	 * 로그인사용자 그리드 정보 가져오기 (SELECT)
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> getGridColInfoAll(BMap param) throws Exception {
		return list("CommonMapper.selectGridColInfoAll", param);
	}
	
	/**
	 * 공통코드 값 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectCommonCode(BMap param) throws Exception{
		return list("CommonMapper.selectCommonCode", param);
	}
	
	/**
	 * 공통코드 값 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectCommonCodeRef(BMap param) throws Exception{
		return list("CommonMapper.selectCommonCodeRef", param);
	}
}
