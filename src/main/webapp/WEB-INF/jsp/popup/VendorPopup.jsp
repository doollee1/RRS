<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : VendorPopup
 */
%>
<div id="VendorPopup">
	<!--- 검색버튼 ---->
	<div class= "oms_popup_button">
		<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
      		<i class='fa fa-search'></i><s:message code='button.search'/></button>
	</div>

<div class="ctm_sech_wrap">
	<form id="frmVendorMGSearch" method="post" action="#">
		<input type="hidden" name="materialGrid_CURRENT_PAGE" id="materialGrid_CURRENT_PAGE">
		<input type="hidden" name="materialGrid_ROWS_PER_PAGE" id="materialGrid_ROWS_PER_PAGE">
		<table class="tab_top_search" width="100%">
			<tbody>
				<tr>
					<td class="small_td"><s:message code='customer.vendor'/></td>
		      		<td><p><input type="text" id="S_CODE" name="S_CODE"></p></td>
		      		<td class="small_td"><s:message code='customer.Name'/></td>
		      		<td><p><input type="text" id="S_CUST_NM" name="S_CUST_NM"/></p></td>
					<td class="small_td"><s:message code='customer.SrchTermOne'/></td>
		      		<td><p><input type="text" id="S_SEARCH_NM" name="S_SEARCH_NM"></p></td>
				</tr>
				<tr>
					<td class="small_td"><s:message code='sales.grd.city'/></td>
		      		<td><p><input type="text" id="S_CITY" name="S_CITY"></p></td>
		      		<td class="small_td"><s:message code='sales.grd.country'/></td>
		      		<td><p><input type="text" id="S_COUNTRY" name="S_COUNTRY"/></p></td>
				</tr>
			</tbody>
		</table>
	</form>
	<div class="ctu_g_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code='customer.vendorList'/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="grid_VendorMG"></table>
		<div id="pager_VendorMG"></div>
	</div>
	<!-- 그리드 끝 -->
</div>
</div>
<script type="text/javascript">
$(function() {
	$('#VendorPopup').dialog({
		title:'<s:message code='customer.vendorSearch'/>',
		autoOpen: false,
		height: 500,
		width: 930,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': { 
				text: '<s:message code='button.confirm'/>',
				click: function() {		
					var selRows = $('#grid_VendorMG').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#grid_VendorMG').getRowData(selRows)];
					
					p_rtnData = gridData;

					parent.$('#PS_NO').val(p_rtnData[0].CODE);
					parent.$('#NAME').val(p_rtnData[0].FULL_NM);	
					parent.$('#DESC').val(p_rtnData[0].SEARCH_NM);	
					
					popupClose($('#VendorPopup').data('pid'));
					
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
			$('#VendorPopup .pop_grid_wrap').height($(this).height() - $('#VendorPopup.popup_search').outerHeight(true) - 70);
			
			$('#S_CUST_CD').val($(this).data('CUST_CD'));
			$('#S_CUST_NM').val($(this).data('CUST_NM'));
			
			grid_VendorMG_Load();
			//popupSearch();

			$('[name="S_CODE"]').focus();
			
			/* 그리드 이벤트 */
			$('#grid_VendorMG').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var gridData = [$('#grid_VendorMG').getRowData(rowid)];
					p_rtnData = gridData;
		
					popupClose($('#VendorPopup').data('pid'));
		    	}
			});
			
			gridData = $(this).data('gridData');
			if (fn_empty(gridData) == false) {
				$('#grid1').jqGrid('clearGridData');
			    $('#grid1').jqGrid('setGridParam', {data:gridData});
			    $('#grid1').trigger('reloadGrid');
			}
			
			var onSearchFld = '#S_CODE, #S_CUST_NM, #S_SEARCH_NM, #S_CITY, #S_COUNTRY';
			
			$(onSearchFld).on('keypress', function (e) {
							if(e.which == 13){
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

function grid_VendorMG_Load() {

	var colName = ['<s:message code='customer.SrchTermOne'/>',
	               '<s:message code='sales.grd.country'/>',
	               '<s:message code='customer.CountryNm'/>',
				   '<s:message code='sales.grd.postCd'/>',
				   '<s:message code='sales.grd.city'/>',
				   '<s:message code='customer.fullName'/>',
			       '<s:message code='customer.vendor'/>',
				   'H_NAME_1ST',
				   'H_NAME_2ND',
				   'H_FULL_NM',
				   'H_SEARCH_NM',
				   'H_SEARCH_NM2',
				   'H_SEARCH_NM3',
				   'H_COUNTRY_CD',
				   'H_CITY_NM',
				   'H_POST_CD',
				   'H_REGION_CD',
				   'H_SORT_KEY',
				   'H_HAUS_NO',
				   'H_STREET_NM',
				   'H_VAT_ID',
				   'H_TAX_ID',
				   'H_URL',
				   'H_TEL_NO1',
				   'H_TEL_NO1_EXT',
				   'H_TEL_NO2',
				   'H_FAX_NO',
				   'H_FAX_NO_EXT',
				   'H_E_MAIL'
			       ];
	var colModel = [
					{name:'SEARCH_NM',index:'SEARCH_NM',width:70},
					{name:'COUNTRY_CD',index:'COUNTRY_CD',width:50},
					{name:'COUNTRY_NM',index:'COUNTRY_NM',width:70},	
					{name:'POST_CD',index:'POST_CD',width:70},
					{name:'CITY_NM',index:'CITY_NM',width:150},
					{name:'FULL_NM',index:'FULL_NM',width:200},
					{name:'CODE',index:'CODE',width:150},
					{name:'H_NAME_1ST',index:'H_NAME_1ST',width:100,hidden:true},
					{name:'H_NAME_2ND',index:'H_NAME_2ND',width:100,hidden:true},
					{name:'H_FULL_NM',index:'H_FULL_NM',width:100,hidden:true},
					{name:'H_SEARCH_NM',index:'H_SEARCH_NM',width:100,hidden:true},
					{name:'H_SEARCH_NM2',index:'H_SEARCH_NM2',width:100,hidden:true},
					{name:'H_SEARCH_NM3',index:'H_SEARCH_NM3',width:100,hidden:true},
					{name:'H_COUNTRY_CD',index:'H_COUNTRY_CD',width:100,hidden:true},
					{name:'H_CITY_NM',index:'H_CITY_NM',width:100,hidden:true},
					{name:'H_POST_CD',index:'H_POST_CD',width:100,hidden:true},
					{name:'H_REGION_CD',index:'H_REGION_CD',width:100,hidden:true},
					{name:'H_SORT_KEY',index:'H_SORT_KEY',width:100,hidden:true},
					{name:'H_HAUS_NO',index:'H_HAUS_NO',width:100,hidden:true},
					{name:'H_STREET_NM',index:'H_STREET_NM',width:100,hidden:true},
					{name:'H_VAT_ID',index:'H_VAT_ID',width:100,hidden:true},
					{name:'H_TAX_ID',index:'H_TAX_ID',width:100,hidden:true},
					{name:'H_URL',index:'H_URL',width:100,hidden:true},
					{name:'H_TEL_NO1',index:'H_TEL_NO1',width:100,hidden:true},
					{name:'H_TEL_NO1_EXT',index:'H_TEL_NO1_EXT',width:100,hidden:true},
					{name:'H_TEL_NO2',index:'H_TEL_NO2',width:100,hidden:true},
					{name:'H_FAX_NO',index:'H_FAX_NO',width:100,hidden:true},
					{name:'H_FAX_NO_EXT',index:'H_FAX_NO_EXT',width:100,hidden:true},
					{name:'H_E_MAIL',index:'H_E_MAIL',width:100,hidden:true}
	];

	var gSetting = {
			height: 200,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
	btGrid.createGrid('grid_VendorMG', colName, colModel, gSetting);
	
}

// popupSearch
function popupSearch() {
	var v_searchData = formIdToMap('frmVendorMGSearch');
	var sendData = {'param':v_searchData};
	var url = '/customer/selectVendorPopup.do';

	fn_ajax(url, true, sendData, function(data, xhr) {
		var gridData = data.result;
		$('#grid_VendorMG').jqGrid('clearGridData');
	    $('#grid_VendorMG').jqGrid('setGridParam', {data:gridData});
	    $('#grid_VendorMG').trigger('reloadGrid');
	});
}
</script>
