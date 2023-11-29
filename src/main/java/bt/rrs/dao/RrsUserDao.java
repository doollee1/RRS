package bt.rrs.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("RrsUserDao")
public class RrsUserDao extends DBAbstractMapper {
	/**
	 * 회원 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectUserInfo(BMap param )throws Exception{
		return list("RrsUserMapper.selectUserInfo", param);
	}
	
	/**
	 * 회원 정보 추가
	 * @param param
	 * @throws Exception
	 */
	public void insertUserInfo(BMap param) throws Exception{
		insert("RrsUserMapper.insertUserInfo", param);
	}
	
	/**
	 * 회원 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateUserInfo(BMap param) throws Exception{
		update("RrsUserMapper.updateUserInfo", param);
	}
	
	/**
	 * 특정 회원 수 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectUserInfoCnt(BMap param) throws Exception{
		return (int)selectByPk("RrsUserMapper.selectUserInfoCnt", param);
	}
	
	/**
	 * 멤버회원 정보 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectMemberUserInfo(BMap param )throws Exception{
		return list("RrsUserMapper.selectMemberUserInfo", param);
	}
	
	/**
	 * 멤버회원 정보 추가
	 * @param param
	 * @throws Exception
	 */
	public void insertMemberUserInfo(BMap param) throws Exception{
		insert("RrsUserMapper.insertMemberUserInfo", param);
	}
	
	/**
	 * 멤버회원 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateMemberUserInfo(BMap param) throws Exception{
		update("RrsUserMapper.updateMemberUserInfo", param);
	}
	
	/**
	 * 특정 멤버회원 수 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMemberUserInfoCnt(BMap param) throws Exception{
		return (int)selectByPk("RrsUserMapper.selectMemberUserInfoCnt", param);
	}
}
