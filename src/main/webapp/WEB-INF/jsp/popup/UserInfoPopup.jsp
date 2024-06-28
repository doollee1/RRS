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
						<input type="text" id="USER_ID" name="USER_ID" class="cmc_txt disabled" readonly="readonly" style="width:150px;" maxlength="15"/>
					</td>
					<th><s:message code='system.name'/></th>
					<td>
						<input type="text"  id="NAME_1ST" name="NAME_1ST" class="cmc_txt" style="width:150px;" maxlength="30"/>
					</td>
					<th><s:message code='system.secondname'/></th>
					<td>
						<input type="text"  id="NAME_2ND" name="NAME_2ND" class="cmc_txt" style="width:150px;" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<th><s:message code='system.usertype'/></th>
					<td>
						<select id="USER_TP" name="USER_TP" class="cmc_combo" style="width:160px;">
							<option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${usertype}">
								<option value="${i.code}">${i.value}</option>
							</c:forEach>
						</select>
					</td>
					<th><s:message code='system.usergroup'/></th>
					<td>
						<input type="text" id="USER_GD" name="USER_GD" class="cmc_txt" style="width:150px;" maxlength="3"/>
					</td>
					<th><s:message code='system.department'/></th>
					<td width="150">
						<input type="text" id="DEPT_CD" name="DEPT_CD" class="cmc_txt" style="width:80px; float:left;"/>
						<button class='grid_popupbtn' id='btn_department' type='button' style="float:left;"></button>
						<p class="data_side_text" name="DEPT_NM" id="DEPT_NM"></p></td>
					</td>
				</tr>
				<tr>
					<th><s:message code='customer.Telephone'/></th>
					<td>
						<input type="text" id="TEL_NO" name="TEL_NO" class="cmc_txt" style="width:150px;" maxlength="40"/>
					</td>
					<th><s:message code='system.qid'/></th>
					<td>
						<input type="text" id="WEB_ID" name="WEB_ID" class="cmc_txt" style="width:150px;" maxlength="15"/>
					</td>
					<th><s:message code='system.email'/></th>
					<td>
						<input type="text" id="E_MAIL" name="E_MAIL" class="cmc_txt" style="width:150px;" maxlength="50"/>
					</td>
				</tr>
				<tr>
					<th><s:message code='system.createtype'/></th>
					<td>
						<input type="radio" id="Manual" name="CRE_TP" value="M" checked  disabled="" readonly="readonly" > <s:message code='system.manual'/>
						<input type="radio" id="Auto" name="CRE_TP" value="A"  disabled="" readonly="readonly" > <s:message code='system.auto'/>
					</td>
					<th><s:message code='system.startdt'/></th>
					<td>
						<input type="text" id="START_DT" name="START_DT" data-type="date"  style="width:150px; float:left;" disabled="" readonly/>
					</td>
					<th><s:message code='system.stopdt'/></th>
					<td>
						<input type="text" id="STOP_DT" name="STOP_DT" data-type="date"  style="width:150px; float:left;" value="31.12.9999" disabled="" readonly/>
					</td>
				</tr>
				<tr>
					<th><s:message code='system.strname'/></th>
					<td>
						<input type="text" id="STR_NM" name="STR_NM" class="cmc_txt" style="width:150px;" maxlength="50"/>
					</td>
					<th><s:message code='system.hausno'/></th>
					<td>
						<input type="text" id="HAUS_NO" name="HAUS_NO" class="cmc_txt" style="width:150px;" maxlength="20"/>
					</td>
					<th><s:message code='system.zipno'/></th>
					<td>
						<input type="text" id="ZIP_NO" name="ZIP_NO" class="cmc_txt" style="width:150px;" maxlength="10" />
					</td>
				</tr>
				<tr>
					<th><s:message code='system.ortnm'/></th>
					<td>
						<input type="text" id="ORT_NM" name="ORT_NM" class="cmc_txt" style="width:150px;" maxlength="20"/>
					</td>
					<th><s:message code='system.regioncode'/></th>
					<td>
						<input type="text" id="REGION_CD" name="REGION_CD" class="cmc_txt" style="width:150px;" maxlength="3"/>
					</td>
					<th><s:message code='system.nation'/></th>
					<td>
						<input type="text" id="LAND_CD" name="LAND_CD" class="cmc_txt" style="width:150px;" maxlength="3"/>
					</td>
				</tr>
				<tr>
					<th><s:message code='system.areacode'/></th>
					<td>
						<input type="text" id="AREA_CD" name="AREA_CD" class="cmc_txt" style="width:150px;" maxlength="10"/>
					</td>
					<th><s:message code='common.language'/></th>
					<td>
						<select id="LANG_CD" name="LANG_CD" class="cmc_combo"  style="width:160px;"></select>
					</td>
					<th><s:message code='common.status'/></th>
					<td>
						<input type="radio" id="Alive" name="STATUS" value="A" checked> <s:message code='system.alive'/>
						<input type="radio" id="Stop" name="STATUS" value="S"> <s:message code='system.stop'/>
						<input type="radio" id="Delete" name="STATUS" value="D"> <s:message code='system.delete'/>
					</td>
				</tr>
				<tr>
					<th><s:message code='system.customer'/></th>
					<td>
						<input type="text" id="CUST_CD" name="CUST_CD" class="cmc_txt" style="width:150px;" maxlength="10"/>
					</td>
				</tr>
			</table>
		</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	
	$('#START_DT').val($.datepicker.formatDate('dd.mm.yy', new Date()));
	
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