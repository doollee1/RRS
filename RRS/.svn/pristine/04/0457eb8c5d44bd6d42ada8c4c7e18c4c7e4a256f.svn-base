<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Quotation Approval
	 * @Description : Quotation Approval
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SL10" />
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
			<input type="hidden" name="quotationGrid_CURRENT_PAGE" id="quotationGrid_CURRENT_PAGE">
			<input type="hidden" name="quotationGrid_ROWS_PER_PAGE" id="quotationGrid_ROWS_PER_PAGE">
			<table width="85%">
				<tbody>
					<tr>
						<td class="small_td"><p><s:message code="quotation.quotationNo"/></p></td>
						<td class=""><input type="text" name="S-DOC_NO" id="S-DOC_NO" maxlength="15" onKeyPress="fn_onlyNum(this)" style="ime-mode:disabled" ></td>
						<td class="small_td"><p><s:message code="quotation.soldTo"/></p></td>
						<td class=""><input type="text" name="S-SOLD_CUST_CD" id="S-SOLD_CUST_CD" maxlength="10">
							<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
							<p class="data_under_text" name="S-SOLD_CUST_NM" id="S-SOLD_CUST_NM"></p></td>
						<td class="small_td"><p><s:message code="title.approvalid"/></p></td>
						<td class=""><input type="text" name="S-APPROVAL_ID" id="S-APPROVAL_ID" maxlength="10" value="${loginVO.userId}" disabled="" readonly>
							<button class="grid_popupbtn" id="cmm_pop_APPROVAL_ID" name="cmm_pop_APPROVAL_ID" type='button' hidden='true'></button>
							<p class="data_under_text" name="S-APPROVAL_NM" id="S-APPROVAL_NM"></p></td>
						<td class="small_td"></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
						<td><select id="S-SALES_ORG_CD" name="S-SALES_ORG_CD" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.distributionCh"/></p></td>
						<td><select id="S-DISTRB_CH" name="S-DISTRB_CH" class=""></select></td>
						<td class="small_td"><p><s:message code="quotation.division"/></p></td>
						<td><select id="S-DIV_CD" name="S-DIV_CD" class=""></select></td>
						<td class="small_td"></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.validFrom"/></p></td>
						<td><input type="text" id="S-VAL_FR_DT" name="S-VAL_FR_DT" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="quotation.validTo"/></p></td>
						<td><input type="text" name="S-VAL_TO_DT" id="S-VAL_TO_DT" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="title.approvalyn"/></p></td>
						<td class=""><select id="S-APPROVAL_YN" name="S-APPROVAL_YN" class=""></select></td>
						<td class="small_td">Approval Date</td>
						<td style="width:110px;"><select id="S-APR_YEAR" name="S-APR_YEAR" style="width:65px;"></select><select id="S-APR_MONTH" name="S-APR_MONTH" style="width:45px;"></select>
						</td>
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
			<div class="ct_grid_top_left"><h4><s:message code="title.quotApproval"/></h4></div>
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
		$('#cBtnUser1').text("Approval");
		$('#cBtnUser1').addClass("cls");
		$('#cBtnUser1').addClass("cBtnPut_style");
		setCommBtn('Save', false);
		$('#txtDate').val($.datepicker.formatDate('dd/mm/yy', new Date()));
		$('#S-DOC_TP').focus();
		
		if(policy.indexOf('ADMIN') > -1){
			$("#S-APPROVAL_ID").attr("disabled",false).attr("readonly",false);
			$("#cmm_pop_APPROVAL_ID").attr("hidden",false);
		}
		fn_codeval({type:'COMM',btn_id:'cmm_pop_DOC_TP',head_id:'DOC_TP',code:'S-DOC_TP',name:'S-DOC_NM'});
		fn_codeval({type:'USER',btn_id:'cmm_pop_APPROVAL_ID',code:'S-APPROVAL_ID', name:'S-APPROVAL_NM'});

		setDateBox();
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
		$("#S-APPROVAL_YN").val("Q");
		$("#S-APPROVAL_YN option:last").remove();
		
		if(auth.substring(3,4) =='N'){
			setCommBtn('BtnUser1', false);
		}

		$('#quotationGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				grid1_ondblClickRow(rowid, iRow, iCol, e);
			},
		}); 
		
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#S-SOLD_CUST_CD').val());
		});
		
// 		$('#cUser1').on('click', function (e) {
// 			updateApproval();
// 		});
		
		$('.tab_top_search input').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } }); 
	});

	function createQuotationGrid(){
		var colName = [
					  'No'
				    , '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'quotationGrid\')" />'
					, '<s:message code="quotation.grd.document"/>'
					, 'Approval Status'
					, 'Approval Status'
					, 'Comment'
					, 'Approval Date'
					, 'Region'
					, 'Customer ID'
					, 'Sold-To Party'
					, 'Item'
					, 'Product Code'
					, 'MW'
					, 'Requested Price'
					, 'ERP Price'
					, 'Dlv. Date'
					, 'Created By'
					, 'KAM'
					, 'Approval By'
					, '<s:message code="quotation.grd.dv"/>'
					, '<s:message code="quotation.grd.sgrp"/>'
					, '<s:message code="quotation.grd.sorg"/>'
					, '<s:message code="quotation.grd.dchl"/>'
					, 'MODI_TMS'
					, 'REFDOC'
					, 'PRIORITY'
					, 'MAX_PRIORITY'
					, 'COMP_CD'
					, 'APPR_ID'
			];
		var colModel = [   
		    			  { name: 'SEQ', width: 50, align: 'center', hidden:true}	
		    			, { name: 'CHK', width : 40, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}								
						, { name: 'DOC_NO', width: 90, align: 'center'}
						, { name: 'APPROVAL_STS', width: 85, align: 'left' , hidden:true}
						, { name: 'APPROVAL_STS_NM', width: 85, align: 'left'}
						, { name: 'REJECT_RSN', width: 120, align: 'left'}	
						, { name: 'APPR_DT', width: 120, align: 'center'}	
						, { name: 'REGION', width: 70, align: 'center'}
						, { name: 'SOLD_CUST_CD', width: 100, align: 'left'}
						, { name: 'SOLD_CUST_NM', width: 200, align: 'left'}
						, { name: 'ITEM_SEQ', width: 50, align: 'center'}
						, { name: 'DESCRIPTION', width: 200, align: 'left'}
						, { name: 'MW', width: 80, align: 'right'}
						, { name: 'REQUESTED_PRICE', width: 80, align: 'right'}
						, { name: 'ERP_PRICE', width: 80, align: 'right'}
						, { name: 'DELIVERY_DATE', width: 80, align: 'center'}
						, { name: 'CREATE_BY', width: 100, align: 'center'}
						, { name: 'KAM', width: 100, align: 'center'}	
						, { name: 'APPR_NM', width: 100, align: 'center'}		
						, { name: 'DIV_CD', width: 50, align: 'center', hidden:true}
						, { name: 'SALES_GR', width: 50, align: 'center', hidden:true}
						, { name: 'SALES_ORG_CD', width: 50, align: 'center', hidden:true}
						, { name: 'DISTRB_CH', width: 50, align: 'center', hidden:true}
						, { name: 'MODI_TMS', width: 50, align: 'center', hidden:true}
						, { name: 'REFDOC', width: 50, align: 'center', hidden:true}
						, { name: 'PRIORITY', width: 50, align: 'center', hidden:true}
						, { name: 'MAX_PRIORITY', width: 50, align: 'center', hidden:true}
						, { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
						, { name: 'APPR_ID', width: 50, align: 'center', hidden:true}
			
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
		} else if(!fn_empty($('#quotationGrid_CURRENT_PAGE').val())) {
			vCurrentPage = $('#quotationGrid_CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		
		vRowsPerPage = btGrid.getGridRowSel('quotationGrid_pager'); //현재 선택된 페이지 번호 설정
		
		$('#quotationGrid_CURRENT_PAGE').val(vCurrentPage);
		$('#quotationGrid_ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/quotation/searchApprovalList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param": formData
				   , "DOC_GR"  : 'QT'};

		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("quotationGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#quotationGrid'), 'cSearch', data.result);  // 그리드 페이징 설정
		});
	}
	
	function cAdd(){
		var param = "?isStatus=N";
		window.top.addTab('QuotationEntry', '/quotation/QuotationEntry.do' + param, 'Quotation Entry');
	}

	function grid1_ondblClickRow(rowid, iRow, iCol, e){
		
		var gridData = $("#quotationGrid").getRowData(rowid);
		var url = '/quotation/getModiTms.do';
		var param = {"param" : { "DOC_NO" : gridData["DOC_NO"] }};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(data.result != gridData["MODI_TMS"]){
				alert("<s:message code='error.alreadyUpd'/>");
				cSearch();
			}else{
				url = "/popup/QuotationPopup.do";
				pid = "QuotationPopup"
				param = {"S_QOUT_NO" :  gridData["DOC_NO"],
						 "S_APPROVAL_YN": gridData["APPROVAL_STS"]};
				popupOpen(url, pid, param, function(data){
					cSearch();
				});
			}
		});
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
	
	/* 그리드 헤더 체크박스 선택 */
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;

		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				if($('#' + gid + '_' + ids[i] + '_CHK').prop('disabled') == false){
					$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
				}
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
	}
	
	//그리드 체크박스 이벤트
	function grid_cbox_onclick(gid, rowid, colkey) {

		var pItemSeq = $("#" + gid).jqGrid('getCell', rowid, 'REFDOC');
		var pri = $("#" + gid).jqGrid('getCell', rowid, 'PRIORITY');
		var checkFlag = false;
		
		if($('#quotationGrid_' + rowid + '_CHK').prop('checked')){
			checkFlag = true;
		}else{
			checkFlag = false;
		}
		
		
		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if(pItemSeq == $("#" + gid).jqGrid('getCell', ids[i], 'DOC_NO') && pri == $("#" + gid).jqGrid('getCell', ids[i], 'PRIORITY')){
				$('#' + gid + '_' + ids[i] + '_CHK').prop('disabled', false);
				if (checkFlag == true) {
					if($('#' + gid + '_' + ids[i] + '_CHK').prop('disabled') == false){
						$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
					}
				} else {
					$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
				}
			}
		}

	}
	
	function cUser1() {
		var ids = $("#quotationGrid").jqGrid("getDataIDs");
		var gridData = [];
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#quotationGrid").getRowData(ids[i]);
			
			if($('#quotationGrid_' + ids[i] + '_CHK').prop('checked')){
				if ( rowData["ITEM_SEQ"] == '100' ) {
					var data = {
							  "DOC_NO" : rowData["DOC_NO"]
							, "COMP_CD" : rowData["COMP_CD"]
							, "APPROVAL_STS" :  rowData["APPROVAL_STS"]
	                        , "APPROVAL_STS_NM" :  rowData["APPROVAL_STS_NM"]
	                        , "REJECT_RSN" :  rowData["REJECT_RSN"] 
	                        , "APPR_DT" :  rowData["APPR_DT"]
	                        , "REGION" :  rowData["REGION"]
	                        , "SOLD_CUST_CD" :  rowData["SOLD_CUST_CD"]
	                        , "SOLD_CUST_NM" :  rowData["SOLD_CUST_NM"]
	                        , "ITEM_SEQ" :  rowData["ITEM_SEQ"]
	                        , "DESCRIPTION" :  rowData["DESCRIPTION"]
	                        , "REQUESTED_PRICE" :  rowData["REQUESTED_PRICE"]
	                        , "ERP_PRICE" :  rowData["ERP_PRICE"]
	                        , "DELIVERY_DATE" :  rowData["DELIVERY_DATE"]
	                        , "CREATE_BY" :  rowData["CREATE_BY"]
	                        , "KAM" :  rowData["KAM"]
	                        , "DIV_CD" :  rowData["DIV_CD"]
	                        , "SALES_GR" :  rowData["SALES_GR"]
	                        , "SALES_ORG_CD" :  rowData["SALES_ORG_CD"]
	                        , "DISTRB_CH" :  rowData["DISTRB_CH"]
	                        , "MODI_TMS" :  rowData["MODI_TMS"]
	                        , "REFDOC" :  rowData["REFDOC"]
	                        , "PRIORITY" : rowData["PRIORITY"]
                    		, "MAX_PRIORITY" : rowData["MAX_PRIORITY"]
    						, "APPR_ID" : rowData["APPR_ID"]
                    		, "DOC_GR" : 'QT'
							}
					gridData.push(data);
				}
			}
			
		}
		
		var url = "/quotation/updateApprovalAll.do";
		var param = {"param":{ "gridData" : gridData } };
		fn_ajax(url, false, param, function(data, xhr){
			console.log(data);
			if(!fn_empty(data)){
				if(data.ALEADY == 'Y'){
					alert("<s:message code='errors.approval'/>");
				}else{
					alert("Approved.");
					cSearch();
				}
			}
		});
	}

	// select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        $("#S-APR_YEAR").append("<option value=''></option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+3); y++){
            $("#S-APR_YEAR").append("<option value='"+ y +"'>"+ y + "</option>");
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#S-APR_MONTH").append("<option value=''></option>");
        for(var i = 1; i <= 12; i++){
        	if(i<10) i = '0' + i;
            $("#S-APR_MONTH").append("<option value='"+ i +"'>"+ i + "</option>");
        }
    }
	</script>
<c:import url="../import/frameBottom.jsp" />