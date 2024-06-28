<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="OpenArReport" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize">
	<form id="frmSearch" action="#" style="display: none;">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
	</form>
</div>
<!-- 검색조건 영역 끝 -->

<div id="ctu_wrap">
	<div class="tab_top_search">
		<table width="100%">
			<tbody>
				<tr>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.grd.date"/></p></td>
					<td><input type="text" id="openArReport_ALLGSTID" data-type="date" readonly/></td>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="customer.Customer"/></p></td>
					<td><input type="text" id=openArReport_CUST_CD>
					<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
					<p class="data_under_text" name="openArReport_CUST_NM" id="openArReport_CUST_NM"></p></td>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="customer.Company"/></p></td>
					<td><select id="openArReport_COMP_CD" name="openArReport_COMP_CD" data-dbcolumn="COMP_CD"></select></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="customer.btn.OpenAR"/></h4></div>
			<div class="ct_grid_top_right">  
			</div>
		</div>
		<table id="openArReportGrid"></table>
		<div id="openArReportGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
(function() {
	
	function createOpenArReportGrid() {
		// TODO
		var colName =  [
			'<s:message code="customer.Customer"/>',
			'<s:message code="customer.Country"/>',
			'<s:message code="customer.Name"/>',
			/*
			'<s:message code="customer.City"/>',
			'<s:message code="customer.PostalCode"/>',
			'<s:message code="customer.Region"/>',
			'<s:message code="customer.Street"/>',
			'<s:message code="customer.Company"/>',*/
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
			{ name: 'KUNNR', width: 150, align: 'center', hidden: true },
			{ name: 'LAND1', width: 100, align: 'center' , hidden: true },
			{ name: 'NAME1', width: 100, align: 'center' , hidden: true },
			/*
			{ name: 'ORT01', width: 250, align: 'center' },
			{ name: 'PSTLZ', width: 250, align: 'center' },
			{ name: 'REGIO', width: 150, align: 'center' },
			{ name: 'STRAS', width: 250, align: 'center' },
			{ name: 'BURKS', width: 250, align: 'center' }, */
			{ name: 'BELNR', width: 100, align: 'center' },
			{ name: 'BLART', width: 100, align: 'center' },
			{ name: 'BLDAT', width: 150, align: 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } },
			{ name: 'BSCHL', width: 100, align: 'center' },
			{ name: 'BUDAT', width: 150, align: 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } },
			{ name: 'BUZID', width: 70, align: 'center' },
			{ name: 'GJAHR', width: 70, align: 'center' },
			{ name: 'HKONT', width: 100, align: 'center', },
			{ name: 'MANST', width: 100, align: 'center' },
			{ name: 'SKFBT', width: 100, align: 'center' },
			{ name: 'WAERS', width: 70, align: 'center' },
			{ name: 'XBLNR', width: 150, align: 'left' },
			{ name: 'ZBD1T', width: 70, align: 'center' },
			{ name: 'ZFBDT', width: 150, align: 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } },
			{ name: 'ZUONR', width: 100, align: 'center' },
			{ name: 'WRBTR', width: 100, align: 'right' },
			{ name: 'DMBTR', width: 100, align: 'right' },
			{ name: 'HWAER', width: 70, align: 'center' },
			{ name: 'ALLGSTID', width: 150, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } },
			{ name: 'SHKZG', width: 100, align: 'center' }
		];
		
		var gSetting = {
			height: 632,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			resizeing: true,
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
		btGrid.createGrid('openArReportGrid', colName, colModel, gSetting);
	}

	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	window.cSearch = function() {
		var param = {
			CUST_CD: leadingZeros(document.getElementById('openArReport_CUST_CD').value,10),
			COMP_CD: document.getElementById('openArReport_COMP_CD').value,
			IS_ALLGSTID: document.getElementById('openArReport_ALLGSTID').value.split('.').reverse().join('')
		};
		
		if (!param.IS_ALLGSTID || !param.CUST_CD || !param.COMP_CD) {
			alert('<s:message code="validator.manatory"/>');
			return;
		}
		
		fn_ajax('/common/retrieveOpenArList.do', true, param, function(data) {
			if (!data.RESULT) {
				return;
			}
			
			var mchbData;
			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'T_ITEMS') {
					mchbData = v;
					return true;
				}
				return false;
			});
			
			if (!!mchbData && mchbData.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			mchbData.rows = mchbData.rows.slice(0, mchbData.rows.length - 1);
			reloadGrid('openArReportGrid', mchbData.rows);
		});

	};
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$("#openArReport_CUST_CD").val(selecedData.CUST_CD);
				$("#openArReport_CUST_NM").text(selecedData.CUST_NM);
			}
		});
	}
	
	function initialize() {
		var toDay = getToday();
		var elm = document.getElementById('openArReport_COMP_CD');
		$.when(Util.component.createCombobox(elm, true))
		.done(function() {
			$("#openArReport_COMP_CD").val('1000');
		});
		
		createOpenArReportGrid();
		
		$("#openArReport_ALLGSTID").val(toDay);

		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#openArReport_CUST_CD').val());
		});
		
		$('#openArReport_CUST_CD').on('keyup', function (e) {
			if (e.which  == 8 || e.which  == 46){
				if(fn_empty($("#openArReport_CUST_CD").val())){
					$("#openArReport_CUST_NM").text("");
				}
			}
		});
	}
	initialize();
})()
</script>

<c:import url="../import/frameBottom.jsp" />