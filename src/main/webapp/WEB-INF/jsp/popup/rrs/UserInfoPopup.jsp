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
		   			<input type="hidden" name="PASSWD" id="PASSWD" />
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
						<input type="text" id="TEL_NO" name="TEL_NO" class="cmc_txt" style="width:150px;" maxlength="13" oninput="autoHyphen(this)"/>
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
					<th>탈퇴여부</th>
					<td>
						<select id="RET_YN" name="RET_YN" class="cmc_combo" style="width:150px;">
							<option value="N">N</option>
							<option value="Y">Y</option>
						</select>
					</td>
					<th>등록일시</th>
					<td>
						<input type="text" id="REG_DTM" name="REG_DTM" class="cmc_txt" style="width:150px;" readonly maxlength="50"/>
					</td>
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
				var upd_dtm = $("#UPD_DTM").val();
				$("#REG_DTM").val(new Date(Number(reg_dtm)).toLocaleDateString());
				$("#UPD_DTM").val(new Date(Number(upd_dtm)).toLocaleDateString());
				
				var tel_no = $("#TEL_NO").val();
				var convert_tel_no = tel_no.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
				$("#TEL_NO").val(convert_tel_no);
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
		fn_ajax(url, false, param, function(data, xhr){
			if(data.isExistMember == 'N'){
				alert("멤버회원이 등록되어 있지 않습니다."); 
			}else{
				alert("<s:message code='info.save'/>");
			}
			popupClose($('#p_UserInfo').data('pid'));			
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