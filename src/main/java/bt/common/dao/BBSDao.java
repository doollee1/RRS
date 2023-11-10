package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("BBSDao")
public class BBSDao extends DBAbstractMapper {
	/**
	 * 공지사항 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectBBSInfo(BMap param) throws Exception{
		return list("BBSMapper.selectBBSInfo", param);
	}
	
	/**
	 * 공지사항 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertBBSInfo(BMap param) throws Exception{
		insert("BBSMapper.insertBBSInfo", param);
	}
	
	/**
	 * 공지사항 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateBBSInfo(BMap param) throws Exception{
		update("BBSMapper.updateBBSInfo", param);
	}
	
	/**
	 * 공지사항 조회수 +1
	 * @param param
	 * @throws Exception
	 */
	public void updateBBSCnt(BMap param) throws Exception{
		update("BBSMapper.updateBBSCnt", param);
	}
	
	/**
	 * 공지사항 수정
	 * @param param
	 * @throws Exception
	 */
	public void BBSDelete(BMap param) throws Exception {		
		this.delete("BBSMapper.BBSDelete", param);
	}	
}
