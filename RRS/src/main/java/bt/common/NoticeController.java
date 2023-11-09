package bt.common;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.common.service.CommonService;
import bt.common.service.FileService;
import bt.common.service.NoticeService;

@Controller
public class NoticeController {
	@Resource(name = "NoticeService")
	private NoticeService noticeService;
	
	@Resource(name = "FileService")
	private FileService fileService;
	
	@Resource(name = "CommonService")
	private CommonService commonService;
	
	/**
	 * 공지사항 리스트 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/NoticeList.do")
	public String NoticeList(ModelMap model) throws Exception{
		return "/common/NoticeList";
	}
	
	/**
	 * 공지사항 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectNoticeList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectNoticeList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", noticeService.selectNoticeInfo(param));
		
		return respData;
	}
	
	/**
	 * 공지사항 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectNoticeInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectAppAuthInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		List<BMap> list = noticeService.selectNoticeInfo(param);
		param.put("FILE_UID", list.get(0).getString("FILE_UID"));
		List<BMap> fileList = fileService.selectFileInfo(param);
		
		respData.put("result", list.get(0));
		respData.put("fileResult", fileList);
		
		return respData;
	}
	
	/**
	 * 공지사항 작성 페이지 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/NoticeWrite.do")
	public String NoticeWrite(ModelMap model) throws Exception{
		model.addAttribute("noticetype", commonService.selectCommonCode("NOTICE_TP"));
		return "/common/NoticeWrite";
	}
	
	/**
	 * 공지사항 이미지 업로드 팝업 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/noticeImageUploadPopup.do")
	public String noticeImageUpload(ModelMap model) throws Exception{
		return "/popup/NoticeImageUploadPopup";
	}
	
	/**
	 * 공지사항 이미지 업로드
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/noticeImageUpload.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public BRespData noticeUploadImage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BMap> list = noticeService.noticeUploadImage(req);
		BRespData respData = new BRespData();
		respData.put("result", list);
		return respData;
	}
	
	/**
	 * 공지사항 파일 첨부 업로드
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/noticeFileUpload.do")
	@ResponseBody
	public BRespData noticeFileUpload(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BMap> list = noticeService.noticeFileUpload(req);
		BRespData respData = new BRespData();
		respData.put("result", list);
		return respData;
	}
	
	/**
	 * 공지사항 등록
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/insertNoticeInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData insertNoticeInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		//String test1 = param.get("CONTENTS").toString().replaceAll("<", "&lt;");
		//String test2 = test1.replaceAll(">", "&gt;");
		
		//param.put("CONTENTS", test2);
		noticeService.insertNoticeInfo(param);
		return respData;
	}
	
	/**
	 * 공지사항 뷰 화면 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/NoticeView.do")
	public String NoticeView(ModelMap model) throws Exception{
		return "/common/NoticeView";
	}
	
	/**
	 * 공지사항 첨부파일 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/downloadNoticeAttach", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void downloadNoticeAttach(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		noticeService.downloadNoticeAttach(req, resp);
	}
	
	/**
	 * 공지사항 첨부파일 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/deleteNoticeAttach.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteNoticeAttach(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("FILE_UID", param.getString("fileUid"));
		param.put("NEW_FILE_NM", param.getString("fileName"));
		BRespData respData = new BRespData();

		noticeService.deleteNoticeAttach(param);
		
		return respData;
	}
	
	@RequestMapping(value = "/common/updateNoticeCnt.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateNoticeCnt(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		noticeService.updateNoticeCnt(param);
		
		return respData;
	}
	
}
