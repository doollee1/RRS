<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : plantPopUp
	 * @Description : plantPopUp
	 */
%>

<div id="plantPopUp">
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
							<td class="small_td"><p>Plant</p></td>
							<td style="text-align:center;"><select id="plantPop_PLNAT_CD" name="plantPop_PLNAT_CD" class="" style="width:110px;"></select></td>							
						</tr>
					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
			<input type="hidden" name="plantPop-MATL_CD" id="plantPop-MATL_CD" />
		</form>
	</div>
</div>

<script type="text/javascript">
$(function() {
	$('#plantPopUp').dialog({
		title: 'Plant',
		autoOpen: false,
		height: 130,
		width: 220,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					p_rtnData = $('#plantPop_PLNAT_CD option:selected').val();
					popupClose($('#plantPopUp').data('pid'));
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
			
			$('#plantPop-MATL_CD').val($(this).data("MATL_CD"));
			
			
			selectPlantPopList();
			
			$('#plantPop_PLNAT_CD').on('change', function (e) {
				if(this.value != ""){
					p_rtnData = $('#plantPop_PLNAT_CD option:selected').val();
					popupClose($('#plnatPopUp').data('pid'));
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

function selectPlantPopList(){
	
	var url = "/salesOrder/selectItemPlant.do";
	
	var disabled = $('form[id=frmSearch]').find(':input:disabled').removeAttr('disabled');
	
	var formData = formIdAllToMap('frmSearch');
	
	disabled.attr('disabled','disabled');
	
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){

		if(!fn_empty(data.plantCd)){
			var retVal = data.plantCd.split(';');
			
			$('#plantPop_PLNAT_CD').empty().data('options');
			$('#plantPop_PLNAT_CD').append('<option value=' + "" + '></option>');
			
			for(i = 0; i < retVal.length; i++){
				if(!fn_empty(retVal[i])){
					var tempVal = retVal[i].split(':');
					$('#plantPop_PLNAT_CD').append('<option value=' + tempVal[0] + '>' + tempVal[1] + '</option>');
				}
			}
		}else{
			popupClose($('#plantPopUp').data('pid'));
			popupClose($('#productPopUp').data('pid'));
		}
	});
}
</script>