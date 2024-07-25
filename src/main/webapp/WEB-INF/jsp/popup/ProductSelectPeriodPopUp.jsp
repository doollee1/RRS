<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="BAS_YY_SEL" id="BAS_YY_SEL" />
		<input type="hidden" name="SSN_GBN_SEL" id="SSN_GBN_SEL" />
	</form>
</div>

<div id="productSelectPeriodPopUp">
	<!--- 버튼 ---->
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
						<input type="hidden" name="BAS_YY_PS" id="BAS_YY_PS" style="width:230px;" readonly>
						<p id="BAS_YY_PS_T" style="font-size: 12px;"></p>
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
			<table id="grid2"></table>
		</div>
		<!-- grid end -->
		<br>
	</form>
</div>
<script type="text/javascript">

/* 초기 로드 */
$(function(){
	/******************************************** 
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : createGrid() / cSearch()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	$('#productSelectPeriodPopUp').dialog({
		title: '<s:message code="product.seldt"/>',
		autoOpen: false,
		width: 750,
		modal: true,
		open : function() {
			$("#BAS_YY_SEL" ).val($(this).data("BAS_YY"));
			$("#SSN_GBN_SEL").val($(this).data("SSN_GBN"));
			$("#BAS_YY_PS_T").text($(this).data("BAS_YY") + "-" + (($(this).data("SSN_GBN") == 1) ? "시즌" : "비시즌"));
			
			createGrid();
			cSearch();
			
			/* grid2 Event */
			$('#grid2').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid2_ondblClickRow(rowid, iRow, iCol, e);
				}
			});
		},
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		}
	});
});

/******************************************** 
 * @Subject : 그리드 생성 함수
 * @Content : 조회 내역 그리드 생성 
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function createGrid(){
	var colName = ['<s:message code='product.season'/>',
				   '<s:message code='product.stdt1'/>',
				   '<s:message code='product.eddt1'/>',
				   '<s:message code='product.stdt2'/>',
				   '<s:message code='product.eddt2'/>',
				   'BAS_YY',
				   'BAS_YY_SEQ',
				]
	var colModel = [
		{ name: 'SSN_GBN'   , width: 5, align: 'center'},
		{ name: 'ST_DT1'    , width: 7, align: 'center'},
		{ name: 'ED_DT1'    , width: 7, align: 'center'},
		{ name: 'ST_DT2'    , width: 7, align: 'center'},
		{ name: 'ED_DT2'    , width: 7, align: 'center'},
		{ name: 'BAS_YY'    , hidden:true},
		{ name: 'BAS_YY_SEQ', hidden:true},
	];
	
	var gSetting = {
			height:200,
			pgflg:true,
			exportflg      : false,    // 엑셀, pdf 출력 버튼 노출여부
			colsetting     : false,    // 컬럼 설정 버튼 노출여부
			searchInit     : false,    // 데이터 검색 버튼 노출여부
			resizeing      : true,
			rownumbers     : false,
			shrinkToFit    : true,
			autowidth      : true,
			queryPagingGrid: false     // 쿼리 페이징 처리 여부				
	};
	btGrid.createGrid('grid2', colName, colModel, gSetting);
}

/******************************************** 
 * @Subject : 조회 함수
 * @Content : 조회 내역 값 화면 셋팅
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function cSearch(){
	var url      = "/product/selectPeriodPopUp.do";
	var formData = formIdAllToMap('frmSearch');
	var param    = {"BAS_YY"  : formData.BAS_YY_SEL,
					"SSN_GBN" : formData.SSN_GBN_SEL
				   };
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid2", data.result);
		btGrid.gridQueryPaging($('#grid2'), 'cSearch', data.result);
	});
	btGrid.gridResizing('grid2');
}

/******************************************** 
 * @Subject : 그리드 더블클릭
 * @Content : 해당 팝업 close 선택 그리드 내용 상위 팝업에 셋팅
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function grid2_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid2").getRowData(rowid);
	parent.$("#seldt_P").val(gridData["ST_DT1"] + " ~ " + gridData["ED_DT1"]);
	parent.$("#seldt_I").val(gridData["BAS_YY_SEQ"]);
	$('#productSelectPeriodPopUp').dialog('close');
}

/* 닫기 버튼 */
function cCancel(){
	$('#productSelectPeriodPopUp').dialog('close');
};

</script>