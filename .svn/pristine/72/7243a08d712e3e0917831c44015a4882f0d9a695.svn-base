package bt.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("FileDao")
public class FileDao extends DBAbstractMapper {
	/**
	 * 첨부파일 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertFileInfo(BMap param) throws Exception{
		insert("FileMapper.insertFileInfo", param);
	}
	
	/**
	 * 첨부파일 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectFileInfo(BMap param) throws Exception{
		return list("FileMapper.selectFileInfo", param);
	}
	
	/**
	 * 첨부파일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteFileInfo(BMap param) throws Exception{
		delete("FileMapper.deleteFileInfo", param);
	}
}
