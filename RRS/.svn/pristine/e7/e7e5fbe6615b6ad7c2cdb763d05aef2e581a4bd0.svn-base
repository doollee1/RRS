<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : BOMPopUp
	 * @Description : BOM조회=팝업
	 */
%>
<div id="BOMPopUp">
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
			<div id="ctm_sech_wrap">
				<ul class="sech_ul">
					<li class="sech_list">
						<div></div>
					</li>
				</ul>
				
				<!-------------- --->
				
				<h4><s:message code="button.search"/></h4>
				<table class="table_line" width="70%">
					<tbody>  
						<tr>
							<td><p><s:message code="material.materialCode"/></p></td>
							<td><input type="text" name="sMATL_CD_str" id="sMATL_CD_str"  maxlength="10" onKeyPress="fn_onlyNum(this)" style="ime-mode:disabled" ><p style="float:left;"></p>
							
							</td>
						</tr>
						<tr>
							<td><p><s:message code="material.plant"/></p></td>
							<td><select id="PLANT_CD" name="PLANT_CD" class="">
								</select>
							</td>
							<td><p><s:message code="material.usage"/></p></td>
							<td><select id="BOM_USAGE" name="BOM_USAGE" class="">
								</select>
							</td>
						</tr>
						<tr>
							<td><p><s:message code="material.validFrom"/></p></td>
							<td><input type="text" id="sValidFrom" name="sValidFrom" data-type="date" readonly="true"/>
							<td>
						</tr>
					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
		</form>
	</div>
	<div class="pop_grid_wrap">
		<table id="BOMGrid"></table>
		<div id="BOMGrid_pager"></div>
	</div>
</div>

<script type="text/javascript">

$(function() {
	
	createCodeBox('PLANT_CD', true); //PLANT
	createCodeBox('BOM_USAGE', true); //USEAGE
		
	$("#cBtnSearch3").click(function(e){
		cSearch();
	});
	
	$('#BOMPopUp').dialog({
		title: '<s:message code="material.materialList"/>',
		autoOpen: false,
		height: 600,
		width: 1000,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {

					var selRows = $('#BOMGrid').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#BOMGrid').getRowData(selRows)];
					if(selRows > 0){
						p_rtnData = gridData;
						console.log(p_rtnData[0]["MATL_NM"]);
						
						parent.$("#S-MATL_CD").val(p_rtnData[0]["MATL_CD"]);
						parent.$('#MATL_NM').text(p_rtnData[0]["MATL_NM"]);
						parent.$('#BOM_QTY').val(p_rtnData[0]["BOM_QTY"]);
						parent.$('#UNIT_CD').text(p_rtnData[0]["UNIT_CD"]);
						parent.$('#PLANT_CD').val(p_rtnData[0]["PLANT_CD"]);
						parent.$('#PLANT_NM').text(p_rtnData[0]["PLANT_NM"]);
						parent.$('#STATUS').val(p_rtnData[0]["STATUS"]);
						parent.$('#STATUS_NM').text(p_rtnData[0]["STATUS_NM"]);
						parent.$('#VAL_FR_DT').val(p_rtnData[0]["VAL_FR_DT"]);
						
						popupClose($('#BOMPopUp').data('pid'));
					}else{
						alert('<s:message code="info.onematerial"/>');
					}		

					
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
			
			createBOMGrid();
			$('#sMATL_CD_str').val($(this).data("S-MATL_CD"));
			//cSearch();
			$('#BOMGrid').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					
					var gridData = [$('#BOMGrid').getRowData(rowid)];
					p_rtnData = gridData;
					popupClose($('#BOMPopUp').data('pid'));
				}
			});
			
			
			$('#sValidFrom').datepicker({
				dateFormat : 'dd.mm.yy',
				showOn : 'both'
			}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
				function(e) {
			});
			
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

function createBOMGrid(){
	var colName = [
		  '<s:message code="material.materialCode"/>'
		, '<s:message code="material.material"/>'
		, '<s:message code="material.grid.desc"/>'
		, '<s:message code="material.usage"/>'
		, 'Plant code'
		, '<s:message code="material.plant"/>'
		, '<s:message code="material.baseQuantity"/>'
		, '<s:message code="material.basicUnit"/>'
		, 'Status code'
		, '<s:message code="material.bomStatus"/>'
		, '<s:message code="material.validFrom"/>'
		, '<s:message code="material.item"/>'
		, 'ICT'
		, '<s:message code="material.component"/>'
		, '<s:message code="material.componentDescription"/>'
		, '<s:message code="material.quantity"/>'
		, '<s:message code="material.unit"/>'
		, '<s:message code="material.validFrom"/>'
		, '<s:message code="material.relToSales"/>'
		, '<s:message code="material.delItem"/>'
		];
	var colModel = [
		  { name: 'MATL_CD', width: 200, align: 'center', }
		, { name: 'MATL_NM', width: 120, align: 'center', }
		, { name: 'BOM_DESC', width: 100, align: 'center' }
		, { name: 'BOM_USAGE', width: 100, align: 'center' }
		, { name: 'PLANT_CD', width: 100, align: 'center', hidden :true}
		, { name: 'PLANT_NM', width: 350, align: 'center' }
		, { name: 'BOM_QTY', width: 100, align: 'center' }
		, { name: 'UNIT_CD', width: 100, align: 'center' }
		, { name: 'STATUS', width: 100, align: 'center' , hidden :true}
		, { name: 'STATUS_NM', width: 100, align: 'center' }
		, { name: 'VAL_FR_DT', width: 100, align: 'center' }
		, { name: 'ITEM_CD', width: 100, align: 'center' }
		, { name: 'ICT', width: 100, align: 'center' }
		, { name: 'COMPNT', width: 100, align: 'center' }
		, { name: 'COMPNT_DESC', width: 100, align: 'center' }
		, { name: 'VOL_QTY', width: 100, align: 'center' }
		, { name: 'BASIC_UNIT', width: 100, align: 'center' }
		, { name: 'VAL_FR_DATE', width: 100, align: 'center' }
		, { name: 'RTS', width: 100, align: 'center' }
		, { name: 'DEL', width: 100, align: 'center' }
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
			height:200
		};
	// 그리드 생성 및 초기화
	btGrid.createGrid('BOMGrid', colName, colModel, gSetting);
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
	vRowsPerPage = btGrid.getGridRowSel('BOMGrid_pager');
	$('#CURRENT_PAGE').val(vCurrentPage);
	$('#ROWS_PER_PAGE').val(vRowsPerPage);
	
	var url = "/Bom/selectMaterialList.do";
	
	var formData = formIdAllToMap('frmSearch');
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){
		reloadGrid("BOMGrid", data.result);
		btGrid.gridQueryPaging($('#BOMGrid'), 'cSearch', data.result);
	});
}
</script>