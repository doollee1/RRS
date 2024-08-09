<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : ExcelUploadPopup.jsp
 * @Description : 엑셀업로드 공통 팝업
 */
%>

<div id="excelupload">
	<div id="form_wrap">
		<input type="hidden" id="SOLD_CUST_CD" value="" />
		<div id="ATTACHFILE"></div>
	</div>
</div>

<script type="text/javascript">
	/********************************************
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
$(function() {
	$('#excelupload').dialog({
		title: '엑셀 업로드',
		autoOpen: false,
		height: 250,
		width: 450,
		modal: true,
		buttons: {
			'Upload': {
				text: 'Upload',
				click: function() {
					uploadExcel();
				}
			},
			'Cancel': {
				text: 'Cancel',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			$("#SOLD_CUST_CD").val($(this).data("SOLD_CUST_CD"));
			$("#ATTACHFILE").mkFileUpload("EXCEL", "/common/uploadQuotationExcel.do", "xls|xlsx");
			ajaxUpload();
		}
	});
});

	/********************************************
	 * @Subject : ajax 파일 업로드 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function ajaxUpload() {
	var param = {
		SOLD_CUST_CD : $("#SOLD_CUST_CD").val()
	};
	$('#multiform_EXCEL').ajaxForm({
		cache: false,
		dataType:"json",
		data: param,
		/* 보내기전 validation check가 필요할경우 */
		beforeSubmit: function (data, frm, opt) {
			var nodes = $("#fileupload_EXCEL_list").children();
			if(1 < nodes.length){
				var msg = "1";
				alert("<s:message code='error.excelUpload' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}else{
				return true;
			}
		},
		/* submit이후의 처리 */
		success: function(data, statusText){
			popupClose($('#excelupload').data('pid'), data);
		},
		/* ajax 통신 에러 */
		error: function(e){
			alert('Error');
		}
	});
}

	 /********************************************
	 * @Subject : 엑셀파일 업로드 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function uploadExcel(){
	$("#multiform_EXCEL").submit();
}
</script>