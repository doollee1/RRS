package bt.rrs.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bt.btframework.common.vo.CodeVO;
import bt.btframework.excel.POIExcelRRS;
import bt.btframework.utils.BMap;
import bt.btframework.utils.LoginInfo;
import bt.common.dao.UserDao;
import bt.rrs.dao.RrsUserDao;
import egovframework.com.utl.sim.service.EgovFileScrty;

@Service("RrsUserService")
public class RrsUserService {
	@Resource(name = "RrsUserDao")
	private RrsUserDao rrsUserDao;

	@Resource(name = "UserDao")
	private UserDao userDao;   //관리자

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
	 * 공통코드 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public String selectGetCommonCode2(BMap param) throws Exception {
		List<CodeVO> codeList = rrsUserDao.selectGetCommonCode2(param);

		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue +=  codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		return resultValue;
	}


	/**
	 * 회원 ID 중복체크
	 * @param param
	 * @throws Exception
	 */
	public BMap UserIdCheck(BMap param) throws Exception {
		BMap bMap = new BMap();
		int chk = rrsUserDao.selectUserInfoCnt(param);
		if (chk > 0) {
			bMap.put("result", "isExistUser");
		}

		return bMap;
	};

	/**
	 * 회원 정보 저장
	 * @param param
	 * @throws Exception
	 */
	public BMap saveUserInfo(BMap param) throws Exception{
		BMap bMap = new BMap();

		// 등록, 수정 유저 정보
		param.put("LOGIN_USER", LoginInfo.getUserId());

		String MEM_GBN = param.getString("MEM_GBN");
		if(MEM_GBN.equals("01")) {	// 멤버 회원이면 멤버테이블에 있는지 검사
			int memberUserCnt = rrsUserDao.selectMemberUserCnt(param);
			if(memberUserCnt == 0) {	// 멤버테이블에 등록된 회원이 없으면 return false
				bMap.put("result", "isExistMember");
				return bMap;
			}
		}


		// 중복되는 멤버ID 있는지 체크
		int memberIDCnt = rrsUserDao.selectMemberUserInfoCnt(param);
		if(memberIDCnt > 0) {
			bMap.put("result", "isExistMemberID");
			return bMap;
		}

		String isNew = param.getString("isNew");

		int cnt = rrsUserDao.selectUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트

		if("03".equals(MEM_GBN) || "04".equals(MEM_GBN)  || "05".equals(MEM_GBN)) {

			param.put("COMP_CD", "1000");
			param.put("NAME_1ST", "에이전시");
			param.put("NAME_2ND", param.getString("ENG_NAME"));
			param.put("USER_TP", "01");
			param.put("USER_GD", MEM_GBN);
			param.put("LANG_CD", "KO");
			param.put("STATUS", "A");
			param.put("E_MAIL", param.getString("EMAIL"));
			param.put("START_DT", new SimpleDateFormat("yyyyMMdd").format(new Date()));
			param.put("STOP_DT", "9999.12.31");

			cnt = userDao.selectUserInfoCnt(param); //현 ID가 등록된 ID인지 카운트
		}

		if(isNew.equals("Y")) {

			// 신규 입력인 경우
			if(cnt == 0) {

				param.put("PASSWD", EgovFileScrty.encryptPassword("fam1!", param.getString("USER_ID")));   //"fam1!"
				rrsUserDao.insertUserInfo(param); //등록되지 않았을 때 사용자 등록

				if("03".equals(MEM_GBN) || "04".equals(MEM_GBN)  || "05".equals(MEM_GBN)) {
					param.put("PW_CURR", EgovFileScrty.encryptPassword("fam1!", param.getString("USER_ID")));  //최초 아이디 등록시 패스워드 oms1234
					userDao.insertUserInfo(param); //등록되지 않았을 때 관리자 등록
				}

			} else {

				bMap.put("result", "isExistUser");
				return bMap;
			}

		} else {

			// 수정인경우
			rrsUserDao.updateUserInfo(param); //등록된 사용자 정보 수정
			if("03".equals(MEM_GBN) || "04".equals(MEM_GBN)  || "05".equals(MEM_GBN)) {
				userDao.updateUserInfo(param); //등록된 관리자 정보 수정
			}

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

			/* 관리자 정보 같이 삭제 */
			param.put("COMP_CD", "1000");
			int adminCnt = userDao.selectUserInfoCnt(param);
			if(adminCnt > 0) {
				userDao.deleteUserInfo(param); /* 관리자 같이 */
			}
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

		// 등록, 수정 유저 정보
		param.put("LOGIN_USER", LoginInfo.getUserId());

		// MEMBER_ID와 중복되는 ID가 있고, MEMBER_ID와 Ex_MEMBER_ID가 다른 경우 return
		int memberIDCnt = rrsUserDao.selectMemberIDCnt(param);
		if(memberIDCnt > 0) {
			if(!(((String) param.get("MEMBER_ID")).equals(param.get("Ex_MEMBER_ID")))) {
				bMap.put("result", "isExistMemberID");
				return bMap;
			}
		}

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

		// 일반회원 -> 멤버회원 전환일때
		if (((String) param.get("MEM_FLAG")).equals("Y")) {
			// 회원 테이블 정보 수정
			rrsUserDao.updateUserInfoChgMemGbn(param);
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
		String[] header = new String[]{"MEMBER_ID", "HAN_NAME", "ENG_NAME", "TEL_NO"};
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
				int count = rrsUserDao.selectMemberIDCnt(bMap);
				if(count > 0) {
					// 실패 => return
					validationResultMap.put("result" , "failure");
					validationResultMap.put("message", "중복된 멤버회원이 존재합니다.\n멤버ID: " + bMap.getString("MEMBER_ID"));
					return validationResultMap;
				}
			}

			// 데이터에 문제 없으면 입력
			for (BMap bMap : list) {
				// 등록, 수정 유저 정보
				bMap.put("LOGIN_USER", LoginInfo.getUserId());

				rrsUserDao.insertMemberUserInfo(bMap);
			}
		}
		result.put("result", "success");
		return result;
	}

	public BMap inputValidation(BMap bMap) {
		BMap resultMap = new BMap();
		resultMap.put("result", "failure");

		String MEMBER_ID = bMap.getString("MEMBER_ID");
		String HAN_NAME  = bMap.getString("HAN_NAME");
		String ENG_NAME  = bMap.getString("ENG_NAME");
		String TEL_NO    = bMap.getString("TEL_NO");

		// empty value
		if(MEMBER_ID == null || MEMBER_ID.equals("null") || MEMBER_ID.equals("")) {
			resultMap.put("message", "멤버ID를 입력해주세요.\n멤버ID: " + MEMBER_ID);
			return resultMap;
		}

		if(HAN_NAME == null || HAN_NAME.equals("null") || HAN_NAME.equals("")) {
			resultMap.put("message", "이름을 입력해주세요.\n이름: " + HAN_NAME);
			return resultMap;
		}

		if(ENG_NAME == null || ENG_NAME.equals("null") || ENG_NAME.equals("")) {
			resultMap.put("message", "영문이름을 입력해주세요.\n영문이름: " + ENG_NAME);
			return resultMap;
		}

		if(TEL_NO == null || TEL_NO.equals("null") || TEL_NO.equals("")) {
			resultMap.put("message", "전화번호를 입력해주세요.\n전화번호: " + TEL_NO);
			return resultMap;
		}

		// maxlength
		if(MEMBER_ID.length() > 5) {
			resultMap.put("message", "멤버ID는 5자리로 입력해야 합니다.\n멤버ID: " + HAN_NAME);
			return resultMap;
		}

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

		// 멤버ID 정규식
		if(!Pattern.matches("^[a-zA-Z]{1}+[0-9]{4}", MEMBER_ID)) {
			resultMap.put("message", "멤버ID는 알파벳 1자리+숫자 4자리로 입력해주세요\n멤버ID: " + MEMBER_ID);
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

	public BMap deleteMemberUserInfo(List<BMap> paramList) throws Exception{
		BMap bMap = new BMap();

		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));

			// 회원 테이블에 있는지 검사
			int memberCnt = rrsUserDao.selectMemberUserInfoCntAfterMemberdelete(param);
			if (memberCnt > 0) {
				bMap.put("result", "isExistUserMember");
			} else {
				rrsUserDao.deleteMemberUserInfo(param);
				bMap.put("result", "success");
			}
		}

		return bMap;
	}

	/**
	 * 멤버회원 정보 검색 조회
	 */
	public List<BMap> selectSearchUserInfo(BMap param) throws Exception{
		return rrsUserDao.selectSearchUserInfo(param);
	}

	/**
	 * 에이전시 컴퍼니 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectAgencyComp(Map<String, Object> param) throws Exception{
		return rrsUserDao.selectAgencyComp(param);
	}

	/**
	 * 에이전시 담당자 정보 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectAgencyUser(Map<String, Object> param) throws Exception{
		return rrsUserDao.selectAgencyUser(param);
	}

	/**
	 * 에이전시 컴퍼니 정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteAgencyComp(List<BMap> paramList) throws Exception{

		for(int i = 0; i < paramList.size(); i++){
			BMap param = new BMap(paramList.get(i));
			rrsUserDao.deleteAgencyComp(param);
		}
	}

	/**
	 * 에이전시 컴퍼니 추가
	 * @param param
	 * @throws Exception
	 */
	public BMap addAgencyComp(Map<String, Object> param) throws Exception{
		BMap bMap = new BMap();
		param.put("LOGIN_USER", LoginInfo.getUserId());

		try {
			/* 이미 등록된 컴퍼니 인지 체크 */
			int chk = rrsUserDao.chkAgencyComp(param);
			if(chk > 0) {
				bMap.put("result", "isExistAgencyComp");
				return bMap;
			}
			else {
				rrsUserDao.addAgencyComp(param);
				bMap.put("result", "success");
			}
		}
		catch(Exception e) {
			bMap.put("result", "false");
			bMap.put("message", e.getMessage());
		}
		return bMap;
	}

	/**
	 * 에이전시 담당자 추가
	 * @param param
	 * @throws Exception
	 */
	public BMap addAgencyUser(BMap param) throws Exception{
		BMap bMap = new BMap();
		String MEM_GBN = param.getString("MEM_GBN");

		try {
			/* 등록, 수정 유저 정보 */
			param.put("LOGIN_USER", LoginInfo.getUserId());

			/* TB_MEMBER(회원테이블)에 중복 데이터가 있는지 체크 */
			int cnt = rrsUserDao.selectUserInfoCnt(param);

			/* BC_USER(관리자테이블)에 입력할 데이터 */
			param.put("COMP_CD",  "1000");
			param.put("NAME_1ST", "에이전시");
			param.put("NAME_2ND", param.getString("ENG_NAME"));
			param.put("USER_TP",  "01");
			param.put("USER_GD",  MEM_GBN);
			param.put("LANG_CD",  "KO");
			param.put("STATUS",   "A");
			param.put("E_MAIL",   param.getString("EMAIL"));
			param.put("START_DT", new SimpleDateFormat("yyyyMMdd").format(new Date()));
			param.put("STOP_DT",  "9999.12.31");

			/* BC_USER(관리자테이블)에 중복 데이터가 있는지 체크 */
			cnt = userDao.selectUserInfoCnt(param);

			if(cnt == 0) {
				/* TB_MEMBER(회원테이블)에 등록 */
				param.put("PASSWD", EgovFileScrty.encryptPassword("fam1!", param.getString("USER_ID")));   //"fam1!"
				rrsUserDao.insertAgencyUser(param);

				/* BC_USER(관리자테이블)에 등록 */
				param.put("PW_CURR", EgovFileScrty.encryptPassword("fam1!", param.getString("USER_ID")));  //최초 아이디 등록시 패스워드 fam1!
				userDao.insertUserInfo(param);

				bMap.put("result", "success");
			} else {
				bMap.put("result", "isExistUser");
				return bMap;
			}
		} catch (Exception e) {
			bMap.put("result", "false");
			bMap.put("message", e.getMessage());
		}
		return bMap;
	}

	/**
	 * 에이전시 담당자 정보 수정
	 * @param param
	 * @throws Exception
	 */
	public Boolean updateAgencyUser(List<BMap> paramList) throws Exception{
		Boolean isValid = true;
		try {
			for(int i = 0; i < paramList.size(); i++){
				BMap param = new BMap(paramList.get(i));
				param.put("LOGIN_USER", LoginInfo.getUserId());
				
				// 회원구분 코드 매핑
				String AGENCY_GB = param.getString("AGENCY_GB_CD");
				if("1".equals(AGENCY_GB) ) {
					param.put("MEM_GBN","03");							
				}
				else if("2".equals(AGENCY_GB)) {
					param.put("MEM_GBN","04");
				}
				else if("3".equals(AGENCY_GB)) {
					param.put("MEM_GBN","05");
				}
				
				rrsUserDao.updateAgencyUser(param);				// 회원정보 수정
				rrsUserDao.updateAgencyUserInfo(param);			// 사용자정보 수정
			}
		} catch (Exception e) {
		    // TODO: handle exception
			e.printStackTrace();
			isValid = false;
		}
		return isValid;
	}
}
