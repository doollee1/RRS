<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : batchPopUp
	 * @Description : 
	 */
%>

<div id="batchPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
	</div>
	
	<!---------->
	
	<div>
		<form id="frmSearch" action="#">
			<div id="ctm_sech_wrap_batch">		
				<table class="new_search_pop" style="margin-top:15px;" width="100%" style="margin-top:1px !important;">
					<tbody>
						<tr>
							<td class="small_td"><p><s:message code="quotation.batchNo"/></p></td>
							<td style="text-align:center;"><select id="batchPop_BATCH_NO" name="batchPop_BATCH_NO" class="" style="width:110px;"></select></td>							
						</tr>
					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
			<input type="hidden" name="batchPop-MATL_CD" id="batchPop-MATL_CD" />
			<input type="hidden" name="batchPop-PLANT_CD" id="batchPop-PLANT_CD" />
		</form>
	</div>
</div>

<script type="text/javascript">
$(function() {
	$('#batchPopUp').dialog({
		title: '<s:message code="quotation.batchNo"/>',
		autoOpen: false,
		height: 130,
		width: 220,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					p_rtnData = $('#batchPop_BATCH_NO option:selected').val();
					popupClose($('#batchPopUp').data('pid'));
					popupClose($('#productPopUp').data('pid'));
					popupClose($('#itemPopUp').data('pid'));
				}
			},
			'Close': {
				text: '<s:message code="button.close"/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			
			$('#batchPop-MATL_CD').val($(this).data("MATL_CD"));
			$('#batchPop-PLANT_CD').val($(this).data("PLANT_CD"));
			
			selectBatchPopList();
			
			$('#batchPop_BATCH_NO').on('change', function (e) {
				if(this.value != ""){
					p_rtnData = $('#batchPop_BATCH_NO option:selected').val();
					popupClose($('#batchPopUp').data('pid'));
					popupClose($('#productPopUp').data('pid'));
					popupClose($('#itemPopUp').data('pid'));
				}
			});
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
			popupClose($('#productPopUp').data('pid'));
			popupClose($('#itemPopUp').data('pid'));
		}
	});
});

function selectBatchPopList(){
	
	var url = "/salesOrder/selectBatchPopList.do";
	
	var disabled = $('form[id=frmSearch]').find(':input:disabled').removeAttr('disabled');
	
	var formData = formIdAllToMap('frmSearch');
	
	disabled.attr('disabled','disabled');
	
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){
		if(!fn_empty(data.batchNo)){
			var retVal = data.batchNo.split(';');
			
			$('#batchPop_BATCH_NO').empty().data('options');
			$('#batchPop_BATCH_NO').append('<option value=' + "" + '></option>');
			
			for(i = 0; i < retVal.length; i++){
				if(!fn_empty(retVal[i])){
					var tempVal = retVal[i].split(':');
					$('#batchPop_BATCH_NO').append('<option value=' + tempVal[0] + '>' + tempVal[1] + '</option>');
				}
			}
		}else{
			popupClose($('#batchPopUp').data('pid'));
			popupClose($('#productPopUp').data('pid'));
			popupClose($('#itemPopUp').data('pid'));
		}
	});
}
</script>