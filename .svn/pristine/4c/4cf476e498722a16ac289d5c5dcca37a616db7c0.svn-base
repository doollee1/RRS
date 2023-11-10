<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : externalMaterialPopUp
	 * @Description : 제품관리 검색팝업
	 */
%>

<div id="externalMaterialPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
		<div id="divBtn">
			<button class="btn btn-default" id="matlPopSearchBtn"><i class="fa fa-search"></i><s:message code="button.search"/></button>
		</div>
	</div>
	
	<!---------->
	
	<div class="popup_search">
		<form id="frmSearch" action="#">
			<div id="ctm_sech_wrap">
				<!--<ul class="sech_ul">
							<li class="sech_list">
								<div></div>
						</li>
					</ul>
				-->					
				<!-- <h4><i class="fa fa-search"></i>&nbsp;<s:message code="button.search"/></h4>-- -->
				<table class="new_search_pop" width="100%">
					<tbody>
						<tr>
							<td style="width:145px;"><p><s:message code="material.materialCode"/></p></td>
							<td><input type="text" name="S_MATL_POP-MATL_CD_ST" id="S_MATL_POP-MATL_CD_ST" style="width:70px; ime-mode:disabled; float:left;" maxlength="10" onKeyPress="fn_onlyNum(this)">
								<p style="float:left;">~</p><input type="text" name="S_MATL_POP-MATL_CD_END" id="S_MATL_POP-MATL_CD_END" style="width:70px; ime-mode:disabled;" maxlength="10" onKeyPress="fn_onlyNum(this)">
							</td>
							<td class="small_td"><p><s:message code="sales.grd.Description"/></p></td>
							<td><input type="text" name="S_MATL_POP-MATL_DESC" id="S_MATL_POP-MATL_DESC">
							</td>
							<td><p><s:message code="material.output"/></p></td>
							<td><input type="text" name="S_MATL_POP-WP_OUT" id="S_MATL_POP-WP_OUT"></td>
						</tr>
						<tr>
							<td><p><s:message code="material.materialType"/></p></td>
							<td style="width:200px;"><select id="S_MATL_POP-MATL_TP" name="S_MATL_POP-MATL_TP" class=""></select>
							</td>
							<td style="width:80px;"><p><s:message code="material.plant"/></p></td>
							<td style="width:200px;"><select id="S_MATL_POP-PLANT_CD" name="S_MATL_POP-PLANT_CD" class="" disabled="disabled">
								</select>
							</td>
							<td><p><s:message code="material.materialGroup"/></p></td>
							<td><input type="text" name="S_MATL_POP-MATL_GR_ST" id="S_MATL_POP-MATL_GR_ST" style="width:70px; ime-mode:disabled;float:left;" maxlength="10" onKeyPress="fn_onlyNum(this)"> <p style="float:left;">~</p>
								<input type="text" name="S_MATL_POP-MATL_GR_END" id="S_MATL_POP-MATL_GR_END" style="width:70px;ime-mode:disabled;" maxlength="10" onKeyPress="fn_onlyNum(this)">
							</td>
						</tr>
						<tr style="display: none;">
							<td><p><s:message code="material.salesOrg"/></p></td>
							<td><select id="S_MATL_POP-SALES_ORG_CD" name="S_MATL_POP-SALES_ORG_CD" class="" disabled="disabled">
								</select>
							</td>
							<td><p><s:message code="material.distrChl"/></p></td>
							<td><select id="S_MATL_POP-DISTRB_CH" name="S_MATL_POP-DISTRB_CH" class="" disabled="disabled">
								</select>
							</td>
							<td><p><s:message code="material.division"/></p></td>
							<td><select id="S_MATL_POP-DIV_CD" name="S_MATL_POP-DIV_CD" class="" disabled="disabled">
								</select>
							</td>
						</tr>
						<tr style="display:none;">
							<td colspan="2"><span style="float:left; margin-right:7px;"><s:message code="material.excludeDeletionPlant"/></span><input type="checkbox" name="S_MATL_POP-EXC_PL" id="S_MATL_POP-EXC_PL" style="width: 10%;"></td>
							<td></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>

					</tbody>
				</table>
				<!-- ----------------- -->
			</div>
		</form>
	</div>
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_wrap">
			<table id="materialGrid"></table>
			<div id="materialGrid_pager"></div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(function() {
	$('#externalMaterialPopUp').dialog({
		title: '<s:message code="material.materialList"/>',
		autoOpen: false,
		height: popHsize,
		width: 1050,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {					
					var selectedrows = $("#materialGrid").jqGrid('getGridParam','selarrrow');
					if(selectedrows.length) {
						p_rtnData = [];
						for(var i=0;i<selectedrows.length; i++) {							
							var rowdata = $("#materialGrid").jqGrid('getRowData', selectedrows[i]);
							p_rtnData.push(rowdata);
						}
					}								
					popupClose($('#externalMaterialPopUp').data('pid'));					
				}
			},
			'Close': {
				text: '<s:message code="button.close"/>',
				click: function() {
					$('#externalMaterialPopUp').dialog('close');
				}
			}
		},
		open: function(e, ui) {
			
			var codeBoxArray = [ 
					  'S_MATL_POP-DIV_CD'
					, 'S_MATL_POP-DISTRB_CH'
					, 'S_MATL_POP-SALES_ORG_CD'
					, 'S_MATL_POP-PLANT_CD'
					, 'S_MATL_POP-MATL_TP'
			];
			
			// initialize code box
			createCodeBoxByArr(codeBoxArray, true);
			
			// initialize material grid
			creatematerialGrid();
		
			// initialize div value
			$("#S_MATL_POP-DIV_CD").val($(this).data("DIV_CD"));
			$("#S_MATL_POP-PLANT_CD").val($(this).data("PLANT_CD"));
			$("#S_MATL_POP-DISTRB_CH").val($(this).data("DISTRB_CH"));
	
			$("#matlPopSearchBtn").click(function(e){
				
				if (
						   '' == $('#S_MATL_POP-MATL_CD_ST').val()
						&& '' == $('#S_MATL_POP-MATL_CD_END').val()
						&& '' == $('#S_MATL_POP-MATL_TP option:selected').val()
						&& '' == $('#S_MATL_POP-PLANT_CD option:selected').val()
						&& '' == $('#S_MATL_POP-SALES_ORG_CD option:selected').val()
						&& '' == $('#S_MATL_POP-DISTRB_CH option:selected').val()
						&& '' == $('#S_MATL_POP-DIV_CD option:selected').val()
						&& '' == $('#S_MATL_POP-MATL_GR_ST').val()
						&& '' == $('#S_MATL_POP-MATL_GR_END').val()
						&& '' == $('#S_MATL_POP-MATL_DESC').val()
						&& '' == $('#S_MATL_POP-WP_OUT').val()
				)
				{
					alert('<s:message code="validator.searchmanatory"/>');
				} 
				else 
				{
					selectMatlPopList(null)
				}
			})
			
			$('#S_MATL_POP-MATL_CD_ST, #S_MATL_POP-MATL_CD_END, #S_MATL_POP-MATL_GR_ST, #S_MATL_POP-MATL_GR_END, #S_MATL_POP-MATL_DESC, #S_MATL_POP-WP_OUT').on('keypress', function (e) {
				if(e.which == 13){
					if(this.value != ""){
						selectMatlPopList(null);
					}
				}
			});
			
			$('#S_MATL_POP-MATL_DESC').focus();
			
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];			
			popupClose($('#externalMaterialPopUp').data('pid'));
		}
	});
});

function creatematerialGrid(){
	var colName = [
     		      '<s:message code="material.material"/>'
     			, '<s:message code="customer.grd.Description"/>'
     			, '<s:message code="material.basicDataText"/>'
     			, '<s:message code="material.plant"/>'
     			, '<s:message code="material.salesOrg"/>'
     			, '<s:message code="material.distrChl"/>'
     			, '<s:message code="material.division"/>'
     			, '<s:message code="material.xPlantStatus"/>'
     			, '<s:message code="material.grid.bum"/>'
     			, '<s:message code="material.output"/>'
     			, '<s:message code="material.materialGroup"/>'
     			, 'BASIC_UNIT'
     			, 'GROSS_WT'
     			, 'NET_WT'
     			, 'WT_UNIT'
     			, 'VOL_QTY'
     			, 'VOL_UNIT'
     			, 'MATL_TP'
     			, 'BATCH_NO'
	];
	var colModel = [
		  { name: 'MATL_CD', width: 100, align: 'center', }
		, { name: 'MATL_DESC', width: 250 }
		, { name: 'LONG_TEXT', width: 150 }
		, { name: 'PLANT_CD', width: 100, align: 'center' }
		, { name: 'SALES_ORG_CD', width: 100, align: 'center' }
		, { name: 'DISTRB_CH', width: 100, align: 'center'}
		, { name: 'DIV_CD', width: 100, align: 'center' }
		, { name: 'X_P_STATUS', width: 100, align: 'center' }
		, { name: 'BUM', width: 100, align: 'center' }
		, { name: 'WP_OUT', width: 100, align: 'right' }
		, { name: 'MATL_GR', width: 100, align: 'center' }
		, { name: 'BASIC_UNIT', width: 100, align: 'center', hidden:true }
		, { name: 'GROSS_WT', width: 100, align: 'center', hidden:true }
		, { name: 'NET_WT', width: 100, align: 'center', hidden:true }
		, { name: 'WT_UNIT', width: 100, align: 'center', hidden:true }
		, { name: 'VOL_QTY', width: 100, align: 'center', hidden:true }
		, { name: 'VOL_UNIT', width: 100, align: 'center', hidden:true }
		, { name: 'MATL_TP', width: 100, align: 'center', hidden:true }
		, { name: 'BATCH_NO', width: 100, align: 'center', hidden:true }
	];
	
	var gSetting = {
		pgflg: true,
		colsetting: true,  // 컬럼 설정 버튼 노출여부
		exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
		searchInit: false,  // 데이터 검색 버튼 노출여부
		resizeing: true,
		rownumbers: false,
		shrinkToFit: true,
		autowidth: true,
		queryPagingGrid: true, // 쿼리 페이징 처리 여부
		height: 349,
		multiselect: true
	};
	// 그리드 생성 및 초기화
	btGrid.createGrid('materialGrid', colName, colModel, gSetting);
}

function selectMatlPopList(currentPage){
	
	var url = "/external/module/selectMatlPopList.do";
	
	var disabled = $('form[id=frmSearch]').find(':input:disabled').removeAttr('disabled');
	
	var formData = formIdAllToMap('frmSearch');
	
	disabled.attr('disabled','disabled');
	
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){
		reloadGrid("materialGrid", data.result);   // 그리드 조회 데이터 출력
	});
}
</script>