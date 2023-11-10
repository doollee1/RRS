<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div id="PartnerSearchPopUp">

	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
		<div id="divBtn">
			<button class="btn btn-default" id="cBtnSearch3"><i class="fa fa-search"></i><s:message code="button.search"/></button>
		</div>
	</div>	
	<!---------->

	<div class="popup_search">
		<form id="frmSearch" action="#">
			<input type="hidden" name="CURRENT_PAGE" id="CURRENT_PAGE">
			<input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE">
			<input type="hidden" id="LEAD_PF_TP" name="LEAD_PF_TP">
			<div id="ctm_sech_wrap">
								
				<table class="new_search_pop" width="100%">
					<tbody>  
						<tr>
							<td width="90px"><s:message code="customer.Customer"/></td>
							<td><input type="text" id="S-CUST_CD" name="S-CUST_CD"></td>
							<td width="90px"><s:message code="customer.Name"/></td>
							<td><input type="text" id="S-CUST_NM" name="S-CUST_NM"></td>
							<td width="120px"><s:message code="customer.SrchTerm"/></td>
							<td class="new_s_pop_small">
								<input type="text" id="S-SEARCH_NM1" name="S-SEARCH_NM1" style="width:71px">&nbsp;
								<input type="text" id="S-SEARCH_NM2" name="S-SEARCH_NM2"  style="width:71px">
							</td>
						</tr>
						<tr>
							<td><s:message code="customer.SalesOrg"/></td>
							<td><select id="S-SALES_ORG_CD" data-dbcolumn="SALES_ORG_CD"></select></td>
							<td><s:message code="customer.DistChannel"/></td>
							<td><select id="S-DISTRB_CH" data-dbcolumn="DISTRB_CH"></select></td>
							<td><s:message code="customer.Division"/></td>
							<td><select id="S-DIV_CD" data-dbcolumn="DIV_CD"></select></td>
						</tr>
					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
		</form>
	</div>
	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<!-- -
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		 -->
		<div class="pop_grid_wrap">
			<table id="PartnerSchGrid"></table>
			<div id="PartnerSchGrid_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
	
</div>

<script>

$(function() {
	var codeBoxArray = [  'S-SALES_ORG_CD'
						, 'S-DISTRB_CH'
						, 'S-DIV_CD'
					   ];
			
	createCodeBoxByArr(codeBoxArray, true);
		
	$("#cBtnSearch3").click(function(e){
		cSearch();
	});
	
	$('#PartnerSearchPopUp').dialog({
		title: 'Partner Search',
		autoOpen: false,
		height: 500,
		width: 930,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					var gridData = [$('#PartnerSchGrid').getRowData($('#PartnerSchGrid').getGridParam('selrow'))];
					
					popupClose($(this).data('pid'), gridData);						
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
			
			createGrid();
			
			$('#LEAD_PF_TP').val($(this).data("LEAD_PF_TP"));
			
			//cSearch();
			
			$('#PartnerSchGrid').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {					
					var gridData = [$('#PartnerSchGrid').getRowData(rowid)];
					
					popupClose($('#PartnerSearchPopUp').data('pid'),gridData);
				}
			});
			
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
		//	p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});


function createGrid(){
	var colName = [
	               '<s:message code="lead.grd.partnerid"/>'
	             , '<s:message code="lead.grd.partnerid"/>'
	             , '<s:message code="lead.grd.partnernm"/>'
	             , '<s:message code="lead.grd.partneraddr"/>'
	             , '<s:message code="lead.grd.mainpartneryn"/>'
	             , '<s:message code="lead.grd.partnerphone"/>'
	             , '<s:message code="lead.grd.partneremail"/>'
	               ];

	var colModel = [
	    			{ name: 'LEAD_PF_TP', width: 150, align: 'center', hidden:true } 
	    		  , { name: 'PF_PS_NO', width: 150, align: 'center' } 
	    		  , { name: 'PF_PS_NM', width: 250, align: 'center' }
	    		  , { name: 'STREET_NM', width: 250, align: 'center' }
	    		  , { name: 'DEFAULT_YN', width: 250, align: 'center' }
	    		  , { name: 'TEL_NO', width: 250, align: 'center' }
	    		  , { name: 'E_MAIL', width: 250, align: 'center' }
	    	  	   ];
	
	var gSetting = {
			height: 264,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
	};
	
	// 그리드 생성 및 초기화
	btGrid.createGrid('PartnerSchGrid', colName, colModel, gSetting);
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
	vRowsPerPage = btGrid.getGridRowSel('PartnerSchGrid_pager');
	$('#CURRENT_PAGE').val(vCurrentPage);
	$('#ROWS_PER_PAGE').val(vRowsPerPage);
	
	var url = "/popup/partnerSearchList.do";
	
	var formData = formIdAllToMap('frmSearch');
	var param = {"param":formData};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("PartnerSchGrid", data.result);
		btGrid.gridQueryPaging($('#PartnerSchGrid'), 'cSearch', data.result);
	});
}

</script>