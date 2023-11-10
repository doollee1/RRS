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
import bt.common.service.BBSService;
import bt.common.service.CommonService;
import bt.common.service.FileService;

@Controller
public class BBSController {
	@Resource(name = "BBSService")
	private BBSService bbsService;
	
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
	@RequestMapping(value = "/common/BBSList.do")
	public String BBSList(ModelMap model) throws Exception{
		return "/common/BBSList";
	}	
	
	/**
	 * 공지사항 리스트 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectBBSList.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBBSList(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		respData.put("result", bbsService.selectBBSInfo(param));
		
		return respData;
	}
	
	/**
	 * 공지사항 조회
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/selectBBSInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData selectBBSInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		
		List<BMap> list = bbsService.selectBBSInfo(param);
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
	@RequestMapping(value = "/common/BBSWrite.do")
	public String BBSWrite(ModelMap model, HttpServletRequest req) throws Exception {	
		model.addAttribute("BO_ID", req.getParameter("BO_ID"));
		model.addAttribute("noticetype", commonService.selectCommonCode("NOTICE_TP"));
		return "/common/BBSWrite";
	}
	
	/**
	 * 공지사항 이미지 업로드 팝업 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/BBSImageUploadPopup.do")
	public String bbsImageUpload(ModelMap model) throws Exception{
		return "/popup/BBSImageUploadPopup";
	}

	/**
	 * 공지사항 이미지 업로드
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/BBSImageUpload.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public BRespData bbsUploadImage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BMap> list = bbsService.bbsUploadImage(req);
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
	@RequestMapping(value = "/common/bbsFileUpload.do")
	@ResponseBody
	public BRespData bbsFileUpload(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		List<BMap> list = bbsService.bbsFileUpload(req);
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
	@RequestMapping(value = "/common/insertBBSInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData insertBBSInfo(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();
		//String test1 = param.get("CONTENTS").toString().replaceAll("<", "&lt;");
		//String test2 = test1.replaceAll(">", "&gt;");
		
		//param.put("CONTENTS", test2);
		bbsService.insertBBSInfo(param);
		return respData;
	}
	
	/**
	 * 공지사항 뷰 화면 호출
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/BBSView.do")
	public String BBSView(ModelMap model) throws Exception{
		return "/common/BBSView";
	}

	/**
	 * 공지사항 첨부파일 다운로드
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/downloadBBSAttach.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public void downloadBBSAttach(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		bbsService.downloadBBSAttach(req, resp);
	}

	/**
	 * 공지사항 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/BBSDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData BBSDelete(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception {
		
		BMap param = reqData.getParamDataMap("param");	
		bbsService.BBSDelete(param);		 
		bbsService.deleteBBSAttach(param);
		
		return new BRespData();
	}
	
	/**
	 * 공지사항 첨부파일 삭제
	 * @param reqData
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/common/deleteBBSAttach.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData deleteBBSAttach(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		param.put("FILE_UID", param.getString("fileUid"));
		param.put("NEW_FILE_NM", param.getString("fileName"));
		BRespData respData = new BRespData();

		bbsService.deleteBBSAttach(param);
		
		return respData;
	}
	
	@RequestMapping(value = "/common/updateBBSCnt.do", method = RequestMethod.POST)
	@ResponseBody
	public BRespData updateBBSCnt(@RequestBody BReqData reqData, HttpServletRequest req) throws Exception{
		BMap param = reqData.getParamDataMap("param");
		BRespData respData = new BRespData();

		bbsService.updateBBSCnt(param);
		
		return respData;
	}
	
}
