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
					<input type="hidden" id="hNoticeNo" name="hNoticeNo" />
					<label id="lblTitle"></label>
				</td>
			</tr>
			<tr>
				<th><s:message code='notice.notictype'/></th>
				<td>
					<label id="lblNoticeType"></label>
				</td>
				<th width="8%"><s:message code='notice.noticdate'/></th>
				<td>
					<label id="lblFromDate"></label> &nbsp;~&nbsp;
					<label id="lblToDate"></label>
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
		
		
		$("#hNoticeNo").val("${param.NOTICE_NO}");
		selectNoticeInfo();
		updateNoticeCnt();
	});
	
	function selectNoticeInfo(){
		
		if ($("#hNoticeNo").val() == "") return;
		
		var url = "/common/selectNoticeInfo.do";
		var param = { "param" : {
				"S_NOTICE_NO" : $("#hNoticeNo").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			var result = data.result;
			$("#lblTitle").text(result.TITLE);
			$("#lblNoticeType").text(result.NOTICE_TP_NM);
			$("#lblFromDate").text(result.FROMDATE);
			$("#lblToDate").text(result.TODATE);
			$("#divContents").html(result.CONTENTS);
			if("${loginVO.userId}" == result.REG_ID){
				setCommBtn("Add", true, "<s:message code='button.modify'/>");
			}else{
				setCommBtn("Add", false);
			}
			
			var file = data.fileResult;
			output(file);
		});
	}
	
	function output(data){
		$.each(data, function(index, item){
			var link = "/common/downloadNoticeAttach.do?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
			$("#noticeAttach").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + item.SRC_FILE_NM + "</a>");
			$("#noticeAttach").append("<br/>");
		});
	}
	
	function cSearch(){
		fn_pageMove("/common/NoticeList.do");
	}
	
	function cAdd(){
		var param = {
			"NOTICE_NO" : "${param.NOTICE_NO}"
		};
		
		fn_pageMove("/common/NoticeWrite.do", param);
	}
	
	function updateNoticeCnt() {
		if ($("#hNoticeNo").val() == "") return;
		
		var url = "/common/updateNoticeCnt.do";
		var param = { "param" : {
				"NOTICE_NO" : $("#hNoticeNo").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr) {
			console.error(arguments);
		});
	}
</script>

<c:import url="../import/frameBottom.jsp" />
	