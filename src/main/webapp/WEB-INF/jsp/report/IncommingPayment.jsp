<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Incomming Payment Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="IncommingPaymeReport" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#">
	<input type="hidden" name="H_FROM_DT" id="H_FROM_DT">
	<input type="hidden" name="H_TO_DT" id="H_TO_DT">
	<div class="tab_top_search">
		<table>
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="Incom.AZDAT"/></p></td>
					<td class="medium_td"><input type="text" name="FROM_DT" id="FROM_DT" data-type="date" disabled="" readonly="" style="width:90px; float:left;"/>
					<p style="float:left;">-</p>
					<input type="text" name="TO_DT" id="TO_DT" style="width:90px;float:left;" data-type="date" disabled="" readonly/></td>
					<td class="small_td"><p><s:message code="quotation.soldTo"/></p></td>
					<td><input type="text" name="CUST_CD" id="CUST_CD" maxlength="10" ess="ess" onKeyPress="fn_onlyNum(this)">
					<button class="grid_popupbtn" id="cmm_pop_CUST_CD" name="cmm_pop_CUST_CD" type='button'></button>
					<p class="data_side_text" name="SL09-CUST_NM" id="SL09-CUST_NM"></p></td>
					<td class="small_td"><p><s:message code="customer.DocumentNumber"/></p></td>
					<td><input type="text" name="DOC_NO" id="DOC_NO">
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>Incoming Payment List</h4></div>
			<div class="ct_grid_top_right">  
			</div>
		</div>
		<table id="IncomGrid"></table>
		<div id="IncomGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
(function() {
	
	var toDay = getToday();
	var lastMonth = getlastMonth();
	
	function createIncomGrid() {
		// TODO
		var colName =  [
				 '<s:message code="Incom.BUKRS"/>'
				,'<s:message code="Incom.ABSND"/>'
				,'<s:message code="Incom.ESNUM"/>'
				,'<s:message code="Incom.AZDAT"/>'
				,'<s:message code="Incom.HKONT"/>'
				,'<s:message code="Incom.KTONR"/>'
				,'<s:message code="Incom.BELNR"/>'
				,'<s:message code="Incom.GJAHR"/>'
				,'<s:message code="Incom.BVDAT"/>'
				,'<s:message code="Incom.BUDAT"/>'
				,'<s:message code="Incom.VALUT"/>'
				,'<s:message code="Incom.KWAER"/>'
				,'<s:message code="Incom.KWBTR"/>'
				,'<s:message code="Incom.FWAER"/>'
				,'<s:message code="Incom.FWBTR"/>'
				,'<s:message code="Incom.CRDR"/>'
				,'<s:message code="Incom.EPVOZ"/>'
				,'<s:message code="Incom.FVAL2"/>' //Invoice Doc.
				,'<s:message code="Incom.FVAL3"/>' //Text
				,'<s:message code="Incom.KUNNR"/>'
				,'<s:message code="Incom.NAME1"/>'
				,'<s:message code="Incom.AZNUM"/>'
				,'<s:message code="Incom.KUKEY"/>'
				,'Invoice No.'
				,'Item Text'
	  		];
	  		
	  		var colModel = [
				  { name : 'BUKRS', width : 100, align : 'center' }
				, { name : 'ABSND', width : 120, align : 'center' , hidden: true}
				, { name : 'ESNUM', width : 70, align : 'center', hidden: true}
				, { name : 'AZDAT', width : 120, align : 'left' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'HKONT', width : 100, align : 'left', hidden: true}
				, { name : 'KTONR', width : 120, align : 'left' }
				, { name : 'BELNR', width : 120, align : 'left' }
				, { name : 'GJAHR', width : 80, align : 'left' }
				, { name : 'BVDAT', width : 120, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'BUDAT', width : 120, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'VALUT', width : 120, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'KWAER', width : 120, align : 'left' }
				, { name : 'KWBTR', width : 120, align : 'right' }
				, { name : 'FWAER', width : 100, align : 'left' , hidden: true}
				, { name : 'FWBTR', width : 100, align : 'right' , hidden: true}
				, { name : 'CRDR', width : 70, align : 'center' , hidden: true}
				, { name : 'EPVOZ', width : 70, align : 'center' , hidden: true}
				, { name : 'FVAL2', width : 100, align : 'left'}
				, { name : 'FVAL3', width : 150, align : 'left'}
				, { name : 'KUNNR', width : 120, align : 'left' }
				, { name : 'NAME1', width : 150, align : 'left' }
				, { name : 'AZNUM', width : 120, align : 'left' }
				, { name : 'KUKEY', width : 100, align : 'left', hidden: true}
				, { name : 'ZUONR', width : 120, align : 'left' }
				, { name : 'SGTXT', width : 100, align : 'left'}
	  		];
		
	  		
		var gSetting = {
			height: 609,
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
		
		btGrid.createGrid('IncomGrid', colName, colModel, gSetting);
	}

	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	window.cSearch = function() {
		
		$("#H_FROM_DT").val($("#FROM_DT").val().split('.').reverse().join(''));
		$("#H_TO_DT").val($("#TO_DT").val().split('.').reverse().join(''));
		
		var url = "/common/retrieveIncommingPaymentList.do";
		
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};

		fn_ajax(url, true, param, function(data, xhr){
			if (!data.RESULT) {
				return;
			}
			var mchbData;
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'T_DATA') {
					for(var i=0; i<v.rows.length; i++){
						var kunnrSub;
						kunnrSub = v.rows[i].KUNNR.substring(3,10);  
						v.rows[i].KUNNR = kunnrSub;
					}
					mchbData = v.rows;
					return true;
				}
				return false;
			});
			
			if (!!mchbData && mchbData.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('IncomGrid', mchbData);
		});
	}
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$("#CUST_CD").val(selecedData.CUST_CD);
				$("#CUST_NM").text(selecedData.CUST_NM);
			}
		});
	}
	function initialize() {
				
		$("#FROM_DT").val(lastMonth);
		$("#TO_DT").val(toDay);
		createIncomGrid();
		
		$('#cmm_pop_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#CUST_CD').val(), 'SOLD');
		});
	}
	
	initialize();
})()
</script>

<c:import url="../import/frameBottom.jsp" />