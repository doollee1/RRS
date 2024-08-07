package bt.rrs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bt.btframework.common.vo.CodeVO;
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
	 * 공통코드 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectGetCommonCode(BMap param) throws Exception{
		return list("RrsUserMapper.selectGetCommonCode", param);
	}
	/**
	 * 공통코드 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> selectGetCommonCode2(BMap param) throws Exception{
		return list("RrsUserMapper.selectGetCommonCode2", param);
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
	 * 회원 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteUserInfo(BMap param) throws Exception{
		delete("RrsUserMapper.deleteUserInfo", param);
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
	 * 특정 멤버회원 카운트
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMemberUserCnt(BMap param) throws Exception{
		return (int)selectByPk("RrsUserMapper.selectMemberUserCnt", param);
	}

	/**
	 * 멤버ID 중복체크
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMemberIDCnt(BMap param) throws Exception{
		return (int)selectByPk("RrsUserMapper.selectMemberIDCnt", param);
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

	/**
	 * 멤버정보를 가지고 회원 테이블에 멤버 회원 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMemberUserInfoCntAfterMemberUpdate(BMap param) throws Exception{
		return (int)selectByPk("RrsUserMapper.selectMemberUserInfoCntAfterMemberUpdate", param);
	}

	/**
	 * 멤버정보를 가지고 회원 테이블에 멤버 회원 정보 수정
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void updateUserInfoAfterMemberUpdate(BMap param) throws Exception{
		update("RrsUserMapper.updateUserInfoAfterMemberUpdate", param);
	}

	/**
	 * 멤버회원 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteMemberUserInfo(BMap param) throws Exception{
		delete("RrsUserMapper.deleteMemberUserInfo", param);
	}

	/**
	 * 삭제 전 회원 테이블에 멤버 정보가 있는지 체크
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectMemberUserInfoCntAfterMemberdelete(BMap param) throws Exception{
		return (int)selectByPk("RrsUserMapper.selectMemberUserInfoCntAfterMemberdelete", param);
	}

	/**
	 * 멤버회원 정보 검색 조회
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectSearchUserInfo(BMap param )throws Exception{
		return list("RrsUserMapper.selectSearchUserInfo", param);
	}

	/**
	 * 일반회원 멤버회원으로 변경
	 * @param param
	 * @throws Exception
	 */
	public void updateUserInfoChgMemGbn(BMap param) throws Exception{
		update("RrsUserMapper.updateUserInfoChgMemGbn", param);
	}
	/**
	 * 에이전시 컴퍼니 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectAgencyComp(Map<String, Object> param )throws Exception{
		return list("RrsUserMapper.selectAgencyComp", param);
	}
	/**
	 * 에이전시 담당자 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectAgencyUser(Map<String, Object> param )throws Exception{
		return list("RrsUserMapper.selectAgencyUser", param);
	}
	/**
	 * 에이전시 컴퍼니 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteAgencyComp(BMap param) throws Exception{
		delete("RrsUserMapper.deleteAgencyComp", param);
	}

	/**
	 * 에이전시 컴퍼니 정보 추가
	 * @param param
	 * @throws Exception
	 */
	public void addAgencyComp(Map<String, Object> param) throws Exception{
		insert("RrsUserMapper.addAgencyComp", param);
	}

	/**
	 * 에이전시 담당자 추가
	 * @param param
	 * @throws Exception
	 */
	public void insertAgencyUser(BMap param) {
		insert("RrsUserMapper.insertAgencyUser", param);
	}

	/**
	 * 에이전시 담당자 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateAgencyUser(BMap param) throws Exception{
		update("RrsUserMapper.updateAgencyUser", param);
	}
	/**
	 * 사용자 정보 수정 (에이전시 담당자)
	 * @param param
	 * @throws Exception
	 */
	public void updateAgencyUserInfo(BMap param) throws Exception{
		update("RrsUserMapper.updateAgencyUserInfo", param);
	}

	/**
	 * 에이전시 컴퍼니 저장 전 같은 컴퍼니가 있는지 체크
	 * @param param
	 * @throws Exception
	 */
	public int chkAgencyComp(Map<String, Object> param) {
		return (int)selectByPk("RrsUserMapper.chkAgencyComp", param);
	}

}
