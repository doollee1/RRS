<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : 
	 * @Description : 
	 */
%>

<div id="storeLocPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
	</div>
	
	<!---------->
	
	<div>
		<form id="frmSearch" action="#">
			<div id="ctm_sech_wrap_storeLoc">		
				<table class="new_search_pop" style="margin-top:15px;" width="100%" style="margin-top:1px !important;">
					<tbody>
						<tr>
							<td class="small_td"><p>Storage Location</p></td>
							<td style="text-align:center;"><select id="storeLocPop_STORE_LOC" name="storeLocPop_STORE_LOC" class="" style="width:110px;"></select></td>							
						</tr>
					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
			<input type="hidden" name="storeLocPop-MATL_CD" id="storeLocPop-MATL_CD" />
			<input type="hidden" name="storeLocPop-PLANT_CD" id="storeLocPop-PLANT_CD" />
		</form>
	</div>
</div>

<script type="text/javascript">
$(function() {
	$('#storeLocPopUp').dialog({
		title: 'Storage Location',
		autoOpen: false,
		height: 130,
		width: 220,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					p_rtnData = $('#storeLocPop_STORE_LOC option:selected').val();
					popupClose($('#storeLocPopUp').data('pid'));
					popupClose($('#productPopUp').data('pid'));
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
			
			$('#storeLocPop-MATL_CD').val($(this).data("MATL_CD"));
			$('#storeLocPop-PLANT_CD').val($(this).data("PLANT_CD"));
			
			selectStoreLocPopList();
			
			$('#storeLocPop_STORE_LOC').on('change', function (e) {
				if(this.value != ""){
					p_rtnData = $('#storeLocPop_STORE_LOC option:selected').val();
					popupClose($('#storeLocPopUp').data('pid'));
					popupClose($('#productPopUp').data('pid'));
				}
			});
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
			popupClose($('#productPopUp').data('pid'));
		}
	});
});

function selectStoreLocPopList(){
	
	var url = "/salesOrder/selectStoreLocPopList.do";
	
	var disabled = $('form[id=frmSearch]').find(':input:disabled').removeAttr('disabled');
	
	var formData = formIdAllToMap('frmSearch');
	
	disabled.attr('disabled','disabled');
	
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){
		if(!fn_empty(data.storeLoc)){
			
			var retVal = data.storeLoc.split(';');
			
			$('#storeLocPop_STORE_LOC').empty().data('options');
			$('#storeLocPop_STORE_LOC').append('<option value=' + "" + '></option>');
			
			for(i = 0; i < retVal.length; i++){
				if(!fn_empty(retVal[i])){
					var tempVal = retVal[i].split(':');
					$('#storeLocPop_STORE_LOC').append('<option value=' + tempVal[0] + '>' + tempVal[1] + '</option>');
				}
			}
		}else{
			popupClose($('#storeLocPopUp').data('pid'));
			popupClose($('#productPopUp').data('pid'));
		}
	});
}
</script>