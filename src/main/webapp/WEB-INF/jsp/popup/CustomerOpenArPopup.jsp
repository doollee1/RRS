<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div id="CustomerOpenInvoicePopup">
	<div class="oms_popup_button" style="padding-bottom:10px;">
	<button id="CustomerOpenInvoicePopup_search" class='btn btn-default' type='button'><i class='fa fa-search'></i>Search</button>
	</div>
	<div id="ctm_sech_wrap">
	<h4>Search</h4>
		<table width="100%" class="table_line">
			<tr>
				<td><p><s:message code="quotation.grd.date"/></p></td>
				<td><input type="text" id="CustomerOpenInvoicePopup_ALLGSTID" data-type="date" readonly/></td>
				<td><s:message code="customer.Customer"/></td>
				<td><input type="text" id=CustomerOpenInvoicePopup_CUST_CD></td>
				<td><s:message code="customer.Company"/></td>
				<td><select id="CustomerOpenInvoicePopup_COMP_CD" data-dbcolumn="COMP_CD"></select></td>
			</tr>
		</table>
	</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="CustomerOpenInvoicePopup_customerList"></table>
		<div id="CustomerOpenInvoicePopup_customerList_pager"></div>
	</div>
	<!-- 그리드 끝 -->
	
</div>

<script>
(function() {
	function createOpenInvoiceGrid() {
		var colName = [
			'<s:message code="customer.Customer"/>',
			'<s:message code="customer.Country"/>',
			'<s:message code="customer.Name"/>',
			'<s:message code="customer.City"/>',
			'<s:message code="customer.PostalCode"/>',
			'<s:message code="customer.Region"/>',
			'<s:message code="customer.Street"/>',
			'<s:message code="customer.Company"/>',
			'<s:message code="quotation.grd.document"/>',
			'<s:message code="lead.DocumentType"/>',
			'<s:message code="sales.grd.DocDate"/>',
			'<s:message code="openinvoice.Posting"/>',
			'<s:message code="openinvoice.Posting"/>',
			'<s:message code="openinvoice.Line"/>',
			'<s:message code="openinvoice.Fiscal"/>',
			'<s:message code="openinvoice.Account"/>',
			'<s:message code="openinvoice.Dunning"/>',
			'<s:message code="openinvoice.Discount"/>',
			'<s:message code="quotation.docCurr"/>',
			'<s:message code="lead.Reference"/>',
			'<s:message code="openinvoice.Days"/>',
			'<s:message code="openinvoice.Baseline"/>',
			'<s:message code="openinvoice.Assignment"/>',
			/*
			'<s:message code="openinvoice.Net"/>',
			*/
			'<s:message code="openinvoice.Amount"/>',
			'<s:message code="openinvoice.Currency"/>',
			'<s:message code="openinvoice.Loc"/>',
			'<s:message code="openinvoice.Key"/>',
			'<s:message code="openinvoice.Debit"/>'
		];
		
		var colModel = [
			{ name: 'KUNNR', width: 150, align: 'center', },
			{ name: 'LAND1', width: 250, align: 'center' },
			{ name: 'NAME1', width: 250, align: 'center' },
			{ name: 'ORT01', width: 250, align: 'center' },
			{ name: 'PSTLZ', width: 250, align: 'center' },
			{ name: 'REGIO', width: 150, align: 'center' },
			{ name: 'STRAS', width: 250, align: 'center' },
			{ name: 'BURKS', width: 250, align: 'center' },
			{ name: 'BELNR', width: 250, align: 'center' },
			{ name: 'BLART', width: 250, align: 'center' },
			{ name: 'BLDAT', width: 150, align: 'center' },
			{ name: 'BSCHL', width: 250, align: 'center' },
			{ name: 'BUDAT', width: 250, align: 'center' },
			{ name: 'BUZID', width: 250, align: 'center' },
			{ name: 'GJAHR', width: 250, align: 'center' },
			{ name: 'HKONT', width: 150, align: 'center', },
			{ name: 'MANST', width: 250, align: 'center' },
			{ name: 'SKFBT', width: 250, align: 'center' },
			{ name: 'WAERS', width: 250, align: 'center' },
			{ name: 'XBLNR', width: 250, align: 'center' },
			{ name: 'ZBD1T', width: 150, align: 'center' },
			{ name: 'ZFBDT', width: 250, align: 'center' },
			{ name: 'ZUONR', width: 250, align: 'center' },
			{ name: 'WRBTR', width: 250, align: 'center' },
			{ name: 'DMBTR', width: 250, align: 'center' },
			{ name: 'HWAER', width: 150, align: 'center', },
			{ name: 'ALLGSTID', width: 250, align: 'center' },
			{ name: 'SHKZG', width: 250, align: 'center' }
		];
		
		var gSetting = {
				height: 175,
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
		
		btGrid.createGrid('CustomerOpenInvoicePopup_customerList', colName, colModel, gSetting);
	}
	
	// laod common code
	$('#CustomerOpenInvoicePopup').dialog({
		title : 'Customer Search',
		autoOpen : false,
		height: 500,
		width: 930,
		modal : true,
		buttons : {
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
			var elm = document.getElementById('CustomerOpenInvoicePopup_COMP_CD');
			$.when($(this).data('window').Util.component.createCombobox(elm, true))
			.done(function() {
				createOpenInvoiceGrid();
				$('#CustomerOpenInvoicePopup_ALLGSTID').datepicker({ dateFormat : 'dd.mm.yy', showOn : 'both' });
			});
			
			var onSearchFld = '#CustomerOpenInvoicePopup_ALLGSTID, #CustomerOpenInvoicePopup_CUST_CD, #CustomerOpenInvoicePopup_COMP_CD';
			
			$(onSearchFld).on('keypress', function (e) {
							if(e.which == 13){
								document.getElementById('CustomerOpenInvoicePopup_search').click();
							}
			});
		}
	});
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	document.getElementById('CustomerOpenInvoicePopup_search').addEventListener('click', function() {
		var param = {
			CUST_CD: document.getElementById('CustomerOpenInvoicePopup_CUST_CD').value,
			COMP_CD: document.getElementById('CustomerOpenInvoicePopup_COMP_CD').value,
			IS_ALLGSTID: document.getElementById('CustomerOpenInvoicePopup_ALLGSTID').value.split('.').reverse().join('')
		};
		
		if (!param.IS_ALLGSTID) {
			alert('<s:message code="validator.manatory"/>');
			return;
		}
		
		fn_ajax('/common/retrieveOpenArList.do', false, param, function(data) {
			var list = data.RESULT;
			if (!!list) {
				reloadGrid('CustomerOpenInvoicePopup_customerList', Object.keys(list[0].rows).map(function(k) { return list[0].rows[k] }));
			}
		});
	});
})();
</script>