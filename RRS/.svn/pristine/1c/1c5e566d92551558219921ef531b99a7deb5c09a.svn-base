<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Sales Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SalesRawReport" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#">
	<div class="tab_top_search">		
		<table>
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
					<td class="2coll_wide_td"><select id="SALES_ORG_CD" name="SALES_ORG_CD" class=""></select></td>
					<td class="small_td"><p><s:message code="customer.DocumentNumber"/></p></td>
					<td class="2coll_wide_td"><input type="text" name="DOC_NO" id="DOC_NO" onKeyPress="fn_onlyNum(this)" maxlength="10"></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="quotation.soldTo"/></p></td>
					<td class="2coll_wide_td"><input type="text" name="SOLD_CUST_CD" id="SOLD_CUST_CD" maxlength="10" style="float:left;">
						<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
						<p class="data_under_text" name="SOLD_CUST_NM" id="SOLD_CUST_NM"></p>
					</td>
					<td class="small_td"><p><s:message code="material.plant"/></p></td>
					<td class="2coll_wide_td"><select id="PLANT_CD" name="PLANT_CD" class=""></select></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="customer.createDate"/></p></td>
					<td class="2coll_wide_td" colspan="3">
						<input type="text" name="CREATE_ON_FR" id="CREATE_ON_FR" data-type="date" disabled="" readonly="" style="width:100px; float:left;"/>
						<p style="width:8px; float:left;">-</p>
						<input type="text" name="CREATE_ON_TO" id="CREATE_ON_TO" data-type="date" disabled="" readonly="" style="width:100px; float:left;"/>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	
	 <div id="tabs">
	      	<ul>
	      		<li class="matrix_tab"><a href="#SR_SRP">Seg/Region/Product</a></li>
	      		<li class="matrix_tab"><a href="#SR_SR">Seg/Region</a></li>
				<li class="matrix_tab"><a href="#SR_SP">Seg/Product</a></li>
	      		<li class="matrix_tab"><a href="#SR_RP">Region/Product</a></li>
	      		<li class="matrix_tab"><a href="#SR_RK">Region/KAM</a></li>
	      		<li class="matrix_tab"><a href="#SR_Rc">Region(Country)</a></li>
	      		<li class="matrix_tab"><a href="#SR_So">Segment(Occupancy)</a></li>
				<li class="matrix_tab"><a href="#SR_PS">Product Simple</a></li>
				<li class="matrix_tab" style="display:none;"><a href="#SR_RAW">SO Data Level(Raw)</a></li>
			</ul>

			<div id="SR_SRP">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Seg/Region/Product</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="SegRegionProductGrid"></table>
					<div id="SegRegionProductGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>

			<div id="SR_SR">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Seg/Region</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="SegRegionGrid"></table>
					<div id="SegRegionGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>

			<div id="SR_SP">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Seg/Product</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id=SegProductGrid></table>
					<div id="SegProductGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>

			<div id="SR_RP">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Region/Product</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="RegionProductGrid"></table>
					<div id="RegionProductGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>

			<div id="SR_RK">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Region/KAM</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="RegionKAMGrid"></table>
					<div id="RegionKAMGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>

			<div id="SR_Rc">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Region(Country)</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="RegionGrid"></table>
					<div id="RegionGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>

			<div id="SR_So">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Segment(Occupancy)</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="SegmentGrid"></table>
					<div id="SegmentGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>
			
			<div id="SR_PS">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Product Simple</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="ProductSimpleGrid"></table>
					<div id="ProductSimpleGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>
			
			<div id="SR_RAW">
			<div id="ctm_wrap">
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>SO Data Level(Raw)</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<table id="RawDataGrid"></table>
					<div id="RawDataGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			</div>
			</div>
	</div>
<script>
	var langcd = '';
	
	$(function() {
		
		$('#cBtnUser1').text("S/O Data(Raw)");
		$('#cBtnUser1').addClass("cBtnConfirm_style");
		
		langcd = getCookie("Language");
		var toDay = getToday();
		var yearFirst = getYearFirst();
		
		var codeBoxArray = [ 'SALES_ORG_CD'
			                ,'PLANT_CD'
						   ];
					
		createCodeBoxByArr(codeBoxArray, true);
		$("#SALES_ORG_CD").val("1000");
		$("#CREATE_ON_FR").val(yearFirst);
		$("#CREATE_ON_TO").val(toDay);
		
	
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#SOLD_CUST_CD').val());
		});
	
		$('#SOLD_CUST_CD').on('keyup', function (e) { 
			if (e.which  == 8 || e.which  == 46){
				if(fn_empty($("#SOLD_CUST_CD").val())){
					$("#SOLD_CUST_NM").text("");
				}
			}
		})
		
		$('li').click(function() {
			
			var selectedTab = $(this).attr('aria-controls');
			
			if('SR_SRP' == selectedTab){
				resizeGrid('SegRegionProductGrid');
			}else if('SR_SR' == selectedTab){
				resizeGrid('SegRegionGrid');
			}else if('SR_SP' == selectedTab){
				resizeGrid('SegProductGrid');
			}else if('SR_RP' == selectedTab){
				resizeGrid('RegionProductGrid');
			}else if('SR_RK' == selectedTab){
				resizeGrid('RegionKAMGrid');
			}else if('SR_Rc' == selectedTab){
				resizeGrid('RegionGrid');
			}else if('SR_So' == selectedTab){
				resizeGrid('SegmentGrid');
			}else if('SR_PS' == selectedTab){
				resizeGrid('ProductSimpleGrid');
			}else if('SR_RAW' == selectedTab){
				resizeGrid('RawDataGrid');
			}
	
			
		});
		
		initialize();
	});

	var chkcell={cellId:undefined, chkval:undefined};
	
	function createSegRegionProductGrid() {
		
		var colName =  [
				  '<s:message code="salesReport.ZSEG"/>'
			    , '<s:message code="salesReport.BSTKD"/>'
				, '<s:message code="salesReport.KVGR4"/>'
				, '<s:message code="salesReport.BEZEI_KVGR4"/>'
				, '<s:message code="salesReport.LAND1_WE"/>'
				, '<s:message code="salesReport.LANDX_WE"/>'
				, '<s:message code="salesReport.ZZREGION1"/>'
				, '<s:message code="salesReport.ZZREGION1_T"/>'
				, '<s:message code="salesReport.ZZPRODSIM"/>'
				, '<s:message code="salesReport.ZZTEXT1"/>'
				, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
				, '<s:message code="salesReport.WP_MENGE"/>'
				, '<s:message code="salesReport.WP_MENGE_SUM"/>'
				, '<s:message code="salesReport.MWP_MENGE"/>'
				, '<s:message code="salesReport.MEINS"/>'
				, '<s:message code="salesReport.KWMENG"/>'
				, '<s:message code="salesReport.VRKME"/>'
				, '<s:message code="salesReport.NETWR"/>'
				, '<s:message code="salesReport.WAERK"/>'
				, '<s:message code="salesReport.WP_NETPR"/>'
				, '<s:message code="salesReport.ZWEEK"/>'
	  		];
	  		
	  		var colModel = [
					  { name : 'ZSEG', width : 100, align : 'center', hidden:true }
					, { name : 'BSTKD', width : 100, align : 'center', cellattr: arrtSetting }
					, { name : 'KVGR4', width : 100, align : 'center', hidden:true }
					, { name : 'BEZEI_KVGR4', width : 100, align : 'center', hidden:true }
					, { name : 'LAND1_WE', width : 100, align : 'center', hidden:true }
					, { name : 'LANDX_WE', width : 170, align : 'left', cellattr: arrtSetting }
					, { name : 'ZZREGION1', width : 100, align : 'center', hidden:true }
					, { name : 'ZZREGION1_T', width : 100, align : 'center', hidden:true }
					, { name : 'ZZPRODSIM', width : 100, align : 'center', hidden:true }
					, { name : 'ZZTEXT1', width : 200, align : 'left' , cellattr: arrtSetting }
					, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
					, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
					, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
					, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
					, { name : 'MEINS', width : 100, align : 'center', hidden:true }
					, { name : 'KWMENG', width : 100, align : 'right' }
					, { name : 'VRKME', width : 100, align : 'center' }
					, { name : 'NETWR', width : 120, align : 'right' }
					, { name : 'WAERK', width : 100, align : 'center' }
					, { name : 'WP_NETPR', width : 100, align : 'right' }
					, { name : 'ZWEEK', width : 150, align : 'center' }
	  		];
	  	
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
	    
		btGrid.createGrid('SegRegionProductGrid', colName, colModel, gSetting);
	}
	
	function createSegRegionGrid() {
		var colName =  [
						  '<s:message code="salesReport.ZSEG"/>'
					    , '<s:message code="salesReport.BSTKD"/>'
						, '<s:message code="salesReport.KVGR4"/>'
						, '<s:message code="salesReport.BEZEI_KVGR4"/>'
						, '<s:message code="salesReport.LAND1_WE"/>'
						, '<s:message code="salesReport.LANDX_WE"/>'
						, '<s:message code="salesReport.ZZREGION1"/>'
						, '<s:message code="salesReport.ZZREGION1_T"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'ZSEG', width : 100, align : 'center', hidden:true }
							, { name : 'BSTKD', width : 100, align : 'center', cellattr: arrtSetting }
							, { name : 'KVGR4', width : 100, align : 'center', hidden:true }
							, { name : 'BEZEI_KVGR4', width : 100, align : 'center', hidden:true }
							, { name : 'LAND1_WE', width : 100, align : 'center', hidden:true }
							, { name : 'LANDX_WE', width : 170, align : 'left', cellattr: arrtSetting }
							, { name : 'ZZREGION1', width : 100, align : 'center', hidden:true }
							, { name : 'ZZREGION1_T', width : 100, align : 'center', hidden:true }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('SegRegionGrid', colName, colModel, gSetting);
	}
	
	function createSegProductGrid() {
		var colName =  [
						  '<s:message code="salesReport.ZSEG"/>'
					    , '<s:message code="salesReport.BSTKD"/>'
						, '<s:message code="salesReport.KVGR4"/>'
						, '<s:message code="salesReport.BEZEI_KVGR4"/>'
						, '<s:message code="salesReport.ZZPRODSIM"/>'
						, '<s:message code="salesReport.ZZTEXT1"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'ZSEG', width : 100, align : 'center', hidden:true }
							, { name : 'BSTKD', width : 100, align : 'center', cellattr: arrtSetting }
							, { name : 'KVGR4', width : 100, align : 'center', hidden:true }
							, { name : 'BEZEI_KVGR4', width : 100, align : 'center', hidden:true }
							, { name : 'ZZPRODSIM', width : 100, align : 'center', hidden:true }
							, { name : 'ZZTEXT1', width : 200, align : 'left' , cellattr: arrtSetting }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('SegProductGrid', colName, colModel, gSetting);
	}	

	function createRegionProductGrid() {
		var colName =  [
						  '<s:message code="salesReport.LAND1_WE"/>'
						, '<s:message code="salesReport.LANDX_WE"/>'
						, '<s:message code="salesReport.ZZREGION1"/>'
						, '<s:message code="salesReport.ZZREGION1_T"/>'
						, '<s:message code="salesReport.ZZPRODSIM"/>'
						, '<s:message code="salesReport.ZZTEXT1"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'LAND1_WE', width : 100, align : 'center', hidden:true }
							, { name : 'LANDX_WE', width : 170, align : 'left', cellattr: arrtSetting }
							, { name : 'ZZREGION1', width : 100, align : 'center', hidden:true }
							, { name : 'ZZREGION1_T', width : 100, align : 'center', hidden:true }
							, { name : 'ZZPRODSIM', width : 100, align : 'center', hidden:true }
							, { name : 'ZZTEXT1', width : 200, align : 'left' , cellattr: arrtSetting }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('RegionProductGrid', colName, colModel, gSetting);
	}
	
	function createRegionKAMGrid() {
		var colName =  [
						  '<s:message code="salesReport.LAND1_WE"/>'
						, '<s:message code="salesReport.LANDX_WE"/>'
						, '<s:message code="salesReport.ZZREGION1"/>'
						, '<s:message code="salesReport.ZZREGION1_T"/>'
						, '<s:message code="salesReport.ZZKAM"/>'
						, '<s:message code="salesReport.ZZKAM_T"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'LAND1_WE', width : 100, align : 'center', hidden:true }
							, { name : 'LANDX_WE', width : 170, align : 'left', cellattr: arrtSetting }
							, { name : 'ZZREGION1', width : 100, align : 'center', hidden:true }
							, { name : 'ZZREGION1_T', width : 100, align : 'center', hidden:true }
							, { name : 'ZZKAM', width : 100, align : 'center', hidden:true }
							, { name : 'ZZKAM_T', width : 200, align : 'left' , cellattr: arrtSetting }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('RegionKAMGrid', colName, colModel, gSetting);
	}	
	
	function createRegionGrid() {
		var colName =  [
						  '<s:message code="salesReport.LAND1_WE"/>'
						, '<s:message code="salesReport.LANDX_WE"/>'
						, '<s:message code="salesReport.ZZREGION1"/>'
						, '<s:message code="salesReport.ZZREGION1_T"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'LAND1_WE', width : 100, align : 'center', hidden:true }
							, { name : 'LANDX_WE', width : 170, align : 'left', cellattr: arrtSetting }
							, { name : 'ZZREGION1', width : 100, align : 'center', hidden:true }
							, { name : 'ZZREGION1_T', width : 100, align : 'center', hidden:true }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('RegionGrid', colName, colModel, gSetting);
	}	
	
	function createSegmentGrid() {
		var colName =  [
						  '<s:message code="salesReport.ZSEG"/>'
					    , '<s:message code="salesReport.BSTKD"/>'
						, '<s:message code="salesReport.KVGR4"/>'
						, '<s:message code="salesReport.BEZEI_KVGR4"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'ZSEG', width : 100, align : 'center', hidden:true }
							, { name : 'BSTKD', width : 100, align : 'center', cellattr: arrtSetting }
							, { name : 'KVGR4', width : 100, align : 'center', hidden:true }
							, { name : 'BEZEI_KVGR4', width : 100, align : 'center', hidden:true }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('SegmentGrid', colName, colModel, gSetting);
	}	
	
	function createProductSimpleGrid() {
		var colName =  [
						  '<s:message code="salesReport.ZZPRODSIM"/>'
						, '<s:message code="salesReport.ZZTEXT1"/>'
						, '<s:message code="salesReport.ZZ_LEISTUNG"/>'
						, '<s:message code="salesReport.WP_MENGE"/>'
						, '<s:message code="salesReport.WP_MENGE_SUM"/>'
						, '<s:message code="salesReport.MWP_MENGE"/>'
						, '<s:message code="salesReport.MEINS"/>'
						, '<s:message code="salesReport.KWMENG"/>'
						, '<s:message code="salesReport.VRKME"/>'
						, '<s:message code="salesReport.NETWR"/>'
						, '<s:message code="salesReport.WAERK"/>'
						, '<s:message code="salesReport.WP_NETPR"/>'
						, '<s:message code="salesReport.ZWEEK"/>'
			  		];
			  		
			  		var colModel = [
							  { name : 'ZZPRODSIM', width : 100, align : 'center', hidden:true }
							, { name : 'ZZTEXT1', width : 200, align : 'left' , cellattr: arrtSetting }
							, { name : 'ZZ_LEISTUNG', width : 110, align : 'right' }
							, { name : 'WP_MENGE', width : 100, align : 'center', hidden:true }
							, { name : 'WP_MENGE_SUM', width : 100, align : 'right' }
							, { name : 'MWP_MENGE', width : 100, align : 'center' , hidden:true}
							, { name : 'MEINS', width : 100, align : 'center', hidden:true }
							, { name : 'KWMENG', width : 100, align : 'right' }
							, { name : 'VRKME', width : 100, align : 'center' }
							, { name : 'NETWR', width : 120, align : 'right' }
							, { name : 'WAERK', width : 100, align : 'center' }
							, { name : 'WP_NETPR', width : 100, align : 'right' }
							, { name : 'ZWEEK', width : 150, align : 'center' }
			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
	    var arrtSetting = function (rowid, val, rowObject, cm, rdata) {
	    	var result = "";
	        
	        if(chkcell.chkval != val) { 
	            var cellId = this.id + '_row_'+rowid+'-'+cm.name;
	          
	            result = ' rowspan="1" id ="'+cellId+'" + name="cellRowspan"';
	            chkcell = {cellId:cellId, chkval:val};
	         
	        } else {
	            result = 'style="display:none"  rowspanid="'+chkcell.cellId+'"'; //같을 경우 display none 처리
	        }
	        return result;
	    };
		
		btGrid.createGrid('ProductSimpleGrid', colName, colModel, gSetting);
	}
	
	function createRawDataGrid() {
		var colName =  [
		                  'Order Grading'
		                , 'Sales and Distribution Document Number'
		                , 'Item number of the SD document'
		                , 'Delivery block (document header)'
		                , 'Default delivery block'
		                , 'Sales document item category'
		                , '[OMS] Segemnt'
		                , 'Attribute Order'
		                , 'Attribute Order Description'
		                , 'Occupancy'
		                , 'Occupancy Description'
		                , 'Customer purchase order number'
		                , 'Sales Document Type'
		                , 'Sold-to party'
		                , 'Name 1'
		                , 'Country Key'
		                , 'Country Name'
		                , 'VAT registration number AG'
		                , 'Ship-to party'
		                , 'Name of the ship-to party'
		                , 'Country Key'
		                , 'Country Name'
		                , 'Sales Organization'
		                , 'Distribution Channel'
		                , 'Division'
		                , 'Name of Person who Created the Object'
		                , 'Full Name of Person'
		                , 'Date on Which Record Was Created'
		                , 'KAM'
		                , 'KAM'
		                , 'KAM Region 1'
		                , 'KAM Region 1'
		                , 'KAM Region 2'
		                , 'KAM Region 2'
		                , 'Material Number'
		                , 'Short text for sales order item'
		                , 'Origin'
		                , 'Product Simple'
		                , 'Description'
		                , 'Material Group'
		                , 'Long text describing the material group'
		                , 'Plant'
		                , 'Storage Location'
		                , 'Batch Number'
		                , 'Requested delivery date'
		                , 'Schedule line date'
		                , 'Goods Issue Date'
		                , 'Calendar year / week'
		                , 'Incoterms (Part 1)'
		                , 'Incoterms (Part 2)'
		                , 'Terms of Payment Key'
		                , 'Own Explanation of Term of Payment'
		                , 'Power output'
		                , 'SO Volume in WP'
		                , 'SO Volume in WP Sum'
		                , 'Volume in MWP'
		                , 'base unit of measure'
		                , 'Cumulative Order Quantity in Sales Units'
		                , 'Sales unit'
		                , 'Net Value in Document Currency'
		                , 'SD Document Currency'
		                , 'Net price/WP'
		                , 'Delivery'
		                , 'Delivery Item'
		                , 'Actual quantity delivered (in sales units)'
		                , 'Delivery Unit'
		                , 'Actual Goods Movement Date'
		                , 'Planned goods movement date'
		                , 'Billing Volume in WP'
		                , 'Net Value in Document Currency'
		                , 'Billing Document'
		                , 'Billing item'
		                , 'Revenue Month'
		                , 'Order reason (reason for the business transaction)'
		                , 'Q partner'
		                , 'Billing Type'
		                , 'Billing category'
		                , 'Billing date for billing index and printout'
		                , 'Actual Invoiced Quantity'
		                , 'Sales unit'
		                , 'SD Document Currency'

			  		];
			  		
			  		var colModel = [
			  		              { name : 'ORD_GRAD', width : 100, align : 'center' }
			  		            , { name : 'VBELN', width : 100, align : 'center' }
			  		            , { name : 'POSNR', width : 100, align : 'center' }
			  		            , { name : 'LIFSK', width : 100, align : 'center' }
			  		            , { name : 'LIFSP', width : 100, align : 'center' }
			  		            , { name : 'PSTYV', width : 100, align : 'center' }
			  		            , { name : 'ZSEG', width : 100, align : 'center' }
			  		            , { name : 'KVGR1', width : 100, align : 'center' }
			  		            , { name : 'BEZEI_KVGR1', width : 100, align : 'center' }
			  		            , { name : 'KVGR4', width : 100, align : 'center' }
			  		            , { name : 'BEZEI_KVGR4', width : 100, align : 'center' }
			  		            , { name : 'BSTKD', width : 100, align : 'center' }
			  		            , { name : 'AUART', width : 100, align : 'center' }
			  		            , { name : 'KUNNR', width : 100, align : 'center' }
			  		            , { name : 'NAME1_AG', width : 100, align : 'center' }
			  		            , { name : 'LAND1_AG', width : 100, align : 'center' }
			  		            , { name : 'LANDX_AG', width : 100, align : 'center' }
			  		            , { name : 'STCEG_AG', width : 100, align : 'center' }
			  		            , { name : 'KUNWE', width : 100, align : 'center' }
			  		            , { name : 'NAME1_WE', width : 100, align : 'center' }
			  		            , { name : 'LAND1_WE', width : 100, align : 'center' }
			  		            , { name : 'LANDX_WE', width : 100, align : 'center' }
			  		            , { name : 'VKORG', width : 100, align : 'center' }
			  		            , { name : 'VTWEG', width : 100, align : 'center' }
			  		            , { name : 'SPART', width : 100, align : 'center' }
			  		            , { name : 'ERNAM', width : 100, align : 'center' }
			  		            , { name : 'NAME_TEXT', width : 100, align : 'center' }
			  		            , { name : 'ERDAT', width : 100, align : 'center' }
			  		            , { name : 'ZZKAM', width : 100, align : 'center' }
			  		            , { name : 'ZZKAM_T', width : 100, align : 'center' }
			  		            , { name : 'ZZREGION1', width : 100, align : 'center' }
			  		            , { name : 'ZZREGION1_T', width : 100, align : 'center' }
			  		            , { name : 'ZZREGION2', width : 100, align : 'center' }
			  		            , { name : 'ZZREGION2_T', width : 100, align : 'center' }
			  		            , { name : 'MATNR', width : 100, align : 'center' }
			  		            , { name : 'ARKTX', width : 100, align : 'center' }
			  		            , { name : 'ORIGIN', width : 100, align : 'center' }
			  		            , { name : 'ZZPRODSIM', width : 100, align : 'center' }
			  		            , { name : 'ZZTEXT1', width : 100, align : 'center' }
			  		            , { name : 'MATKL', width : 100, align : 'center' }
			  		            , { name : 'WGBEZ60', width : 100, align : 'center' }
			  		            , { name : 'WERKS', width : 100, align : 'center' }
			  		            , { name : 'LGORT', width : 100, align : 'center' }
			  		            , { name : 'CHARG', width : 100, align : 'center' }
			  		            , { name : 'VDATU', width : 100, align : 'center' }
			  		            , { name : 'EDATU', width : 100, align : 'center' }
			  		            , { name : 'WADAT', width : 100, align : 'center' }
			  		            , { name : 'ZWEEK', width : 100, align : 'center' }
			  		            , { name : 'INCO1', width : 100, align : 'center' }
			  		            , { name : 'INCO2', width : 100, align : 'center' }
			  		            , { name : 'ZTERM', width : 100, align : 'center' }
			  		            , { name : 'TEXT1', width : 100, align : 'center' }
			  		            , { name : 'ZZ_LEISTUNG', width : 100, align : 'center' }
			  		            , { name : 'WP_MENGE', width : 100, align : 'center' }
			  		            , { name : 'WP_MENGE_SUM', width : 100, align : 'center' }
			  		            , { name : 'MWP_MENGE', width : 100, align : 'center' }
			  		            , { name : 'MEINS', width : 100, align : 'center' }
			  		            , { name : 'KWMENG', width : 100, align : 'center' }
			  		            , { name : 'VRKME', width : 100, align : 'center' }
			  		            , { name : 'NETWR', width : 100, align : 'center' }
			  		            , { name : 'WAERK', width : 100, align : 'center' }
			  		            , { name : 'WP_NETPR', width : 100, align : 'center' }
			  		            , { name : 'VBELN_VL', width : 100, align : 'center' }
			  		            , { name : 'POSNR_VL', width : 100, align : 'center' }
			  		            , { name : 'LFIMG', width : 100, align : 'center' }
			  		            , { name : 'VRKME_VL', width : 100, align : 'center' }
			  		            , { name : 'WADAT_IST', width : 100, align : 'center' }
			  		            , { name : 'WADAT_VL', width : 100, align : 'center' }
			  		            , { name : 'WP_FKIMG', width : 100, align : 'center' }
			  		            , { name : 'NETWR_VF', width : 100, align : 'center' }
			  		            , { name : 'VBELN_VF', width : 100, align : 'center' }
			  		            , { name : 'POSNR_VF', width : 100, align : 'center' }
			  		            , { name : 'FKDAT_YM', width : 100, align : 'center' }
			  		            , { name : 'AUGRU_AUFT', width : 100, align : 'center' }
			  		            , { name : 'BEZEI_AUGRU', width : 100, align : 'center' }
			  		            , { name : 'FKART', width : 100, align : 'center' }
			  		            , { name : 'FKTYP', width : 100, align : 'center' }
			  		            , { name : 'FKDAT', width : 100, align : 'center' }
			  		            , { name : 'FKIMG', width : 100, align : 'center' }
			  		            , { name : 'VRKME_VF', width : 100, align : 'center' }
			  		            , { name : 'WAERK_VF', width : 100, align : 'center' }

			  		];
		
		var gSetting = {
			height: 520,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			rownumbers: false,
			//shrinkToFit: true,
			autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
		btGrid.createGrid('RawDataGrid', colName, colModel, gSetting);
	}


	
	function cSearch(currentPage){
		
		var param = {
				SALES_ORG_CD: document.getElementById('SALES_ORG_CD').value,
				DOC_NO: document.getElementById('DOC_NO').value,
				SOLD_CUST_CD: document.getElementById('SOLD_CUST_CD').value,
				CREATE_ON_FR: document.getElementById('CREATE_ON_FR').value.split('.').reverse().join(''),
				CREATE_ON_TO: document.getElementById('CREATE_ON_TO').value.split('.').reverse().join(''),
				PLANT_CD: document.getElementById('PLANT_CD').value
			};
		
		var url = "/common/retrieveSalesReportList.do";
		
		fn_ajax(url, true, param, function(data, xhr){
			if (!data.RESULT) {
				return;
			}
					
			var tab1Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB1') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;							
							
					}
					tab1Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab1Data && tab1Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('SegRegionProductGrid', tab1Data.rows);
			
			var tab2Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB2') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab2Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab2Data && tab2Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('SegRegionGrid', tab2Data.rows);

			var tab3Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB3') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab3Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab3Data && tab3Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('SegProductGrid', tab3Data.rows);

			var tab4Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB4') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab4Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab4Data && tab4Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('RegionProductGrid', tab4Data.rows);


			var tab5Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB5') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab5Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab5Data && tab5Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('RegionKAMGrid', tab5Data.rows);

			var tab6Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB6') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab6Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab6Data && tab6Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('RegionGrid', tab6Data.rows);
			
			var tab7Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB7') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab7Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab7Data && tab7Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('SegmentGrid', tab7Data.rows);	

			var tab8Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_TAB8') {
					for (var i = 0; i < v.rows.length; i++) {
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;
						
						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;

						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 

						var soQty;
						soQty = createNormalFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;
					}
					tab8Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab8Data && tab8Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('ProductSimpleGrid', tab8Data.rows);
			

			var tab9Data;			
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_BASE') {
					for (var i = 0; i < v.rows.length; i++) {
						
						var vbeln;
						vbeln = v.rows[i].VBELN.replace(/(^0+)/, "");
						v.rows[i].VBELN = vbeln;

						var posnr;
						posnr = v.rows[i].POSNR.replace(/(^0+)/, "");
						v.rows[i].POSNR = posnr;

						var kunnr;
						kunnr = v.rows[i].KUNNR.replace(/(^0+)/, "");
						v.rows[i].KUNNR = kunnr;

						var kunwe;
						kunwe = v.rows[i].KUNWE.replace(/(^0+)/, "");
						v.rows[i].KUNWE = kunwe;

						var erdat;					
						erdat = v.rows[i].ERDAT.substring(8, 10) + '.' +v.rows[i].ERDAT.substring(5, 7) + '.' + v.rows[i].ERDAT.substring(0, 4);				
						v.rows[i].ERDAT = erdat;

						var matnr;
						matnr = v.rows[i].MATNR.replace(/(^0+)/, "");
						v.rows[i].MATNR = matnr;

						var vdatu;					
						vdatu = v.rows[i].VDATU.substring(8, 10) + '.' +v.rows[i].VDATU.substring(5, 7) + '.' + v.rows[i].VDATU.substring(0, 4);				
						v.rows[i].VDATU = vdatu;

						var edatu;					
						edatu = v.rows[i].EDATU.substring(8, 10) + '.' +v.rows[i].EDATU.substring(5, 7) + '.' + v.rows[i].EDATU.substring(0, 4);				
						v.rows[i].EDATU = edatu;

						var wadat;					
						wadat = v.rows[i].WADAT.substring(8, 10) + '.' +v.rows[i].WADAT.substring(5, 7) + '.' + v.rows[i].WADAT.substring(0, 4);				
						v.rows[i].WADAT = wadat;
						
						var wp_menge;
						wp_menge = createGridNumFm(Number(v.rows[i].WP_MENGE).toFixed(3));						
						v.rows[i].WP_MENGE = wp_menge; 
						
						var wpSum;
						wpSum = createGridNumFm(Number(v.rows[i].WP_MENGE_SUM).toFixed(3));						
						v.rows[i].WP_MENGE_SUM = wpSum; 
						
						var mwp_menge;
						mwp_menge = createGridNumFm(Number(v.rows[i].MWP_MENGE).toFixed(3));						
						v.rows[i].MWP_MENGE = mwp_menge; 

						var yearweek;					
						yearweek = v.rows[i].ZWEEK.substring(4, 6) + '.' + v.rows[i].ZWEEK.substring(0, 4);				
						v.rows[i].ZWEEK = yearweek;
						
						var meins;
						meins = v.rows[i].MEINS;
						if ( langcd != 'DE' && meins == 'ST' ) meins = 'PCS'; 
						v.rows[i].MEINS = meins;
						
						var unit;
						unit = v.rows[i].VRKME;
						if ( langcd != 'DE' && unit == 'ST' ) unit = 'PCS'; 
						v.rows[i].VRKME = unit;						

						var soQty;
						soQty = createGridNumFm(Number(v.rows[i].KWMENG).toFixed());						
						v.rows[i].KWMENG = soQty; 
						
						var amount;
						amount = createGridNumFm(Number(v.rows[i].NETWR).toFixed(2));						
						v.rows[i].NETWR = amount; 
						
						var wpPrice;
						wpPrice = createGridNumFm(Number(v.rows[i].WP_NETPR).toFixed(2));						
						v.rows[i].WP_NETPR = wpPrice;

						var vbeln_vl;
						vbeln_vl = v.rows[i].VBELN_VL.replace(/(^0+)/, "");
						v.rows[i].VBELN_VL = vbeln_vl;

						var posnr_vl;
						posnr_vl = v.rows[i].POSNR_VL.replace(/(^0+)/, "");
						v.rows[i].POSNR_VL = posnr_vl;

						var lfimg;
						lfimg = createGridNumFm(Number(v.rows[i].LFIMG).toFixed());						
						v.rows[i].LFIMG = lfimg; 

						var vrkme_vl;
						vrkme_vl = v.rows[i].VRKME_VL;
						if ( langcd != 'DE' && vrkme_vl == 'ST' ) vrkme_vl = 'PCS'; 
						v.rows[i].VRKME_VL = vrkme_vl;	

						var wadat_ist;					
						wadat_ist = v.rows[i].WADAT_IST.substring(8, 10) + '.' +v.rows[i].WADAT_IST.substring(5, 7) + '.' + v.rows[i].WADAT_IST.substring(0, 4);	
						v.rows[i].WADAT_IST = wadat_ist;

						var wadat_vl;					
						wadat_vl = v.rows[i].WADAT_VL.substring(8, 10) + '.' +v.rows[i].WADAT_VL.substring(5, 7) + '.' + v.rows[i].WADAT_VL.substring(0, 4);	
						v.rows[i].WADAT_VL = wadat_vl;

						var wp_fkimg;
						wp_fkimg = createGridNumFm(Number(v.rows[i].WP_FKIMG).toFixed());						
						v.rows[i].WP_FKIMG = wp_fkimg; 

						var netwr_vf;
						netwr_vf = createGridNumFm(Number(v.rows[i].NETWR_VF).toFixed(2));						
						v.rows[i].NETWR_VF = netwr_vf;

						var vbeln_vf;
						vbeln_vf = v.rows[i].VBELN_VF.replace(/(^0+)/, "");
						v.rows[i].VBELN_VF = vbeln_vf;

						var posnr_vf;
						posnr_vf = v.rows[i].POSNR_VF.replace(/(^0+)/, "");
						v.rows[i].POSNR_VF = posnr_vf;

						var fkdat_ym;					
						fkdat_ym = v.rows[i].FKDAT_YM.substring(4, 6) + '.' + v.rows[i].FKDAT_YM.substring(0, 4);				
						v.rows[i].FKDAT_YM = fkdat_ym;

						var fkdat;					
						fkdat = v.rows[i].FKDAT.substring(8, 10) + '.' +v.rows[i].FKDAT.substring(5, 7) + '.' + v.rows[i].FKDAT.substring(0, 4);	
						v.rows[i].FKDAT = fkdat;

						var fkimg;
						fkimg = createGridNumFm(Number(v.rows[i].FKIMG).toFixed());						
						v.rows[i].FKIMG = fkimg; 

						var vrkme_vf;
						vrkme_vf = v.rows[i].VRKME_VF;
						if ( langcd != 'DE' && vrkme_vf == 'ST' ) vrkme_vf = 'PCS'; 
						v.rows[i].VRKME_VF = vrkme_vf;	

					}
					tab9Data = v;
					return true;
				}
				return false;
			});
			
			if (!!tab9Data && tab9Data.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('RawDataGrid', tab9Data.rows);
			
		});
	}

	function initialize() {
		createSegRegionProductGrid();
		createSegRegionGrid();
		createSegProductGrid();
		createRegionProductGrid();
		createRegionKAMGrid();
		createRegionGrid();
		createSegmentGrid();
		createProductSimpleGrid();
		createRawDataGrid();
	}
	
	function resizeGrid(gridId) {
	    var $grid = $("#"+gridId),
	    newWidth = $grid.closest(".ui-jqgrid").parent().width();
	    $grid.jqGrid("setGridWidth", newWidth, true);
	}
	
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$("#SOLD_CUST_CD").val(selecedData.CUST_CD);
				$("#SOLD_CUST_NM").text(selecedData.CUST_NM);
			}
		});
	}

	function cUser1() {
		var gid = 'RawDataGrid';
		btGrid.gridSaveRow(gid);
		var newcolModel=[];
		var colModel=$('#'+gid).jqGrid('getGridParam','colModel');
		var colName=$('#'+gid).jqGrid('getGridParam','colNames');
		var gridData=$('#'+gid).jqGrid('getGridParam','data');
		var title=$('#'+gid).parent().parent().parent().parent().prev().children().first().text().replace('*','').trim();
		title=fn_empty(title)?'Excel':title;
		if(gridData.length==0){
			alert('No Data Found.');
			return false;
		}
		for(var i=0,len=colModel.length;i<len;i++){
			if(colModel[i].hidden===true){continue;}
			if(colModel[i].colmenu===false){continue;}
			var rowdata={};
			rowdata['label']=colName[i];
			rowdata['name']=colModel[i].name;
			rowdata['width']=colModel[i].width;
			rowdata['align']=fn_empty(colModel[i].align)?'left':colModel[i].align;
			rowdata['formatter']=fn_empty(colModel[i].formatter)?'':colModel[i].formatter;
			newcolModel.push(rowdata);
			if(colModel[i].formatter=='select'){
				$('#' + gid).jqGrid('setColProp',colModel[i].name,{unformat:gridUnfmt});
			}
		}
		var rowNumtemp = $('#' + gid).jqGrid('getGridParam', 'rowNum');
		var scrolltemp = $('#' + gid).jqGrid('getGridParam', 'scroll');
		var pgbuttonstemp = $('#' + gid).jqGrid('getGridParam', 'pgbuttons');
		$('#' + gid).jqGrid('setGridParam', {rowNum:1000000000,scroll:1,pgbuttons:false});
		var gridDatatemp = $('#' + gid).getRowData();
		$('#' + gid).jqGrid('setGridParam', {rowNum:rowNumtemp,scroll:scrolltemp,pgbuttons:pgbuttonstemp});
		$('#' + gid).trigger('reloadGrid');
		for(vari=0,len=colModel.length;i<len;i++){
			if(colModel[i].formatter == 'select'){
				$('#' + gid).jqGrid('setColProp', colModel[i].name, {unformat:null});
			}
		}
		var param={'colModel':newcolModel,'gridData':gridDatatemp,'title':title};
		fn_ajax('/common/saveGridExcel.do',true,param,function(data,xhr){
			var exceldata=base64DecToArr(data.exceldata);
			var filename=title+'.xlsx';
			var blob=new Blob([exceldata],{
				type:'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'});
				if(typeof window.navigator.msSaveBlob!=='undefined'){
					window.navigator.msSaveBlob(blob,filename);
				}else{
					var URL=window.URL||window.webkitURL;
					var downloadUrl=URL.createObjectURL(blob);
					if(filename){
						var a=document.createElement('a');
						if(typeof a.download==='undefined'){
							window.location=downloadUrl;
						}else{
							a.href=downloadUrl;
							a.download=filename;
							document.body.appendChild(a);
							a.click();
						}
					}else{
						window.location=downloadUrl;
					}
					setTimeout(function(){
						URL.revokeObjectURL(downloadUrl);
					},100);
				}
			});		
	}
	

</script>

<c:import url="../import/frameBottom.jsp" />