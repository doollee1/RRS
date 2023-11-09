<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : main
	 * @Description : 메인 화면
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SL12" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<!--- 검색버튼 ---->
<!---------->

	<div id="ctu_no_resize">
		<form id="frmSearch">
			<input type="hidden" name="externalGrid_CURRENT_PAGE" id="externalGrid_CURRENT_PAGE">
			<input type="hidden" name="externalGrid_ROWS_PER_PAGE" id="externalGrid_ROWS_PER_PAGE">
			<input type="hidden" name="itemGrid_ROWS_PER_PAGE" id="itemGrid_ROWS_PER_PAGE">
			<input type="hidden" name="itemGrid_ROWS_PER_PAGE" id="itemGrid_ROWS_PER_PAGE">
		</form>
	</div>

<div id="ctu_wrap">	
	
	<form id="frmDetail" action="#" >
		<div class="tab_top_search">
			<table  width="100%">
				<tbody>
					<tr>
						<td class="small_td"  style="width:141px;"><p><s:message code="quotation.soldTo"/></p></td>
						<td class="small_td"><input type="text" name="S-SOLD_CUST_CD" id="S-SOLD_CUST_CD" maxlength="10">
							<ul>
								<li style="float: left; list-style-type: none;">
								<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
								<p class="data_side_text" name="S-SOLD_CUST_NM" id="S-SOLD_CUST_NM"></p>
								</li>
								<li style="float: left; list-style-type: none; padding-left: 5px;"><label> show only my report<input type="checkbox" id="chkOnlyMyReport" name="chkOnlyMyReport" style="width: 16px; height: 16px;" /></label></li>
							</ul>
						</td>	
						<td class="small_td" style="display:none;"><p><s:message code="lead.address"/></p></td>
						<td class="small_td" style="display:none;"><input type="text" name="S-ADDRESS_NM" id="S-ADDRESS_NM" maxlength="50"  disabled="" readonly></td>
						<td class="small_td" style="display:none;"></td>
						<td style="display:none;"></td>
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
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4>External List</h4>
				</div>
			</div>		
			<table id="externalGrid"></table>
			<div id="externalGrid_pager"></div>
		</div>
		
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4>Item List</h4>
				</div>
			</div>		
			<table id="itemGrid"></table>
			<div id="itemGrid_pager"></div>
		</div>
		
		<p>&nbsp;</p>
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
		createExtGrid();
		createItemGrid();
		
		$('#cBtnUser1').text("<s:message code='button.createSo'/>");
		$('#cBtnUser1').addClass("cBtnPut_style"); 
		
		$('#S-SOLD_CUST_CD').on('keypress', function (e) {
			if(e.which == 13){
				cSearch();
			}
		});
		
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#S-SOLD_CUST_CD').val());
		});
		
		$('#externalGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				searchExternalItemList($("#externalGrid").jqGrid('getCell', iRow, 'EXT_DOC_NO'));
			}
		});
	});
	
	function createExtGrid(){
		var colName = [
					  'OM Number'
					, 'OM'
					, 'PF_PS_NO'
					, '<s:message code="quotation.grd.soldToPt"/>'
					, '<s:message code="quotation.grd.document"/>'
					, '<s:message code="quotation.grd.pruchaseOrderNo"/>'
					, '<s:message code="quotation.shipTo"/>'
					, '<s:message code="sales.grd.street"/>'
					, '<s:message code="quotation.grd.dlvDate"/>'
					, '<s:message code="quotation.grd.time"/>'
					, 'PAY_TERM'
					, 'INCOTERMS'
					, 'NAME_1ST'
					, 'NAME_2ND'
					, 'ADDR'
					, 'POST_CD'
					, 'PLACE'
					, 'COUNTRY'
					, 'Unload Equip'
					, 'REMARKS'
					, 'SOLD_CUST_CD'
					, 'SALES_ORG_CD'
					, 'DISTRB_CH'
					, 'DIV_CD'
					, 'PAY_TERM'
			];
		var colModel = [
			  { name: 'OM_NO', width: 100, align: 'center'}
			, { name: 'OM_NM', width: 100, align: 'left'}
			, { name: 'PF_PS_NO', width: 100, align: 'center', hidden: true}
			, { name: 'CUST', width: 200, align: 'left'}
			, { name: 'EXT_DOC_NO', width: 70, align: 'left', hidden:true}
			, { name: 'PO_NO', width: 200, align: 'left'}
			, { name: 'SHIP_TO_NM', width: 200, align: 'left'}
			, { name: 'STREET_NM', width: 200, align: 'left'}
			, { name: 'REQ_DELI_DT', width: 80, align: 'right'}
			, { name: 'REG_DT', width: 150, align: 'right'}			
			, { name: 'PAYMENT_TERM', width: 70, align: 'left', hidden:true}
			, { name: 'INCOTERMS', width: 70, align: 'left', hidden:true}
			, { name: 'NAME_1ST', width: 70, align: 'left', hidden:true}
			, { name: 'NAME_2ND', width: 70, align: 'left', hidden:true}
			, { name: 'ADDR_COMP_CO', width: 70, align: 'left', hidden:true}
			, { name: 'POST_CD', width: 70, align: 'left', hidden:true}
			, { name: 'PLACE', width: 70, align: 'left', hidden:true}
			, { name: 'COUNTRY', width: 70, align: 'left', hidden:true}
			, { name: 'UNLOAD_EQUIP_COMMENT', width: 200, align: 'left', hidden:false}
			, { name: 'REMARKS', width: 200, align: 'left'}
			, { name: 'SOLD_CUST_CD', width: 200, align: 'left', hidden:true}
			, { name: 'SALES_ORG_CD', width: 200, align: 'left', hidden:true}
			, { name: 'DISTRB_CH', width: 200, align: 'left', hidden:true}
			, { name: 'DIV_CD', width: 200, align: 'left', hidden:true}
			, { name: 'PAY_TERM_NM', width: 200, align: 'left', hidden:true}
			];
		
		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				autowidth: true,
				rownumbers:false,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 287
			};
		
		btGrid.createGrid('externalGrid', colName, colModel, gSetting);
	}
	
	function createItemGrid(){
		var colName = [
					  '<s:message code="quotation.grd.document"/>'
					, '<s:message code="quotation.grd.material"/>'
					, '<s:message code="quotation.grd.description"/>'
					, '<s:message code="material.materialGroup"/>'
					, '<s:message code="material.salesOrg"/>'
					, '<s:message code="material.distrChl"/>'
					, '<s:message code="quotation.division"/>'
					, '<s:message code="material.output"/>'
					, '<s:message code="quotation.grd.qty"/>'
					, '<s:message code="quotation.grd.bUnit"/>'
					, '<s:message code="quotation.grd.netPrice"/>'
					, '<s:message code="quotation.grd.erpPer"/>'
					, '<s:message code="quotation.grd.uomErp"/>'
					, '<s:message code="quotation.grd.dlvDate"/>'
					, '<s:message code="ext.availbled"/>'
			];
		var colModel = [
			  { name: 'EXT_DOC_NO', width: 70, align: 'center', hidden:true}
			, { name: 'MATL_CD', width: 100, align: 'center'}
			, { name: 'MATL_DESC', width: 200, align: 'left'}
			, { name: 'MATL_GR', width: 80, align: 'center'}
			, { name: 'SALES_ORG_CD', width: 80, align: 'center'}
			, { name: 'DISTRB_CH', width: 80, align: 'center'}
			, { name: 'DIV_CD', width: 80, align: 'center'}
			, { name: 'WP_OUT', width: 80, align: 'right'}
			, { name: 'QTY', width: 80, align: 'right'}
			, { name: 'BASIC_UNIT', width: 80, align: 'center'}
			, { name: 'NET_VAL', width: 60, align: 'right'}
			, { name: 'WP_OUT', width: 60, align: 'right'}
			, { name: 'UOM', width: 60, align: 'right'}
			, { name: 'REQ_DELI_DT', width: 80, align: 'center'}
			, { name: 'AVAIL_ITEM', width: 80, align: 'center', hidden:true}
			];
		
		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				autowidth: false,
				rownumbers:false,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 243
			};
		
		btGrid.createGrid('itemGrid', colName, colModel, gSetting);
	}
	
	function cSearch(){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty($('#externalGrid_CURRENT_PAGE').val())) {
			vCurrentPage = $('#externalGrid_CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('externalGrid_pager');
		$('#externalGrid_CURRENT_PAGE').val(vCurrentPage);
		$('#externalGrid_ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/salesOrder/searchExternalList.do";
		
		var formData = formIdAllToMap('frmDetail');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("externalGrid", data.result);
			btGrid.gridQueryPaging($('#externalGrid'), 'cSearch', data.result);
		});
	}
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
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
	
	function searchExternalItemList(){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty($('#itemGrid_CURRENT_PAGE').val())) {
			vCurrentPage = $('#itemGrid_CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('itemGrid_pager');
		$('#itemGrid_CURRENT_PAGE').val(vCurrentPage);
		$('#itemGrid_ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/salesOrder/searchExternalItemList.do";
		
		var param = {"param": {'EXT_DOC_NO' : $("#externalGrid").jqGrid('getCell', $('#externalGrid').jqGrid('getGridParam', 'selrow'), 'EXT_DOC_NO')} };
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("itemGrid", data.result);
			btGrid.gridQueryPaging($('#itemGrid'), 'searchExternalItemList', data.result);
			
// 			for(i=0;i< data.result.length;i++){
// 				if('Y' != data.result[i].AVAIL_ITEM){
// 					$('#itemGrid').jqGrid('setCell',i + 1,"EXT_DOC_NO","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"MATL_CD","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"MATL_DESC","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"MATL_GR","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"SALES_ORG_CD","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"DISTRB_CH","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"DIV_CD","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"WP_OUT","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"QTY","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"BASIC_UNIT","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"REQ_DELI_DT","",{'color':'red','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"AVAIL_ITEM","",{'color':'red','font-weight':'bold'});
// 				}else{
// 					$('#itemGrid').jqGrid('setCell',i + 1,"EXT_DOC_NO","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"MATL_CD","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"MATL_DESC","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"MATL_GR","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"SALES_ORG_CD","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"DISTRB_CH","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"DIV_CD","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"WP_OUT","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"QTY","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"BASIC_UNIT","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"REQ_DELI_DT","",{'color':'blue','font-weight':'bold'});
// 					$('#itemGrid').jqGrid('setCell',i + 1,"AVAIL_ITEM","",{'color':'blue','font-weight':'bold'});
// 				}
// 			}
		});
	}
	
	function cUser1(){
		var selRow = $('#externalGrid').jqGrid('getGridParam', 'selrow');
		
		btGrid.gridSaveRow('externalGrid');
		btGrid.gridSaveRow('itemGrid');

		var exHeaderData = '';
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'EXT_DOC_NO') + ';';	//0  ext_doc_no
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'SOLD_CUST_CD') + ';';	//1  sold_to
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'PO_NO') + ';';		//2  po_no
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'PF_PS_NO') + ';';		//3  PF_PS_NO
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'STREET_NM') + ';';	//4  STREET_NM
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'REQ_DELI_DT') + ';';	//5  REQ_DELI_DT
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'PAYMENT_TERM') + ';';	//6  PAYMENT_TERM
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'INCOTERMS') + ';';	//7  INCOTERMS
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'NAME_1ST') + ';';		//8  NAME_1ST
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'NAME_2ND') + ';';		//9  NAME_2ND
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'ADDR_COMP_CO') + ';';	//10 ADDR_COMP_CO
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'POST_CD') + ';';		//11 POST_CD
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'PLACE') + ';';		//12 PLACE
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'COUNTRY') + ';';		//13 COUNTRY
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'REMARKS') + ';';		//14 REMARKS
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'SALES_ORG_CD') + ';';	//15 SALES_ORG_CD
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'DISTRB_CH') + ';';	//16 DISTRB_CH
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'DIV_CD') + ';';		//17 DIV_CD
		exHeaderData += $("#externalGrid").jqGrid('getCell', selRow, 'PAY_TERM_NM') + ';';	//18 PAY_TERM_NM
		
		var exItemData = '';
		
		var ids = $("#itemGrid").jqGrid("getDataIDs");
		var availFlag = false;
		
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#itemGrid").getRowData(ids[i]);
			if ( rowData["AVAIL_ITEM"] == 'Y' ) {
				exItemData += rowData["MATL_CD"] + ';';
				exItemData += rowData["QTY"] + ';';
				exItemData += rowData["REQ_DELI_DT"] + ';';
				exItemData += rowData["NET_VAL"] + ';';
				exItemData += rowData["BASIC_UNIT"] + '@';
				availFlag = true;
			}
		}
		
		var param = "?isStatus=EXT" + "&exHeaderData=" + encodeURIComponent(exHeaderData) + "&exItemData=" + exItemData;
		
		if(!fn_empty($("#externalGrid").getGridParam('selrow')) && availFlag){
			if(confirm("<s:message code='confirm.createSo'/>")){
				window.top.addTab('SO_' + $("#externalGrid").jqGrid('getCell', selRow, 'EXT_DOC_NO') + 'EXT', '/salesOrder/SalesOrderEntry.do' + param, 'S.O-Trans');
			}
		}
	}
</script>

<c:import url="../import/frameBottom.jsp" />