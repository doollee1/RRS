package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("UserDao")
public class UserDao extends DBAbstractMapper {
	/**
	 * 사용자 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectUserInfo(BMap param )throws Exception{
		return list("UserMapper.selectUserInfo", param);
	}
	
	/**
	 * 사용자 정보 추가
	 * @param param
	 * @throws Exception
	 */
	public void insertUserInfo(BMap param) throws Exception{
		insert("UserMapper.insertUserInfo", param);
	}
	
	/**
	 * 사용자 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateUserInfo(BMap param) throws Exception{
		update("UserMapper.updateUserInfo", param);
	}
	
	/**
	 * 사용자 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteUserInfo(BMap param) throws Exception{
		delete("UserMapper.deleteUserInfo", param);
	}
	
	/**
	 * 특정 사용자 수 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectUserInfoCnt(BMap param) throws Exception{
		return (int)selectByPk("UserMapper.selectUserInfoCnt", param);
	}
	
	/**
	 * 사용자 패스워드 수정
	 * @param param
	 * @throws Exception
	 */
	public void updatePassword(BMap param) throws Exception{
		update("UserMapper.updatePassword", param);
	}
	
	/**
	 * 사용자 과거 패스워드 체크
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectPastPassword(BMap param) throws Exception{
		return (int)selectByPk("UserMapper.selectPastPassword", param);
	}
	
	/**
	 * Lock 해지
	 * @param param
	 * @throws Exception
	 */
	public void updateLockyn(BMap param) throws Exception{
		update("UserMapper.updateLockyn", param);
	}
}
