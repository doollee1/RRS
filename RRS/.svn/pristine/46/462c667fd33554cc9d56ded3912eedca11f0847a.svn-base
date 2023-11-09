<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : QuotationReport
	 * @Description : QuotationReport
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="QuotationReport" />
</c:import>

<!--- 검색버튼 ---->
<div id="divBtns">
	<div id="divWindowpath">
		<span id="title1"></span><span id="title2"></span><span id="title3"></span>
	</div>
</div>
<!---------->

<div id="ctu_wrap">	
	<form id="frmSearch" action="#" >
		<div class="tab_top_search">
			<input type="hidden" name="quotationGrid-CURRENT_PAGE" id="quotationGrid-CURRENT_PAGE">
			<input type="hidden" name="quotationGrid-ROWS_PER_PAGE" id="quotationGrid-ROWS_PER_PAGE">
			<table width="100%">
				<tbody>
					<tr>
						<td class="small_td" width="150px"><p><s:message code="quotation.quotationNo"/></p></td>
						<td  width="320px"><input type="text" name="S-DOC_NO" id="S-DOC_NO" maxlength="15" onKeyPress="fn_onlyNum(this)" style="ime-mode:disabled" ></td>
						<td class="small_td"  width="150px"><p><s:message code="quotation.soldTo"/></p></td>
						<td class="medium_td"  width="320px"><input type="text" name="S-SOLD_CUST_CD" id="S-SOLD_CUST_CD" maxlength="10">
						<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
						<p class="data_under_text" name="S-SOLD_CUST_NM" id="S-SOLD_CUST_NM"></p></td>
						<td width="150px"></td>
						<td width="320px"></td>
					</tr>
					<tr>						
						<td class="small_td"><p><s:message code="quotation.validFrom"/></p></td>
						<td><input type="text" id="S-VAL_FR_DT" name="S-VAL_FR_DT" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="quotation.validTo"/></p></td>
						<td><input type="text" name="S-VAL_TO_DT" id="S-VAL_TO_DT" data-type="date" disabled="" readonly/></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
						<td><select id="S-SALES_ORG_CD" name="S-SALES_ORG_CD" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.distributionCh"/></p></td>
						<td><select id="S-DISTRB_CH" name="S-DISTRB_CH" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.division"/></p></td>
						<td><select id="S-DIV_CD" name="S-DIV_CD" class=""></select></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<!-------------------->

<div id="ctm_wrap">
	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="title.quotationreport"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<table id="quotationGrid"></table>
			<div id="quotationGrid_pager"></div>
		</div>
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
  var args;
	//초기 로드
	$(function() {

		$('#S-DOC_NO').focus();
		var codeBoxArray = [ 'S-REF_DOC_H_STS'
							, 'S-T_REF_STS'
							, 'S-RJT_STS'
							, 'S-SALES_ORG_CD'
							, 'S-DISTRB_CH'
							, 'S-DIV_CD'
							, 'S-DOC_TP'
							, 'S-APPROVAL_YN'
							];
				
		createCodeBoxByArr(codeBoxArray, true);
		createQuotationGrid();
		
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#S-SOLD_CUST_CD').val());
		});
 
		$('#S-SOLD_CUST_CD').on('keyup', function (e) { 
			if (e.which  == 8 || e.which  == 46){
				if(fn_empty($("#S-SOLD_CUST_CD").val())){
					$("#S-SOLD_CUST_NM").text("");
				}
			}
		});
 
	});

	function createQuotationGrid(){
		var colName = [
		               '<s:message code="lead.DocumentType"/>'
		               , '<s:message code="quotation.quotationNo"/>'
		               , '<s:message code="sales.grd.DocDate"/>'
		               , '<s:message code="quotation.soldTo"/>'
		               , '<s:message code="quotation.soldToNm"/>'
		               , '<s:message code="quotation.shipTo"/>'
		               , '<s:message code="quotation.shipToNm"/>'
		               , '<s:message code="sales.grd.Validfrom"/>'
		               , '<s:message code="sales.grd.Validto"/>'
		               , '<s:message code="quotation.reqDelDate"/>'
		               , '<s:message code="lead.salesOrg"/>'
		               , '<s:message code="lead.distributionCh"/>'
		               , '<s:message code="lead.division"/>'
		               , '<s:message code="customer.SalesGrp"/>'
		               , '<s:message code="customer.SalesOffice"/>'
		               , '<s:message code="quotation.poNo"/>'
		               , '<s:message code="quotation.poDate"/>'
		               , '<s:message code="sales.creditstatus"/>'
		               , '<s:message code="quotation.industry"/>'
		               , '<s:message code="quotation.orderQty"/>'
		               , '<s:message code="quotation.DeliveryPlantCD"/>'
		               , '<s:message code="quotation.dunBlc"/>'
		               , '<s:message code="quotation.grd.unit"/>'
		               , '<s:message code="quotation.totalWgt"/>'
		               , '<s:message code="quotation.twtunit"/>'
		               , '<s:message code="quotation.totalAmt"/>'
		               , '<s:message code="quotation.netamount"/>'
		               , '<s:message code="quotation.vatamount"/>'
		               , '<s:message code="quotation.vat"/>'
		               , '<s:message code="sales.overalldlvstat"/>'
		               , '<s:message code="quotation.ovlSts"/>'
		               , '<s:message code="quotation.grd.curr"/>'
		               , '<s:message code="system.customer"/>'
		               , '<s:message code="quotation.priceDate"/>'
		               , '<s:message code="quotation.paymentTerms"/>'
		               , '<s:message code="quotation.incoterms"/>'
		               , '<s:message code="quotation.incotermsdesc"/>'
		               , '<s:message code="quotation.ordRea"/>'
		               , '<s:message code="quotation.leadNo"/>'
		               , '<s:message code="quotation.grd.deliveryBl"/>'
		               , '<s:message code="quotation.delSts"/>'
		               , '<s:message code="quotation.grd.giDate"/>'
		               , '<s:message code="quotation.reqpericd"/>'
		               , '<s:message code="quotation.cmpdeliyn"/>'
		               , '<s:message code="quotation.shippingCond"/>'
		               , '<s:message code="quotation.podRelevan"/>'
		               , '<s:message code="quotation.refDocHeadStatus"/>'
		               , '<s:message code="quotation.totRefStaAllItem"/>'
		               , '<s:message code="quotation.rejStatus"/>'
		               , '<s:message code="quotation.blockReas"/>'
		               , '<s:message code="quotation.customerSts"/>'
		               , '<s:message code="quotation.ifdate"/>'
		               , '<s:message code="quotation.ifdstatus"/>'
		               , '<s:message code="quotation.aprvtp"/>'
		               , '<s:message code="quotation.grd.status"/>'
		               , '<s:message code="title.approvalyn"/>'
		               , '<s:message code="title.rejectRsn"/>'
		               , '<s:message code="title.approvalid"/>'
		               , '<s:message code="quotation.attrordnm"/>'
		               , '<s:message code="quotation.attrdt"/>'
		               , '<s:message code="customer.regDate"/>'
		               , '<s:message code="quotation.grd.shpt"/>'
		               , '<s:message code="customer.regid"/>'
			];
		var colModel = [
		                { name: 'DOC_TP_NM', width: 150, align: 'left' }
		                ,  { name: 'DOC_NO', width: 100, align: 'center' }
		                , { name: 'Doc_Date', width: 100, align: 'center' }
		                , { name: 'SOLD_CUST_CD', width: 100, align: 'center' }
		                , { name: 'SOLD_CUST_NM', width: 150, align: 'left' }
		                , { name: 'SHIP_CUST_CD', width: 100, align: 'center' }
		                , { name: 'SHIP_CUST_NM', width: 150, align: 'left' }
		                , { name: 'VAL_FR_DT', width: 100, align: 'center' }
		                , { name: 'VAL_TO_DT', width: 100, align: 'center' }
		                , { name: 'REQ_DELI_DT', width: 100, align: 'center' }
		                , { name: 'SALES_ORG_NM', width: 160, align: 'left' }
		                , { name: 'DISTRB_CH_NM', width: 100, align: 'left' }
		                , { name: 'DIV_NM', width: 100, align: 'left' }
		                , { name: 'SALES_GR_NM', width: 120, align: 'left' }
		                , { name: 'SALES_OFFICE_NM', width: 130, align: 'left' }
		                , { name: 'PO_NO', width: 100, align: 'center' }
		                , { name: 'PO_DT', width: 100, align: 'center' }
		                , { name: 'CREDIT_STS', width: 100, align: 'center' }
		                , { name: 'INDUSTRY_CD', width: 100, align: 'center' }
		                , { name: 'VOL_QTY', width: 70, align: 'right' }
		                , { name: 'DELI_PLANT_NM', width: 150, align: 'left' }
		                , { name: 'DUN_BLOCK_NM', width: 100, align: 'center' }
		                , { name: 'VOL_UNIT', width: 70, align: 'center' }
		                , { name: 'T_WT', width: 100, align: 'right' }
		                , { name: 'T_WT_UNIT', width: 100, align: 'center' }
		                , { name: 'T_AMT', width: 100, align: 'right' }
		                , { name: 'NET_AMT', width: 100, align: 'right' }
		                , { name: 'VAT_AMT', width: 100, align: 'right' }
		                , { name: 'VAT', width: 100, align: 'right' }
		                , { name: 'OVL_DVL_STS_NM', width: 100, align: 'center' }
		                , { name: 'OVL_STS_NM', width: 100, align: 'left' }
		                , { name: 'CURR_NM', width: 100, align: 'left' }
		                , { name: 'CUST_CD', width: 100, align: 'center' }
		                , { name: 'PRICE_DT', width: 100, align: 'center' }
		                , { name: 'PAY_TERM_NM', width: 100, align: 'center' }
		                , { name: 'INCOTERMS_NM', width: 150, align: 'left' }
		                , { name: 'INCOTERMS_DESC', width: 150, align: 'left' }
		                , { name: 'ORD_RESN_NM', width: 150, align: 'left' }
		                , { name: 'LEAD_NO', width: 100, align: 'center' }
		                , { name: 'DELI_BLOCK_NM', width: 110, align: 'left' }
		                , { name: 'DELI_STS', width: 100, align: 'center' }
		                , { name: 'GI_Date', width: 100, align: 'center' , hidden:true }
		                , { name: 'REQ_PERI_CD', width: 100, align: 'center' , hidden:true }
		                , { name: 'CMP_DELI_YN', width: 100, align: 'center' , hidden:true }
		                , { name: 'SHP_CON_NM', width: 100, align: 'left' , hidden:true }
		                , { name: 'REL_POD_YN', width: 100, align: 'center' , hidden:true }
		                , { name: 'REF_DOC_H_STS_NM', width: 100, align: 'center' , hidden:true }
		                , { name: 'T_REF_STS_NM', width: 100, align: 'center' , hidden:true }
		                , { name: 'RJT_STS_NM', width: 100, align: 'left' , hidden:true }
		                , { name: 'BLK_RSN_NM', width: 100, align: 'left' , hidden:true }
		                , { name: 'CUST_STS_NM', width: 100, align: 'left' , hidden:true }
		                , { name: 'IF_DT', width: 100, align: 'center' , hidden:true }
		                , { name: 'IF_STS', width: 100, align: 'center' , hidden:true }
		                , { name: 'APRV_TP', width: 100, align: 'center' , hidden:true }
		                , { name: 'STATUS_NM', width: 100, align: 'center' , hidden:true }
		                , { name: 'APPROVAL_STS', width: 100, align: 'left' , hidden:true }
		                , { name: 'REJECT_RSN', width: 150, align: 'left' , hidden:true }
		                , { name: 'APPR_ID', width: 100, align: 'center' , hidden:true }
		                , { name: 'ATTR_ORD_NM', width: 150, align: 'left' , hidden:true }
		                , { name: 'APPR_DT', width: 100, align: 'center' , hidden:true }
		                , { name: 'REG_DT', width: 100, align: 'center', hidden:true }
		                , { name: 'ShPt', width: 70, align: 'left' , hidden:true }
		                , { name: 'REG_ID', width: 100, align: 'left' , hidden:true }

			];
		
		var gSetting = {
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			autowidth: false,
			rownumbers:false,
			queryPagingGrid:true, // 쿼리 페이징 처리 여부
			height : 585
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('quotationGrid', colName, colModel, gSetting);
	}

	function cSearch(currentPage){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#quotationGrid-CURRENT_PAGE').val())) {
			vCurrentPage = $('#quotationGrid-CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		
		vRowsPerPage = btGrid.getGridRowSel('quotationGrid_pager'); //현재 선택된 페이지 번호 설정
		
		$('#quotationGrid-CURRENT_PAGE').val(vCurrentPage);
		$('#quotationGrid-ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/report/retrieveQuotationReport.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param": formData
				   , "DOC_GR"  : 'QT'};

		fn_ajax(url, true, param, function(data, xhr){
			reloadGrid("quotationGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#quotationGrid'), 'cSearch', data.result);  // 그리드 페이징 설정
		});
	}
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$("#S-SOLD_CUST_CD").val(selecedData.CUST_CD);
				$("#S-SOLD_CUST_NM").text(selecedData.CUST_NM);
			}
		});
	}
	function cfn_exceldown() {
		$('.gridexeclsave').click();
	}
</script>
<c:import url="../import/frameBottom.jsp" />