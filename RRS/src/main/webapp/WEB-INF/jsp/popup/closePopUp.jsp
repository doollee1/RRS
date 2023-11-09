<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : ProductPopUp
	 * @Description : 제품관리 검색팝업
	 */
%>

<div id="closePopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
	</div>
	
	<!---------->
	
	<div class="popup_search_small">
		<form id="frmSearch" action="#">
			<div id="ctm_sech_wrap_batch">
				<ul class="sech_ul">
					<li class="sech_list">
						<div></div>
					</li>
				</ul>
				
				<!-------------- --->
				
				<!-- <h4><i class="fa fa-search"></i>&nbsp;<s:message code="button.search"/></h4>-- -->
				<table class="new_search_pop" width="100%">
					<tbody>
						<tr>
							<td style="text-align:center;"><select id="closePopUp-RSN_RJT_CD" name="closePopUp-RSN_RJT_CD" class="" style="width:370px;"></select></td>							
						</tr>
					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
$(function() {
	$('#closePopUp').dialog({
		title: '<s:message code="title.rejectRsn"/>',
		autoOpen: false,
		height: 160,
		width: 400,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					p_rtnData = $('#closePopUp-RSN_RJT_CD option:selected').val();
					popupClose($('#closePopUp').data('pid'));
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
			
			var codeBoxArray = ['closePopUp-RSN_RJT_CD'];
			createCodeBoxByEdit(codeBoxArray, true);
			
// 			$('#closePopUp-RSN_RJT_CD').on('change', function (e) {
// 				if(this.value != ""){
// 					p_rtnData = $('#closePopUp-RSN_RJT_CD option:selected').val();
// 					popupClose($('#closePopUp').data('pid'));
// 				}
// 			});
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});
</script>