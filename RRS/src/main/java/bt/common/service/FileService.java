package bt.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.FileDao;

@Service("FileService")
public class FileService {
	@Resource(name = "FileDao")
	private FileDao fileDao;
	
	/**
	 * 첨부파일 정보 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertFileInfo(BMap param) throws Exception{
		param.put("LOGIN_USER", LoginInfo.getUserId());
		fileDao.insertFileInfo(param);
	}
	
	/**
	 * 첨부파일 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectFileInfo(BMap param) throws Exception{
		return fileDao.selectFileInfo(param);
	}
	
	/**
	 * 첨부파일 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteFileInfo(BMap param) throws Exception{
		fileDao.deleteFileInfo(param);
	}
}
