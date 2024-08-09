<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : NoticeImangeUploadPopup
 * @Description : 공지사항 이미지 업로드 팝업
 */
%>
<div id="p_NoticeImageUpload">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<caption></caption>
				<colgroup>
					<col width="300px" />
				</colgroup>
				<tr>
					<th>이미지파일 (.gif, .jpg, .png) 만 업로드 가능합니다.</th>
				</tr>
				<tr>
					<td>
						<div id="IMAGEFILE"></div>
					</td>
				</tr>
			</table>
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
	$('#p_NoticeImageUpload').dialog({
		title : '이미지업로드',
		autoOpen : false,
		height: 250,
		width: 400,
		modal : true,
		buttons : {
			'저장' : {
				text: '저장',
				click: function() {
					uploadImage();
				}
			},
			'취소' : {
				text: '취소',
				click: function() {
					$(this).dialog("close");
				}
			}
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			$("#IMAGEFILE").mkFileUpload("IMAGE", "/common/noticeImageUpload.do", "jpg|png|gif");
			ajaxUpload();
		}
	});
});

	 /********************************************
	 * @Subject : ajax 통신 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function ajaxUpload(){
	$('#multiform_IMAGE').ajaxForm({
		cache: false,
		dataType:"json",
		/* 보내기전 validation check가 필요할경우 */
		beforeSubmit: function (data, frm, opt) {
			return true;
		},
		/* submit이후의 처리 */
		success: function(data, statusText){
			p_rtnData = data.result;
			popupClose($('#p_NoticeImageUpload').data('pid'));
		},
		/*ajax error */
		error: function(e){
			alert("Error");
		}
	});
}

	 /********************************************
	 * @Subject : 이미지 업로드 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function uploadImage(){
	$("#multiform_IMAGE").submit();
}
</script>