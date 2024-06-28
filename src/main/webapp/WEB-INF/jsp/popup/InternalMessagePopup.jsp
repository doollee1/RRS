<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : Internal Message
 */
%>
<div id="InternalMessagePopup">
	<div class="ctm_sech_wrap">	
	<form id="frmInternalMessageSearch" method="post" action="#">
		<input type="hidden" value = ""  data-form="CUST_CD" id="InternalMessagePopup_CUST_CD" />
	</form>
	</div>
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
	<div class="pop_grid_wrap" style="width:100%; float:left; padding: 10px;">
		<textarea style="width: 96.5%; height: 400px; overflow: auto; padding-left: 10px; margin-top: -1px; margin-right: 10px; min-height: 100px;" disabled= "disabled" id="MS01_CUST_TEXT" data-dbcolumn="CUST_TEXT" ></textarea>
	</div>	
	<!-- 그리드 끝 -->
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#InternalMessagePopup').dialog({
		title:'Internal Message',
		autoOpen: false,
		height: 468,
		width: 930,
		modal: true,
		buttons: {
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
/* 			var param = [];
			var formElements = document.querySelectorAll('[data-form]');
			Array.prototype.forEach.call(formElements, function (ele) {
				var formid = ele.dataset.form;
				param.push({formid : ele.value});
			}); */
			
			$('#InternalMessagePopup_CUST_CD').val($(this).data('CUST_CD'));			
			var param = {			
				CUST_CD: $("#InternalMessagePopup_CUST_CD").val()
			}
			fn_ajax('/customer/getCustText.do', true, param, function(data) {
				if (!!data.RESULT) {
					if (data.RESULT.length>0 && data.RESULT[0] != null && data.RESULT[0].CUST_TEXT != undefined) {
						$('#MS01_CUST_TEXT').val(data.RESULT[0].CUST_TEXT);	
					}
				}
			});
		},
		close: function(e, ui) {
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});
</script>
