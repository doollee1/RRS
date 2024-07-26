<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : PdfUploadPopup.jsp
 * @Description : PDF업로드 공통 팝업
 */
%>

<div id="PdfUploadPopup">
	<div id="form_wrap">
		<input type="hidden" id="hFileUid" name="hFileUid" />
		<div id="ATTACHFILE"></div>
		<div id="noticeAttach"></div>
	</div>
</div>

<script type="text/javascript">
/********************************************
 * @Subject : 화면 OPEN 시 최초 실행 함수
 * @Content : 팝업창 설정
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
$(function() {
	var seq;
	var req_dt;
	var fileuid;
	var n_file_nm;
	var file_nm;

	$('#PdfUploadPopup').dialog({
		title   : 'Upload PDF',
		autoOpen: false,
		height  : 250,
		width   : 450,
		modal   : true,
		buttons: {
			'Upload': {
				text: 'Upload',
				click: function() {
					uploadPdf();
				}
			},
			'Cancel': {
				text: 'Cancel',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open : function() {
			fn_init($(this).data());
			output(fileuid);
			$("#ATTACHFILE").mkFileUpload("PDF", "/reserve/uploadPdf.do", "pdf");
			ajaxUpload();
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		}
	});

/********************************************
 * @Subject : 기본값 설정
 * @Content : 부모창에서 가져온 데이터로 설정
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
	function fn_init(recevicedData) {
		seq        = recevicedData.SEQ;
		req_dt     = recevicedData.REQ_DT;
		fileuid    = recevicedData.FILE_UID;
	}

/********************************************
 * @Subject : 파일 다운로드 링크, 삭제 버튼 생성
 * @Content : 파일이 있는 경우 다운로드 링크와 파일 삭제 버튼 생성한다
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
	function output(data){
		$.each(data, function(index, item){
			var link = "/reserve/downloadInvoicePdf.do?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
			var deleteLink = "/reserve/deleteInvoicePdf.do?seq="+seq+"&req_dt="+req_dt+"&file_uid="+item.FILE_UID+"&fileName="+item.NEW_FILE_NM;
			$("#noticeAttach").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + item.NEW_FILE_NM + "</a>");   //item.SRC_FILE_NM
			//$("#noticeAttach").append("<span class='clipdel'><a href='#' onclick=\"fileDelete('" + deleteLink + "', '" + item.FILE_UID + "', '" + item.NEW_FILE_NM + "');\"><span class='notice_file_del'>Delete</span></a></span>");
			$("#noticeAttach").append("<span class='clipdel'><a href='#' onclick=\"fileDelete('" + deleteLink + "');\"><span class='notice_file_del'>Delete</span></a></span>");
			$("#noticeAttach").append("<br/>");
		});
	}
});

/********************************************
 * @Subject : 파일 업로드 함수
 * @Content : 
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
function ajaxUpload() {
	$('#multiform_PDF').ajaxForm({
		cache   : false,
		dataType:"json",
		data:{
			"seq"    : $(this).seq,
			"req_dt" : $(this).req_dt
		},
		/* 보내기전 validation check가 필요할경우 */
		beforeSubmit: function (data, frm, opt) {
			var nodes = $("#fileupload_PDF_list").children();
			if(1 < nodes.length){
				var msg = "1";
				alert("<s:message code='error.pdfUpload' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;

			}else if(nodes.length == 0){
				alert("<s:message code='error.pdfUpload' arguments='" + 1 + "' javaScriptEscape='false'/>");
				return false;
			}
			else{
				return true;
			}
		},
		/* 저장이 성공한 경우 */
		success: function(data, statusText){
			alert('upload success')
			findFileUid(data.result);

			popupClose($('#PdfUploadPopup').data('pid'));
		},
		/* ajax 에러가 간 경우 */
		error: function(e){
			alert('Error')
		}
	});

/********************************************
 * @Subject : 파일아이디 설정 함수
 * @Content : 
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
	function findFileUid(result){
		var file_uid = $("#hFileUid").val();
		if(!fn_empty(result)){
			file_uid = result[0]["FILE_UID"];
		}
		//부모화면인 InvoicePopup의 #hFileUid에 file_uid를 보낸다
		$("#hFileUid", opener).val(file_uid);
	}
}

/********************************************
 * @Subject : 업로드 버튼 클릭
 * @Content : 
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
function uploadPdf(){
	$("#multiform_PDF").submit();
}
</script>