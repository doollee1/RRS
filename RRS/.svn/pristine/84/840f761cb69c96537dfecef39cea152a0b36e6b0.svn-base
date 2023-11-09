<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Sales Order Report
	 * @Description : Sales Order Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SalesReport" />
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
		<div class="tab_top_search2">
			<input type="hidden" name="quotationGrid-CURRENT_PAGE" id="quotationGrid-CURRENT_PAGE">
			<input type="hidden" name="quotationGrid-ROWS_PER_PAGE" id="quotationGrid-ROWS_PER_PAGE">
			<input type="hidden" name="H_DOC_NO_FR" id="H_DOC_NO_FR">
			<input type="hidden" name="H_DOC_NO_TO" id="H_DOC_NO_TO">
			<input type="hidden" name="H_REQ_DELI_DT_FR" id="H_REQ_DELI_DT_FR">
			<input type="hidden" name="H_REQ_DELI_DT_TO" id="H_REQ_DELI_DT_TO">
			<input type="hidden" name="H_CREATE_ON_FR" id="H_CREATE_ON_FR">
			<input type="hidden" name="H_CREATE_ON_TO" id="H_CREATE_ON_TO">
			<input type="hidden" name="H_MOVE_DT_FR" id="H_MOVE_DT_FR">
			<input type="hidden" name="H_MOVE_DT_TO" id="H_MOVE_DT_TO">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
						<td class="medium_td"><select id="SALES_ORG_CD" name="SALES_ORG_CD" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.distributionCh"/></p></td>
						<td class="medium_td"><select id="DISTRB_CH" name="DISTRB_CH" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.division"/></p></td>
						<td class="medium_td"><select id="DIV_CD" name="DIV_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="customer.DocumentNumber"/></p></td>
						<td class="medium_td"><input type="text" name="DOC_NO_FR" id="DOC_NO_FR" style="width:100px;float:left;" onKeyPress="fn_onlyNum(this)" maxlength="10">
						<p style="float:left;">-</p>
						<input type="text" name="DOC_NO_TO" id="DOC_NO_TO" style="width:100px;" class="" onKeyPress="fn_onlyNum(this)" maxlength="10"></td>
						<td class="small_td"><p><s:message code="sales.documentctg"/></p></td>
						<td><select id="SD_DOC_CATE" name="SD_DOC_CATE" class=""></select></td>
						
						<td class="small_td"><p><s:message code="sales.salesdoctype"/></p></td>
						<td><input type="text" name="DOC_TP" id="DOC_TP" maxlength="4" style="float:left;">
						<button type="button" class="grid_popupbtn" id="cmm_pop_DOC_TP" name="cmm_pop_DOC_TP" ></button>
						<p class="data_under_text" name="DOC_NM" id="DOC_NM"></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.soldTo"/></p></td>
						<td class="medium_td"><input type="text" name="SOLD_CUST_CD" id="SOLD_CUST_CD" maxlength="10" style="float:left;">
						<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
						<p class="data_under_text" name="SOLD_CUST_NM" id="SOLD_CUST_NM"></p></td>
						<td class="small_td"><p><s:message code="customer.SalesGrp"/></p></td>
						<td><input type="text" id="SALES_GR" name="SALES_GR" maxlength="3" style="float:left;">
						<button type="button" class="grid_popupbtn" id="cmm_pop_SALES_GR" name="cmm_pop_SALES_GR" ></button>
						<p class="data_under_text" name="SALES_GR_NM" id="SALES_GR_NM"></td>
						<td class="small_td"><p><s:message code="customer.AccountGrp"/></p></td>
						<td><select id="ACCOUNT_GR" name="ACCOUNT_GR" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.reqDelDate"/></p></td>
						<td class="medium_td"><input type="text" name="REQ_DELI_DT_FR" id="REQ_DELI_DT_FR" data-type="date" disabled="" readonly style="width:90px; float:left;"/>
						<p style="float:left;">-</p>
						<input type="text" name="REQ_DELI_DT_TO" id="REQ_DELI_DT_TO" style="width:90px;float:left;" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="customer.createDate"/></p></td>
						<td class="medium_td"><input type="text" name="CREATE_ON_FR" id="CREATE_ON_FR" data-type="date" disabled="" readonly="" style="width:90px; float:left;"/>
						<p style="float:left;">-</p>
						<input type="text" name="CREATE_ON_TO" id="CREATE_ON_TO" style="width:90px;float:left;" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="sales.goodsmovedt"/></p></td>
						<td class="medium_td"><input type="text" name="MOVE_DT_FR" id="MOVE_DT_FR" data-type="date" disabled="" readonly style="width:90px;float:left;"/>
						<p style="float:left;">-</p>
						<input type="text" name="MOVE_DT_TO" id="MOVE_DT_TO" style="width:90px;float:left;" data-type="date" disabled="" readonly/></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="material.materialGroup"/></p></td>
						<td><input type="text" id="MATL_GR" name="MATL_GR" maxlength="9" style="float:left;">
						<button type="button" class="grid_popupbtn" id="cmm_pop_MATL_GR" name="cmm_pop_MATL_GR" ></button>
						<p class="data_under_text" name="MATL_GR_NM" id="MATL_GR_NM"></td>
						<td class="small_td"><p><s:message code="quotation.itemCat"/></p></td>
						<td><select id="ITEM_CTG_GR" name="ITEM_CTG_GR" class=""></select></td>
						<td class="small_td"><p><s:message code="material.plant"/></p></td>
						<td><select id="PLANT_CD" name="PLANT_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="physical.lgort"/></p></td>
						<td><select id="STO_LOC" name="STO_LOC" class=""></select></td>
						<td class="small_td"><p><s:message code="physical.charg"/></p></td>
						<td class="medium_td"><input type="text" name="BATCH_NO" id="BATCH_NO" maxlength="10"></td>
						<td class="small_td"><p><s:message code="quotation.usage"/></p></td>
						<td><select id="USAGE_CD" name="USAGE_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="sales.billtype"/></p></td>
						<td><input type="text" id="BILLING_TYPE" name="BILLING_TYPE" maxlength="4" style="float:left;">
						<button type="button" class="grid_popupbtn" id="cmm_pop_BILLING_TYPE" name="cmm_pop_BILLING_TYPE" ></button>
						<p class="data_under_text" name="BILLING_TYPE_NM" id="BILLING_TYPE_NM"></td>
						<td class="small_td"><p><s:message code="sales.billctg"/></p></td>
						<td><select id="BILLING_CATE" name="BILLING_CATE" class=""></select></td>
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
			<div class="ct_grid_top_left"><h4><s:message code="title.salesorderreport"/></h4></div>
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

		var toDay = getToday();
		var lastMonth = getlastMonth();
		
		$('#S-DOC_TP').focus();
		fn_codeval({type:'COMM',btn_id:'cmm_pop_DOC_TP',head_id:'DOC_TP',code:'DOC_TP',name:'DOC_NM'});
		fn_codeval({type:'COMM',btn_id:'cmm_pop_SALES_GR',head_id:'SALES_GR',code:'SALES_GR',name:'SALES_GR_NM'});
		fn_codeval({type:'COMM',btn_id:'cmm_pop_MATL_GR',head_id:'MATL_GR',code:'MATL_GR',name:'MATL_GR_NM'});
		fn_codeval({type:'COMM',btn_id:'cmm_pop_BILLING_TYPE',head_id:'BILLING_TYPE',code:'BILLING_TYPE',name:'BILLING_TYPE_NM'});
		
		var codeBoxArray = [ 'SALES_ORG_CD'
		                    ,'DISTRB_CH'
		                    ,'DIV_CD'
		                    ,'DOC_TP'
		                    ,'ITEM_CTG_GR'
		                    ,'PLANT_CD'
		                    ,'STO_LOC'
		                    ,'USAGE_CD'
		                    ,'BILLING_CATE'
		                    ,'ACCOUNT_GR'
		                    ,'SD_DOC_CATE'
							];
				
		createCodeBoxByArr(codeBoxArray, true);
		$("#SALES_ORG_CD").val("1000");
		$("#CREATE_ON_FR").val(lastMonth);
		$("#CREATE_ON_TO").val(toDay);
		
		createQuotationGrid();
		
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#SOLD_CUST_CD').val());
		});
 
		$('#SOLD_CUST_CD').on('keyup', function (e) { 
			if (e.which  == 8 || e.which  == 46){
				if(fn_empty($("#SOLD_CUST_CD").val())){
					$("#SOLD_CUST_NM").text("");
				}
			}
		});
	});

	function createQuotationGrid(){
		var colName = [
				  '<s:message code="quotation.grd.document"/>'
				, '<s:message code="report.dlblheader"/>'
				, '<s:message code="report.dlbldefault"/>'
				, '<s:message code="quotation.itemCat"/>'
				, '<s:message code="sales.attdesc"/>'
				, '<s:message code="sales.occudesc"/>'
				, '<s:message code="sales.grd.SaTy"/>'
				, '<s:message code="quotation.soldTo"/>'
				, '<s:message code="quotation.soldToNm"/>'
				, '<s:message code="sales.grd.country"/>'
				, '<s:message code="sales.grd.Purchaseorderno"/>'
				, '<s:message code="sales.grd.SOrg"/>'
				, '<s:message code="sales.grd.DChl"/>'
				, '<s:message code="sales.grd.Dv"/>'
				, '<s:message code="customer.SalesGrp"/>'
				, '<s:message code="lead.CreatedOn"/>'
				, '<s:message code="report.quotation.material"/>'
				, '<s:message code="quotation.grd.materialShtText"/>'
				, '<s:message code="material.materialGroup"/>'
				, '<s:message code="material.plant"/>'
				, '<s:message code="sales.sloc"/>'
				, '<s:message code="quotation.batchNo"/>'
				, '<s:message code="quotation.reqDelDate"/>'
				, '<s:message code="quotation.grd.deliDate"/>'
				, '<s:message code="sales.goodsissue"/>'
				, '<s:message code="sales.calyr"/>'
				, '<s:message code="customer.Incoterms"/>'
				, '<s:message code="sales.incopart2"/>'
				, '<s:message code="sales.ownexplan"/>'
				, '<s:message code="material.output"/>'
				, '<s:message code="sales.sum"/>'
				, '<s:message code="material.unit"/>'
				, '<s:message code="quotation.grd.orderQty"/>'
				, '<s:message code="quotation.grd.netValue"/>'
				, '<s:message code="quotation.grd.curr"/>'
				, '<s:message code="sales.pricewp"/>'
				, '<s:message code="sales.delivery"/>'
				, '<s:message code="sales.dlvqty"/>'
				, '<s:message code="sales.actualgidate"/>'
				, '<s:message code="sales.billingdate"/>'
				, '<s:message code="sales.planinvdate"/>'
				, '<s:message code="sales.billiedpow"/>'
				, '<s:message code="quotation.grd.netValue"/>'
				, '<s:message code="customer.BillingDocu"/>'
				, '<s:message code="material.grid.desc"/>'
			];
		var colModel = [
				  { name: 'VBELN', width : 100, align: 'center' }
				, { name: 'LIFSK', width : 150, align: 'center' }
				, { name: 'LIFSP', width : 150, align: 'center' }
				, { name: 'PSTYV', width : 70, align: 'center' }
				, { name: 'BEZEI_KVGR1', width : 70, align: 'center' }
				, { name: 'BEZEI_KVGR4', width : 70, align: 'center' }
				, { name: 'AUART', width : 70, align: 'center' }
				, { name: 'KUNNR', width : 100, align: 'center' }
				, { name: 'NAME1_AG', width : 250, align: 'left' }
				, { name: 'LANDX_AG', width : 100, align: 'left' }
				, { name: 'BSTNK', width : 120, align: 'left' }
				, { name: 'VKORG', width : 70, align: 'center' }
				, { name: 'VTWEG', width : 70, align: 'center' }
				, { name: 'SPART', width : 70, align: 'center' }
				, { name: 'VKGRP_TXT', width : 150, align: 'left' }
				, { name: 'ERDAT', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'MATNR', width : 150, align: 'center' }
				, { name: 'MAKTX', width : 200, align: 'left' }
				, { name: 'WGBEZ60', width : 150, align: 'left' }
				, { name: 'WERKS', width : 70, align: 'center' }
				, { name: 'LGORT', width : 70, align: 'center' }
				, { name: 'CHARG', width : 100, align: 'left' }
				, { name: 'VDATU', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'EDATU', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'WADAT_LFREL', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'ZWEEK', width : 100, align: 'left' }
				, { name: 'INCO1', width : 100, align: 'left' }
				, { name: 'INCO2', width : 100, align: 'left' }
				, { name: 'TEXT1', width : 200, align: 'left' }
				, { name: 'WP_MENGE', width : 100, align: 'right' }
				, { name: 'WP_MENGE_SUM', width : 100, align: 'right' }
				, { name: 'MEINS', width : 70, align: 'center' }
				, { name: 'KWMENG', width : 100, align: 'right' }
				, { name: 'NETWR', width : 100, align: 'right' }
				, { name: 'WAERK', width : 100, align: 'left' }
				, { name: 'WP_NETPR', width : 100, align: 'right' }
				, { name: 'VBELN_VL', width : 100, align: 'right' }
				, { name: 'LFIMG', width : 100, align: 'right' }
				, { name: 'WADAT_IST', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'FKDAT', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'FKDAT_PLAN', width : 100, align: 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name: 'WP_FKIMG', width : 100, align: 'right' }
				, { name: 'NETWR_VF', width : 100, align: 'right' }
				, { name: 'VBELN_VF', width : 100, align: 'left' }
				, { name: 'BEZEI', width : 100, align: 'left' }
			];
		
		var gSetting = {
		        pgflg:true,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				//shrinkToFit: true,
				//autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 487
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('quotationGrid', colName, colModel, gSetting);
	}

	function cSearch(currentPage){

		$("#H_DOC_NO_FR").val($("#DOC_NO_FR").val().split('.').reverse().join(''));
		$("#H_DOC_NO_TO").val($("#DOC_NO_TO").val().split('.').reverse().join(''));
		$("#H_REQ_DELI_DT_FR").val($("#REQ_DELI_DT_FR").val().split('.').reverse().join(''));
		$("#H_REQ_DELI_DT_TO").val($("#REQ_DELI_DT_TO").val().split('.').reverse().join(''));
		$("#H_CREATE_ON_FR").val($("#CREATE_ON_FR").val().split('.').reverse().join(''));
		$("#H_CREATE_ON_TO").val($("#CREATE_ON_TO").val().split('.').reverse().join(''));
		$("#H_MOVE_DT_FR").val($("#MOVE_DT_FR").val().split('.').reverse().join(''));
		$("#H_MOVE_DT_TO").val($("#MOVE_DT_TO").val().split('.').reverse().join(''));

		if(fn_empty($("#SALES_ORG_CD").val())){
			args = '<s:message code="quotation.salesOrg"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}

		if(fn_empty($("#CREATE_ON_FR").val()) || fn_empty($("#CREATE_ON_TO").val())){
			args = '<s:message code="customer.createDate"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		if(fn_empty($("#CREATE_ON_FR").val()) && !fn_empty($("#CREATE_ON_TO").val())){
			$("#CREATE_ON_FR").val($("#CREATE_ON_TO").val());
		}
		
		if(fn_empty($("#CREATE_ON_TO").val()) && !fn_empty($("#CREATE_ON_FR").val())){
			$("#CREATE_ON_TO").val($("#CREATE_ON_FR").val());
		}
		
		var url = "/common/retrieveSalesOrder.do";
		
		var formData = formIdAllToMap('frmSearch');
// 		formData["SOLD_CUST_CD"] = leadingZeros($("#SOLD_CUST_CD").val(),10);
		if(!fn_empty($("#SOLD_CUST_CD").val())){
			formData["SOLD_CUST_CD"] = leadingZeros($("#SOLD_CUST_CD").val(),10);
		}else{
			formData["SOLD_CUST_CD"] = '';
		}
		
		var param = {"param":formData};
		console.log(param);
		fn_ajax(url, true, param, function(data, xhr){
			//console.log(data.RESULT[3].rows);
			if (!!data.RESULT[4] && data.RESULT[4].rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			
			reloadGrid("quotationGrid", data.RESULT[4].rows);
		});
	}
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$("#SOLD_CUST_CD").val(selecedData.CUST_CD);
				$("#SOLD_CUST_NM").text(selecedData.CUST_NM);
			}
		});
	}
	
	function cUser5() {
		//var param = {"DOC_NO":$('#SL05-DOC_NO').val()};
		var param = {};
		
		fn_ajax('/salesOrder/sendEmail.do', false, param, function(data) {
			
		});
	}
	
</script>
<c:import url="../import/frameBottom.jsp" />