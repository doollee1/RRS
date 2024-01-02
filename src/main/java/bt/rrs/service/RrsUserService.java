package bt.rrs.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

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
	 * 공통코드 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectGetCommonCode(BMap param) throws Exception {
		return rrsUserDao.selectGetCommonCode(param);
	}
	
	/**
	 * 회원 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public BMap saveUserInfo(BMap param) throws Exception{
		BMap bMap = new BMap();
		
		String MEM_GBN = param.getString("MEM_GBN");
		if(MEM_GBN.equals("01")) {	// 멤버 회원이면 멤버테이블에 있는지 검사
			int memberUserCnt = rrsUserDao.selectMemberUserCnt(param);
			if(memberUserCnt == 0) {	// 멤버테이블에 등록된 회원이 없으면 return false
				bMap.put("result", "isExistMember");
				return bMap;
			}
		}
		
		String isNew = param.getString("isNew");
	
		int cnt = rrsUserDao.selectUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트
		if(isNew.equals("Y")) {
			// 신규 입력인 경우
			if(cnt == 0) {
				param.put("PASSWD", "1234");
				rrsUserDao.insertUserInfo(param); //등록되지 않았을 때 등록
			} else {
				bMap.put("result", "isExistUser");
				return bMap;
			}
		} else {
			// 수정인경우
			rrsUserDao.updateUserInfo(param); //등록된 사용자 정보 수정
		}
		
		bMap.put("result", "success");
		return bMap;
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
	public BMap saveMemberUserInfo(BMap param) throws Exception{
		BMap bMap = new BMap();
		
		int cnt = rrsUserDao.selectMemberUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트 (Ex_HAN_NAME, Ex_ENG_NAME, Ex_TEL_NO)
		if(cnt == 0){
			// 새롭게 입력된 값으로 다시한번 조회
			int memCnt = rrsUserDao.selectMemberUserCnt(param);
			if(memCnt == 0) {
				// 없으면 등록
				rrsUserDao.insertMemberUserInfo(param); //등록되지 않았을 때 등록
			} else {
				// 있으면 false 리턴
				bMap.put("result", "isExistMember");
				return bMap;
			}
		}else{
			//멤버 테이블의 멤버 정보 수정
			rrsUserDao.updateMemberUserInfo(param);
			// 회원 테이블에 있는지 검사 후
			int memberCnt = rrsUserDao.selectMemberUserInfoCntAfterMemberUpdate(param);
			// 있으면 회원테이블에도 멤버 정보 수정
			if(memberCnt > 0) rrsUserDao.updateUserInfoAfterMemberUpdate(param);
		}
		bMap.put("result", "success");
		return bMap;
	}
	
	/**
	 * 멤버회원 엑셀 업로드
	 * @param param
	 * @throws Exception
	 */
	public BMap uploadMemberUserExcel(HttpServletRequest req) throws Exception {
		POIExcelRRS upload = new POIExcelRRS();
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) req;
		String[] header = new String[]{"HAN_NAME", "ENG_NAME", "TEL_NO"};
		List<MultipartFile> files =  mpRequest.getFiles("fileupload[]");
		
		BMap result = new BMap();
		for(MultipartFile file : files) {
			List<BMap> list = upload.excelUpload(file, header);
			// 순회하면서 데이터에 문제 있으면 return
			for (BMap bMap : list) {
				// excel upload data validation
				BMap validationResultMap = inputValidation(bMap);
				if(validationResultMap.getString("result").equals("failure")) {
					// 실패 => return
					return validationResultMap;
				}
				
				// 중복 검사
				int count = rrsUserDao.selectMemberUserCnt(bMap);
				if(count > 0) {
					// 실패 => return
					validationResultMap.put("result", "failure");
					validationResultMap.put("message", "중복된 멤버회원이 존재합니다.\n이름: " + bMap.getString("HAN_NAME"));
					return validationResultMap;
				}
			}
			
			// 데이터에 문제 없으면 입력
			for (BMap bMap : list) {
				if(bMap.size() >= 3) { 
					rrsUserDao.insertMemberUserInfo(bMap);
				}
			}
		}
		result.put("result", "success");
		return result;
	}
	
	public BMap inputValidation(BMap bMap) {
		BMap resultMap = new BMap();
		resultMap.put("result", "failure");
		
		String HAN_NAME = bMap.getString("HAN_NAME");
		String ENG_NAME = bMap.getString("ENG_NAME");
		String TEL_NO = bMap.getString("TEL_NO");
		
		// empty value
		if(HAN_NAME.length() == 0) {
			resultMap.put("message", "이름을 입력해주세요.\n이름: " + HAN_NAME);
			return resultMap;
		}
		
		if(ENG_NAME.length() == 0) {
			resultMap.put("message", "영문이름을 입력해주세요.\n영문이름: " + ENG_NAME);
			return resultMap;
		}
		
		if(TEL_NO.length() == 0) {
			resultMap.put("message", "전화번호를 입력해주세요.\n전화번호: " + TEL_NO);
			return resultMap;
		}
		
		// maxlength
		if(HAN_NAME.length() > 20) {
			resultMap.put("message", "이름 길이를 20이하로 입력해주세요.\n이름: " + HAN_NAME);
			return resultMap;
		}
		
		if(ENG_NAME.length() > 30) {
			resultMap.put("message", "영문이름 길이를 30이하로 입력해주세요.\n영문이름: " + ENG_NAME);
			return resultMap;
		}
		
		if(TEL_NO.length() > 20) {
			resultMap.put("message", "전화번호 길이를 20이하로 입력해주세요.\n전화번호: " + TEL_NO);
			return resultMap;
		}
		
		// 한글만 입력
		if(!Pattern.matches("^[ㄱ-ㅎ가-힣]*$", HAN_NAME)) {
			resultMap.put("message", "이름에 한글만 입력해야 합니다.\n이름: " + HAN_NAME);
			return resultMap;
		}
		
		// 영어만 입력
		if(!Pattern.matches("^[a-zA-Z]*$", ENG_NAME)) {
			resultMap.put("message", "영문이름에 영어만 입력해야 합니다.\n영문이름: " + ENG_NAME);
			return resultMap;
		}
		
		// 숫자만 입력
		if(!Pattern.matches("^[0-9]*$", TEL_NO)) {
			resultMap.put("message", "전화번호에 숫자만 입력해야 합니다.\n전화번호: " + TEL_NO);
			return resultMap;
		}
		
		resultMap.put("result", "success");
		return resultMap;
	}
	
	/**
	 * 멤버회원 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteMemberUserInfo(List<BMap> paramList) throws Exception{
		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			rrsUserDao.deleteMemberUserInfo(param);
		}
	}
}
