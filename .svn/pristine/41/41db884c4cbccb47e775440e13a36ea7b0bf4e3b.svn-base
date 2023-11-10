<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : StockPopup
 */
%>
<div id="stockPopup">
	<div class="pop_grid_wrap">
		<table id="popGrid1"></table>
		<div id="popGrid1_item_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>
<script type="text/javascript">
var args;
var item_list;
$(function() {
	$('#stockPopup').dialog({
		title:'<s:message code='title.availablestock'/>',
		autoOpen: false,
		height: 575,
		width: 900,
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
			$('#stockPopup.pop_grid_wrap').height($(this).height() - $('#stockPopup.popup_search').outerHeight(true) - 70);

			item_list = $(this).data('ITEM');
			popGrid1_Load();
			popupSearch();

		},
		close: function(e, ui) {
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

function popGrid1_Load() {
	
	var colName =  [
	  			  '<s:message code="material.materialCode"/>'
	  			, '<s:message code="material.material"/>'
	  			, '<s:message code="physical.werks"/>'
	  			, '<s:message code="material.sotckQty"/>'
	  		];
	  		
	  		var colModel = [
	  			  { name: 'MATNR', width : 150, align: 'left' }
	  			, { name: 'MAKTX', width : 300, align: 'left' }
	  			, { name: 'WERKS', width : 70, align: 'center' }
	  			, { name: 'ZZ_ATP_G4', width : 150, align: 'right' }
	  		];
	  		
	var gSetting = {
	        pgflg:true,
	        colsetting : true,
			searchInit : false,
			resizeing : true,
			rownumbers:false,
			//shrinkToFit: true,
			//autowidth: true,
			height:439
		};
	btGrid.createGrid('popGrid1', colName, colModel, gSetting);
	
}

// popupSearch
function popupSearch() {
	var url = "/common/retrieveAvailableStockList2.do";
	
	var param = {"param":item_list};
	
	fn_ajax(url, true, param, function(data, xhr){
		if (!data.RESULT) {
			return;
		}
		var mchbData;
		Array.prototype.some.call(data.RESULT, function(v) {
			if (v.tableName === 'ET_DATA') {
				mchbData = v;
				return true;
			}
			return false;
		});
		
		if (!!mchbData && mchbData.rows.length === 0) {
			alert('<s:message code="validator.notfound"/>');
		}
		reloadGrid('popGrid1', mchbData.rows);
	});
}
</script>
