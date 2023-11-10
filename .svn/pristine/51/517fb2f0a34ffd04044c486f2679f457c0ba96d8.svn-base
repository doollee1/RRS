package bt.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("AppAuthDao")
public class AppAuthDao extends DBAbstractMapper {
	/**
	 * 프로그램별 권한 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectAppAuthInfo(BMap param) throws Exception{
		return list("AppAuthMapper.selectAppAuthInfo", param);
	}
	
	/**
	 * 프로그램 권한 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertAppAuthInfo(BMap param) throws Exception{
		insert("AppAuthMapper.insertAppAuthInfo", param);
	}
	
	/**
	 * 프로그램 권한 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateAppAuthInfo(BMap param) throws Exception{
		update("AppAuthMapper.updateAppAuthInfo", param);
	}
	
	/**
	 * 프로그램 권한 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteAppAuthInfo(BMap param) throws Exception{
		delete("AppAuthMapper.deleteAppAuthInfo", param);
	}
	
	/**
	 * 프로그램 권한 정보 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectAppAuthCnt(BMap param) throws Exception{
		return (int)selectByPk("AppAuthMapper.selectAppAuthCnt", param);
	}
}
