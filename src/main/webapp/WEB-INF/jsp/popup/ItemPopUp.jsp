<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : ItemPopUp
	 * @Description : 제품관리 검색팝업
	 */
%>

<div id="itemPopUp">
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
							<td style="width:200px;"><select id="S_MATL_POP-PLANT_CD" name="S_MATL_POP-PLANT_CD" class="">
								</select>
							</td>
							<td><p><s:message code="material.materialGroup"/></p></td>
							<td><input type="text" name="S_MATL_POP-MATL_GR_ST" id="S_MATL_POP-MATL_GR_ST" style="width:70px; ime-mode:disabled;float:left;" maxlength="10" onKeyPress="fn_onlyNum(this)"> <p style="float:left;">~</p>
								<input type="text" name="S_MATL_POP-MATL_GR_END" id="S_MATL_POP-MATL_GR_END" style="width:70px;ime-mode:disabled;" maxlength="10" onKeyPress="fn_onlyNum(this)">
							</td>
						</tr>
						<tr>
							<td><p><s:message code="material.salesOrg"/></p></td>
							<td><select id="S_MATL_POP-SALES_ORG_CD" name="S_MATL_POP-SALES_ORG_CD" class="">
								</select>
							</td>
							<td><s:message code="material.distrChl"/></p></td>
							<td><select id="S_MATL_POP-DISTRB_CH" name="S_MATL_POP-DISTRB_CH" class="">
								</select>
							</td>
							<td><p><s:message code="material.division"/></p></td>
							<td><select id="S_MATL_POP-DIV_CD" name="S_MATL_POP-DIV_CD" class="">
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

var disFlag = '';
var batchFlg = ''; /*Batch Popup 조회여부*/
var hideBatchFlg = false;
$(function() {
	$('#itemPopUp').dialog({
		title: '<s:message code="material.materialList"/>',
		autoOpen: false,
		height:popHsize,
		width: 1050,
		modal: true,
		buttons: {
			'Confirm': { 
				text: '<s:message code="button.confirm"/>',
				click: function() {
					var url = "/salesOrder/selectBatchPopList.do";
					var param = {"param": {"MATL_CD" : $("#materialGrid").jqGrid('getCell', $('#materialGrid').jqGrid('getGridParam', 'selrow'), 'MATL_CD')
						, "PLANT_CD" : $("#materialGrid").jqGrid('getCell', $('#materialGrid').jqGrid('getGridParam', 'selrow'), 'PLANT_CD')}};
					fn_ajax(url, true, param, function(data, xhr){
						if(!fn_empty(data.batchNo) && ('Y' == disFlag) && !hideBatchFlg){
							setBatch();
						}else{
							var gridData = [$('#materialGrid').getRowData($('#materialGrid').getGridParam('selrow'))];
							p_rtnData = gridData;
							
							popupClose($('#itemPopUp').data('pid'));
						}
					});
				}
			},
			'Close': {
				text: '<s:message code="button.close"/>',
				click: function() {
					$('#itemPopUp').dialog('close');
				}
			}
		},
		open: function(e, ui) {
			
			var codeBoxArray = [  'S_MATL_POP-DIV_CD'
								, 'S_MATL_POP-DISTRB_CH'
								, 'S_MATL_POP-SALES_ORG_CD'
								, 'S_MATL_POP-MATL_TP'
								];
			
			var codeBoxArrayDp = [ 'S_MATL_POP-PLANT_CD' ];
			
			createCodeBoxByArr(codeBoxArray, true);
			setDeliPlantCombo($(this).data("SALES_ORG_CD"), $(this).data("DISTRB_CH"), $(this).data("PLANT_CD"), true)
			
			creatematerialGrid();

			$('#S_MATL_POP-MATL_CD_ST').val($(this).data("MATL_CD"));
			$('#S_MATL_POP-MATL_CD_END').val($(this).data("MATL_CD"));
			$('#S_MATL_POP-SALES_ORG_CD').val($(this).data("SALES_ORG_CD"));
			$("#S_MATL_POP-MATL_TP").val($(this).data("MATL_TP"));
			$("#S_MATL_POP-PLANT_CD").val($(this).data("PLANT_CD"));
			$("#S_MATL_POP-DISTRB_CH").val($(this).data("DISTRB_CH"));
// 			$("#S_MATL_POP-DIV_CD").val($(this).data("DIV_CD"));
			$("#S_MATL_POP-MATL_DESC").val($(this).data("MATL_DESC"));
			disFlag = $(this).data("DISFLAG");
			
			('N' == $(this).data("BATCH_FLG")) ? hideBatchFlg = true : hideBatchFlg = false;
			
			if('Y' == $(this).data("DISFLAG")){
				
// 				var url = '/salesOrder/getPlantCD2.do';
// 				var param = {"param" : { "SALES_ORG_CD" : $(this).data("SALES_ORG_CD")
// 										 , "DISTRB_CH" : $(this).data("DISTRB_CH")
// 					                     , "PLANT_CD" : $(this).data("PLANT_CD") }};
				
// 				fn_ajax(url, true, param, function(data, xhr){
// 					if(!fn_empty(data.result)){
// 						$("#S_MATL_POP-PLANT_CD").val(data.result);
// 					}
// 				});
				
				$('#S_MATL_POP-SALES_ORG_CD').prop('disabled', true);
				$("#S_MATL_POP-DISTRB_CH").prop('disabled', true);
				//$("#S_MATL_POP-PLANT_CD").prop('disabled', true);
				
				
// 				var delList = [];
				
// 				for(var i = 0; i < $("#S_MATL_POP-DIV_CD option").size(); i++){
					
// 					$("#S_MATL_POP-DIV_CD option:eq(" + i + ")").attr("selected", "selected");
					
// 					if(!('20' == $('#S_MATL_POP-DIV_CD option:selected').val() 
// 						|| '40' == $('#S_MATL_POP-DIV_CD option:selected').val()
// 						|| '90' == $('#S_MATL_POP-DIV_CD option:selected').val())){
// 						delList.push($('#S_MATL_POP-DIV_CD option:selected').val());
// 					}
// 				}
				
// 				for(var i = 0; i < delList.length; i++){
// 					$("#S_MATL_POP-DIV_CD").val(delList[i]);
// 					$("#S_MATL_POP-DIV_CD option:eq(" + $("#S_MATL_POP-DIV_CD option").index($("#S_MATL_POP-DIV_CD option:selected")) + ")").remove();
// 				}
				
				////////////////////////////////////////////////////////////////////////////
				// TODO
				//$("#S_MATL_POP-DIV_CD").prop('disabled', true);
				////////////////////////////////////////////////////////////////////////////
			}
			
			if('' != $('#S_MATL_POP-MATL_CD_ST').val()
				|| '' != $('#S_MATL_POP-MATL_TP').val()
				|| '' != $('#S_MATL_POP-PLANT_CD').val()
				|| '' != $('#S_MATL_POP-MATL_DESC').val()
				){
				selectMatlPopList(null)
			}
			
			$('#materialGrid').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var url = "/salesOrder/selectBatchPopList.do";
					var param = {"param": {"MATL_CD" : $("#materialGrid").jqGrid('getCell', $('#materialGrid').jqGrid('getGridParam', 'selrow'), 'MATL_CD')
						, "PLANT_CD" : $("#materialGrid").jqGrid('getCell', $('#materialGrid').jqGrid('getGridParam', 'selrow'), 'PLANT_CD')}};
					fn_ajax(url, true, param, function(data, xhr){
						if(!fn_empty(data.batchNo) && ('Y' == disFlag) && !hideBatchFlg){
							setBatch();
						}else{
							var gridData = [$('#materialGrid').getRowData($('#materialGrid').getGridParam('selrow'))];
							p_rtnData = gridData;
							
							popupClose($('#itemPopUp').data('pid'));
						}
					});
				}
			});
			
			$("#matlPopSearchBtn").click(function(e){
				
				if('' == $('#S_MATL_POP-MATL_CD_ST').val()
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
						){
						alert('<s:message code="validator.searchmanatory"/>');
					}else{
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
			popupClose($('#itemPopUp').data('pid'));
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
		, 'UOM_CNT'
		];
	var colModel = [
		  { name: 'MATL_CD', width: 100, align: 'center', }
		, { name: 'MATL_DESC', width: 250, align: 'left' }
		, { name: 'LONG_TEXT', width: 150, align: 'left' }
		, { name: 'PLANT_CD', width: 100, align: 'center' }
		, { name: 'SALES_ORG_CD', width: 100, align: 'center' }
		, { name: 'DISTRB_CH', width: 100, align: 'center' }
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
		, { name: 'UOM_CNT', width: 100, align: 'center', hidden:true }
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
		height : 349
	};
	// 그리드 생성 및 초기화
	btGrid.createGrid('materialGrid', colName, colModel, gSetting);
}

function selectMatlPopList(currentPage){
	
	var url = "/product/selectMatlPopList.do";
	
	var disabled = $('form[id=frmSearch]').find(':input:disabled').removeAttr('disabled');
	
	var formData = formIdAllToMap('frmSearch');
	
	disabled.attr('disabled','disabled');
	
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){
		reloadGrid("materialGrid", data.result);   // 그리드 조회 데이터 출력
		$('#materialGrid').jqGrid('setSelection', $('#materialGrid').jqGrid('getDataIDs')[0]);
	});
}

function setBatch(){
	var selRow = $('#materialGrid').jqGrid('getGridParam', 'selrow');
	var matlCd = $("#materialGrid").jqGrid('getCell', selRow, 'MATL_CD');
	var plantCd = $("#materialGrid").jqGrid('getCell', selRow, 'PLANT_CD');
	
	var url = "/popup/batchPopUp.do";
	var pid = "batchPopUp";  //팝업 페이지의 취상위 div ID
	var param = { 'MATL_CD':matlCd, 'PLANT_CD' : plantCd };
	
	popupOpen(url, pid, param, function(data){
		$("#materialGrid").jqGrid('setCell', selRow, 'BATCH_NO', data);
		
		var gridData = [$('#materialGrid').getRowData($('#materialGrid').getGridParam('selrow'))];
		p_rtnData = gridData;
	});
}

function setDeliPlantCombo(salesOrgCd, distrbCh, deliPlantCd, flag){
	
	var url = "/salesOrder/setDeliPlantCombo.do";
	var param = {"param" : {"CODE" : salesOrgCd + distrbCh}};
	
	fn_ajax(url, false, param, function(data, xhr){
		var retVal = data.result.split(';');
		
		$("#S_MATL_POP-PLANT_CD").empty().data('options');
		$("#S_MATL_POP-PLANT_CD").append('<option value=' + "" + '></option>');
		
		if(!fn_empty(data.result)){
			for(j = 0; j < retVal.length; j++){
				var tempVal = retVal[j].split(':');
				$("#S_MATL_POP-PLANT_CD").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
			}
			$('#S_MATL_POP-PLANT_CD').val(deliPlantCd);
		}
	});

}
</script>