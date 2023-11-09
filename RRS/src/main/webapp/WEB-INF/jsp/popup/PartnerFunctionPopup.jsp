<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div id="PartnerFunctionPopup">
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
		<div id="divBtn">
			<button class='btn btn-default' id='btn_search' type='button' onclick='selectPfPopList();'><i class='fa fa-file-o'></i><s:message code='button.search'/></button>
		</div>
	</div>
	<div id="ctm_sech_wrap">
		<input type="hidden" name="pfListGrid_CURRENT_PAGE" id="pfListGrid_CURRENT_PAGE">
		<input type="hidden" name="pfListGrid_ROWS_PER_PAGE" id="pfListGrid_ROWS_PER_PAGE">
		<table class="new_search_pop" width="60%">
			<tr>
				<td class="small_td"><s:message code="customer.partnerf"/></td>
				<td><input id="PartnerFunctionPopup_CUST_CD" name="PartnerFunctionPopup_CUST_CD" type="text" style="float:left;">
					<p class="data_side_text" name="PartnerFunctionPopup_CUST_NM" id="PartnerFunctionPopup_CUST_NM"></p></td>
				<td></td>
				<td></td>		
				<td></td>
				<td></td>		
			</tr>			
		</table>
	</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="pfListGrid"></table>
		<div id="pfListGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
	<input type="hidden" name="DOC_NO" id="DOC_NO">
	<input type="hidden" name="SALES_ORG_CD" id="SALES_ORG_CD">
	<input type="hidden" name="DISTRB_CH" id="DISTRB_CH">
	<input type="hidden" name="DIV_CD" id="DIV_CD">
	<input type="hidden" name="PF_TP" id="PF_TP">
</div>

<script type="text/javascript">
$(function() {
	$('#PartnerFunctionPopup').dialog({
		title: '<s:message code="sales.tab.PartnerTexts"/>',
		autoOpen: false,
		height: popHsize,
		width: popWsize,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					var gridData = [$('#pfListGrid').getRowData($('#pfListGrid').getGridParam('selrow'))];
					
					p_rtnData = gridData;
					
					popupClose($(this).data('pid'));
				}
			},
			'Close': {
				text: '<s:message code="button.close"/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			
			createPfListGrid();
			
			$('#DOC_NO').val($(this).data("DOC_NO"));
			$('#PartnerFunctionPopup_CUST_CD').val($(this).data("CUST_CD"));
			$('#PartnerFunctionPopup_CUST_NM').text($(this).data("CUST_NM"));
			$("#SALES_ORG_CD").val($(this).data("SALES_ORG_CD"));
			$("#DISTRB_CH").val($(this).data("DISTRB_CH"));
			$("#DIV_CD").val($(this).data("DIV_CD"));
			$("#PF_TP").val($(this).data("PF_TP"));
			
			$('#pfListGrid').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var gridData = [$('#pfListGrid').getRowData(rowid)];
					p_rtnData = gridData;
					popupClose($('#PartnerFunctionPopup').data('pid'));
				}
			});
			
			selectPfPopList(null);
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

function createPfListGrid(){
	var colName = [
					  'COMP_CD'
					, '<s:message code="quotation.grd.document"/>'
					, 'SEQ'
					, '<s:message code="quotation.grd.pf"/>'
					, '<s:message code="quotation.grd.partnerFnc"/>'
					, '<s:message code="quotation.grd.number"/>'
					, '<s:message code="quotation.grd.name"/>'
					, '<s:message code="quotation.grd.partDesc"/>'
					, '<s:message code="sales.grd.street"/>'
					, 'STREET_NM2'
					, 'NAME_1ST'
					, 'NAME_2ND'
					, 'HAUS_NO'
					, 'POST_CD'
					, 'CITY_CD'
					, 'COUNTRY_CD'
					, 'REGION_CD'
					, 'TIME_ZONE'
					, 'TRANSP_ZONE'
					, 'LANG_CD'
					, 'TEL_NO'
					, 'TEL_NO_EXT'
					, 'MOBILE_NO'
					, 'FAX_NO'
					, 'FAX_NO_EXT'
					, 'E_MAIL'
					, 'VAT_REG_NO'
					, 'ACCOUNT_GR'
					, ''
					, 'ROW_STATUS'
					];
			var colModel = [
				  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
				, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
				, { name: 'SEQ', width: 50, align: 'center', hidden:true}
				, { name: 'PF_TP', width: 50, align: 'center', editable:false}
				, { name: 'PF_NM', width: 50, align: 'left', editable:false}
				, { name: 'PF_PS_NO', width: 50, align: 'center', editable:false}
				, { name: 'PF_PS_NM', width: 100, align: 'left', editable:false}
				, { name: 'PF_DESC', width: 150, align: 'center', editable:false, hidden:true}
				, { name: 'STREET_NM', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'STREET_NM2', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'NAME_1ST', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'NAME_2ND', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'HAUS_NO', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'POST_CD', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'CITY_CD', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'COUNTRY_CD', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'REGION_CD', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'TIME_ZONE', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'TRANSP_ZONE', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'LANG_CD', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'TEL_NO', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'TEL_NO_EXT', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'MOBILE_NO', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'FAX_NO', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'FAX_NO_EXT', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'E_MAIL', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'VAT_REG_NO', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'ACCOUNT_GR', width: 200, align: 'left', editable:false, hidden:true}
				, { name: 'DELI_PLNAT_CD', hidden: true }
				, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
				];
	
	var gSetting = {
		pgflg:true,
		colsetting : true,  // 컬럼 설정 버튼 노출여부
		exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		searchInit : false,  // 데이터 검색 버튼 노출여부
		resizeing : true,
		rownumbers:false,
		shrinkToFit: true,
		autowidth: true,
		queryPagingGrid:true, // 쿼리 페이징 처리 여부
		height : 372
	};
	// 그리드 생성 및 초기화
	btGrid.createGrid('pfListGrid', colName, colModel, gSetting);
}

function selectPfPopList(currentPage){
	
	var vCurrentPage = 1;
	var vRowsPerPage;
	if(!fn_empty(currentPage)){
		vCurrentPage = currentPage;
	} else if(!fn_empty($('#pfListGrid_CURRENT_PAGE').val())) {
		vCurrentPage = $('#pfListGrid_CURRENT_PAGE').val();
	} else {
		vCurrentPage = 1;
	}
	
	vRowsPerPage = btGrid.getGridRowSel('pfListGrid_pager'); //현재 선택된 페이지 번호 설정
	
	$('#pfListGrid_CURRENT_PAGE').val(vCurrentPage);
	$('#pfListGrid_ROWS_PER_PAGE').val(vRowsPerPage);
	
	var url = "/product/selectPfPopList.do";
	var param = { "param" : {
			  "DOC_NO"  : $('#DOC_NO').val()
			, "CUST_CD" : $('#PartnerFunctionPopup_CUST_CD').val()
			, "SALES_ORG_CD" : $('#SALES_ORG_CD').val()
			, "DISTRB_CH" : $('#DISTRB_CH').val()
			, "DIV_CD" : $('#DIV_CD').val()
			, "PF_TP" : $('#PF_TP').val()
		}
	};
	
	fn_ajax(url, true, param, function(data, xhr){
		reloadGrid("pfListGrid", data.result);   // 그리드 조회 데이터 출력
		btGrid.gridQueryPaging($('#pfListGrid'), 'selectPfPopList', data.result);  // 그리드 페이징 설정
		$('#pfListGrid').jqGrid('setSelection', $('#pfListGrid').jqGrid('getDataIDs')[0]);
	});
	
}
</script>