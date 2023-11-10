<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Stock Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="StockReport" />
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
						<input type="text" maxlength="18" id="MATL_CD" name="MATL_CD" style="width:214px;">
						<button class='grid_popupbtn' id='btn_matl' type='button'></button>
						<p class="data_under_text" name="MATL_NM" id="MATL_NM"></p></td>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="material.plant"/><p></td>
					<td class="medium_td">
						<select id="PLANT_CD" name="PLANT_CD" style="width:215px;" class=""></select>
					</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="physical.charg"/></p></td>
					<td class="medium_td">
						<input type="text" id="CHARG_FR" name="CHARG_FR" maxlength="18" style="width:100px;float:left;">
						<p ></p><p style="float:left; margin-left:2px; margin-right:2px;" class="box_pb_sign"> - </p>
						<input type="text" id="CHARG_TO" name="CHARG_TO" maxlength="18" style="width:100px;">
						<p></p>
					</td>
					<td class="small_td"><p><s:message code="physical.lgort"/></p></td>
					<td class="medium_td">
						<select id="STO_LOC" name="STO_LOC" style="width:215px;" class=""></select>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="physical.title"/></h4></div>
			<div class="ct_grid_top_right">  
			</div>
		</div>
		<table id="physicalSockReportGrid"></table>
		<div id="physicalSockReportGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
(function() {
	
	$("#btn_matl").click(function(e) {
		openProductPop();
	});
	
	function createPhysicalSockReportGrid() {
		// TODO
		var colName =  [
			'<s:message code="physical.matnr"/>',
			'<s:message code="physical.maktx"/>',
			'<s:message code="physical.werks"/>',
			'<s:message code="physical.name1"/>',
			'<s:message code="physical.lgort"/>',
			'<s:message code="physical.lgobe"/>',
			'<s:message code="physical.charg"/>',
			'Not Reserved Stock',
			'<s:message code="physical.lvorm"/>',
			'<s:message code="physical.clabs"/>',
			'<s:message code="physical.cumlm"/>',
			'<s:message code="physical.cinsm"/>',
			'<s:message code="physical.cspem"/>'
		];
		
		var colModel = [
			{ name: 'MATNR', width: 150, align: "center" },
			{ name: 'MAKTX', width: 200, align: "left" },
			{ name: 'WERKS', width: 70, align: "center"},
			{ name: 'NAME1', width: 200, align: "left" },
			{ name: 'LGORT', width: 100, align: "center"},
			{ name: 'LGOBE', width: 150, align: "left" },
			{ name: 'CHARG', width: 70, align: "left" },
			{ name: 'MENGE', width: 70, align: "left" },
			{ name: 'LVORM', width: 100, align: "center" , hidden: true},
			{ name: 'CLABS', width: 100, align: "right"  , hidden: true},
			{ name: 'CUMLM', width: 100, align: "right"  , hidden: true},
			{ name: 'CSPEM', width: 100, align: "right"  , hidden: true},
			{ name: 'CINSM', width: 100, align: "right"  , hidden: true},
		];
		
		var gSetting = {
			height: 609,
			pgflg: true,
			exportflg: true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting: true,  // 컬럼 설정 버튼 노출여부
			searchInit: false,  // 데이터 검색 버튼 노출여부
			resizeing: true,
			rownumbers: false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid: true // 쿼리 페이징 처리 여부
			
		};
		
		btGrid.createGrid('physicalSockReportGrid', colName, colModel, gSetting);
	}

	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	window.cSearch = function() {
		
		if(fn_empty($("#MATL_CD").val())){
			args = '<s:message code="material.materialCode"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		if(fn_empty($("#PLANT_CD").val())){
			args = '<s:message code="material.plant"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		var url = "/common/retrievePhysicalSockList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, true, param, function(data, xhr){
			if (!data.RESULT) {
				return;
			}

			console.log(data.RESULT);
			
			var mchbData;
			Array.prototype.some.call(data.RESULT, function(v) {
				if (v.tableName === 'T_MCHB') {
					
			for (var i = 0; i < v.rows.length; i++) {
							var matnrSub;
							matnrSub = v.rows[i].MATNR.substring(10, 18);
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
				reloadGrid('physicalSockReportGrid', mchbData.rows);
			});
		}

		window.cPrint = function() {
			print();
		}

		function openProductPop() {
			var url = "/popup/productPopUp.do";
			var pid = "productPopUp"; //팝업 페이지의 취상위 div ID
			var param = {
				'MATL_CD' : $("#MATL_CD").val()
			};

			popupOpen(url, pid, param, function(data) {
				if (!fn_empty(data)) {
					for (var i = 0; i < data.length; i++) {
						$("#MATL_CD").val(data[i]["MATL_CD"]);
						$("#MATL_NM").text(data[i]["MATL_DESC"]);
						$("#PLANT_CD").val(data[i]["PLANT_CD"]);
						$("#CHARG_FR").val(data[i]["BATCH_NO"]);
						$("#CHARG_TO").val(data[i]["BATCH_NO"]);

						cSearch();
					}
				}
			});
		}

		function initialize() {
			var codeBoxArray = [ 'PLANT_CD', 'STO_LOC' ];

			createCodeBoxByArr(codeBoxArray, true);
			$("#PLANT_CD").val("1000");
			createPhysicalSockReportGrid();
		}

		initialize();
	})()
</script>

<c:import url="../import/frameBottom.jsp" />