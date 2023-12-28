<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="BAS_YY" id="BAS_YY" />
		<input type="hidden" name="BAS_YY_SEQ" id="BAS_YY_SEQ" />
		<input type="hidden" name="PROD_SEQ" id="PROD_SEQ" />
	</form>
</div>

<div id="productPeriodPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divBtn">
			<button class='btn btn-default ' id='cBtnSearch' type='button' onclick='cSearch()'>조회</button>
			<button class='btn btn-default ' id='cBtnAdd' type='button' onclick='cAdd()'>등록</button>
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
				<col width="100px" />
		        <col width="200px" />
		    </colgroup>
		    
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="product.baseyear"/></p></td>
					<td>
						<select id="BAS_YY_PP" name="BAS_YY_PP" class="cmc_combo" style=width:80%;>
							<c:forEach var="i" items="${basyy}">
								<option value="${i.BAS_YY}">${i.BAS_YY}</option>
							</c:forEach>
						</select>
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
				<div class="ct_grid_top_right">
					<button class='cBtnclass cBtnCopy_style' id='cBtnCopy' type='button' onclick='cCopy()' disabled='disabled'>복사등록</button>
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
	
	//조회조건 변경 시 복사등록 비활성화 처리
	$("#BAS_YY_PP").change(function(){
		$("#cBtnCopy").attr("disabled", true);
		$("#cBtnSearch").attr("disabled", false);
	})
	
	$('#productPeriodPopUp').dialog({
		title: '<s:message code="product.regist"/>',
		autoOpen: false,
		width: 750,
		modal: true,
		open: function() {
			createGrid();
			cSearch();
			
			/* grid1 Event */
			$('#grid1').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
				}
			});
			
			//조회결과 없을 시 비활성화 및 alert
			if($("#BAS_YY_PP").val() == ""){
				$("#BAS_YY_PP").attr("disabled", true);
				$("#cBtnCopy").attr("disabled", true);
				$("#cBtnSearch").attr("disabled", true);
				alert("년도별 기간관리를 마저 등록해 주세요.");
			}
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
		{ name: 'ST_DT1', width: 7, align: 'center'},
		{ name: 'ED_DT1', width: 7, align: 'center'},
		{ name: 'ST_DT2', width: 7, align: 'center'},
		{ name: 'ED_DT2', width: 7, align: 'center'},
		{ name: 'ST_DT3', width: 7, align: 'center'},
		{ name: 'ED_DT3', width: 7, align: 'center'},
		{ name: 'BAS_YY', hidden:true},
		{ name: 'BAS_YY_SEQ', hidden:true},
  	];
	
	var gSetting = {
			height:200,
			pgflg:true,
			exportflg : false,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : false,  // 컬럼 설정 버튼 노출여부
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
	var param = {"BAS_YY" :formData.BAS_YY_PP};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid1", data.result);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
	});
	btGrid.gridResizing('grid1');
	
	//복사등록 비활성화 여부 설정
	$("#cBtnCopy").attr("disabled", false);
}

//그리드 더블클릭 - 상세조회
function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid1").getRowData(rowid);
	var formData = formIdAllToMap('frmProductPeriod');
	var param = {
		"modify" : true,
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
	productPeriodDetailPopUp(param);
}

//등록 버튼
function cAdd(){
	productPeriodDetailPopUp();
}

//닫기 버튼
function cCancel(){
	$('#productPeriodPopUp').dialog('close');
};
	
//상세조회 및 등록 팝업
function productPeriodDetailPopUp(param){
	var url = "/popup/ProductPeriodDetailPopUp.do";
	var pid = "productPeriodDetailPopUp";  //팝업 페이지의 최상위 div ID
	
	popupOpen(url, pid, param, function(data) {
		cSearch();
	});
}

//복사등록 팝업
function cCopy(param){
	var url = "/popup/ProductCopyPopUp.do";
	var pid = "productCopyPopUp";	//팝업 페이지의 최상위 div ID
	var formData = formIdAllToMap('frmProductPeriod');
	var param = { 
			"BAS_YY" : formData.BAS_YY_PP,
			"branch" : "period"
	}
	
	popupOpen(url, pid, param, function(data){
		
	});
}

</script>