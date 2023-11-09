<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Lead
	 * @Description : Lead List
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SL08" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<!--- 검색버튼 ---->
<div id="divBtns">
	<div id="divWindowpath">
		<span id="title1"></span><span id="title2"></span><span id="title3"></span>
	</div>
</div>

<!---------->
<div class="tab_top_search">
	<form id="frmSearch" action="#" >
		<input type="hidden" name="CURRENT_PAGE" id="CURRENT_PAGE">
		<input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE">
		<table width="100%">
				<tbody>
					<tr>
						<td class="small_td" style="width:149px;"><p><s:message code="sales.ordno"/></p></td>
						<td class="medium_td" style="width:320px;"><input type="text" name="S-DOC_NO" id="S-DOC_NO" maxlength="15" onKeyPress="fn_onlyNum(this)" style="ime-mode:disabled" ></td>
						<td class="small_td"  style="width:141px;"><p><s:message code="quotation.soldTo"/></p></td>
						<td class="medium_td"><input type="text" name="S-SOLD_CUST_CD" id="S-SOLD_CUST_CD" maxlength="10">
							<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
							<p name="S-SOLD_CUST_NM" id="S-SOLD_CUST_NM"></p></td>
						<td class="small_td"  style="width:150px;"><p><s:message code="title.approvalyn"/></p></td>
						<td class="medium_td"  style="width:320px;"><select id="S-APPROVAL_YN" name="S-APPROVAL_YN" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
						<td><select id="S-SALES_ORG_CD" name="S-SALES_ORG_CD" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.distributionCh"/></p></td>
						<td><select id="S-DISTRB_CH" name="S-DISTRB_CH" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.division"/></p></td>
						<td><select id="S-DIV_CD" name="S-DIV_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="sales.creditstatus"/></p></td>
						<td><select id="S-CREDIT_STS" name="S-CREDIT_STS"></select></td>
						<td class="small_td"><p><s:message code="quotation.ovlSts"/></p></td>
						<td><select id="S-OVL_STS" name="S-OVL_STS" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.delSts"/></p></td>
						<td><select id="S-DELI_STS" name="S-DELI_STS" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="sales.overalldlvstat"/></p></td>
						<td><select name="S-OVL_DVL_STS" id="S-OVL_DVL_STS" ></select></td>
						<td class="small_td"><p><s:message code="quotation.rejStatus"/></p></td>
						<td><select id="S-RJT_STS" name="S-RJT_STS" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.creatBy"/></p></td>
						<td><input type="text" name="S-REG_ID" id="S-REG_ID" maxlength="30" value="${loginVO.userId}">
						<button class="grid_popupbtn" id="cmm_pop_REG_ID" name="cmm_pop_REG_ID" type='button'></button>
						<p class="data_under_text" name="S-REG_NM" id="S-REG_NM"></p></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.QcBackOfc"/></p></td>
						<td><input type="text" name="S-BACK_OFC_ID" id="S-BACK_OFC_ID" maxlength="30">
						<button class="grid_popupbtn" id="cmm_pop_BACK_OFC_ID" name="cmm_pop_BACK_OFC_ID" type='button'></button>
						<p class="data_under_text" name="S-BACK_OFC_NM" id="S-BACK_OFC_NM" ></p></td>
						<td class="small_td"><p><s:message code="quotation.createfr"/></p></td>
						<td><input type="text" name="S-REG_FR_DT" id="S-REG_FR_DT" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="quotation.createto"/></p></td>
						<td><input type="text" name="S-REG_TO_DT" id="S-REG_TO_DT" data-type="date" disabled="" readonly/></td>
					</tr>
				</tbody>
		</table>
	</form>
</div>
<!-------------------->

<div id="ctm_wrap">
	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>Sales Order List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="salesOrderGrid"></table>
		<div id="salesOrderGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script type="text/javascript">
<%-- 
  * ========= 공통버튼 클릭함수 =========
  * 검색 : cSearch()
  * 추가 : cAdd()
  * 삭제 : cDel()
  * 저장 : cSave()
  * 인쇄 : cPrint()
  * 업로드 : cUpload()
  * 엑셀다운 : cExcel()
  * PDF다운 : cPdf()
  * 취소 : cCancel()
  * 사용자버튼 : cUser1() ~ cUser5()
  * -------------------------------
  * 버튼 순서 : setCommBtnSeq(['ret','list']) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * 버튼 표시/숨김 : setCommBtn('ret', true) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * ===============================
--%>
	//초기 로드
	$(function() {
		
		$('#cBtnUser1').text("<s:message code='button.copy'/>");
		$('#cBtnUser1').addClass("cBtnCopy_style");
		$('#cBtnAdd').text("New");
		
		initLayout();
		createGrid1();
		
		var codeBoxArray = [ 'S-RJT_STS'
								, 'S-SALES_ORG_CD'
								, 'S-DISTRB_CH'
								, 'S-DIV_CD'
								, 'S-DELI_STS'
								, 'S-OVL_STS'
								, 'S-OVL_DVL_STS'
								, 'S-CREDIT_STS'
								, 'S-APPROVAL_YN'
								];
					
		createCodeBoxByArr(codeBoxArray, true);

		/* 그리드 grid1 이벤트 */
		$('#salesOrderGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				salesOrderGrid_ondblClickRow(rowid, iRow, iCol, e);
			}
		});
		
		fn_codeval({type:'USER',btn_id:'cmm_pop_REG_ID',code:'S-REG_ID', name:'S-REG_NM'});
		fn_codeval({type:'USER',btn_id:'cmm_pop_BACK_OFC_ID',code:'S-BACK_OFC_ID', name:'S-BACK_OFC_NM'});
		
		var onSearchFld = '#S-SOLD_CUST_CD, #S-DOC_NO, #S-REG_ID';
		
		$(onSearchFld).on('keypress', function (e) {
			if(e.which == 13){
				cSearch();
			}
		});
		
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#S-SOLD_CUST_CD').val());
		});
		
	});

	function createGrid1(){
		var colName = [
					  'COMP_CD'
					, '<s:message code="quotation.grd.document"/>'
					, '<s:message code="quotation.grd.quotationType"/>'
					, '<s:message code="quotation.grd.docDate"/>'
					, 'Q/T No.'
					, '<s:message code="title.approvalyn"/>'
					, '<s:message code="quotation.grd.pruchaseOrderNo"/>'
					, '<s:message code="quotation.grd.validFrom"/>'
					, '<s:message code="quotation.grd.validTo"/>'
					, '<s:message code="quotation.grd.soldToPt"/>'
					, '<s:message code="quotation.grd.sorg"/>'
					, '<s:message code="quotation.grd.dchl"/>'
					, '<s:message code="quotation.grd.dv"/>'
					, '<s:message code="quotation.grd.soff"/>'
					, '<s:message code="quotation.grd.sgrp"/>'
					, '<s:message code="quotation.grd.plnt"/>'
					, '<s:message code="quotation.grd.netValue"/>'
					, '<s:message code="quotation.vat"/>'
					, '<s:message code="sales.grd.Curr"/>'
					, '<s:message code="quotation.grd.pricingDt"/>'
					, '<s:message code="quotation.grd.dlvDate"/>'
					, '<s:message code="quotation.grd.dibi"/>'
					, '<s:message code="quotation.grd.createdBy"/>'
					, '<s:message code="quotation.grd.time"/>'
					, '<s:message code="quotation.grd.status"/>'
			];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true, frozen : true}
			, { name: 'DOC_NO', width: 70, align: 'center', frozen : true}
			, { name: 'DOC_TP', width: 160, align: 'left', frozen : true }
			, { name: 'DOC_DATE', width: 80, align: 'center',
                sorttype: function (cell, rowData) {
                	
                	var dt = rowData.DOC_DATE;		
                	if (dt != "") {
	                	var dtArr = dt.split(".");                	
	                	
	                	var month = dtArr[1];
	                	var day = dtArr[0];
	                	var year = dtArr[2];                	            	
	                    return (year + month + day);
                	} else {
                		return dt;
                	}
                }
			  }
			, { name: 'QT_NO', width: 80, align: 'right'}
			, { name: 'APPROVAL_STS', width: 120, align: 'center'}
			, { name: 'PO_NO', width: 100, align: 'left'}
			, { name: 'VAL_FR_DT', width: 80, align: 'center', hidden:true}
			, { name: 'VAL_TO_DT', width: 80, align: 'center', hidden:true}
			, { name: 'SOLD_CUST_CD', width: 150, align: 'left'}
			, { name: 'SALES_ORG_CD', width: 150, align: 'left'}
			, { name: 'DISTRB_CH', width: 150, align: 'left'}
			, { name: 'DIV_CD', width: 150, align: 'left'}
			, { name: 'SALES_OFFICE_CD', width: 150, align: 'left'}
			, { name: 'SALES_GR', width: 150, align: 'left'}
			, { name: 'DELI_PLANT_CD', width: 150, align: 'left', hidden:true}
			, { name: 'T_AMT', width: 80, align: 'right'}
			, { name: 'VAT', width: 80, align: 'right'}
			, { name: 'CURR_CD', width: 50, align: 'center'}
			, { name: 'PRICE_DT', width: 80, align: 'center'}
			, { name: 'REQ_DELI_DT', width: 80, align: 'center'}
			, { name: 'DELI_BLOCK_CD', width: 150, align: 'left'}
			, { name: 'REG_ID', width: 80, align: 'left'}
			, { name: 'REG_DT', width: 160, align: 'center'}
			, { name: 'STATUS_NM', width: 50, align: 'left'}
			];
		
		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				autowidth: false,
				rownumbers:false,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 537
			};
		
		btGrid.createGrid('salesOrderGrid', colName, colModel, gSetting);
	}
	
	function cSearch(currentPage){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE').val())) {
			vCurrentPage = $('#CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('salesOrderGrid_pager');
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/salesOrder/searchSalesOrderList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("salesOrderGrid", data.result);
			btGrid.gridQueryPaging($('#salesOrderGrid'), 'cSearch', data.result);
			
		});
	}
	
	function salesOrderGrid_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#salesOrderGrid").getRowData(rowid);
		
		var param = "?isStatus=S" + "&DOC_NO=" + gridData["DOC_NO"];

		//window.top.addTab('SL08', '/salesOrder/SalesOrderEntry.do' + param, 'Sales Order Entry');
		window.top.addTab('SO_' + gridData["DOC_NO"], '/salesOrder/SalesOrderEntry.do' + param, 'S.O-' + gridData["DOC_NO"]);
	}
	
	function cUser1(){
		var gridData = $("#salesOrderGrid").getRowData($("#salesOrderGrid").getGridParam('selrow'));
		var param = "?isStatus=C" + "&DOC_NO=" + gridData["DOC_NO"];
		
		if(!fn_empty($("#salesOrderGrid").getGridParam('selrow'))){
			if(confirm("<s:message code='confirm.copy'/>")){
				window.top.addTab('SO_' + gridData["DOC_NO"] + 'C', '/salesOrder/SalesOrderEntry.do' + param, 'SO_Copy');
			}
		}
	}
	
	
	function cAdd(){
		var param = "?isStatus=N";
		
		window.top.addTab('SL08', '/salesOrder/SalesOrderEntry.do' + param, 'Sales Order Entry');
	}
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		oneTimeFlag = false;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$.each(selecedData, function(k, v) {
					if('CUST_CD' == k){
						$('#S-SOLD_CUST_CD').val(v);
					}
					if('CUST_NM' == k){
						$('#S-SOLD_CUST_NM').text(v);
					}
				});
			}
		});
	}
</script>

<c:import url="../import/frameBottom.jsp" />