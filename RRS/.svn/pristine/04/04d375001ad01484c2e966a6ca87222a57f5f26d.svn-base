<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Credit Block Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="CreditReport" />
</c:import>
	
<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			<div class="tab_top_search">
				<table>
					<tbody>  
						<tr>
							<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.soldTo"/></p></td>
							<td class="medium_td"><input type="text" name="CUST_CD" id="CUST_CD" style="width:210px;" maxlength="10" onKeyPress="fn_onlyNum(this)" ess="ess">
							<button class="grid_popupbtn" id="cmm_pop_CUST_CD" name="cmm_pop_CUST_CD" type='button'></button>
							<p class="data_under_text" name="CUST_NM" id="CUST_NM"></p></td>
							<td class="small_td"><p><s:message code="customer.DocumentNumber"/></p></td>
							<td class="medium_td"><input type="text" name="DOC_NO_FR" id="DOC_NO_FR" style="width:100px;float:left;">
							<p style="float:left;">-</p>
							<input type="text" name="DOC_NO_TO" id="DOC_NO_TO" style="width:100px;" class=""></td>
						</tr>
						<tr>
							<td class="small_td"><p><s:message code="quotation.salesOfc"/></p></td>
							<td class="medium_td"><select name="SALES_OFFICE_CD" id="SALES_OFFICE_CD" style="width:215px;" class=""></select></td>
							<td class="small_td"><p><s:message code="quotation.salesGrp"/></p></td>
							<td class="medium_td"><select name="SALES_GR" id="SALES_GR" style="width:215px;" class=""></select></td>
							<td class="small_td"><p><span>*</span>&nbsp;<s:message code="sales.creditstatus"/></p></td>
							<td class="medium_td"><select name="CREDIT_STS" id="CREDIT_STS" style="width:215px;" class="" ess="ess"></select></p></td>
						</tr>
						<tr>
							<td class="small_td"><p><s:message code="customer.SalesOrg"/></p></td>
							<td class="medium_td"><select name="SALES_ORG_CD" id="SALES_ORG_CD" style="width:215px;" class=""></select></td>
							<td class="small_td"><p><s:message code="customer.DistChannel"/></p></td>
							<td class="medium_td"><select name="DISTRB_CH" id="DISTRB_CH" style="width:215px;" class=""></select></td>
							<td class="small_td"><p><s:message code="customer.Division"/></p></td>
							<td class="medium_td"><select name="DIV_CD" id="DIV_CD" style="width:215px;" class=""></select>
							</td>
							</tr>
					</tbody>
				</table>
			</div>
	</form>
	<!-- 검색조건 영역 끝 -->
		
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.creditblockreport'/></h4>
			</div>
		</div>		
		<table id="grid1"></table>
	    <div id="grid1_pager"></div>
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
	var args;
	$(function() {
		setCommBtn('Search', true);				
		initLayout();
		createGrid1();
		
		$('#cBtnUser1').text("<s:message code='title.release'/>");
		$('#cBtnUser1').addClass("cBtnConfirm_style");
		
		$('#CUST_CD').focus();

		var codeBoxArray = [ 'SALES_OFFICE_CD'
		                    ,'SALES_GR'
							,'SALES_ORG_CD'
							,'DISTRB_CH'
							,'DIV_CD'
							,'CREDIT_STS'
						   ];
				
		createCodeBoxByArr(codeBoxArray, true);

		$("#CREDIT_STS").val("B");
		$('#cmm_pop_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#CUST_CD').val());
		});
 
		$('#CUST_CD').on('keyup', function (e) { 
			if (e.which  == 8 || e.which  == 46){
				if(fn_empty($("#CUST_CD").val())){
					$("#CUST_NM").text("");
				}
			}
		});
	});
	
	function createGrid1(){
		var colName = [
		     		  '<s:message code="customer.creditcontrolarea"/>'
		     		, '<s:message code="customer.DocumentNumber"/>'
		     		, '<s:message code="lead.salesOrg"/>'
		     		, '<s:message code="lead.salesOrg"/>'
		     		, '<s:message code="lead.distributionCh"/>'
		     		, '<s:message code="lead.distributionCh"/>'
		     		, '<s:message code="quotation.division"/>'
		     		, '<s:message code="quotation.division"/>'
		     		, '<s:message code="customer.Customeraccountnumber"/>'
		     		, '<s:message code="quotation.grd.name"/>'
		     		, '<s:message code="sales.grd.city"/>'
		     		, '<s:message code="customer.Company"/>'
		     		, '<s:message code="customer.Company"/>'
		     		, '<s:message code="customer.nameoforderer"/>'
		     		, '<s:message code="sales.grd.telephone"/>'
		     		, '<s:message code="customer.ristcategory"/>'
		     		, '<s:message code="customer.creditlimit"/>'
		     		, '<s:message code="customer.TermsOfPayment"/>'
		     		, '<s:message code="customer.TermsOfPayment"/>'
		     		, '<s:message code="quotation.ovlSts"/>'
		     		, '<s:message code="quotation.ovlSts"/>'
		     		, '<s:message code="sales.grd.Purchaseorderno"/>'
		     		, '<s:message code="customer.Currency"/>'
		     		, '<s:message code="customer.creditvalue"/>'
		     		, '<s:message code="quotation.netValue"/>'
		     		, '<s:message code="quotation.grd.soldToPt"/>'
		     		, '<s:message code="quotation.grd.soldToPt"/>'
		     		, '<s:message code="customer.SalesOffice"/>'
		     		, '<s:message code="customer.SalesOffice"/>'
		     		, '<s:message code="customer.SalesGrp"/>'
		     		, '<s:message code="customer.SalesGrp"/>'
		     		];
		     	var colModel = [
					  { name : 'KKBER', width: 60, align:'center', hidden: true}
					, { name : 'VBELN', width: 100, align:'center'}
					, { name : 'VKORG', width: 40, align:'center', hidden: true}
					, { name : 'VKORG_TXT', width: 200, align:'left'}
					, { name : 'VTWEG', width: 20, align:'center', hidden: true}
					, { name : 'VTWEG_TXT', width: 150, align:'left'}
					, { name : 'SPART', width: 20, align:'center', hidden: true}
					, { name : 'SPART_TXT', width: 100, align:'left'}
					, { name : 'KNKLI', width: 100, align:'center'}
					, { name : 'NAME1', width: 200, align:'left'}
					, { name : 'ORT01', width: 200, align:'left'}
					, { name : 'LAND', width: 30, align:'center', hidden: true}
					, { name : 'LANDX', width: 100, align:'left'}
					, { name : 'BNAME', width: 350, align:'center', hidden: true}
					, { name : 'TELF1', width: 160, align:'left'}
					, { name : 'CTLPC', width: 30, align:'center'}
					, { name : 'KLPRZ', width: 30, align:'right'}
					, { name : 'ZTERM', width: 40, align:'center', hidden: true}
					, { name : 'ZTERM_TXT', width: 300, align:'left'}
					, { name : 'CMGST', width: 10, align:'center', hidden: true}
					, { name : 'CMGST_TXT', width: 300, align:'left'}
					, { name : 'BSTNK', width: 200, align:'left'}
					, { name : 'WAERK', width: 50, align:'center'}
					, { name : 'KWKKC', width: 100, align:'right'}
					, { name : 'NETWR', width: 150, align:'right'}
					, { name : 'KUNAG', width: 100, align:'center'}
					, { name : 'NAME1_SP', width: 150, align:'left'}
					, { name : 'VKBUR', width: 40, align:'center', hidden: true}
					, { name : 'VKBUR_TXT', width: 150, align:'left'}
					, { name : 'VKGRP', width: 30, align:'center', hidden: true}
					, { name : 'VKGRP_TXT', width: 150, align:'left'}
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
				height:585
		};
		
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}

	function cSearch(currentPage){
		
		if(fn_empty($("#CREDIT_STS").val())){
			args = '<s:message code="sales.creditstatus"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		if(fn_empty($("#CUST_CD").val())){
			args = '<s:message code="quotation.soldTo"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		var url = "/common/retrieveCreditBlock.do";
		
		var formData = formIdAllToMap('frmSearch');
		formData["CUST_CD"] = leadingZeros($("#CUST_CD").val(),10);
		var param = {"param":formData};

		fn_ajax(url, true, param, function(data, xhr){
			if (!!data.RESULT[4] && data.RESULT[4].rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			for(var i=0; i<data.RESULT[4].rows.length; i++){
				var vtwegSub;
				vtwegSub = data.RESULT[4].rows[i].KNKLI.substring(3,10);  
				data.RESULT[4].rows[i].KNKLI = vtwegSub;
				console.log(data.RESULT[4]);
				vtwegSub = data.RESULT[4].rows[i].KUNAG.substring(3,10);  
				data.RESULT[4].rows[i].KUNAG = vtwegSub;
			}
			reloadGrid("grid1", data.RESULT[4].rows);
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
	
	function cUser1(){
		
		var rowId = $('#grid1').jqGrid('getGridParam', 'selrow');
		var gridData = $("#grid1").getRowData(rowId);
				
		if(fn_empty(rowId)){
			args = '<s:message code="customer.DocumentNumber"/>';
			alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		var url = "/common/requireCreditBlock.do";
		var param = {"IS_ORDER": gridData.VBELN};
		fn_ajax(url, true, param, function(data, xhr){
			if(!fn_empty(data.SUCCESS)){
				alert("<s:message code='success.release'/>");
				cSearch();
			}
		});
	}
</script>
<c:import url="../import/frameBottom.jsp" />