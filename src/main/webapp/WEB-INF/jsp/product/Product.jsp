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
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="BAS_YY" id="BAS_YY" />
		<input type="hidden" name="BAS_YY_SEQ" id="BAS_YY_SEQ" />
		<input type="hidden" name="PROD_SEQ" id="PROD_SEQ" />
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
	</form>
</div>

<div id="ctu_wrap">	
	<!-- <input type="text"  name="lineAlign"  id="lineAlign" style="visibility:hidden;"/> -->
	<form id="frmDetail" action="#">
		<div class="ct_grid_top_left">
			<h4>조회조건</h4>
		</div>	
		<div class="tab_top_search">
		<table>
			<colgroup>
				<col width="100px" />
		        <col width="200px" />
		        <col width="100px" />
	        	<col width="200px" />
		    </colgroup>
		    
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="product.baseyear"/></p></td>
					<td>
						<select id="ST_DT1" name="ST_DT1" class="cmc_combo" style=width:80%;>
							<c:forEach var="i" items="${basyy}">
								<option value="${i.BAS_YY}">${i.BAS_YY}</option>
							</c:forEach>
						</select>
					</td>
					<td class="small_td"><p><s:message code="product.season"/></p></td>
					<td class="medium_td">
						<select id="SSN_GBN" name="SSN_GBN" class="" style=width:80%;>
							<c:forEach var="i" items="${season}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
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
			<div id="grid1_pager"></div>
		</div>
		<!-- grid end -->
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
		
	//미리보기, 기준년도관리, 조회, 등록, 닫기 버튼
	$("#divBtn").append("<button class='cBtnclass cBtnPut_style' id='cBtnPut' type='button' onclick=''>미리보기</button>");
	$("#divBtn").append("<button class='cBtnclass cBtnEdit_style' id='cBtnPeriod' type='button' onclick='cPeriod()'>기준년도관리</button>");
    $("#divBtn").append("<button class='cBtnclass cBtnSearch_style' id='cBtnSearch' type='button' onclick='cSearch();'>조회</button>");
    $("#divBtn").append("<button class='cBtnclass cBtnAdd_style' id='cBtnAdd' type='button' onclick='cAdd();'>등록</button>");
    $("#divBtn").append("<button class='cBtnclass cBtnCancel_style' id='cBtnCancel' type='button' onclick='cCancel();'>닫기</button>");
	    
    //즐겨찾기 숨기기
    $("#cBtnUser6").hide();
    
    //초기 진입시 시작 (그리드그리기와 조회)
	createGrid();
	cSearch();
	
	/* grid1 Event */
	$('#grid1').jqGrid('setGridParam', {
		ondblClickRow: function(rowid, iRow, iCol, e) {
			grid1_ondblClickRow(rowid, iRow, iCol, e);
		}
	});
	
	//조회조건 변경 시 복사등록 비활성화 처리
	$("#ST_DT1, #SSN_GBN").change(function(){
		$("#cBtnCopy").attr("disabled", true);
	})
});

//그리드 그리기
function createGrid(){
	var colName = ['<s:message code='product.season'/>',
				'<s:message code='product.item'/>',
				'<s:message code='product.condition'/>',
				'<s:message code='product.stdt1'/>',
				'<s:message code='product.eddt1'/>',
				'<s:message code='product.stdt2'/>',
				'<s:message code='product.eddt2'/>',
				'<s:message code='product.stdt3'/>',
				'<s:message code='product.eddt3'/>',
				'<s:message code='product.amount'/>',
				'<s:message code='product.etc'/>',
				'<s:message code='product.amount'/>',
				'<s:message code='product.etc'/>',
				'BAS_YY',
				'BAS_YY_SEQ',
				'PROD_SEQ',
				'COM_BAS_PER',
				'COM_BAS_DAY',
				'AGN_BAS_PER',
				'AGN_BAS_DAY',
				]
	var colModel = [
		{ name: 'SSN_GBN', width: 5, align: 'center'},
		{ name: 'HDNG_GBN', width: 5, align: 'center'},
		{ name: 'PROD_COND', width: 5, align: 'center'},
		{ name: 'ST_DT1', width: 7, align: 'right'},
		{ name: 'ED_DT1', width: 7, align: 'right'},
		{ name: 'ST_DT2', width: 7, align: 'right'},
		{ name: 'ED_DT2', width: 7, align: 'right'},
		{ name: 'ST_DT3', width: 7, align: 'right'},
		{ name: 'ED_DT3', width: 7, align: 'right'},
		{ name: 'COM_AMT', width: 7, align: 'right'},
		{ name: 'COM_CNTN', width: 7, align: 'right'},
		{ name: 'AGN_AMT', width: 7, align: 'right'},
		{ name: 'AGN_CNTN', width: 7, align: 'right'},
		{ name: 'BAS_YY', hidden:true},
		{ name: 'BAS_YY_SEQ', hidden:true},
		{ name: 'PROD_SEQ', hidden:true},
		{ name: 'COM_BAS_PER', hidden:true},
		{ name: 'COM_BAS_DAY', hidden:true},
		{ name: 'AGN_BAS_PER', hidden:true},
		{ name: 'AGN_BAS_DAY', hidden:true},
  	];
	
	var gSetting = {
			height:600,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true, // 쿼리 페이징 처리 여부	
	};
	btGrid.createGrid('grid1', colName, colModel, gSetting);
	
	$('#grid1').jqGrid('setGroupHeaders', {
		useColSpanStyle: true, 
		groupHeaders:[
			{startColumnName: 'ST_DT1', numberOfColumns: 2, titleText: '기간1'},
			{startColumnName: 'ST_DT2', numberOfColumns: 2, titleText: '기간2'},
			{startColumnName: 'ST_DT3', numberOfColumns: 2, titleText: '기간3'},
			{startColumnName: 'COM_AMT', numberOfColumns: 2, titleText: '일반'},
			{startColumnName: 'AGN_AMT', numberOfColumns: 2, titleText: '에이전시'},
			]
	});
	
	btGrid.gridResizing('grid1');
	
}
	
//조회
function cSearch(currentPage){
	var vCurrentPage = 1;
	var vRowsPerPage;
	if(!fn_empty(currentPage)){
		vCurrentPage = currentPage;
	} else if(!fn_empty($('#CURRENT_PAGE').val())) {
		vCurrentPage = $('#CURRENT_PAGE').val();
	} else {
		vCurrentPage = 1;
	}
	vRowsPerPage = btGrid.getGridRowSel('grid1_pager');
	$('#CURRENT_PAGE').val(vCurrentPage);
	$('#ROWS_PER_PAGE').val(vRowsPerPage);
	
	var url = "/common/selectProductInfo.do";
	
	var formData = formIdAllToMap('frmDetail');
	var param = {"ST_DT1" :formData.ST_DT1
				,"SSN_GBN":formData.SSN_GBN};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid1", data.result);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
	});
	
	//복사등록 비활성화 여부 설정
	var cBtnCopy = document.getElementById("cBtnCopy");
	if(param.SSN_GBN == 3) {
		cBtnCopy.disabled = false;
	} else {
		cBtnCopy.disabled = true;
	}
	vRowsPerPage = btGrid.getGridRowSel('grid1_pager');
	btGrid.gridResizing('grid1');
}

//그리드 더블클릭 - 상세조회
function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid1").getRowData(rowid);
	var formData = formIdAllToMap('frmDetail');
	var param = {
		"modify" : true,
		"ST_DT1" : formData.ST_DT1,					// 기준년도
		"SSN_GBN" : gridData["SSN_GBN"],			// 시즌구분
		"HDNG_GBN" : gridData["HDNG_GBN"],			// 항목구분
		"PROD_COND" : gridData["PROD_COND"],		// 조건
		//기간선택 추가
		"COM_AMT" : gridData["COM_AMT"],			// 일반 금액
		"COM_BAS_PER" : gridData["COM_BAS_PER"],	// 일반 기준인원수
		"COM_BAS_DAY" : gridData["COM_BAS_DAY"],	// 일반 기준일수
		"COM_CNTN" : gridData["COM_CNTN"],			// 일반 기타내용
		"AGN_AMT" : gridData["AGN_AMT"],			// 에이전시 금액
		"AGN_BAS_PER" : gridData["AGN_BAS_PER"],	// 에이전시 기준인원수
		"AGN_BAS_DAY" : gridData["AGN_BAS_DAY"],	// 에이전시 기준일수
		"AGN_CNTN" : gridData["AGN_CNTN"],			// 에이전시 기타내용
		
		"BAS_YY" : gridData["BAS_YY"],				// 기준년도
		"BAS_YY_SEQ" : gridData["BAS_YY_SEQ"],		// 기간년도순번
		"PROD_SEQ" : gridData["PROD_SEQ"]			// 상품순번
	};
	productDetailPopUp(param);
}

//등록 버튼
function cAdd(){
	productDetailPopUp();
}
	
//상세조회 및 등록 팝업
function productDetailPopUp(param){
	var url = "/popup/ProductDetailPopUp.do";
	var pid = "productDetailPopUp";  //팝업 페이지의 최상위 div ID
	
	popupOpen(url, pid, param, function(data) {
		cSearch();
	});
}

//기준년도 관리 팝업
function cPeriod(param){
	var url = "/popup/ProductPeriodPopUp.do";
	var pid = "productPeriodPopUp";	//팝업 페이지의 최상위 div ID
	
	popupOpen(url, pid, param, function(data){
	});
}

//복사등록 팝업
function cCopy(param){
	var url = "/popup/ProductCopyPopUp.do";
	var pid = "productCopyPopUp";	//팝업 페이지의 최상위 div ID
	var formData = formIdAllToMap('frmDetail');
	var param = { 
			"ST_DT1" : formData.ST_DT1,
			"branch" : "normal"
	}
	
	popupOpen(url, pid, param, function(data){
	});
}
	
</script>

<c:import url="../import/frameBottom.jsp" />