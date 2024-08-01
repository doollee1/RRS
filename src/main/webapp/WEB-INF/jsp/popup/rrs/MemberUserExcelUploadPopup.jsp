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
	/******************************************** 
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : uploadExcel() / ajaxUpload()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	$('#MemberUserExcelUploadPopup').dialog({
		title: '멤버 회원 정보 엑셀 업로드',
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

/******************************************** 
 * @Subject : ajax 처리 함수
 * @Content : ajax 전 validation 체크, submit 이후 처리
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function ajaxUpload() {
	$('#multiform_EXCEL').ajaxForm({
		cache: false,
		dataType:"json",
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
			if(!data.success) {
				alert('업로드에 실패했습니다. : '+ data.message)
			} else {
				alert('업로드에 성공했습니다.')
			}
			popupClose($('#MemberUserExcelUploadPopup').data('pid'));
		},
		/* ajax error */
		error: function(e){
			alert('Error')
		}
	});
}

/******************************************** 
 * @Subject : Excel 업로드 함수
 * @Content : 
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function uploadExcel(){
	$("#multiform_EXCEL").submit();
}
</script>