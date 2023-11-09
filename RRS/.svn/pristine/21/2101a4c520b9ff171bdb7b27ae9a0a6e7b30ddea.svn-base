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
	<c:param name="progcd" value="Product" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>


	<!--- 검색버튼 ---->
	<!---------->

	<div id="ctu_no_resize">
		<form id="frmSearch" action="#">
			<input type="hidden" name="descGrid_CURRENT_PAGE" id="descGrid_CURRENT_PAGE" />
			<input type="hidden" name="descGrid_ROWS_PER_PAGE" id="descGrid_ROWS_PER_PAGE" />
			<input type="hidden" name="unitGrid_CURRENT_PAGE" id="unitGrid_CURRENT_PAGE" />
			<input type="hidden" name="unitGrid_ROWS_PER_PAGE" id="unitGrid_ROWS_PER_PAGE" />
			<input type="hidden" name="basicGrid_CURRENT_PAGE" id="basicGrid_CURRENT_PAGE" />
			<input type="hidden" name="basicGrid_ROWS_PER_PAGE" id="basicGrid_ROWS_PER_PAGE" />
		</form>
	</div>


<div id="ctu_wrap">	
	<!-- <input type="text"  name="lineAlign"  id="lineAlign" style="visibility:hidden;"/> -->
	<form id="frmDetail" action="#">
	
	<div class="tab_top_search">
	<table width="60%">
		<tbody>
			<tr>
				<td class="small_td"><p><s:message code="material.materialCode"/></p></td>
				<td>
					<input type="text" name="S-MATL_CD" id="S-MATL_CD" maxlength="10" onKeyPress="fn_onlyNum(this)" style="float:left; margin-right:10px; ime-mode:disabled;" ess="ess">
					<p class="data_side_text" name="S-MATL_NM" id="S-MATL_NM"></p>
				</td>
				<td class="small_td"><p><s:message code="report.quotation.materialdec"/></p></td>
				<td colspan="3">
					<input type="text" style="width:300px !important;"name="S-MATL_DESC" id="S-MATL_DESC" style="float:left; margin-right:10px; ime-mode:disabled;" ess="ess">
				</td>
			</tr>
			<tr>
				<td class="small_td"><p><s:message code="material.materialType"/></p></td>
				<td><select id="S-MATL_TP" name="S-MATL_TP" class=""></select></td>
				<td class="small_td"><p><s:message code="material.plant"/></p></td>
				<td class="medium_td"><select id="S-PLANT_CD" name="S-PLANT_CD" class=""></select></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	</div>
	
	<!-- ----------------- -->

	<!--  tab start -->
	<div id="tabs">
		<ul>
			<li class="matrix_tab"><a href="#general_tab"><s:message code="material.generalData"/></a></li>
			<li class="matrix_tab"><a href="#addttional_tab"><s:message code="material.additionalData"/></a></li>
		</ul>
		<div id="general_tab">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="material.generalData"/></h4>
				</div>
			</div>	
			<table class="table_line" width="100%">
				<tbody>
					<tr>
						<td class="td_text_right"><p><s:message code="material.basicUnit"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_BASIC_UNIT" id="MS02_BASIC_UNIT" disabled="disabled" readonly="readonly"  > 
							<p class="data_side_text"  name="MS02_BASIC_UNIT_NM" id="MS02_BASIC_UNIT_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.materialGroup"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_MATL_GR_CD" id="MS02_MATL_GR_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_MATL_GR_NM" id="MS02_MATL_GR_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.genItemCatGrp"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_GEN_ITEM_CTG_GR_CD" id="MS02_GEN_ITEM_CTG_GR_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_GEN_ITEM_CTG_GR_NM" id="MS02_GEN_ITEM_CTG_GR_NM"></p></td>
					</tr>
					<tr>
						<td class="td_text_right"><p><s:message code="material.xPlantStatus"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_X_P_STATUS_CD" id="MS02_X_P_STATUS_CD" disabled="disabled" readonly="readonly" >
							<p class="data_side_text"  name="MS02_X_P_STATUS_NM" id="MS02_X_P_STATUS_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.validFrom"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_VAL_FR_DATE" id="MS02_VAL_FR_DATE" disabled="disabled" readonly="readonly" ></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="material.productClassfication"/></h4>
				</div>
			</div>			
			<table class="table_line" width="100%">
				<tbody>
					<tr>
						<td class="td_text_right"><p><s:message code="material.productClass"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_PROD_CL_CD" id="MS02_PROD_CL_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_PROD_CL_NM" id="MS02_PROD_CL_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.cellType"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_CELL_TP" id="MS02_CELL_TP" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_CELL_TP_NM" id="MS02_CELL_TP_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.append"/></p></td>
						<td><input type="text" style="width:180px !important;"class="side_front_Sinput"  name="MS02_APPEND_TXT" id="MS02_APPEND_TXT" disabled="disabled" readonly="readonly"  ></td>
					</tr>
					<tr>
						<td class="td_text_right"><p><s:message code="material.output"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_WP_OUT_CD" id="MS02_WP_OUT_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_WP_OUT_NM" id="MS02_WP_OUT_NM"></p></td>
						<td><p>&nbsp;</p></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="material.dimensionAmpPackingMaterialData"/></h4>
				</div>
			</div>			
			<table class="table_line" width="100%">
				<tbody>
					<tr>
						<td class="td_text_right"><p><s:message code="material.grossWeight"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_GRS_WT" id="MS02_GRS_WT" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_GRS_WT_NM" id="MS02_GRS_WT_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.netWeight"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_NET_WT" id="MS02_NET_WT" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_NET_NM" id="MS02_NET_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.volume"/></p></td>
							<td><input type="text" class="side_front_Sinput"  name="MS02_VOL_QTY" id="MS02_VOL_QTY" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_VOL_NM" id="MS02_VOL_NM"></p></td>
					</tr>
				</tbody>
			</table>
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="material.salesOrg"/> <s:message code="common.data"/></h4>
				</div>
			</div>	
			<table class="table_line" width="100%">
				<tbody>
					<tr>
						<td class="td_text_right"><p><s:message code="material.salesOrg"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_SALES_ORG_CD" id="MS02_SALES_ORG_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_SALES_ORG_NM" id="MS02_SALES_ORG_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.distrChl"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_DISTRB_CH" id="MS02_DISTRB_CH" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_DISTRB_CH_NM" id="MS02_DISTRB_CH_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.division"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_DIV_CD" id="MS02_DIV_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_DIV_NM" id="MS02_DIV_NM"></p></td>
					</tr>
					<tr>
					<td class="td_text_right"><p><s:message code="material.cashDiscount"/></p></td>
					<td><label class="checkbox"><input type="checkbox" name="MS02_CASH_DC_YN" id="MS02_CASH_DC_YN" disabled="disabled" readonly="readonly"  ><i style="background-color:#efefef; border:1px solid #ccc;"></i>&nbsp;</label></td>
					</tr>
				</tbody>
			</table>
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="material.plant"/> <s:message code="common.data"/></h4>
				</div>
			</div>			
			<table class="table_line" width="100%">
				<tbody>
					<tr>
						<td class="td_text_right"><p><s:message code="material.plantSpMatlStatus"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_PLANT_SP_STS" id="MS02_PLANT_SP_STS" disabled="disabled" readonly="readonly"  ></td>
						<td class="td_text_right"><p><s:message code="material.deliveringPlant"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_DELI_PLANT_CD" id="MS02_DELI_PLANT_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_DELI_PLANT_NM" id="MS02_DELI_PLANT_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.availablityCheck"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_AVAIL_CHK_CD" id="MS02_AVAIL_CHK_CD" disabled="disabled" readonly="readonly"  >
							<p class="data_side_text"  name="MS02_AVAIL_CHK_NM" id="MS02_AVAIL_CHK_NM"></p></td>
					</tr>
					<tr>
						<td class="td_text_right"><p><s:message code="material.batchManagement"/></p></td>
						<td><label class="checkbox"><input type="checkbox" name="MS02_BATCH_MNG" id="MS02_BATCH_MNG" disabled="disabled" readonly="readonly"  ><i style="background-color:#efefef; border:1px solid #ccc;"></i>&nbsp;</label></td>
						<td class="td_text_right"><p><s:message code="material.countryOfOrgin"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_MADE_IN" id=MS02_MADE_IN disabled="disabled" readonly="readonly"  ></td>
					</tr>
				</tbody>
			</table>
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="material.generalPlantParameters"/></h4>
				</div>
			</div>	
			<table class="table_line" width="100%">
				<tbody>
					<tr>
						<td class="td_text_right"><p><s:message code="material.serialNoProfile"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_SNO_PROFILE" id="MS02_SNO_PROFILE" disabled="disabled" readonly="readonly"  >
							<p  class="data_side_text" id="MS02_SNO_PROFILE_NM"></p></td>
						<td class="td_text_right"><p><s:message code="material.profitCenter"/></p></td>
						<td><input type="text" class="side_front_Sinput"  name="MS02_PROFIT_C_CD" id="MS02_PROFIT_C_CD" disabled="disabled" readonly="readonly"  ></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<!-- Hidden Field -->
			<input type="hidden"  name="MS02_COMP_CD"  id="MS02_COMP_CD" />
			<input type="hidden"  name="MS02_MATL_CD"  id="MS02_MATL_CD" />
			<input type="hidden"  name="MS02_MATL_NM"  id="MS02_MATL_NM" />
			<input type="hidden"  name="S-SALES_ORG_CD"  id="S-SALES_ORG_CD" />
			<input type="hidden"  name="S-DISTRB_CH"  id="S-DISTRB_CH" />
			<input type="hidden"  name="S-DIV_CD"  id="S-DIV_CD" />
		</div>
		
		<!-- ------- tab2----- -->
		<div id="addttional_tab">
		
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
						<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
							<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left">
									<h4><s:message code="common.descriptions"/></h4>
								</div>
							</div>		
							<table id="descGrid"></table>
							<div id="descGrid_pager"></div>
						</div>
						
						<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
							<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left">
									<h4><s:message code="material.unitOfMeasure"/></h4>
								</div>
							</div>		
							<table id="unitGrid"></table>
							<div id="unitGrid_pager"></div>
						</div>
						
						<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
							<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left">
									<h4><s:message code="material.basicDataText"/></h4>
								</div>
							</div>		
							<table id="basicGrid"></table>
							<div id="basicGrid_pager"></div>
						</div>
						<p>&nbsp;</p>
				</div>
				<!-- 그리드 끝 -->
			</div>
		
		</div>
	</div>
	<!--  tab end -->
	<!-------------->
	
	</form>
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
		createDescGrid();
		createUnitGrid();
		createBasicGrid();
		resizeGrid();
		var codeBoxArray = [ 'S-PLANT_CD'
							, 'S-MATL_TP'
							];
			
		createCodeBoxByArr(codeBoxArray, true);
		
		$("#cBtnSearch").click(function(e){
			if(this.value != ""){
				(chkMatlCd()) ? cSearch() : openProductPop();
			}else{
				openProductPop();
			}
		})
		
		$('#S-MATL_CD, #S-MATL_DESC').on('keypress', function (e) {
			if(e.which == 13){
				if(this.value != ""){
					(chkMatlCd()) ? cSearch() : openProductPop();
				}else{
					openProductPop();
				}
			}
		});

		
		$("#tabs a").click(function(e) {
			setTimeout(function() {
				btGrid.gridResizing('descGrid');
				btGrid.gridResizing('unitGrid');
				btGrid.gridResizing('basicGrid');
			});
		});
		
		$('#MS02_BATCH_MNG, #MS02_CASH_DC_YN').on('click', function (e) {
			$(this).attr('checked', false);
		});
		
	});
	
	function createDescGrid(){
		var colName = [
					  '<s:message code="common.language"/>'
					, '<s:message code="material.grid.desc"/>'
			];
		var colModel = [
			  { name: 'LANG_CD', width: 200, align: 'center'}
			, { name: 'MATL_DESC', width: 1100, align: 'left'}
			];
		
		var gSetting = {
			height:137,
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
		btGrid.createGrid('descGrid', colName, colModel, gSetting);
	}

	function createUnitGrid(){
		var colName = [
				  'X'
				, 'AUn' //'<s:message code="material.grid.aun"/>'
				, 'Y'
				, 'BUn'
				, '<s:message code="material.grid.measuremtUnitText"/>'
				];
		var colModel = [
			  { name: 'UNIT_DIV', width: 200, align: 'center', }
			, { name: 'ALT_UNIT_CD', width: 200, align: 'center' }
			, { name: 'BS_UOM', width: 200, align: 'center', }
            , { name: 'BASIC_UNIT', width: 200, align: 'center' }
            , { name: 'UNIT_DESC', width: 1000, align: 'left', hidden:true } 
			];
		
		var gSetting = {
			height:139,
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
		btGrid.createGrid('unitGrid', colName, colModel, gSetting);
	}
	
	function createBasicGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="material.materialCode"/>'
				, '<s:message code="common.language"/>'
				, '<s:message code="common.descriptions"/>'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'MATL_CD', width: 50, align: 'center', hidden:true}
			, { name: 'LANG_CD', width: 200, align: 'center', }
			, { name: 'LONG_TEXT', width: 1100, align: 'left' }
			];
		
		var gSetting = {
			height:139,
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
		btGrid.createGrid('basicGrid', colName, colModel, gSetting);
	}
	
	function openProductPop(){
		var url = "/popup/productPopUp.do";
		var pid = "productPopUp";  //팝업 페이지의 취상위 div ID
		var param = { 'MATL_CD':$("#S-MATL_CD").val()
					, 'MATL_TP':$("#S-MATL_TP").val()
					, 'PLANT_CD':$("#S-PLANT_CD").val()
					, 'MATL_DESC':$("#S-MATL_DESC").val()
		};
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				for(var i = 0; i < data.length; i++){
					$("#S-MATL_CD").val(data[i]["MATL_CD"]);
					$("#S-PLANT_CD").val(data[i]["PLANT_CD"]);
					$("#S-SALES_ORG_CD").val(data[i]["SALES_ORG_CD"]);
					$("#S-DISTRB_CH").val(data[i]["DISTRB_CH"]);
					$("#S-DIV_CD").val(data[i]["DIV_CD"]);
					$("#S-MATL_TP").val(data[i]["MATL_TP"]);
					$("#S-MATL_DESC").val(data[i]["MATL_DESC"]);
					cSearch();
				}
			}
		});
	}
	
	function cSearch(){
		
		if($("#S-MATL_CD").val() == "" && $("#S-MATL_DESC").val() == ""){
			return;
		}
		
		var url = "/product/selectProductInfo.do";
		var param = { "param" : {
				  "MATL_CD"  : $("#S-MATL_CD").val()
				, "MATL_TP"  : $("#S-MATL_TP option:selected").val()
				, "PLANT_CD" : $("#S-PLANT_CD option:selected").val()
				, "MATL_DESC" : $("#S-MATL_DESC").val()
				, "SALES_ORG_CD" : $("#S-SALES_ORG_CD").val()
				, "DISTRB_CH" : $("#S-DISTRB_CH").val()
				, "DIV_CD" : $("#S-DIV_CD").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(data.resultProductInfo != null){
				clearText();
				fn_dataBind('frmDetail', data.resultProductInfo);
				
				$("#S-MATL_NM").text($("#MS02_MATL_NM").val());
				
				//Addttional Data 조회
				selectDescList(null);
				selectUOMList(null);
				selectBasicList(null);
			}else{
				alert('<s:message code="info.nodata.msg"/>');
				clearText();
				clearForm($('#frmDetail'));
				$("#descGrid").jqGrid("clearGridData", true);
				$("#unitGrid").jqGrid("clearGridData", true);
				$("#basicGrid").jqGrid("clearGridData", true);
			}
		});
	}
	
	function selectDescList(currentPage){
		
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#descGrid_CURRENT_PAGE').val())) {
			vCurrentPage = $('#descGrid_CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		
		vRowsPerPage = btGrid.getGridRowSel('descGrid_pager'); //현재 선택된 페이지 번호 설정
		
		$('#descGrid_CURRENT_PAGE').val(vCurrentPage);
		$('#descGrid_ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/product/selectDescList.do";
		
		var param = { "param" : {
			  "MATL_CD"  : $("#S-MATL_CD").val()
			, "COMP_CD"  : $("#MS02_COMP_CD").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("descGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#descGrid'), 'selectDescList', data.result);  // 그리드 페이징 설정
		});
	}
	
	function selectUOMList(currentPage){
		
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#unitGrid_CURRENT_PAGE').val())) {
			vCurrentPage = $('#unitGrid_CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		
		vRowsPerPage = btGrid.getGridRowSel('unitGrid_pager'); //현재 선택된 페이지 번호 설정
		
		$('#unitGrid_CURRENT_PAGE').val(vCurrentPage);
		$('#unitGrid_ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/product/selectUOMList.do";
		
		var param = { "param" : {
			  "MATL_CD"  : $("#S-MATL_CD").val()
			, "COMP_CD"  : $("#MS02_COMP_CD").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("unitGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#unitGrid'), 'selectUOMList', data.result);  // 그리드 페이징 설정
			$("table.ui-jqgrid-htable", $("#unitGrid")).css ("height", 30);
		});
	}
	
	function selectBasicList(currentPage){
		
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#basicGrid_CURRENT_PAGE').val())) {
			vCurrentPage = $('#basicGrid_CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		
		vRowsPerPage = btGrid.getGridRowSel('basicGrid_pager'); //현재 선택된 페이지 번호 설정
		
		$('#basicGrid_CURRENT_PAGE').val(vCurrentPage);
		$('#basicGrid_ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/product/selectBasicList.do";
		
		var param = { "param" : {
			  "MATL_CD"  : $("#S-MATL_CD").val()
			, "COMP_CD"  : $("#MS02_COMP_CD").val()
			, "SALES_ORG_CD" : $("#MS02_SALES_ORG_CD").val()
			, "DISTRB_CH" : $("#MS02_DISTRB_CH").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("basicGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#basicGrid'), 'selectBasicList', data.result);  // 그리드 페이징 설정
		});
	}
	
	function chkMatlCd(){
		var rtnFlg = true;
		
		var url = "/product/chkMatlCd.do";
		
		var formData = formIdAllToMap('frmDetail');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			(data.isOk == 'Y') ? rtnFlg = true : rtnFlg = false;
		});
		
		return rtnFlg;
	}
	
	function resizeGrid() {
        var $grid = $("#basicGrid"),
        newWidth = $grid.closest(".ui-jqgrid").parent().width();
        $grid.jqGrid("setGridWidth", newWidth, true);
	}
	
	function clearText() {
		$("#MS02_BASIC_UNIT_NM").text('');
		$("#MS02_MATL_GR_NM").text('');
		$("#MS02_GEN_ITEM_CTG_GR_NM").text('');
		$("#MS02_X_P_STATUS_NM").text('');
		$("#MS02_PROD_CL_NM").text('');
		$("#MS02_CELL_TP_NM").text('');
		$("#MS02_WP_OUT_NM").text('');
		$("#MS02_GRS_WT_NM").text('');
		$("#MS02_NET_NM").text('');
		$("#MS02_VOL_NM").text('');
		$("#MS02_SALES_ORG_NM").text('');
		$("#MS02_DISTRB_CH_NM").text('');
		$("#MS02_DIV_NM").text('');
		$("#MS02_DELI_PLANT_NM").text('');
		$("#MS02_AVAIL_CHK_NM").text('');
		$("#MS02_SNO_PROFILE_NM").text('');
		
	}
</script>

<c:import url="../import/frameBottom.jsp" />