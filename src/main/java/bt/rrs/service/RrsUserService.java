package bt.rrs.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bt.btframework.excel.POIExcelRRS;
import bt.btframework.utils.BMap;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.ResponseStatus;
import bt.rrs.dao.RrsUserDao;

@Service("RrsUserService")
public class RrsUserService {
	@Resource(name = "RrsUserDao")
	private RrsUserDao rrsUserDao;
	
	/**
	 * 회원 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectUserInfo(BMap param) throws Exception{
		return rrsUserDao.selectUserInfo(param);
	}
	
	/**
	 * 회원 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public Boolean saveUserInfo(BMap param) throws Exception{
		Boolean isValid = true;
		int cnt = rrsUserDao.selectUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트 
		if(cnt == 0){
			rrsUserDao.insertUserInfo(param); //등록되지 않았을 때 등록
		}else{
			if(param.getString("ISNEW").equals("0")){
				isValid = false;
			}else{
				rrsUserDao.updateUserInfo(param); //등록된 사용자 정보 수정
			}
		}
		return isValid;
	}
	
	/**
	 * 회원 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteUserInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			rrsUserDao.deleteUserInfo(param);
		}
	}
	
	/**
	 * 멤버회원 정보 조회
	 */
	public List<BMap> selectMemberUserInfo(BMap param) throws Exception{
		return rrsUserDao.selectMemberUserInfo(param);
	}
	
	/**
	 * 멤버회원 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public Boolean saveMemberUserInfo(BMap param) throws Exception{
		Boolean isValid = true;
		
		int cnt = rrsUserDao.selectMemberUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트 
		if(cnt == 0){
			rrsUserDao.insertMemberUserInfo(param); //등록되지 않았을 때 등록
		}else{
			if(param.getString("ISNEW").equals("0")){
				isValid = false;
			}else{
				rrsUserDao.updateMemberUserInfo(param); //등록된 사용자 정보 수정
			}
		}
		return isValid;
	}
	
	/**
	 * 멤버회원 엑셀 업로드
	 * @param param
	 * @throws Exception
	 */
	public BRespData uploadMemberUserExcel(HttpServletRequest req) throws Exception {
		POIExcelRRS upload = new POIExcelRRS();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		String[] header = new String[]{"NO", "HAN_NAME", "ENG_NAME", "TEL_NO"};
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		List<BMap> result = new ArrayList<BMap>();
		
		System.out.println("uploadMemberUserExcel");
		for(MultipartFile file : files) {
			List<BMap> list = upload.excelUpload(file, header);
			for (BMap bMap : list) {
				rrsUserDao.insertMemberUserInfo(bMap);
			}
		}
		
		return new BRespData(ResponseStatus.OK, result);
	}
}
