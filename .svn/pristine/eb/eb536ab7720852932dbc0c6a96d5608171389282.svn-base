<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : CommPopup
 */
%>
<div id="commPopup">
	<div class="oms_popup_button">
		<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'><i class='fa fa-search'></i><s:message code='button.search'/></button>
	</div>
	<div id="ctm_sech_wrap">
		<form id="frmSearch" method="post" action="#">
			<input type="text" id="RefCode" hidden='true'/>
				<input type="text" id="S_HEAD_ID" name="S_HEAD_ID" class="cmc_txt" hidden='false'/>
			<div>
				<table  class="new_search_pop">
					<tbody>
						<tr>
							<td style="width:100px;"><s:message code='title.codename'/></td>
	      					<td><p><input type="text" id="S_CODE" name="S_CODE"></p></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<div class="pop_grid_wrap">
		<table id="popGrid1"></table>
		<div id="popGrid1_item_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>
<script type="text/javascript">
var args;
$(function() {
	$('#commPopup').dialog({
		title:'<s:message code='title.commlist'/>',
		autoOpen: false,
		height: 600,
		width: 400,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': { 
				text: '<s:message code='button.confirm'/>',
				click: function() {		
					var selRows = $('#popGrid1').jqGrid('getGridParam', 'selrow');
					if(fn_empty(selRows)){
						args = '<s:message code='common.detailedcode'/>';
						alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");

					}else{
						var gridData = [$('#popGrid1').getRowData(selRows)];

						p_rtnData = gridData;
						popupClose($('#commPopup').data('pid'));
					}
				}
			},
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#commPopup.pop_grid_wrap').height($(this).height() - $('#commPopup.popup_search').outerHeight(true) - 70);

			$('#S_HEAD_ID').val($(this).data('S_HEAD_ID'));
			$('#S_CODE').val($(this).data('S_CODE'));
			$('#S_NAME').val($(this).data('S_NAME'));
			$('#RefCode').val($(this).data('RefCode'));
			
			popGrid1_Load();
			//popupSearch();

			/* 그리드 이벤트 */
			$('#popGrid1').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var gridData = [$('#popGrid1').getRowData(rowid)];
					p_rtnData = gridData;
					popupClose($('#commPopup').data('pid'));
		    	}
			});
			
			$("#S_COMM_CD").keyup(function(event){
			    if(event.keyCode == 13){
			        popupSearch();
			    }
			});
			
			$("#S_COMM_NM").keyup(function(event){
			    if(event.keyCode == 13){
			        popupSearch();
			    }
			});
			
			gridData = $(this).data('gridData');
			if (fn_empty(gridData) == false) {
				$('#grid1').jqGrid('clearGridData');
			    $('#grid1').jqGrid('setGridParam', {data:gridData});
			    $('#grid1').trigger('reloadGrid');
			}
			
			$('#S_CODE').focus();
			$('#S_CODE').keyup(function(e) {
				if (e.keyCode === 13) {
					popupSearch();
				}
			});
		},
		close: function(e, ui) {
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

function popGrid1_Load() {

	var colName = ['<s:message code='system.compcd'/>',
	               '<s:message code='common.headerid'/>',
				   '<s:message code='common.detailedcode'/>',
				   '<s:message code='common.codename'/>'];
	var colModel = [
					{name:'COMP_CD',index:'COMP_CD',width:120,hidden:true},
					{name:'HEAD_ID',index:'HEAD_ID',width:50, hidden:true},
					{name:'CODE',index:'CODE',width:50},
					{name:'NAME',index:'NAME',width:100},
	];

	var gSetting = {
	        pgflg:true,
	        colsetting : true,
			searchInit : false,
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			height:402
		};
	btGrid.createGrid('popGrid1', colName, colModel, gSetting);
	
}

// popupSearch
function popupSearch() {
	var v_searchData = formIdToMap('frmSearch');
	var sendData = {'param':v_searchData};
	var url = '/common/selectCommPopup.do';
	
	var refCode = $('#RefCode').val();
	if (!!refCode) {
		sendData.param.RefCode = refCode;
	}
	
	fn_ajax(url, false, sendData, function(data, xhr) {
		var gridData = data.result;
		$('#popGrid1').jqGrid('clearGridData');
	    $('#popGrid1').jqGrid('setGridParam', {data:gridData});
	    $('#popGrid1').trigger('reloadGrid');
	});
}
</script>
