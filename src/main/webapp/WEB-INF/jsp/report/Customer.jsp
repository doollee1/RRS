<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="CustomerReport" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize">
	<form id="frmSearch" action="#" style="display: none;">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
	</form>
	<button class='cBtnclass cBtnExcel_style' id='cBtnExcel' type='button' onclick='cExcelSample();'>Excel Download</button>
</div>
<!-- 검색조건 영역 끝 -->

<div id="ctu_wrap">
	<div class="tab_top_search">
		<table width="100%">
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="customer.Customer"/></p></td>
					<td><input type="text" data-searchcolumn="CUST_CD"></td>
					<td class="small_td"><p><s:message code="customer.Name"/></p></td>
					<td><input type="text" data-searchcolumn="CUST_NM" maxlength="20"></td>
					<td class="small_td"><p><s:message code="customer.SrchTerm"/></p></td>
					<td class="2coll_wide_td">
						<input type="text" data-searchcolumn="SEARCH_NM1" maxlength="20">
						<input type="text" data-searchcolumn="SEARCH_NM2" maxlength="20">
					</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="customer.SalesOrg"/></p></td>
					<td><select data-dbcolumn="SALES_ORG_CD" data-searchcolumn="SALES_ORG_CD"></select>
					</td>
					<td class="small_td"><p><s:message code="customer.DistChannel"/></p></td>
					<td><select data-dbcolumn="DISTRB_CH" data-searchcolumn="DISTRB_CH"></select>
					</td>
					<td class="small_td"><p><s:message code="customer.Division"/></p></td>
					<td><select data-dbcolumn="DIV_CD" data-searchcolumn="DIV_CD"></select>
					</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="customer.AccountGrp"/></p></td>
					<td><select data-dbcolumn="ACCOUNT_GR" data-searchcolumn="ACCOUNT_GR"></select>
					<td class="small_td"><p><s:message code="customer.SalesGrp"/></p></td>
					<td><select data-dbcolumn="SALES_GR" data-searchcolumn="SALES_GR"></select></td>
					<td class="small_td"><p><s:message code="customer.CustGrp"/></p></td>
					<td><select data-dbcolumn="CUST_GR" data-searchcolumn="CUST_GR"></select>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="customer.Grade"/></td>
					<td><p><select data-dbcolumn="GRADE" data-searchcolumn="GRADE"></select></p></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="customer.Customer"/></h4></div>
			<div class="ct_grid_top_right">  
			</div>
		</div>
		<table id="customerReportGrid"></table>
		<div id="customerReportGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
(function() {
	var searchElms = document.querySelectorAll('[data-searchcolumn]');
	
	function createcustomerReportGrid() {
		// TODO
		var colName =  [
				'<s:message code="customer.custCd"/>'			
			,'<s:message code="customer.AccountGrpCd"/>'			
			,'<s:message code="customer.AccountGrp"/>'				
			,'Grade Code'
			,'Grade'
			,'<s:message code="customer.CustNm"/>'	
			,'<s:message code="system.strname"/>'				
			,'<s:message code="system.hausno"/>'			
			,'<s:message code="customer.PostalCode"/>'	
			,'City Name'	
			,'<s:message code="customer.CountryCd"/>'			
			,'<s:message code="customer.CountryNm"/>'
			,'<s:message code="customer.TransportationZoneCd"/>'			
			,'<s:message code="customer.TransportationZone"/>'	
			,'<s:message code="customer.RegionCd"/>'			
			,'<s:message code="customer.Region"/>'						
			,'<s:message code="lead.grd.Language"/>'		
			,'<s:message code="sales.grd.telephone"/>'		
			,'<s:message code="sales.grd.mobilePhn"/>'			
			,'<s:message code="sales.grd.fax"/>'				
			,'<s:message code="sales.grd.eml"/>'				
			,'<s:message code="customer.SalesOrgCd"/>'			
			,'<s:message code="customer.SalesOrg"/>'			
			,'<s:message code="customer.DistChannelCd"/>'			
			,'<s:message code="customer.DistChannel"/>'			
			,'<s:message code="customer.DivisionCd"/>'			
			,'<s:message code="customer.Division"/>'			
			,'<s:message code="customer.SalesOfficeCd"/>'			
			,'<s:message code="customer.SalesOffice"/>'			
			,'<s:message code="customer.SalesGrpCd"/>'			
			,'<s:message code="customer.SalesGrp"/>'			
			,'<s:message code="customer.CustGrpCd"/>'			
			,'<s:message code="customer.CustGrp"/>'			
			,'<s:message code="customer.CurrencyCd"/>'			
			,'<s:message code="customer.Currency"/>'		
// 			,'<s:message code="customer.CustPricProcCd"/>'			
			,'<s:message code="customer.CustPricProc"/>'		
			,'<s:message code="customer.AcctAssmtGrpCd"/>'			
			,'<s:message code="customer.AcctAssmtGrp"/>'	
			,'<s:message code="customer.TermsOfPayment"/>'		
			,'<s:message code="customer.TermsOfPayment"/>'		
			,'<s:message code="customer.IncotermsCd"/>'			
			,'<s:message code="customer.Incoterms"/>'				
			,'<s:message code="customer.ShippingConditionCd"/>'			
			,'<s:message code="customer.ShippingCondition"/>'				
			,'<s:message code="customer.DeliveryPlantCd"/>'			
			,'<s:message code="quotation.DeliveryPlantNM"/>'				
			,'<s:message code="customer.pfTypeCode"/>'			
			,'<s:message code="customer.pfTypeNm"/>'				
			,'<s:message code="customer.grd.Number"/>'		
// 			,'<s:message code="quotation.grd.name"/>'			
// 			,'<s:message code="customer.grd.Telephone1"/>'				
// 			,'<s:message code="customer.grd.Fax"/>'				
// 			,'<s:message code="customer.grd.Function"/>'				
// 			,'<s:message code="customer.grd.Function"/>'		
// 			,'<s:message code="customer.grd.Department"/>'			
// 			,'<s:message code="customer.grd.Department"/>'
// 			,'<s:message code="customer.grd.E_Mail"/>'					
		];
		
		var colModel = [
				  {name:'CUST_CD',width:100 ,align:'center',hidden:false}
				, {name:'ACCOUNT_GR',width:100 ,align:'center',hidden:true}
				, {name:'ACCOUNT_GR_NM',width:100 ,align:'left',hidden:false}
				, {name:'GRADE',width:100 ,align:'center',hidden:true}
				, {name:'GRADE_NM',width:100 ,align:'center',hidden:false}
				, {name:'CUST_NM',width:100 ,align:'center',hidden:true}
				, {name:'STREET_NM',width:100 ,align:'left',hidden:false}
				, {name:'HAUS_NO',width:100 ,align:'left',hidden:false}
				, {name:'POST_CD',width:100 ,align:'left',hidden:false}
				, {name:'CITY_NM',width:100 ,align:'left',hidden:false}
				, {name:'COUNTRY_CD',width:100 ,align:'left',hidden:true}
				, {name:'COUNTRY_NM',width:100 ,align:'left',hidden:false}
				, {name:'TRANSP_ZONE',width:100 ,align:'center',hidden:true}
				, {name:'TRANSP_ZONE_NM',width:100 ,align:'left',hidden:false}
				, {name:'REGION_CD',width:100 ,align:'center',hidden:true}
				, {name:'REGION_CD_NM',width:100 ,align:'left',hidden:false}
				, {name:'LANG_CD',width:100 ,align:'center',hidden:false}
				, {name:'TEL_NO',width:100 ,align:'center',hidden:false}
				, {name:'MOBILE_NO',width:100 ,align:'center',hidden:false}
				, {name:'FAX_NO',width:100 ,align:'center',hidden:false}
				, {name:'E_MAIL',width:100 ,align:'center',hidden:false}
				, {name:'SALES_ORG_CD',width:100 ,align:'center',hidden:true}
				, {name:'SALES_ORG_NM',width:100 ,align:'left',hidden:false}
				, {name:'DISTRB_CH',width:100 ,align:'center',hidden:true}
				, {name:'DISTRB_CH_NM',width:100 ,align:'left',hidden:false}
				, {name:'DIV_CD',width:100 ,align:'center',hidden:true}
				, {name:'DIV_NM',width:100 ,align:'left',hidden:false}
				, {name:'SALES_OFFICE_CD',width:100 ,align:'center',hidden:true}
				, {name:'SALES_OFFICE_NM',width:100 ,align:'left',hidden:false}
				, {name:'SALES_GR',width:100 ,align:'center',hidden:true}
				, {name:'SALES_GR_NM',width:100 ,align:'left',hidden:false}
				, {name:'CUST_GR',width:100 ,align:'center',hidden:true}
				, {name:'CUST_GR_NM',width:100 ,align:'left',hidden:false}
				, {name:'CURR_CD',width:100 ,align:'center',hidden:true}
				, {name:'CURR_NM',width:100 ,align:'left',hidden:false}
// 				, {name:'CUST_PRICE_PROC_CD',width:100 ,align:'center',hidden:true}
				, {name:'CUST_PRICE_PROC_NM',width:100 ,align:'left',hidden:false}
				, {name:'ACCT_ASSMT_GR',width:100 ,align:'center',hidden:true}
				, {name:'ACCT_ASSMT_GR_NM',width:100 ,align:'left',hidden:false}
				, {name:'TERM_PAY_CD',width:100 ,align:'center',hidden:true}
				, {name:'TERM_PAY_NM',width:100 ,align:'left',hidden:false}
				, {name:'INCOTERMS_CD',width:100 ,align:'center',hidden:true}
				, {name:'INCOTERMS_NM',width:100 ,align:'left',hidden:false}
				, {name:'SHIP_CONDI_CD',width:100 ,align:'center',hidden:true}
				, {name:'SHIP_CONDI_NM',width:100 ,align:'left',hidden:false}
				, {name:'DELI_PLANT_CD',width:100 ,align:'center',hidden:true}
				, {name:'DELI_PLANT_NM',width:100 ,align:'left',hidden:false}
				, {name:'PF_TP',width:100 ,align:'center',hidden:true}
				, {name:'PF_TP_NM',width:100 ,align:'left',hidden:false}
				, {name:'PF_PS_NO',width:100 ,align:'center',hidden:false}
// 				, {name:'CP_NAME',width:100 ,align:'center',hidden:false}
// 				, {name:'CP_TEL_NO',width:100 ,align:'center',hidden:false}
// 				, {name:'CP_FAX_NO',width:100 ,align:'center',hidden:false}
// 				, {name:'FUNC_CD',width:100 ,align:'center',hidden:true}
// 				, {name:'FUNC_NM',width:100 ,align:'left',hidden:false}
// 				, {name:'DEPT_CD',width:100 ,align:'center',hidden:true}
// 				, {name:'DEPT_NM',width:100 ,align:'left',hidden:false}
// 				, {name:'CP_EMAIL',width:100 ,align:'center',hidden:false}
		];
		
		var gSetting = {
			height: 585,
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
		
		btGrid.createGrid('customerReportGrid', colName, colModel, gSetting);
	}

	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	window.cSearch = function() {
		console.log('search')
		var param = {};
		Array.prototype.forEach.call(searchElms, function(elm) {
			var value = elm.value;
			if (!!value) {
				param = param || {};
				var column = elm.dataset.searchcolumn;
				param[column] = value;
			}
		});
		var result = [{'CUST_CD': 'test'}]
		reloadGrid('customerReportGrid', result);
		
 		fn_ajax('/report/retrieveCustomerReport.do', true, param, function(data) {
 			if (!data.RESULT) {
				return;
 			}
			
 			if (!!data.RESULT && data.RESULT.length === 0) {
 				alert('<s:message code="validator.notfound"/>');
 			}
			
 			var customerInfoList = data.RESULT;
 			data.RESULT
 			reloadGrid('customerReportGrid', data.RESULT);
 			btGrid.gridQueryPaging($('#customerReportGrid'), 'cSearch', data.RESULT);
 		});
	};
	
	window.cPrint = function() {
		print();
	}
	
	function initialize() {
		Util.component.createCombobox(searchElms, true);
		createcustomerReportGrid();
		$('[data-searchcolumn]').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } }); 
		console.log('123123');
	}
	
	//공통버튼 - 엑셀 다운 클릭
// 	function cExcelSample() {
	window.cExcelSample = function() {
		console.log('excel');
// 		if (confirm("<s:message code='info.excel'/>")  == true) { 
			
// 			var colNms = excelToMap();
			
 			var param = {"SEQ": 	"6"
 					    ,"REQ_DT": 	"20231116"
 					    ,"MEM_GBN": "02"
 					    ,"WK_GBN":  ""
 					    }
// 					    ,"SEARCH_NM2":  $("#SEARCH_NM2").val()
// 					    ,"SALES_ORG_CD":$("#SALES_ORG_CD").val()
// 					    ,"DISTRB_CH":   $("#DISTRB_CH").val()
// 					    ,'DIV_CD':	   	$("#DIV_CD").val()
// 					    ,"GRADE":   	$("#GRADE").val()
// 					    ,"SALES_GR":  	$("#SALES_GR").val()
// 					    ,"CUST_GR":   	$("#CUST_GR").val()
// 					    ,'COL_NM':	   colNms}
// 		};

		fn_formSubmit('/report/retrieveCustomerReportAll.do', param);
		//전송 버튼 클릭시 하단 로직 수행
		var url = "/report/retrieveCustomerReportSend.do";
		
		loadingStart();
		
		setTimeout(function() { 
    		fn_ajax(url, false, param, function(data, xhr){
    		    if(data.resultCd == "-1"){
    				alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
    			}else{
    				alert("<s:message code='success.sendemail'/>");
    				//cSearch();
    			}
    		});
		}, 2000); 
		 
		 loadingEnd();
 			
	}
	
	function excelToMap() {
		
		var colNms = $("#customerReportGrid").jqGrid('getGridParam','colNames');
		var colid = $("#customerReportGrid")[0].p.colModel;
		var _string =  '%' ;
		for(var i= 0 ; i < colid.length; i++) {
			if(colid[i].name != "CHK"){
				if(i == (colid.length -1)) {
					 _string += ''+colid[i].name+':'		+ colNms[i] +'';
				}else  _string += ''+colid[i].name+':'		+ colNms[i] +',';
			}
		}
		_string +=  '%' ;
		return _string;
	}
	initialize();
})()
</script>

<c:import url="../import/frameBottom.jsp" />