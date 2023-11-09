<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Available Stock Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="AvailableStockReport" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#">
	<div class="tab_top_search">
		<table>
			<tbody>
				<tr>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="material.materialCode"/><p></td>
					<td class="medium_td">
						<input type="text" id="MATL_CD_FR" name="MATL_CD_FR" maxlength="18" style="width:100px;float:left;">
						<button class='grid_popupbtn' id='btn_matl1' type='button'></button>
						<p ></p><p style="float:left;" class="box_pb_sign"> - </p>
						<input type="text" id="MATL_CD_TO" name="MATL_CD_TO" maxlength="18" style="width:100px;">
						<button class='grid_popupbtn' id='btn_matl2' type='button'></button>
						<p></p>
					</td>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="physical.werks"/><p></td>
					<td class="medium_td">
						<select id="PLANT_CD" name="PLANT_CD" style="width:215px;" class=""></select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="title.availablestock"/></h4></div>
			<div class="ct_grid_top_right">  
			</div>
		</div>
		<table id="SockReportGrid"></table>
		<div id="SockReportGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
(function() {
	
	$("#btn_matl1").click(function(e) {
		openProductPop1();
	});
	
	$("#btn_matl2").click(function(e) {
		openProductPop2();
	});
	
	function createSockReportGrid() {
		// TODO
		var colName =  [
  			 	  '<s:message code="material.materialCode"/>'
	  			, '<s:message code="material.material"/>'
	  			, '<s:message code="physical.werks"/>'
	  			, '<s:message code="material.sotckQty"/>'
	  		];
	  		
	  		var colModel = [
	  			  { name: 'MATNR', width : 150, align: 'center' }
	  			, { name: 'MAKTX', width : 300, align: 'left' }
	  			, { name: 'WERKS', width : 70, align: 'center' }
	  			, { name: 'ZZ_ATP_G4', width : 150, align: 'right' }
	  		];
		
		var gSetting = {
			height: 609,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			resizeing: true,
			rownumbers: false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
		btGrid.createGrid('SockReportGrid', colName, colModel, gSetting);
	}

	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	window.cSearch = function() {
		
		if(fn_empty($("#MATL_CD_FR").val()) && fn_empty($("#MATL_CD_TO").val())){
			args = '<s:message code="material.materialCode"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		if(fn_empty($("#PLANT_CD").val())){
			args = '<s:message code="material.plant"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		var url = "/common/retrieveAvailableStockList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, true, param, function(data, xhr){
			if (!data.RESULT) {
				return;
			}
			var mchbData;
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'ET_DATA') {
					for(var i=0; i<v.rows.length; i++){
						var matnrSub;
						matnrSub = v.rows[i].MATNR.substring(10,18);  
						v.rows[i].MATNR = matnrSub;
					}
					mchbData = v;
					return true;
				}
				return false;
			});
			
			if (!!mchbData && mchbData.rows.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
			reloadGrid('SockReportGrid', mchbData.rows);
		});
	}
	
	window.cPrint = function() {
		print();
	}
	
	function openProductPop1() {
		var url = "/popup/productPopUp.do";
		var pid = "productPopUp"; //팝업 페이지의 취상위 div ID
		var param = {
			'MATL_CD' : $("#MATL_CD_FR").val()
		};

		popupOpen(url, pid, param, function(data) {
			if (!fn_empty(data)) {
				for (var i = 0; i < data.length; i++) {
					$("#MATL_CD_FR").val(data[i]["MATL_CD"]);
// 					$("#MATL_NM").text(data[i]["MATL_DESC"]);
// 					$("#PLANT_CD").val(data[i]["PLANT_CD"]);
// 					$("#CHARG_FR").val(data[i]["BATCH_NO"]);
// 					$("#CHARG_TO").val(data[i]["BATCH_NO"]);

					cSearch();
				}
			}
		});
	}
	
	function openProductPop2() {
		var url = "/popup/productPopUp.do";
		var pid = "productPopUp"; //팝업 페이지의 취상위 div ID
		var param = {
			'MATL_CD' : $("#MATL_CD_TO").val()
		};

		popupOpen(url, pid, param, function(data) {
			if (!fn_empty(data)) {
				for (var i = 0; i < data.length; i++) {
					$("#MATL_CD_TO").val(data[i]["MATL_CD"]);
// 					$("#MATL_NM").text(data[i]["MATL_DESC"]);
// 					$("#PLANT_CD").val(data[i]["PLANT_CD"]);
// 					$("#CHARG_FR").val(data[i]["BATCH_NO"]);
// 					$("#CHARG_TO").val(data[i]["BATCH_NO"]);

					cSearch();
				}
			}
		});
	}
	
	function initialize() {
		var codeBoxArray = [ 'PLANT_CD'
							, 'STO_LOC'
							   ];
					
		createCodeBoxByArr(codeBoxArray, true);
		$("#PLANT_CD").val("1000");
		createSockReportGrid();
		fn_codeval({type:'COMM',btn_id:'cmm_pop_MATL_GR',head_id:'MATL_GR',code:'MATL_GR',name:'MATL_GR_NM'});
		
	}
	
	initialize();
})()
</script>

<c:import url="../import/frameBottom.jsp" />