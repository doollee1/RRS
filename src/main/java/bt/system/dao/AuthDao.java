package bt.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("AuthDao")
public class AuthDao extends DBAbstractMapper{
	/**
	 * 권한 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectAuthInfo(BMap param) throws Exception{
		return list("AuthMapper.selectAuthInfo", param);
	}
	
	/**
	 * 권한 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertAuthInfo(BMap param) throws Exception{
		insert("AuthMapper.insertAuthInfo", param);
	}
	
	/**
	 * 프로그램 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateAuthInfo(BMap param) throws Exception{
		update("AuthMapper.updateAuthInfo", param);
	}
	
	/**
	 * 프로그램 정보 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectAuthCnt(BMap param) throws Exception{
		return (int)selectByPk("AuthMapper.selectAuthCnt", param);
	}
	
	/**
	 * 권한정보삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteAuthInfo(BMap param) throws Exception{
		delete("AuthMapper.deleteAuthInfo", param);
	}
}
