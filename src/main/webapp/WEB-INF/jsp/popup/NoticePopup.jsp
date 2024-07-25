<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : NoticePopup
 * @Description : 메인 공지사항 팝업
 */
%>

<div id="noticePopup" style="overflow-y:auto;">
	<form id="frmNoticeP" action="#">
	<div id="pop_ct_form_wrap">
		<table class="pop_tblForm">
			<caption></caption>
			<colgroup>
				<col width="130px" />
				<col />
			</colgroup>
			<tr>
				<th><s:message code='notice.title'/></th>
				<td colspan="3">
					<input type="text" name="TITLE" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th><s:message code='notice.notictype'/></th>
				<td colspan="3">
					<input type="text" name="NOTICE_TP_NM" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th><s:message code='notice.noticdate'/></th>
				<td>
					<input type="text" name="FROMDATE" style="width:calc(21% - 100px); float:left;" data-type="date" disabled="" readonly><p style="float:left; margin-top:3px; margin-left:3px; margin-right:4px;">~</p>
					<input type="text" name="TODATE" style="width:calc(25% - 100px); float:left;" data-type="date" disabled="" readonly>
				</td>
			</tr>
			<tr>
				<th id="file">Attach File</th>
				<td colspan="3">
					<div id="attachfiledown_wrap" class="ctm_mg_wrap" style="float:left; width:100%; height:auto; overflow-y:auto;"></div>
				</td>
			</tr>
			<tbody></tbody>
		</table>
	</div>
	</form>
	<div class="emptyH10"></div>
	<div id="CONTENTS" style="padding:5px;"></div>
</div>

<script type="text/javascript">
/******************************************** 
 * @Subject : 화면 OPEN 시 최초 실행 함수
 * @Content : 팝업창 설정
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
$(function() {
	$('#noticePopup').dialog({
		title : '<s:message code='notice.notice'/>',
		autoOpen : false,
		height: 630,
		width: 1000,
		modal : true,
		buttons : {
			'Close' : {
				text: 'Close',
				click: function() {
					$(this).dialog("close");
				}
			}
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			retrieveNoticeP($(this).data('noticecd'));
		}
	});
});

	/******************************************** 
	 * @Subject : 조회 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function retrieveNoticeP(noticecd) {
	var url = '/common/selectNoticeInfo.do';
	var sendData = {'param': {'S_NOTICE_NO' : noticecd}}

	fn_ajax(url, false, sendData, function(data, xhr) {
		var noticeInfo = data.result;
		var file = data.fileResult;
		fn_dataBind('frmNoticeP', noticeInfo);
		/* 내용 바인딩 */
		$('#CONTENTS').html(noticeInfo.CONTENTS);
		/* 첨부파일 바인딩 */
		$.each(file, function(index, item){
			var link = "/common/downloadNoticeAttach.do?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
			$("#attachfiledown_wrap").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + item.SRC_FILE_NM + "</a>");
			$("#attachfiledown_wrap").append("<br/>");
		});
		if(fn_empty(file)){
			$('#file').remove();
		}
		updateNoticeCnt(noticecd);
	});
}

function updateNoticeCnt(noticecd){
	var url = "/common/updateNoticeCnt.do";
	var param = { "param" : {
			"NOTICE_NO" : noticecd
		}
	};

	fn_ajax(url, false, param, function(data, xhr) {
	});
}
</script>