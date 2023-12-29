<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @JSP Name : MemberUserExcelUploadPopup.jsp 
 * @Description : 멤버 엑셀업로드 팝업
 */
%>

<div id=MemberUserExcelUploadPopup>
	<div id="form_wrap">
		<div id="ATTACHFILE"></div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#MemberUserExcelUploadPopup').dialog({
		title: 'Upload Excel',
		autoOpen: false,
		height: 160,
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
		open : function() {
			$("#ATTACHFILE").mkFileUpload("EXCEL", "/rrs/uploadMemberUserExcel.do", "xls|xlsx");
			ajaxUpload();
		},
		close : function() {
			popupClose($(this).data('pid')); /* 필수로 들어가야함 */
		}
	});
});

function ajaxUpload() {
	$('#multiform_EXCEL').ajaxForm({
     	cache: false,
     	dataType:"json",
       	//보내기전 validation check가 필요할경우
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
		//submit이후의 처리
		success: function(data, statusText){
			if(!data.success) {
				alert('upload fail: '+ data.message)
			} else {
				alert('upload success')
			}
			popupClose($('#MemberUserExcelUploadPopup').data('pid'));
		},
        //ajax error
       	error: function(e){
       		alert('Error')
		}
	});
}
function uploadExcel(){
	$("#multiform_EXCEL").submit();
}
</script>