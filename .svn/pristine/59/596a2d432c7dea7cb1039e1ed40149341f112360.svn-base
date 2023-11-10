<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div id="CustomerSearchPopup">
	<form id="frmSearch" action="#" style="display: none;">
		<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
	</form>
	
	<div class="oms_popup_button">
	<button id="CustomerSearchPopup_search" class='btn btn-default' type='button'><i class='fa fa-search'></i>Search</button>
	</div>
	<div id="ctm_sech_wrap">
		<table class="new_search_pop" width="100%">
			<tr>
				<td style="width:140px;"><s:message code="customer.Customer"/></td>
				<td style="width:242px;"><input id=CustomerSearchPopup_CUST_CD type="text" data-searchcolumn="CUST_CD"></td>
				<td style="width:146px;"><s:message code="customer.Name"/></td>
				<td style="width:242px;"><input id=CustomerSearchPopup_CUST_NM type="text" data-searchcolumn="CUST_NM"></td>
				<td style="width:136px;"><s:message code="customer.SrchTerm"/></td>
				<td style="width:242px;" class="new_s_pop_small" width="180px">
					<input id=CustomerSearchPopup_SEARCH_NM1 type="text" data-searchcolumn="SEARCH_NM1" width="92px">
					<input id=CustomerSearchPopup_SEARCH_NM2 type="text" data-searchcolumn="SEARCH_NM2" width="92px">
				</td>
			</tr>
			<tr>
				<td class="small_td"><p><s:message code="customer.CityName"/></p></td>
				<td><input id="CustomerSearchPopup_CITY_NM" type="text" data-searchcolumn="CITY_NM"></td>
				<td class="small_td"><p><s:message code="customer.PostalCode"/></p></td>
				<td><input id="CustomerSearchPopup_POST_CD" type="text" data-searchcolumn="POST_CD"></td>
				<td class="small_td"><p><s:message code="customer.Country"/></p></td>
				<td><select id="CustomerSearchPopup_COUNTRY_CD" data-dbcolumn="COUNTRY_CD" data-searchcolumn="COUNTRY_CD"></select></td>
			</tr>
			<tr>
				<td><s:message code="customer.SalesOrg"/></td>
				<td><select  id="CustomerSearchPopup_SALES_ORG_CD" data-dbcolumn="SALES_ORG_CD" data-searchcolumn="SALES_ORG_CD"></select></td>
				<td><s:message code="customer.DistChannel"/></td>
				<td><select  id="CustomerSearchPopup_DISTRB_CH" data-dbcolumn="DISTRB_CH" data-searchcolumn="DISTRB_CH"></select></td>
				<td><s:message code="customer.Division"/></td>
				<td><select  id="CustomerSearchPopup_DIV_CD" data-dbcolumn="DIV_CD" data-searchcolumn="DIV_CD"></select></td>
			</tr>
			<tr>
				<td><p><s:message code="customer.Grade"/></td>
				<td width="180px"><p><select id="CustomerSearchPopup_QPARTNERGRADE" data-dbcolumn="GRADE" data-searchcolumn="GRADE"></select></p></td>
				<td class="small_td"><p><s:message code="customer.QPartner"/></td>
				<td><p><select id="CustomerSearchPopup_QPARTNER" data-searchcolumn="QPARTNER"><option value="">ALL</option><option value="Y">Y - Yes</option><option value="N">N - No</option></select></p></td>
				<td><p><s:message code="customer.SalesGrp"/></p></td>
				<td><select id="CustomerSearchPopup_SALES_GR" data-dbcolumn="SALES_GR" data-searchcolumn="SALES_GR"></select></td>
			</tr>
			<tr>
				<td><p><s:message code="customer.CustGrp"/></p></td>
				<td width="180px"><select id="CustomerSearchPopup_CUST_GR" data-dbcolumn="CUST_GR" data-searchcolumn="CUST_GR"></select>
				<td class="small_td"><p><s:message code="customer.AccountGrp"/></p></td>
				<td><select id="CustomerSearchPopup_ACCOUNT_GR" data-dbcolumn="ACCOUNT_GR" data-searchcolumn="ACCOUNT_GR"></select>
			</tr>
			<tr style="display: none;">
				<td colspan="6"><span style="float:left; margin-right:4px;"><s:message code="customer.Onetimecust"/></span><input type="checkbox" id="CustomerSearchPopup_OneTimecust_CD" style="width:12.5%;"></td>
			</tr>
			<input type="hidden" name="DIV_FLAG"  id="DIV_FLAG" data-dbcolumn="DIV_FLAG" data-searchcolumn="DIV_FLAG"/>
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
			<table id="CustomerSearchPopup_customerList"></table>
			<div id="CustomerSearchPopup_customerList_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
	
</div>

<script>
(function() {
	function createSearchGrid() {
		var colName = [
			'<s:message code="customer.Customer"/>',
			'<s:message code="customer.grd.Name"/>',
			'',
			'<s:message code="customer.SalesOrg"/>',
			'',
			'<s:message code="customer.DistChannel"/>',
			'',
			'<s:message code="customer.Division"/>',
			'<s:message code="customer.Grade"/>',
			''
		];
		
		var colModel = [
			{ name: 'CUST_CD', width: 150, align: 'center', },
			{ name: 'CUST_NM', width: 250, align: 'left' },
			{ name: 'SALES_ORG_CD', hidden: true },
			{ name: 'SALES_ORG_CD_VO', width: 250, align: 'left' },
			{ name: 'DISTRB_CH', hidden: true },
			{ name: 'DISTRB_CH_VO', width: 250, align: 'left' },
			{ name: 'DIV_CD', hidden: true },
			{ name: 'DIV_CD_VO', width: 250, align: 'left' },
			{ name: 'GRADE_NM', width: 150, align: 'center' },
			{ name: 'DELI_PLNAT_CD', hidden: true }
		];
		
		var gSetting = {
			height: 223,
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
		
		btGrid.createGrid('CustomerSearchPopup_customerList', colName, colModel, gSetting);
		
		$('#CustomerSearchPopup_customerList').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				var buttons = $('#CustomerSearchPopup').dialog('option', 'buttons');
				buttons.ok.click.apply($('#CustomerSearchPopup'));
			}
		});
	}
	
	// laod common code
	var customerInfoList;
	var searchElms = document.querySelectorAll('#CustomerSearchPopup [data-searchcolumn]');
	var dbcolumnElms = document.querySelectorAll('#CustomerSearchPopup [data-dbcolumn]');
	
	$('#CustomerSearchPopup').dialog({
		title : 'Customer Search',
		autoOpen : false,
		height: 521,
		width: 1150,
		modal : true,
		buttons : {
			'ok' : {
				text: 'OK',
				click: function() {
					var grid = $('#CustomerSearchPopup_customerList');
					var selrow = grid.getGridParam('selrow');
					if (!selrow) {
						alert('<s:message code="customer.msg.mandatorycustomer"/>');
					} else {
						var that = $(this);
						var row = $('#CustomerSearchPopup_customerList').jqGrid('getRowData', selrow);
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
				$('#CustomerSearchPopup_CUST_NM').focus();
			}
			
			var onetimeCheck = document.getElementById('CustomerSearchPopup_OneTimecust_CD');
			onetimeCheck.addEventListener('click', function(e) {
				if (onetimeCheck.getAttribute('checked')) {
					onetimeCheck.removeAttribute('checked');
				} else {
					onetimeCheck.setAttribute('checked', 'checked');
				}		
				
			});
			
			var qparterGradeElm = document.getElementById('CustomerSearchPopup_QPARTNERGRADE');
			qparterGradeElm.addEventListener('change', function(e) {
				if (!!qparterGradeElm.value) {
					qparterElm.value = 'Y';
				}
			});
			
			var qparterElm = document.getElementById('CustomerSearchPopup_QPARTNER');
			qparterElm.addEventListener('change', function(e) {
				if (qparterElm.value === 'N') {
					qparterGradeElm.value = '';
				}
			});
			
			$.when($(this).data('window').Util.component.createCombobox(dbcolumnElms, 'ALL'))
			.done(function() {
				initValue();
				createSearchGrid();
				reloadGrid('CustomerSearchPopup_customerList', []);
				btGrid.gridResizing('CustomerSearchPopup_customerList');
				/*
				customerInfoList = that.data('result');
				if (!!customerInfoList) {
					reloadGrid('CustomerSearchPopup_customerList', customerInfoList);
				} else {
					var elm = document.getElementById('CustomerSearchPopup_search');
					var event = document.createEvent("Event");
					event.initEvent("click", false, true); 
					elm.dispatchEvent(event);
				}
				btGrid.gridResizing('CustomerSearchPopup_customerList');
				*/
				
				if(!fn_empty($('#CustomerSearchPopup_CUST_CD').val())
					&& !fn_empty($('#CustomerSearchPopup_SALES_ORG_CD option:selected').val())
					&& !fn_empty($('#CustomerSearchPopup_DISTRB_CH option:selected').val())
					&& !fn_empty($('#CustomerSearchPopup_DIV_CD option:selected').val())){
					
					document.getElementById('CustomerSearchPopup_search').click();
					
					setTimeout(function() { 
						$('#CustomerSearchPopup_customerList').jqGrid('setSelection', $('#CustomerSearchPopup_customerList').jqGrid('getDataIDs')[0]);
						
						var buttons = $('#CustomerSearchPopup').dialog('option', 'buttons');
						buttons.ok.click.apply($('#CustomerSearchPopup'));
					},500);
				}
				
				if(!fn_empty($('#CustomerSearchPopup_SALES_ORG_CD option:selected').val())
					&& !fn_empty($('#CustomerSearchPopup_DISTRB_CH option:selected').val())
					&& !fn_empty($('#CustomerSearchPopup_DIV_CD option:selected').val())){
						$('#CustomerSearchPopup_SALES_ORG_CD').prop('disabled', true);
						$('#CustomerSearchPopup_DISTRB_CH').prop('disabled', true);
						$('#CustomerSearchPopup_DIV_CD').prop('disabled', true);
					}
			});
			
			var onSearchFld = '#CustomerSearchPopup_CUST_CD, #CustomerSearchPopup_CUST_NM, #CustomerSearchPopup_SEARCH_NM1, #CustomerSearchPopup_SEARCH_NM2, #CustomerSearchPopup_CITY_NM, #CustomerSearchPopup_POST_CD';
			
			$(onSearchFld).on('keypress', function (e) {
				if (e.which === 13) {
					document.getElementById('CustomerSearchPopup_search').click();
				}
			});
		}
	});
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	document.getElementById('CustomerSearchPopup_search').addEventListener('click', function() {
		var custCd = document.getElementById('CustomerSearchPopup_CUST_CD').value;
		custCd = custCd.replace(/\*/g , '%');
		var custNm = document.getElementById('CustomerSearchPopup_CUST_NM').value;
		custNm = custNm.replace(/\*/g , '%');
		var searchNm1 = document.getElementById('CustomerSearchPopup_SEARCH_NM1').value;
		searchNm1 = searchNm1.replace(/\*/g , '%');
		var searchNm2 = document.getElementById('CustomerSearchPopup_SEARCH_NM2').value;
		searchNm2 = searchNm2.replace(/\*/g , '%');
		
		var param = {};
		Array.prototype.forEach.call(searchElms, function(elm) {
			var value = elm.value;
			if (!!value) {
				var column = elm.dataset.searchcolumn;
				value = value.replace(/\*/g , '%');
				param[column] = value;
			}
		});
		
		fn_ajax('/customer/retrieveGeneral.do', true, param, function(data) {
			customerInfoList = data.RESULT;
			reloadGrid('CustomerSearchPopup_customerList', customerInfoList);
		});
	});
})();
</script>