<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : UserInfoPopup
 */
%>
<div id="p_UserInfo">
	<div>
		<div></div>
		<div style="float:right;" class="ct_grid_top_right">
			<button class='btn btn-default' id='btn_init' type='button'><i class='fa fa-file-o'></i><s:message code='button.pwinit'/></button>
		</div>
	</div>
	<form id="frmUserInfo" action="#">
		<div id="pop_ct_form_wrap">
			<input type="hidden" name="ISNEW" id="ISNEW" value="1" />
			<input type="hidden" name="AUTH" id="AUTH" value="1" />
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
					<th><s:message code='system.UserID'/></th>
					<td>
						<input type="hidden" id="COMP_CD" name = 'COMP_CD' />
						<input type="hidden" id="USER_TP" name = 'USER_TP' value="01" />
						<input type="hidden" id="LANG_CD" name = 'LANG_CD' value="en" />
						<input type="hidden" id="STATUS" name = 'STATUS' value="A" />
						<input type="hidden" id="START_DT" name = 'START_DT' />
						<input type="hidden" id="STOP_DT" name = 'STOP_DT' value="9999.12.31" />
						<input type="text" id="USER_ID" name="USER_ID" class="cmc_txt disabled" readonly="readonly" style="width:150px;" maxlength="15"/>
					</td>
					<th><s:message code='system.name'/></th>
					<td>
						<input type="text"  id="NAME_1ST" name="NAME_1ST" class="cmc_txt" style="width:150px;" maxlength="40"/>
					</td>
					<th>텔레그램 ID</th>
					<td>
						<input type="text" id="CHAT_ID" name="CHAT_ID" class="cmc_txt" style="width:150px;" maxlength="20"/>
					</td>
				</tr>
			</table>
		</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	
	$('#START_DT').val($.datepicker.formatDate('yy.mm.dd', new Date()));
	
	$('#USER_TP').change(function() {
		if($('#USER_TP').val() == '02'){
			$('#CUST_CD').removeAttr("readonly");
			$('#WEB_ID').attr("readonly",false);
			$('#DEPT_CD').attr("readonly",false);					
		}else{
			$('#CUST_CD').attr("readonly",false);
			$('#WEB_ID').removeAttr("readonly");
			$('#DEPT_CD').removeAttr("readonly");
		}
	});
	
	$('#DEPT_NM').attr("readonly",true);	
	createCodeBox('LANG_CD', false);
	createCodeBox('USER_TP', false);
	$('#LANG_CD').val(getCookie("Language").toUpperCase());
	
	$('#p_UserInfo').dialog({
		title :'<s:message code='system.userinfo'/>',
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
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			if(fn_empty($(this).data("COMP_CD"))){
				$("#USER_ID").removeAttr("READONLY", false);
				$("#COMP_CD").val("${loginVO.compCd}");
				$("#ISNEW").val("0");
				$("#btn_init").hide();
			}else{
				$("#USER_TP").val($(this).data("USER_TP"));
				$("#AUTH").val($(this).data("AUTH"));
				selectUserInfo($(this).data("COMP_CD"), $(this).data("USER_ID"));
				$("#ISNEW").val("1");
				if($('#USER_TP').val() == '02'){
					$('#CUST_CD').removeAttr("readonly");
					$('#WEB_ID').attr("readonly",false);
					$('#DEPT_CD').attr("readonly",false);					
				}else{
					$('#CUST_CD').attr("readonly",false);
					$('#WEB_ID').removeAttr("readonly");
					$('#DEPT_CD').removeAttr("readonly");
				}
				if($('#AUTH').val().substring(1,2) =='N'){
					$("#save").hide();
					$("#btn_init").hide();
				}
			}	
			/*
		$('#START_DT').datepicker({
			dateFormat : 'dd.mm.yy',
			showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
			function(e) {
		});
		
		$('#STOP_DT').datepicker({
			dateFormat : 'dd.mm.yy',
			showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
			function(e) {
		});
		*/
		
		if($(this).data("CRE_TP") == 'A'){
			fn_formAllDisable(['frmUserInfo']);	
			$('#btn_department').attr('disabled','disabled');
			$("[name='STATUS']").attr('disabled','disabled');
			$("#save").hide();
		}
		$("#USER_ID").focus();
		}
	});
	
	$("#btn_department").click(function(e){

		var url = "/common/DeptPopup.do";
		var pid = "deptPopup"
		var param = {"S_DEPT_CD" : $("#DEPT_CD").val()};
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				$("#DEPT_CD").val(data[0].DEPT_CD);
				$("#DEPT_NM").text(data[0].DEPT_NM);
			}
		});
	})
	
	$("#btn_init").click(function(e){
		var url = "/common/initPw.do";
		var param = {"param" : {		
				"COMP_CD" : $("#COMP_CD").val(),
				"USER_ID" : $("#USER_ID").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(data.success){
				alert("<s:message code="confirm.init"/>");	/* 변경하였습니다. */
			}else{
				alert(data.message);
			}
		});
	})
});

function selectUserInfo(compCd, userId, userTp){
	var param = {"param" : {
			"COMP_CD" : compCd,
			"USER_ID" : userId
		}
	};
	
	var url = "/common/selectUserInfo.do"
	
	fn_ajax(url, false, param, function(data, xhr){
		fn_dataBind('frmUserInfo', data.result[0]);
	});
}

function saveUserInfo(){
	var formData = formIdAllToMap('frmUserInfo');
	var param = {"param" : formData};
	var url = "/common/saveUserInfo.do"
		
	if(confirm("<s:message code='confirm.save'/>")){
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