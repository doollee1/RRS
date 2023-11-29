<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : rrs/UserInfoPopup
 */
%>
<div id="p_UserInfo">
	<form id="frmUserInfo" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<!---<caption></caption> --->
				<colgroup>
					<col width="100px" />
			        <col width="200px" />
			        <col width="100px" />
			        <col width="200px" />
			        <col width="100px" />
			        <col width="200px" />
			    </colgroup>
		   		<tr>
					<th>회원타입</th>
					<td>
						<select id="MEM_GBN" name="MEM_GBN" class="cmc_combo" style="width:150px;">
							<option value="00">전체</option>
							<option value="01">멤버</option>
							<option value="02">일반</option>
							<option value="03">교민</option>
							<option value="04">에이전시</option>
						</select>
					</td>
					<th>이름</th>
					<td>
						<input type="text"  id="HAN_NAME" name="HAN_NAME" class="cmc_txt" style="width:150px;" maxlength="30"/>
					</td>
					<th>영문이름</th>
					<td>
						<input type="text"  id="ENG_NAME" name="ENG_NAME" class="cmc_txt" style="width:150px;" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" id="TEL_NO" name="TEL_NO" class="cmc_txt" style="width:150px;" maxlength="30"/>
					</td>
					<th>회원 ID</th>
					<td>
						<input type="text" id="USER_ID" name="USER_ID" class="cmc_txt" style="width:150px;" maxlength="30"/>
					</td>
					<th>Email</th>
					<td>
						<input type="text" id="EMAIL" name="EMAIL" class="cmc_txt" style="width:150px;" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="text" id="PASSWD" name="PASSWD" class="cmc_txt" style="width:150px;" maxlength="30"/>
					</td>
					<th>탈퇴여부</th>
					<td>
						<select id="RET_YN" name="RET_YN" class="cmc_combo" style="width:150px;">
							<option value="N">X</option>
							<option value="Y">O</option>
						</select>
					</td>
					<th>등록일시</th>
					<td>
						<input type="text" id="REG_DTM" name="REG_DTM" class="cmc_txt" style="width:150px;" readonly maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th>수정일시</th>
					<td>
						<input type="text" id="UPD_DTM" name="UPD_DTM" class="cmc_txt" style="width:150px;" readonly maxlength="50"/>
					</td>
				</tr>
			</table>
		</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	$('#p_UserInfo').dialog({
		title :'회원 정보',
		autoOpen : false,
		//height: 400,
		width: 940,
		modal : true,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					saveUserInfo();
				}
			},
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close");
				}
			},

		},
		close : function() {
			popupClose($(this).data('pid')); /* 필수로 들어가야함 */
		},
		open : function() {
			if(!fn_empty($(this).data("USER_ID"))) {
				// 회원 수정 팝업인 경우
				selectUserInfo($(this).data("USER_ID"));
				$("#USER_ID").attr("readonly", true);
				var reg_dtm = $("#REG_DTM").val();
				console.log('reg_dtm: ', reg_dtm);
				$("#REG_DTM").val(new Date(reg_dtm));
			}
		}
	});
});

function selectUserInfo(userId){
	var param = {
		"param": {
			"USER_ID" : userId
		}
	};
	var url = "/rrs/selectUserInfo.do"
	
	fn_ajax(url, false, param, function(data, xhr){
		fn_dataBind('frmUserInfo', data.result[0]);
	});
}

function saveUserInfo(){
	var formData = formIdAllToMap('frmUserInfo');
	var param = {"param" : formData};
	var url = "/rrs/saveUserInfo.do"
		
	if(confirm("<s:message code='confirm.save'/>")){
		console.log('param: ', param);
		fn_ajax(url, false, param, function(data, xhr){
			if(data.dup == 'Y'){
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			}else{
				alert("<s:message code='info.save'/>");
				popupClose($('#p_UserInfo').data('pid'));			
			}
		});
	}
}

</script>