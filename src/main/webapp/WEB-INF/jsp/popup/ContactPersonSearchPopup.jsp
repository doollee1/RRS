<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : ContactPearson Search
	 * @Description : 거절사유 팝업창
	 */
%>
<div id="ContactPearsonSearchPopup">
	<form id="frmSearch" action="#" style="display: none;">
		<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
	</form>
	
	<div class="oms_popup_button">
	<button id="ContactPearsonSearchPopup_search" class='btn btn-default' type='button'><i class='fa fa-search'></i>Search</button>
	</div>
	<div id="ctm_sech_wrap">
		<table class="new_search_pop" width="100%">
			<tr>
				<td style="width:140px;"><s:message code="customer.Code"/></td>
				<td style="width:242px;"><input id="ContactPearsonSearchPopup_CUST_CD" type="text" data-searchcolumn="CUST_CD"></td>
				<td style="width:146px;"><s:message code="customer.Name"/></td>
				<td style="width:242px;"><input id="ContactPearsonSearchPopup_CUST_NM" type="text" data-searchcolumn="CUST_NM"></td>
				<td style="width:136px;"><s:message code="customer.SearchTerm"/></td>
				<td style="width:242px;" class="new_s_pop_small" width="180px">
					<input id="ContactPearsonSearchPopup_SEARCH_NM1" type="text" data-searchcolumn="SEARCH_NM1" width="92px">
					<input id="ContactPearsonSearchPopup_SEARCH_NM2" type="text" data-searchcolumn="SEARCH_NM2" width="92px">
				</td>
			</tr>
			<tr>
				<td style="width:140px;"><s:message code="customer.ContactContact.Number"/></td>
				<td style="width:242px;"><input id="ContactPearsonSearchPopup_CODE" type="text" data-searchcolumn="CODE"></td>
				<td style="width:146px;"><s:message code="customer.ContactContact.Name"/></td>
				<td style="width:242px;"><input id="ContactPearsonSearchPopup_FULL_NM" type="text" data-searchcolumn="FULL_NM"></td>
				<td style="width:136px;"><s:message code="customer.ContactContact.SearchTerm"/></td>
				<td style="width:242px;" class="new_s_pop_small" width="180px">
					<input id="ContactPearsonSearchPopup_NAME_1ST" type="text" data-searchcolumn="NAME_1ST" width="92px">
					<input id="ContactPearsonSearchPopup_NAME_2ND" type="text" data-searchcolumn="NAME_2ND" width="92px">
				</td>
			</tr>
			<tr>
				<td><s:message code="customer.AccountGrp"/></td>
				<td><select  id="ContactPearsonSearchPopup_ACCOUNT_GR" data-dbcolumn="ACCOUNT_GR" data-searchcolumn="ACCOUNT_GR"></select></td>
				<td><s:message code="customer.grd.Department"/></td>
				<td><select  id="ContactPearsonSearchPopup_DEPT_CD" data-dbcolumn="DEPT_CD" data-searchcolumn="DEPT_CD"></select></td>
				<td><s:message code="customer.grd.Function"/></td>
				<td><select  id="ContactPearsonSearchPopup_FUNC_CD" data-dbcolumn="FUNC_CD" data-searchcolumn="FUNC_CD"></select></td>
			</tr>
		</table>
	</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<!-- --
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		 -->
		<div class="pop_grid_wrap">
			<table id="ContactPearsonSearchPopup_List"></table>
			<div id="ContactPearsonSearchPopup_List_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
	
</div>

<script>
(function() {
	function createSearchGrid() {
		var colName = [
   			  '<s:message code="customer.grd.PsNO"/>'   			
   			, '<s:message code="customer.grd.Name"/>'
   			, '<s:message code="customer.grd.Department"/>'
   			, '<s:message code="customer.grd.Function"/>'
   			, '<s:message code="customer.Customer"/>'
   			, '<s:message code="customer.Customer"/>'
   			, '<s:message code="customer.AccountGrp"/>'
   			, '<s:message code="customer.grd.E_Mail"/>'
   			, '<s:message code="customer.grd.Telephone1"/>'	
   		];
		
		var colModel = [
			{ name: 'CODE', width: 150, align: 'center', },			
			{ name: 'FULL_NM', width: 250},
			{ name: 'DEPT_CD_NM', width: 250},
			{ name: 'FUNC_CD_NM', width: 250},
			{ name: 'CUST_CD', width: 150, align: 'center', hidden: false },
			{ name: 'CUST_NM', width: 250},
			{ name: 'ACCOUNT_GR_NM', width: 250},
			{ name: 'E_MAIL', width: 250},
			{ name: 'TEL_NO', align: 'center' }			
		];
		
		var gSetting = {
			height: 260,
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
		
		btGrid.createGrid('ContactPearsonSearchPopup_List', colName, colModel, gSetting);
		
		$('#ContactPearsonSearchPopup_List').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				var buttons = $('#ContactPearsonSearchPopup').dialog('option', 'buttons');
				buttons.ok.click.apply($('#ContactPearsonSearchPopup'));
			}
		});
	}
	
	// laod common code
	var customerInfoList;
	var searchElms = document.querySelectorAll('#ContactPearsonSearchPopup [data-searchcolumn]');
	var dbcolumnElms = document.querySelectorAll('#ContactPearsonSearchPopup [data-dbcolumn]');
	
	$('#ContactPearsonSearchPopup').dialog({
		title : 'ContactPearson Search',
		autoOpen : false,
		height: 521,
		width: 1150,
		modal : true,
		buttons : {
			'ok' : {
				text: 'OK',
				click: function() {
					var grid = $('#ContactPearsonSearchPopup_List');
					var selrow = grid.getGridParam('selrow');
					if (!selrow) {
						alert('<s:message code="customer.msg.mandatorycustomer"/>');
					} else {
						var that = $(this);
						var row = $('#ContactPearsonSearchPopup_List').jqGrid('getRowData', selrow);
						var param = row;
						
						fn_ajax('/customer/retrieveGeneral.do', false, param, function(data) {
							var customerInfo = data.RESULT[0];
							var selectedSaleInfo;
							customerInfo.custSalesList.some(function(v) {
								if (v.SALES_ORG_CD === param.SALES_ORG_CD && v.DISTRB_CH === param.DISTRB_CH && v.DIV_CD === param.DIV_CD) {
									selectedSaleInfo = v;
									return true;
								}
								return false;
							});
							
							if (!!selectedSaleInfo) {
								$.each(selectedSaleInfo, function(k, v) {
									if (k === 'custPartList') {
										return;
									}
									customerInfo[k] = v;
								});
							}
							
							popupClose(that.attr('id'), data.RESULT);
						});
					}
				}
			},
			'close' : {
				text: 'Close',
				click: function() {
					popupClose($(this).attr('id')); /* 필수로 들어가야함 */
				}
			}
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			var that = $(this);
			function initValue() {
				Array.prototype.forEach.call(searchElms, function(elm) {
					var searchcolumn = elm.dataset.searchcolumn;
					var searchData = that.data(searchcolumn);
					if (!!searchData) {
						elm.value = searchData;
					}
				});
				$('#ContactPearsonSearchPopup_FULL_NM').focus();
			}			

			$.when($(this).data('window').Util.component.createCombobox(dbcolumnElms, 'ALL'))
			.done(function() {
				initValue();
				createSearchGrid();
				reloadGrid('ContactPearsonSearchPopup_List', []);
				btGrid.gridResizing('ContactPearsonSearchPopup_List');
				
				if(!fn_empty($('#ContactPearsonSearchPopup_CUST_CD').val())){
					
					document.getElementById('ContactPearsonSearchPopup_search').click();
					
					/* setTimeout(function() { 
						$('#ContactPearsonSearchPopup_List').jqGrid('setSelection', $('#ContactPearsonSearchPopup_List').jqGrid('getDataIDs')[0]);
						
						var buttons = $('#ContactPearsonSearchPopup').dialog('option', 'buttons');
						buttons.ok.click.apply($('#ContactPearsonSearchPopup'));
					},500); */
				}
			});
			
			var onSearchFld = '#ContactPearsonSearchPopup_CUST_CD, #ContactPearsonSearchPopup_CUST_NM, #ContactPearsonSearchPopup_SEARCH_NM1, #ContactPearsonSearchPopup_SEARCH_NM2';
			onSearchFld += '#ContactPearsonSearchPopup_CODE, #ContactPearsonSearchPopup_FULL_NM, #ContactPearsonSearchPopup_NAME_1ST, #ContactPearsonSearchPopup_NAME_2ND';
			
			$(onSearchFld).on('keypress', function (e) {
				if (e.which === 13) {
					document.getElementById('ContactPearsonSearchPopup_search').click();
				}
			});
		}
	});
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	document.getElementById('ContactPearsonSearchPopup_search').addEventListener('click', function() {
		var custCd = document.getElementById('ContactPearsonSearchPopup_CUST_CD').value;
		custCd = custCd.replace(/\*/g , '%');
		var custNm = document.getElementById('ContactPearsonSearchPopup_CUST_NM').value;
		custNm = custNm.replace(/\*/g , '%');
		var searchNm1 = document.getElementById('ContactPearsonSearchPopup_SEARCH_NM1').value;
		searchNm1 = searchNm1.replace(/\*/g , '%');
		var searchNm2 = document.getElementById('ContactPearsonSearchPopup_SEARCH_NM2').value;
		searchNm2 = searchNm2.replace(/\*/g , '%');
		
		var param = {
			  CURRENT_PAGE: $("#ContactPearsonSearchPopup_List").getGridParam("page")
		    , ROWS_PER_PAGE: $("#ContactPearsonSearchPopup_List").getGridParam("rowNum")
		}		
			
		Array.prototype.forEach.call(searchElms, function(elm) {
			var value = elm.value;
			if (!!value) {
				var column = elm.dataset.searchcolumn;
				value = value.replace(/\*/g , '%');
				param[column] = value;
			}
		});
		var params = {
			param: param
		};
		var url = "<c:url value="/customer/selectContactPersonList.do"/>";
		fn_ajax(url, true, params, function(data) {
			customerInfoList = data.result;
			reloadGrid('ContactPearsonSearchPopup_List', customerInfoList);
		});
	});
})();
</script>