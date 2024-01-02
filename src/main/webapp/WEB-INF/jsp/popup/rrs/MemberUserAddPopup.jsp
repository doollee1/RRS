<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : MemberUserAddPopup
 */
%>
<div id="MemberUserAddPopup">
	<div class="ctm_sech_wrap">	
		<form id="frmMemberUserInfo" method="post" action="#">
			<table class="tab_top_search" width="100%">
				<tbody>
					<tr>
						<td class="small_td">이름</td>
			      		<td><p><input type="text" id="HAN_NAME" name="HAN_NAME" maxlength="20" onlyKor></p></td>
			      	</tr>
			      	<tr>
						<td class="small_td">영문이름</td>
			      		<td><p><input type="text" id="ENG_NAME" name="ENG_NAME" maxlength="30" onlyEng></p></td>
			      	</tr>
			      	<tr>
						<td class="small_td">전화번호</td>
			      		<td><p><input type="text" id="TEL_NO" name="TEL_NO" maxlength="13" oninput="autoHyphen(this)"></p></td>
			      	</tr>
				</tbody>
			</table>
			<input type="hidden" id="Ex_HAN_NAME" name="Ex_HAN_NAME" />
	      	<input type="hidden" id="Ex_ENG_NAME" name="Ex_ENG_NAME" />
	      	<input type="hidden" id="Ex_TEL_NO" name="Ex_TEL_NO" />
		</form>
	</div>
</div>
<script type="text/javascript">
$(document).on("keyup", "input[onlyKor]", function() {$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g,"") );});
$(document).on("keyup", "input[onlyEng]", function() {$(this).val( $(this).val().replace(/[^A-Za-z]/ig,"") );});

$(function() {
	$('#MemberUserAddPopup').dialog({
		title:'멤버 회원 정보 등록',
		autoOpen: false,
		height: 160,
		width: 400,
		modal: true,
		buttons: {
			'save': {
				text: '저장',
				click: function() {
					saveMemberUserInfo();
				}
			},
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function() {
			$('#HAN_NAME').val($(this).data('HAN_NAME'));
			$('#ENG_NAME').val($(this).data('ENG_NAME'));
			$('#TEL_NO').val($(this).data('TEL_NO'));
			$('#Ex_HAN_NAME').val($(this).data('HAN_NAME'));
			$('#Ex_ENG_NAME').val($(this).data('ENG_NAME'));
			$('#Ex_TEL_NO').val($(this).data('TEL_NO'));
			
			// 연락처 하이픈 처리
			var tel_no = $("#TEL_NO").val();
			var convert_tel_no = tel_no.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
			$("#TEL_NO").val(convert_tel_no);
		},
		close: function() {
			popupClose($(this).data('pid'));
		}
	});
});

function saveMemberUserInfo(){
	var formData = formIdAllToMap('frmMemberUserInfo');
	
	// validation check
	if(formData.HAN_NAME === "") {
		alert("이름을 입력해주세요.");
		return;
	}
	if(formData.ENG_NAME === "") {
		alert("영문이름을 입력해주세요.");
		return;
	}
	if(formData.TEL_NO === "") {
		alert("전화번호를 입력해주세요.");
		return;
	}
	
	// delete hypen
	formData.TEL_NO = formData.TEL_NO.replace(/-/g, '');
	formData.Ex_TEL_NO = formData.Ex_TEL_NO.replace(/-/g, '');
	var param = {"param" : formData};
	var url = "/rrs/saveMemberUserInfo.do"
		
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if(data.isExistMember == 'Y'){
				alert("이미 등록된 멤버회원이 존재합니다."); 
			} else {
				alert("<s:message code='info.save'/>");
				popupClose($('#MemberUserAddPopup').data('pid'));			
			}
		});
	}
}

function autoHyphen(target) {
	target.value = target.value
		.replace(/[^0-9]/g, '')
	  	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	return target
}

</script>
