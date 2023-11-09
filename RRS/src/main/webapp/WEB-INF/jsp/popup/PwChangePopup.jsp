<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : PwChangePopup
 * @Description : 패스워드 변경 팝업
 */
%>
<!-- 순서에 유의 -->
<script type="text/javascript" src="/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/js/rsa/rng.js"></script>

<div id="p_PwChange">
	<form id="frmPw" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<!---<caption></caption>
				<colgroup>
					<col width="35%" />
			        <col width="65%" />
			    </colgroup>
			    --->
		   		<tr>
					<th>ID</th>
					<td>
						<input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
						<input type="hidden" id="RSAExponent" value="${RSAExponent}"/>
						<input type="hidden" id="POPUP_COMP_CD" name = 'POPUP_COMP_CD'/>
						<input type="text" id="POPUP_USER_ID" name="POPUP_USER_ID" class="cmc_txt disabled" readonly="readonly" disabled=""/>
					</td>
				</tr>
				<tr>
					<th><s:message code="system.name"/></th>	<!-- 이름 -->
					<td>
						<input type="text" id="POPUP_USER_NM" name="POPUP_USER_NM" class="cmc_txt disabled" readonly="readonly" disabled=""/>
					</td>
				</tr>
				<tr>
					<th><s:message code="system.prePasswd"/></th>	<!-- 이전패스워드 -->
					<td>
						<input type="password" id="CURR_PASSWORD" name="CURR_PASSWORD" class="cmc_txt"  ess="ess"/>
					</td>
				</tr>
				<tr>
					<th><s:message code="system.newPasswd"/></th>	<!-- 신규패스워드 -->
					<td>
						<input type="password" id="NEW_PASSWORD" name="NEW_PASSWORD" class="cmc_txt" ess="ess"/>
					</td>
				</tr>
				<tr>
					<th><s:message code="system.passwdCnfm"/></th>	<!-- 신규패스워드확인 -->
					<td>
						<input type="password" id="CONF_PASSWORD" name="CONF_PASSWORD" class="cmc_txt" ess="ess"/>
					</td>
				</tr>
			</table>
		</div>
	</form>	
</div>
<script type="text/javascript">
var init;
$(function() {
	$('#p_PwChange').dialog({
		title : '<s:message code="title.passwdChange"/>',	/* 패스워드변경 */
		autoOpen : false,
		height: 256,
		width: 380,
		modal : true,
		buttons : {
			'저장' : {
				text: '<s:message code="button.save"/>',	/* 저장 */
				click: function() {
					changePw();
				}
			},
			'취소' : {
				text: '<s:message code="button.cancel"/>',	/* 취소 */
				click: function() {
					$(this).dialog("close");
				}
			}
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			$("#POPUP_COMP_CD").val($(this).data("COMP_CD"));
			$("#POPUP_USER_NM").val($(this).data("USER_NM"));
			$("#POPUP_USER_ID").val($(this).data("USER_ID"));
			
		}
	});
});

function changePw(){
	if(!fn_inputCheck("frmPw")){
		return;
	}
	if($("#NEW_PASSWORD").val() != $("#CONF_PASSWORD").val()){
		alert("<s:message code="errors.differPasswd"/>");		/* 신규 패스워드와 확인을 제대로 입력하세요. */
		return;
	}
	
	var rsa = new RSAKey();
    rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
    
    var v_formInfo = formIdToMap('frmPw');
    v_formInfo["INIT"] = init;
    v_formInfo["USER_ID"] = $("#POPUP_USER_ID").val();
    v_formInfo["CURR_PASSWORD"] = rsa.encrypt($("#CURR_PASSWORD").val());
    v_formInfo["NEW_PASSWORD"] = rsa.encrypt($("#NEW_PASSWORD").val());
    v_formInfo["CONF_PASSWORD"] = rsa.encrypt($("#CONF_PASSWORD").val());
    
    var url = "/common/changePw.do";
	
	var param = {"param":v_formInfo};
	fn_ajax(url, false, param, function(data, xhr){
		if(data.success){
			alert("<s:message code="info.save"/>");	/* 변경하였습니다. */
			popupClose($('#p_PwChange').data('pid'));
		}else{
			alert(data.message);
		}
	});
}
</script>