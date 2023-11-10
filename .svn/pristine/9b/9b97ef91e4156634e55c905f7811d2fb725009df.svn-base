package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("NoticeDao")
public class NoticeDao extends DBAbstractMapper {
	/**
	 * 공지사항 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectNoticeInfo(BMap param) throws Exception{
		return list("NoticeMapper.selectNoticeInfo", param);
	}
	
	/**
	 * 공지사항 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertNoticeInfo(BMap param) throws Exception{
		insert("NoticeMapper.insertNoticeInfo", param);
	}
	
	/**
	 * 공지사항 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateNoticeInfo(BMap param) throws Exception{
		update("NoticeMapper.updateNoticeInfo", param);
	}
	
	/**
	 * 공지사항 조회수 +1
	 * @param param
	 * @throws Exception
	 */
	public void updateNoticeCnt(BMap param) throws Exception{
		update("NoticeMapper.updateNoticeCnt", param);
	}
}
