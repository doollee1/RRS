<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="ST_DT1_SEL" id="ST_DT1_SEL" />
		<input type="hidden" name="SSN_GBN_SEL" id="SSN_GBN_SEL" />
	</form>
</div>

<div id="productSelectPeriodPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divBtn">
			<button class='btn btn-default ' id='cBtnCancel' type='button' onclick='cCancel()'>닫기</button>
		</div>
	</div>
	
	<!---------->
	<form id="frmProductPeriod" action="#">
		<div class="ct_grid_top_left">
			<h4>조회조건</h4>
		</div>	
		<div class="tab_top_search">
		<table>
			<colgroup>
				<col width="120px" />
		        <col width="300px" />
		    </colgroup>
		    
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="product.bas-season"/></p></td>
					<td>
						<input type="hidden" name="ST_DT1" id="ST_DT1" style="width:230px;" readonly>
						<p id="ST_DT1_T" style="font-size: 12px;"></p>
					</td>
				</tr>
			</tbody>
		</table>
		</div> 
		
		<!-- grid start -->
		<div id="ctm_mg_wrap">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4>조회내역</h4>
				</div>	
			</div>
			<table id="grid1"></table>
		</div>
		<!-- grid end -->
		<br>
	</form>
</div>
<script type="text/javascript">

//초기 로드
$(function(){
	$('#productSelectPeriodPopUp').dialog({
		title: '<s:message code="product.seldt"/>',
		autoOpen: false,
		width: 750,
		modal: true,
		open: function() {
			$("#ST_DT1_SEL").val($(this).data("ST_DT1"));
			$("#SSN_GBN_SEL").val($(this).data("SSN_GBN"));
			$("#ST_DT1_T").text($(this).data("ST_DT1") + "-" + $(this).data("SSN_GBN"));
			
			createGrid();
			cSearch();
			
			/* grid1 Event */
			$('#grid1').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
				}
			});
		},
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		}
	});
});

//그리드 그리기
function createGrid(){
	var colName = ['<s:message code='product.season'/>',
				'<s:message code='product.stdt1'/>',
				'<s:message code='product.eddt1'/>',
				'<s:message code='product.stdt2'/>',
				'<s:message code='product.eddt2'/>',
				'<s:message code='product.stdt3'/>',
				'<s:message code='product.eddt3'/>',
				'BAS_YY',
				'BAS_YY_SEQ',
				]
	var colModel = [
		{ name: 'SSN_GBN', width: 5, align: 'center'},
		{ name: 'ST_DT1', width: 7, align: 'right'},
		{ name: 'ED_DT1', width: 7, align: 'right'},
		{ name: 'ST_DT2', width: 7, align: 'right'},
		{ name: 'ED_DT2', width: 7, align: 'right'},
		{ name: 'ST_DT3', width: 7, align: 'right'},
		{ name: 'ED_DT3', width: 7, align: 'right'},
		{ name: 'BAS_YY', hidden:true},
		{ name: 'BAS_YY_SEQ', hidden:true},
  	];
	
	var gSetting = {
			height:200,
			pgflg:true,
			exportflg : false,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:false // 쿼리 페이징 처리 여부				
	};
	btGrid.createGrid('grid1', colName, colModel, gSetting);
}

//조회
function cSearch(){
	var url = "/common/selectPeriodInfo.do";
	
	var formData = formIdAllToMap('frmProductPeriod');
	var param = {"ST_DT1" :formData.ST_DT1};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid1", data.result);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
	});
	btGrid.gridResizing('grid1');
	
}

//그리드 더블클릭 - 상세조회
function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid1").getRowData(rowid);
	var formData = formIdAllToMap('frmProductPeriod');
	var param = {
		"BAS_YY" : gridData["BAS_YY"],				// 기준년도
		"BAS_YY_SEQ" : gridData["BAS_YY_SEQ"],		// 기준년도 순번
		"SSN_GBN" : gridData["SSN_GBN"],			// 시즌구분
		"ST_DT1" : gridData["ST_DT1"],				// 시작일1
		"ED_DT1" : gridData["ED_DT1"],				// 종료일1
		"ST_DT2" : gridData["ST_DT2"],				// 시작일2
		"ED_DT2" : gridData["ED_DT2"],				// 종료일2
		"ST_DT3" : gridData["ST_DT3"],				// 시작일3
		"ED_DT3" : gridData["ED_DT3"],				// 종료일3
	};
	alert("더블클릭");
// 	productPeriodDetailPopUp(param);
}

//닫기 버튼
function cCancel(){
	$('#productSelectPeriodPopUp').dialog('close');
};

</script>