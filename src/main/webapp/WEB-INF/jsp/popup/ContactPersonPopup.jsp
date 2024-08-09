<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : ContactPersonPopup
 */
%>
<div id="ContactPersonPopup">
	<!--- 검색버튼 ---->
		<div class="oms_popup_button">
			<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
				<i class='fa fa-search'></i><s:message code='button.search'/></button>
		</div>

	<div id="ctm_sech_wrap">
	<form id="frmContactMGSearch" method="post" action="#">
		<input type="hidden" name="contactPersonGrid_CURRENT_PAGE" id="contactPersonGrid_CURRENT_PAGE"/>
		<input type="hidden" name="contactPersonGrid_ROWS_PER_PAGE" id="contactPersonGrid_ROWS_PER_PAGE"/>
		<table class="new_search_pop" style="width:100%;">
				<tr>
					<td class="small_td"><s:message code='customer.Customer'/></td>
					<td><p><input type="text" id="S_CUST_CD" name="S_CUST_CD"  readonly="readonly" disabled=""></p></td>
					<td class="small_td"><s:message code='customer.Name'/></td>
					<td><p><input type="text" id="S_CUST_NM" name="S_CUST_NM"  readonly="readonly" disabled=""/></p></td>
				</tr>
				<tr>
					<td class="small_td"><s:message code='customer.lastName'/></td>
					<td><p><input type="text" id="S_LAST_NM" name="S_LAST_NM"></p></td>
					<td class="small_td"><s:message code='customer.firstName'/></td>
					<td><p><input type="text" id="S_FIRST_NM" name="S_FIRST_NM" class="cmc_txt" /></p></td>
				</tr>
				<tr>
					<td class="small_td"><s:message code='customer.SrchTermOne'/></td>
					<td><p><input type="text" id="S_SEARCH_NM" name="S_SEARCH_NM"></p></td>
					<td></td>
					<td></td>
				</tr>
		</table>
	</form>
	</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:5px;">
	<!-- <div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code='customer.contactList'/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
	 -->
		<table id="grid_ContactPersonMG"></table>
		<div id="pager_ContactPersonMG"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script type="text/javascript">
	/********************************************
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
$(function() {
	$('#ContactPersonPopup').dialog({
		title:'<s:message code='customer.contactSearch'/>',
		autoOpen: false,
		height: 500,
		width: 930,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': {
				text: '<s:message code='button.confirm'/>',
				click: function() {
					var selRows = $('#grid_ContactPersonMG').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#grid_ContactPersonMG').getRowData(selRows)];

					p_rtnData = gridData;
					parent.$('#PS_NO').val(p_rtnData[0].CODE);
					parent.$('#NAME').val(p_rtnData[0].FULL_NM);
					parent.$('#DESC').val(p_rtnData[0].SEARCH_TERM);
					popupClose($('#ContactPersonPopup').data('pid'));
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
			$('#ContactPersonPopup .pop_grid_wrap').height($(this).height() - $('#ContactPersonPopup.popup_search').outerHeight(true) - 70);
			$('#S_CUST_CD').val($(this).data('CUST_CD'));
			$('#S_CUST_NM').val($(this).data('CUST_NM'));

			grid_ContactPersonMG_Load();
			//popupSearch();

			$('[name="S_LAST_NM"]').focus();

			/* 그리드 이벤트 */
			$('#grid_ContactPersonMG').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var gridData = [$('#grid_ContactPersonMG').getRowData(rowid)];
					p_rtnData = gridData;
					popupClose($('#ContactPersonPopup').data('pid'));
				}
			});

			gridData = $(this).data('gridData');
			if (fn_empty(gridData) == false) {
				$('#grid1').jqGrid('clearGridData');
				$('#grid1').jqGrid('setGridParam', {data:gridData});
				$('#grid1').trigger('reloadGrid');
			}

			var onSearchFld = '#S_CUST_CD, #S_CUST_NM, #S_LAST_NM, #S_FIRST_NM, #S_SEARCH_NM';
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

	/********************************************
	 * @Subject : 그리드 설정 및 초기화
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function grid_ContactPersonMG_Load() {
	var colName = ['<s:message code='system.compcd'/>',
				   '<s:message code='customer.lastName'/>',
				   '<s:message code='customer.firstName'/>',
				   '<s:message code='customer.fullName'/>',
				   '<s:message code='customer.partnerid'/>',
				   '<s:message code='customer.SrchTermOne'/>',
				   'STREET_NM',
				   'TEL_NO',
				   'E_MAIL',
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
				   'H_E_MAIL',
				   'H_COUNTRY_NM'
				   ];
	var colModel = [
					{name:'COMP_CD',      index:'COMP_CD',      width:120, hidden:true},
					{name:'NAME_2ND',     index:'NAME_2ND',     width:150},
					{name:'NAME_1ST',     index:'NAME_1ST',     width:150},
					{name:'FULL_NM',      index:'FULL_NM',      width:100, hidden:true},
					{name:'CODE',         index:'CODE',         width:150},
					{name:'SEARCH_NM',    index:'SEARCH_NM',    width:150},
					{name:'STREET_NM',    index:'STREET_NM',    width:100, hidden:true},
					{name:'TEL_NO',       index:'TEL_NO',       width:100, hidden:true},
					{name:'E_MAIL',       index:'E_MAIL',       width:100, hidden:true},
					{name:'H_NAME_1ST',   index:'H_NAME_1ST',   width:100, hidden:true},
					{name:'H_NAME_2ND',   index:'H_NAME_2ND',   width:100, hidden:true},
					{name:'H_FULL_NM',    index:'H_FULL_NM',    width:100, hidden:true},
					{name:'H_SEARCH_NM',  index:'H_SEARCH_NM',  width:100, hidden:true},
					{name:'H_SEARCH_NM2', index:'H_SEARCH_NM2', width:100, hidden:true},
					{name:'H_SEARCH_NM3', index:'H_SEARCH_NM3', width:100, hidden:true},
					{name:'H_COUNTRY_CD', index:'H_COUNTRY_CD', width:100, hidden:true},
					{name:'H_CITY_NM',    index:'H_CITY_NM',    width:100, hidden:true},
					{name:'H_POST_CD',    index:'H_POST_CD',    width:100, hidden:true},
					{name:'H_REGION_CD',  index:'H_REGION_CD',  width:100, hidden:true},
					{name:'H_SORT_KEY',   index:'H_SORT_KEY',   width:100, hidden:true},
					{name:'H_HAUS_NO',    index:'H_HAUS_NO',    width:100, hidden:true},
					{name:'H_STREET_NM',  index:'H_STREET_NM',  width:100, hidden:true},
					{name:'H_VAT_ID',     index:'H_VAT_ID',     width:100, hidden:true},
					{name:'H_TAX_ID',     index:'H_TAX_ID',     width:100, hidden:true},
					{name:'H_URL',        index:'H_URL',        width:100, hidden:true},
					{name:'H_TEL_NO1',    index:'H_TEL_NO1',    width:100, hidden:true},
					{name:'H_TEL_NO1_EXT',index:'H_TEL_NO1_EXT',width:100, hidden:true},
					{name:'H_TEL_NO2',    index:'H_TEL_NO2',    width:100, hidden:true},
					{name:'H_FAX_NO',     index:'H_FAX_NO',     width:100, hidden:true},
					{name:'H_FAX_NO_EXT', index:'H_FAX_NO_EXT', width:100, hidden:true},
					{name:'H_E_MAIL',     index:'H_E_MAIL',     width:100, hidden:true},
					{name:'H_COUNTRY_NM', index:'H_COUNTRY_NM', width:100, hidden:true}
	];

	var gSetting = {
			height: 252,
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
	btGrid.createGrid('grid_ContactPersonMG', colName, colModel, gSetting);
}

	/********************************************
	 * @Subject : 팝업창 조회 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function popupSearch() {
	var v_searchData = formIdToMap('frmContactMGSearch');
	var sendData     = {'param':v_searchData};
	var url          = '/customer/selectContactPersonPopup.do';
	fn_ajax(url, false, sendData, function(data, xhr) {
		var gridData = data.result;
		$('#grid_ContactPersonMG').jqGrid('clearGridData');
		$('#grid_ContactPersonMG').jqGrid('setGridParam', {data:gridData});
		$('#grid_ContactPersonMG').trigger('reloadGrid');
	});
}
</script>
