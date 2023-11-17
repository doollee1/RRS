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
			      		<td><p><input type="text" id="HAN_NAME" name="HAN_NAME"></p></td>
			      	</tr>
			      	<tr>
						<td class="small_td">영문이름</td>
			      		<td><p><input type="text" id="ENG_NAME" name="ENG_NAME"></p></td>
			      	</tr>
			      	<tr>
						<td class="small_td">전화번호</td>
			      		<td><p><input type="text" id="TEL_NO" name="TEL_NO"></p></td>
			      	</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<script type="text/javascript">
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
		},
		close: function() {
			popupClose($(this).data('pid'));
		}
	});
});

function saveMemberUserInfo(){
	var formData = formIdAllToMap('frmMemberUserInfo');
	var param = {"param" : formData};
	var url = "/rrs/saveMemberUserInfo.do"
		
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if(data.dup == 'Y'){
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			}else{
				alert("<s:message code='info.save'/>");
				popupClose($('#MemberUserAddPopup').data('pid'));			
			}
		});
	}
}

</script>
