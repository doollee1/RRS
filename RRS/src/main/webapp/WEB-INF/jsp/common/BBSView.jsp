<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : NoticeWrite
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="NoticeView" />
</c:import>

<!--****dummy*** -->
<div class="top_button_h_margin" style="border-bottom:1px solid #ddd; padding-bottom:4px;"></div>

<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
<div id="ctm_wrap">
	<div class="ctm_sech_wrap">
		<input type="hidden" name="ISNEW" value="1" />
		<input type="hidden" name="ORASCN" />
		<table class="tblForm">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code='notice.notice'/></h4>
				</div>
				<div class="ct_grid_top_right"></div>
			</div>
			<colgroup>
				<col width="130px" />
		        <col/>
		    </colgroup>
			<tr>
				<th><s:message code='notice.title'/></th>
				<td colspan="3">
					<input type="hidden" id="hBOID" name="hBOID" />
					<input type="hidden" id="hBBSNo" name="hBBSNo" />
					<label id="lblTitle"></label>
				</td>
			</tr>
			<tr>
				<th><s:message code='notice.notictype'/></th>
				<td colspan="3">
					<label id="lblBBSCATEGORY"></label>
				</td>
			</tr>			
			<tr style="height: 30px;">
				<th><s:message code='notice.file'/></th>
				<td colspan="3" style="margin:5px;">
					<div id="noticeAttach" class="ctm_mg_wrap" style="float:left;width:100%; height:auto; overflow-y:auto;"></div>
				</td>
			</tr>
			<tr>
				<th><s:message code='notice.content'/></th>
				<td colspan="3">
					<div id="divContents" class="ctm_mg_wrap" style="float:left; width:100%; height:480px; overflow-y:auto;">
					</div>
				</td>
			</tr>			
		</table>
	</div>
</div>

<script type="text/javascript">
<%-- 
  * ========= 공통버튼 클릭함수 =========
  * 검색 : cSearch()
  * 추가 : cAdd()
  * 삭제 : cDel()
  * 저장 : cSave()
  * 인쇄 : cPrint()
  * 업로드 : cUpload()
  * 엑셀다운 : cExcel()
  * PDF다운 : cPdf()
  * 취소 : cCancel()
  * 사용자버튼 : cUser1() ~ cUser5()
  * -------------------------------
  * 버튼 순서 : setCommBtnSeq(['ret','list']) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * 버튼 표시/숨김 : setCommBtn('ret', true) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * ===============================
--%>
	//초기 로드
	$(function() {
		initLayout();
		$('#cBtnSearch').text("<s:message code='button.list'/>");
		$('#cBtnAdd').text("<s:message code='button.modify'/>");
		
		$('#cBtnSearch').addClass("cls");
		$('#cBtnSearch').addClass("cBtnList_style");
		
		$('#cBtnAdd').addClass("cls");
		$('#cBtnAdd').addClass("cBtnEdit_style");
		
		$("#hBOID").val("${param.BO_ID}");
		$("#hBBSNo").val("${param.BBS_NO}");
		selectBBSInfo();
		updateBBSCnt();
	});
	
	function selectBBSInfo(){
		
		if ($("#hBBSNo").val() == "") return;
		
		var url = "<c:url value="/common/selectBBSInfo.do"/>";
		var param = { "param" : {
				"BO_ID" : $("#hBOID").val(),
				"S_BBS_NO" : $("#hBBSNo").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			var result = data.result;
			$("#lblTitle").text(result.BBS_TITLE);
			$("#lblBBSCATEGORY").text(result.BBS_CATEGORY_NM);
			$("#divContents").html(result.BBS_CONTENTS);
			if("${loginVO.userId}" == result.REG_ID){
				setCommBtn("Add", true, "<s:message code='button.modify'/>");
			}else{
				setCommBtn("Add", false);
			}
			
			var file = data.fileResult;
			if (file != "") {
				output(file);	
			}
		});
	}
	
	function output(data){
		$.each(data, function(index, item) {
			var url ="<c:url value="/common/downloadBBSAttach.do"/>";
			var link = url + "?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
			$("#noticeAttach").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + item.SRC_FILE_NM + "</a>");
			$("#noticeAttach").append("<br/>");
		});
	}
	
	function cSearch(){
		var url ="<c:url value="/common/BBSList.do"/>";
		fn_pageMove(url);
	}
	
	function cAdd(){
		var param = {
			"BO_ID" : $("#hBOID").val(),
			"BBS_NO" : $("#hBBSNo").val()
		};
		var url ="<c:url value="/common/BBSWrite.do"/>";
		fn_pageMove(url, param);
	}
	
	function updateBBSCnt() {
		if ($("#hBBSNo").val() == "") return;
		
		var url = "<c:url value="/common/updateBBSCnt.do" />";
		var param = { "param" : {
				"BO_ID" : $("#hBOID").val(),
				"BBS_NO" : $("#hBBSNo").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr) {
			console.error(arguments);
		});
	}
</script>

<c:import url="../import/frameBottom.jsp" />
	