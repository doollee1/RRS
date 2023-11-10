<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Price Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="PriceReport" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#">
	<div class="tab_top_search">
		<table>
			<tbody>
				<tr>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="Price.KSCHL"/><p></td>
					<td class="medium_td">
						<select id="COND_TP" name="COND_TP" style="width:250px;" class=""></select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	
	 <div id="tabs">
	      	<ul>
	      		<li class="matrix_tab"><a href="#lead_Customer"><s:message code="Price.customer"/></a></li>
	      		<li class="matrix_tab"><a href="#lead_General"><s:message code="Price.General"/></a></li>
				<li class="matrix_tab"><a href="#lead_Nonq"><s:message code="Price.nonq"/></a></li>
			</ul>
			<form id="frmCustomer" action="#">
			<div id="lead_Customer">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4><s:message code="Price.customer"/></h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="CustGrid"></table>
					<div id="CustGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>
			</form>
			<form id="frmGeneral" action="#">
			<div id="lead_General">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4><s:message code="Price.General"/></h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="GeneralGrid"></table>
					<div id="GeneralGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>
			</form>
			<form id="frmNonq" action="#">
			<div id="lead_Nonq">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4><s:message code="Price.nonq"/></h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="NonQPartGrid"></table>
					<div id="NonQPartGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>
			</form>
	</div>
<script>
(function() {
	
	$('li').click(function() {
		
		var selectedTab = $(this).attr('aria-controls');
		
		if('lead_General' == selectedTab){
			resizeGrid('GeneralGrid');
		}else if('lead_Nonq' == selectedTab){
			resizeGrid('NonQPartGrid');
		}else if('lead_Customer' == selectedTab){
			resizeGrid('CustGrid');
		}
	});
	
	function createCustGrid() {
		// TODO
		var colName =  [
				'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.VKORG"/>'
				,'<s:message code="Price.KUNNR"/>'
				,'<s:message code="Price.MATNR"/>'
				,'<s:message code="Price.DATBI"/>'
				,'<s:message code="Price.DATAB"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.ERNAM"/>'
				,'<s:message code="Price.ERDAT"/>'
				,'<s:message code="Price.KVEWE"/>'
				,'<s:message code="Price.KOTABNR"/>'
				,'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.DATAB"/>'
				,'<s:message code="Price.DATBI"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.KOPOS"/>'
				,'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.STFKZ"/>'
				,'<s:message code="Price.KZBZG"/>'
				,'<s:message code="Price.KONMS"/>'
				,'<s:message code="Price.KRECH"/>'
				,'<s:message code="Price.KBETR"/>'
				,'<s:message code="Price.KONWA"/>'
				,'<s:message code="quotation.grd.per"/>'
				,'<s:message code="quotation.grd.uom"/>'
	  		];
	  		
	  		var colModel = [
				  { name : 'KAPPL', width : 100, align : 'center', hidden:true }
				, { name : 'KSCHL', width : 100, align : 'center' }
				, { name : 'VKORG', width : 100, align : 'left', hidden:true }
				, { name : 'KUNNR', width : 150, align : 'center' }
				, { name : 'MATNR', width : 150, align : 'center' }
				, { name : 'DATBI', width : 130, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'DATAB', width : 130, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'KNUMH', width : 120, align : 'left' }
				, { name : 'ERNAM', width : 120, align : 'left', hidden:true }
				, { name : 'ERDAT', width : 120, align : 'left', hidden:true }
				, { name : 'KVEWE', width : 100, align : 'left', hidden:true }
				, { name : 'KOTABNR', width : 100, align : 'left', hidden:true }
				, { name : 'KAPPL', width : 100, align : 'left', hidden:true }
				, { name : 'KSCHL', width : 100, align : 'left', hidden:true }
				, { name : 'DATAB', width : 100, align : 'left' , hidden:true }
				, { name : 'DATBI', width : 100, align : 'left' , hidden:true }
				, { name : 'KNUMH', width : 100, align : 'left' , hidden:true }
				, { name : 'KOPOS', width : 100, align : 'left' , hidden:true }
				, { name : 'KAPPL', width : 100, align : 'left' , hidden:true }
				, { name : 'KSCHL', width : 100, align : 'left' , hidden:true }
				, { name : 'STFKZ', width : 100, align : 'left' , hidden:true }
				, { name : 'KZBZG', width : 100, align : 'left' , hidden:true }
				, { name : 'KONMS', width : 100, align : 'left' , hidden:true }
				, { name : 'KRECH', width : 100, align : 'left' , hidden:true }
				, { name : 'KBETR', width : 100, align : 'right' }
				, { name : 'KONWA', width : 100, align : 'center' }
				, { name : 'KPEIN', width : 140, align : 'right' }
				, { name : 'KMEIN', width : 100, align : 'center' }
	  		];
		
		var gSetting = {
			height: 609,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
		};
		
		btGrid.createGrid('CustGrid', colName, colModel, gSetting);
	}
	function createGeneralGrid() {
		// TODO
		var colName =  [
				 '<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KLABC"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.VKORG"/>'
				,'<s:message code="Price.AUGRU"/>'
				,'<s:message code="Price.MATNR"/>'
				,'<s:message code="Price.DATBI"/>'
				,'<s:message code="Price.DATAB"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.ERNAM"/>'
				,'<s:message code="Price.ERDAT"/>'
				,'<s:message code="Price.KVEWE"/>'
				,'<s:message code="Price.KOTABNR"/>'
				,'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.DATAB"/>'
				,'<s:message code="Price.DATBI"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.KOPOS"/>'
				,'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.STFKZ"/>'
				,'<s:message code="Price.KZBZG"/>'
				,'<s:message code="Price.KONMS"/>'
				,'<s:message code="Price.KRECH"/>'
				,'<s:message code="Price.KBETR"/>'
				,'<s:message code="Price.KONWA"/>'
				,'<s:message code="quotation.grd.per"/>'
				,'<s:message code="quotation.grd.uom"/>'
	  		];
	  		
	  		var colModel = [
				  { name : 'KAPPL', width : 100, align : 'left', hidden:true}
				, { name : 'KLABC', width : 140, align : 'center' }
				, { name : 'KSCHL', width : 100, align : 'left', hidden:true}
				, { name : 'VKORG', width : 100, align : 'left', hidden:true}
				, { name : 'AUGRU', width : 100, align : 'left', hidden:true}
				, { name : 'MATNR', width : 150, align : 'center' }
				, { name : 'DATBI', width : 120, align : 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'DATAB', width : 120, align : 'center', formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'KNUMH', width : 100, align : 'left' , hidden:true}
				, { name : 'ERNAM', width : 100, align : 'left' , hidden:true}
				, { name : 'ERDAT', width : 100, align : 'left' , hidden:true}
				, { name : 'KVEWE', width : 100, align : 'left' , hidden:true}
				, { name : 'KOTABNR', width : 100, align : 'left' , hidden:true}
				, { name : 'KAPPL', width : 100, align : 'left' , hidden:true}
				, { name : 'KSCHL', width : 100, align : 'left' , hidden:true}
				, { name : 'DATAB', width : 100, align : 'left' , hidden:true}
				, { name : 'DATBI', width : 100, align : 'left' , hidden:true}
				, { name : 'KNUMH', width : 100, align : 'left' , hidden:true}
				, { name : 'KOPOS', width : 100, align : 'left' , hidden:true}
				, { name : 'KAPPL', width : 100, align : 'left' , hidden:true}
				, { name : 'KSCHL', width : 100, align : 'left' , hidden:true}
				, { name : 'STFKZ', width : 100, align : 'left' , hidden:true}
				, { name : 'KZBZG', width : 100, align : 'left' , hidden:true}
				, { name : 'KONMS', width : 100, align : 'left' , hidden:true}
				, { name : 'KRECH', width : 100, align : 'left' , hidden:true}
				, { name : 'KBETR', width : 100, align : 'right' }
				, { name : 'KONWA', width : 100, align : 'center' }
				, { name : 'KPEIN', width : 140, align : 'right' }
				, { name : 'KMEIN', width : 100, align : 'center' }
	  		];
		
		var gSetting = {
			height: 609,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
		btGrid.createGrid('GeneralGrid', colName, colModel, gSetting);
	}
	
	function createNonQPartGrid() {
		// TODO
		var colName =  [
				'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.VKORG"/>'
				,'<s:message code="Price.MATNR"/>'
				,'<s:message code="Price.DATBI"/>'
				,'<s:message code="Price.DATAB"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.ERNAM"/>'
				,'<s:message code="Price.ERDAT"/>'
				,'<s:message code="Price.KVEWE"/>'
				,'<s:message code="Price.KOTABNR"/>'
				,'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.DATAB"/>'
				,'<s:message code="Price.DATBI"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.KOPOS"/>'
				,'<s:message code="Price.KAPPL"/>'
				,'<s:message code="Price.KSCHL"/>'
				,'<s:message code="Price.STFKZ"/>'
				,'<s:message code="Price.KZBZG"/>'
				,'<s:message code="Price.KONMS"/>'
				,'<s:message code="Price.KRECH"/>'
				,'<s:message code="Price.KBETR"/>'
				,'<s:message code="Price.KNUMH"/>'
				,'<s:message code="Price.KOPOS"/>'
				,'<s:message code="Price.KLFN1"/>'
				,'<s:message code="Price.KSTBM"/>'
				,'<s:message code="quotation.grd.uom"/>'
				,'<s:message code="Price.KBETR"/>'
				,'<s:message code="Price.KONWA"/>'
				,'<s:message code="quotation.grd.per"/>'
				,'<s:message code="quotation.grd.uom"/>'
	  		];
	  		
	  		var colModel = [
				  { name : 'KAPPL', width : 100, align : 'left', hidden:true}
				, { name : 'KSCHL', width : 100, align : 'center' }
				, { name : 'VKORG', width : 100, align : 'left', hidden:true}
				, { name : 'MATNR', width : 140, align : 'center' }
				, { name : 'DATBI', width : 120, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'DATAB', width : 120, align : 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" } }
				, { name : 'KNUMH', width : 100, align : 'left' , hidden:true}
				, { name : 'ERNAM', width : 100, align : 'left' , hidden:true}
				, { name : 'ERDAT', width : 100, align : 'left' , hidden:true}
				, { name : 'KVEWE', width : 100, align : 'left' , hidden:true}
				, { name : 'KOTABNR', width : 100, align : 'left' , hidden:true}
				, { name : 'KAPPL', width : 100, align : 'left' , hidden:true}
				, { name : 'KSCHL', width : 100, align : 'left' , hidden:true}
				, { name : 'DATAB', width : 100, align : 'left' , hidden:true}
				, { name : 'DATBI', width : 100, align : 'left' , hidden:true}
				, { name : 'KNUMH', width : 100, align : 'left' , hidden:true}
				, { name : 'KOPOS', width : 100, align : 'left' , hidden:true}
				, { name : 'KAPPL', width : 100, align : 'left' , hidden:true}
				, { name : 'KSCHL', width : 100, align : 'left' , hidden:true}
				, { name : 'STFKZ', width : 100, align : 'left' , hidden:true}
				, { name : 'KZBZG', width : 100, align : 'left' , hidden:true}
				, { name : 'KONMS', width : 100, align : 'left' , hidden:true}
				, { name : 'KRECH', width : 100, align : 'left' , hidden:true}
				, { name : 'KBETR', width : 100, align : 'left' , hidden:true}
				, { name : 'KNUMH', width : 100, align : 'left' , hidden:true}
				, { name : 'KOPOS', width : 100, align : 'left' , hidden:true}
				, { name : 'KLFN1', width : 100, align : 'left' , hidden:true}
				, { name : 'KSTBM', width : 150, align : 'right' }
				, { name : 'KMEIN', width : 100, align : 'center' }
				, { name : 'KBETR', width : 100, align : 'right' }
				, { name : 'KONWA', width : 100, align : 'center' }
				, { name : 'KPEIN', width : 140, align : 'right' }
				, { name : 'KMEIN', width : 100, align : 'center' }
	  		];
		
		var gSetting = {
			height: 609,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
		btGrid.createGrid('NonQPartGrid', colName, colModel, gSetting);
	}
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	window.cSearch = function() {
		
		if(fn_empty($("#COND_TP").val())){
			args = '<s:message code="material.materialCode"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		var url = "/common/retrievePriceList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, true, param, function(data, xhr){
			if (!data.RESULT) {
				return;
			}
			
			console.log(data.RESULT);
			function getTableByName(arr, name) {
				var find;
				Array.prototype.some.call(arr, function(v) {
					if (v.tableName === name) {
						find = v.rows;
						return true;
					}
					return false;
				});
				
				return find;
			}
			
			var a636 = getTableByName(data.RESULT, 'ET_A636');
			var a637 = getTableByName(data.RESULT, 'ET_A637');
			var a638 = getTableByName(data.RESULT, 'ET_A638');
			
			var konh = getTableByName(data.RESULT, 'ET_KONH');
			var konp = getTableByName(data.RESULT, 'ET_KONP');
			var konm = getTableByName(data.RESULT, 'ET_KONM');
			
			// merge (CustGrid)
			var firstMerge = [];
			var kunnrSub;
			var matnrSub;
			konh.forEach(function(v) {
				a636.some(function(k) {
					if (v.KNUMH === k.KNUMH) {
						$.extend(v, k);
 						kunnrSub = v.KUNNR.substring(3,10);  
 						v.KUNNR = kunnrSub;
 						
 						matnrSub = v.MATNR.substring(10, 18);  
 						v.MATNR = matnrSub;
						firstMerge.push(v);
						return true;
					}
					return false;
				});
			});
			
			var customerPriceList = [];
			firstMerge.forEach(function(v) {
				konp.some(function(k) {
					if (v.KNUMH === k.KNUMH) {
						$.extend(v, k);
						
						customerPriceList.push(v);
						return true;
					}
					return false;
				});
			})
			reloadGrid('CustGrid', customerPriceList);
			
			// merge (GeneralGrid)
			firstMerge = [];
			konh.forEach(function(v) {
				a637.some(function(k) {
					if (v.KNUMH === k.KNUMH) {
						$.extend(v, k);
						matnrSub = v.MATNR.substring(10, 18);  
 						v.MATNR = matnrSub;
 						
						firstMerge.push(v);
						return true;
					}
					return false;
				});
			});
			
			customerPriceList = [];
			firstMerge.forEach(function(v) {
				konp.some(function(k) {
					if (v.KNUMH === k.KNUMH) {
						$.extend(v, k);
						customerPriceList.push(v);
						return true;
					}
					return false;
				});
			})
			reloadGrid('GeneralGrid', customerPriceList);
			
			// merge (NonQPartGrid)
			firstMerge = [];
			konm.forEach(function(v) {
				konp.some(function(k) {
					if (v.KNUMH === k.KNUMH && v.KOPOS === k.KOPOS) {
						$.extend(v, k);
						firstMerge.push(v);
						return true;
					}
					return false;
				});
			});
			
			customerPriceList = [];
			firstMerge.forEach(function(v) {
				a638.some(function(k) {
					if (v.KNUMH === k.KNUMH) {
						$.extend(v, k);
						customerPriceList.push(v);
						return true;
					}
					return false;
				});
			});
			
			firstMerge.forEach(function(v) {
				konh.some(function(k) {
					if (v.KNUMH === k.KNUMH) {
						$.extend(v, k);
						matnrSub = v.MATNR.substring(10, 18);  
 						v.MATNR = matnrSub;
						customerPriceList.push(v);
						return true;
					}
					return false;
				});
			})
			reloadGrid('NonQPartGrid', customerPriceList);
		});
	}
	
	window.cPrint = function() {
		print();
	}
	
	function initialize() {
		createCodeBox('COND_TP');
		createCustGrid();
		createGeneralGrid();
		createNonQPartGrid();
	}
	
	function resizeGrid(gridId) {
        var $grid = $("#"+gridId),
        newWidth = $grid.closest(".ui-jqgrid").parent().width();
        $grid.jqGrid("setGridWidth", newWidth, true);
	}
	initialize();
})()
</script>

<c:import url="../import/frameBottom.jsp" />