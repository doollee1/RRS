package bt.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("UserAuthDao")
public class UserAuthDao extends DBAbstractMapper {
	/**
	 * 사용자 권한 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectUserAuthInfo(BMap param) throws Exception{
		return list("UserAuthMapper.selectUserAuthInfo", param);
	}
	
	/**
	 * 사용자 권한 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertUserAuthInfo(BMap param) throws Exception{
		insert("UserAuthMapper.insertUserAuthInfo", param);
	}
	
	/**
	 * 사용자 권한 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateUserAuthInfo(BMap param) throws Exception{
		update("UserAuthMapper.updateUserAuthInfo", param);
	}
	
	/**
	 * 사용자 권한 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteUserAuthInfo(BMap param) throws Exception{
		delete("UserAuthMapper.deleteUserAuthInfo", param);
	}
	
	/**
	 * 사용자 권한 정보 카운트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectUserAuthCnt(BMap param) throws Exception{
		return (int) selectByPk("UserAuthMapper.selectUserAuthCnt", param);
	}
}
