<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Approval PopUp
	 * @Description : Approval PopUp
	 */
%>
<div id="ApprovalPopUp">
	<form id="frmSearch" action="#">
		<input type="hidden" name="CURRENT_PAGE" id="CURRENT_PAGE">
		<input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE">
		<input type="hidden" name="DOC_GR" id="DOC_GR">
		<table class="pop_tblForm">
			<caption></caption>
			<!----<colgroup>
				<col width="300px"></col>
		        <col width="300px"></col>
		    </colgroup>---->
			<tbody>
				<tr>
					<td><s:message code='quotation.grd.document'/>&nbsp;</td>
					<td><input type="text" name="DOC_NO_A" id="DOC_NO_A" disabled="" readonly style="width:380px;"/></td>
				</tr>
				<tr>
					<td><s:message code='title.approvalyn'/>&nbsp;</td>
					<td><input type="radio" id="Allow" name="APLV_TP" value="Y" checked > <s:message code='title.approval'/>
					<input type="radio" id="Reject" name="APLV_TP" value="R" > <s:message code='title.reject'/></td>
				</tr>
				<tr>
					<td><s:message code='title.rejectRsn'/>&nbsp;</td>
					<td><textarea id="REJECT_RSN" name="REJECT_RSN" rows="2" disabled="" readonly style="width:380px; border-radius:4px;"></textarea></td>
				</tr>
		</tbody>
		</table>
	</form>
</div>

<script type="text/javascript">
var args ;
var modi_tms ;
$(function() {

	$('#ApprovalPopUp').dialog({
		title: '<s:message code="title.approvalyn"/>',
		autoOpen: false,
		height: 200,
		width: 540,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					if($("input:radio[name=APLV_TP]:checked").val() == 'R' && fn_empty($("#REJECT_RSN").val())){
						args = '<s:message code='title.rejectRsn'/>';
						alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
					}else{
						updateApproval();
					}
				}
			},
		},
		open: function(e, ui) {
			$('#DOC_NO_A').val($(this).data("DOC_NO"));
			$('#DOC_GR').val($(this).data("DOC_GR"));
			modi_tms =  $(this).data("MODI_TMS");
			//cSearch();
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
		
	});
	
	 $("input:radio[id=Allow]").click(function(){ 
		 $("#REJECT_RSN").val("");
		 $("#REJECT_RSN").attr("disabled",true).attr("readonly",false);
	 }); 
	 
	 $("input:radio[id=Reject]").click(function(){ 
		 $("#REJECT_RSN").attr("readonly",false).attr("disabled",false);
	 }); 
});


function updateApproval(){
	if('' != $('#DOC_NO_A').val()){
		var url;
		($("#DOC_GR").val() =='QT') ? url = '/quotation/getModiTms.do' : url = '/salesOrder/getModiTms.do';
		var param = {"param" : { "DOC_NO" : $('#DOC_NO').val() }};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(data.result != modi_tms){
				alert("<s:message code='error.alreadyUpd'/>");
			}else{
				var url = "/quotation/updateApproval.do";
				var param = {"param":{"DOC_NO": $("#DOC_NO_A").val()
									 ,"DOC_GR": $("#DOC_GR").val()
									 ,"APLV_TP":$("input:radio[name=APLV_TP]:checked").val()
									 ,"REJECT_RSN":$("#REJECT_RSN").val()}};
				console.log(param);
				fn_ajax(url, false, param, function(data, xhr){
					if(data.ALEADY == 'Y'){
						alert("<s:message code='errors.approval'/>");
					}else{
						alert("<s:message code='info.save'/>");
						($("#DOC_GR").val() =='QT') ? popupClose($('#QuotationPopup').data('pid')) : popupClose($('#SalesOrderPopup').data('pid'));
						popupClose($('#ApprovalPopUp').data('pid'));
					}
				});
			}
		});
	}
}
</script>