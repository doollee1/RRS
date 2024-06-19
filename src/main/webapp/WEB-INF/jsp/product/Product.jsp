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
	<c:param name="progcd" value="Pr01" />
</c:import>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
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
						<select id="BAS_YY" name="BAS_YY" class="cmc_combo" style=width:80%;>
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
					<td class="small_td"><p>조건</p></td>
					<td class="medium_td">
						<select id="PROD_COND" name="PROD_COND" class="" style=width:80%;>
							<option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${prodcond}">
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
					<span style="text-align:right; font-size: 10px; font-weight: bold">※ 시즌구분 <font color="red">'전체'</font> 로 조회 후 복사등록이 가능합니다.</span>
					<button class='cBtnclass cBtnCopy_style' id='cBtnCopy' type='button' style="align:right" onclick='cCopy()' disabled='disabled'>복사등록</button>
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
		
	//조회, 등록, 미리보기, 기준년도관리
	$('#cBtnSearch').text("조회");
	$('#cBtnAdd').text("등록");
	$('#cBtnUser1').text("미리보기").addClass("cBtnclass cBtnPut_style").attr('disabled', true);
	$('#cBtnUser2').text("기준년도관리").addClass("cBtnclass cBtnEdit_style");
	
    //초기 진입시 시작 (그리드그리기와 조회)
	createGrid();
	cSearch();
	
	/* grid1 Event */
	$('#grid1').jqGrid('setGridParam', {
		ondblClickRow: function(rowid, iRow, iCol, e) {
			grid1_ondblClickRow(rowid, iRow, iCol, e);
		}
	});
	
	//조회조건 변경 시 복사등록, 미리보기 비활성화 처리
	$("#BAS_YY, #SSN_GBN").change(function(){
		$("#cBtnCopy").attr("disabled", true);
		$("#cBtnUser1").attr("disabled", true);
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
				'<s:message code='product.amount'/>',
				'<s:message code='product.etc'/>',
				'BAS_YY',
				'BAS_YY_SEQ',
				'PROD_SEQ',
				'COM_BAS_PER',
				'COM_BAS_DAY',
				'AGN_COM_BAS_PER',
				'AGN_COM_BAS_DAY',
				'AGN_DIS_BAS_PER',
				'AGN_DIS_BAS_DAY',
				'PROD_COND2',
				'HDNG_GBN_CODE',
				]
	var colModel = [
		{ name: 'SSN_GBN', width: 5, align: 'center'},
		{ name: 'HDNG_GBN', width: 13, align: 'center'},
		{ name: 'PROD_COND', width: 5, align: 'center'},
		{ name: 'ST_DT1', width: 7, align: 'center'},
		{ name: 'ED_DT1', width: 7, align: 'center'},
		{ name: 'ST_DT2', width: 7, align: 'center'},
		{ name: 'ED_DT2', width: 7, align: 'center'},
		{ name: 'ST_DT3', width: 7, align: 'center'},
		{ name: 'ED_DT3', width: 7, align: 'center'},
		{ name: 'COM_AMT', width: 7, align: 'right', formatter:'integer', formatoptions : {defaultValue: '', thousandsSeparator : ','}},
		{ name: 'COM_CNTN', width: 7, align: 'left'},
		{ name: 'AGN_COM_AMT', width: 7, align: 'right', formatter:'integer', formatoptions : {defaultValue: '', thousandsSeparator : ','}},
		{ name: 'AGN_COM_CNTN', width: 7, align: 'left'},
		{ name: 'AGN_DIS_AMT', width: 7, align: 'right', formatter:'integer', formatoptions : {defaultValue: '', thousandsSeparator : ','}},
		{ name: 'AGN_DIS_CNTN', width: 7, align: 'left'},
		{ name: 'BAS_YY', hidden:true},
		{ name: 'BAS_YY_SEQ', hidden:true},
		{ name: 'PROD_SEQ', hidden:true},
		{ name: 'COM_BAS_PER', hidden:true},
		{ name: 'COM_BAS_DAY', hidden:true},
		{ name: 'AGN_COM_BAS_PER', hidden:true},
		{ name: 'AGN_COM_BAS_DAY', hidden:true},
		{ name: 'AGN_DIS_BAS_PER', hidden:true},
		{ name: 'AGN_DIS_BAS_DAY', hidden:true},
		{ name: 'PROD_COND2', hidden:true},
		{ name: 'HDNG_GBN_CODE', hidden:true},
  	];
	
	var gSetting = {
			height:600,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : false,  // 컬럼 설정 버튼 노출여부
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
			{startColumnName: 'AGN_COM_AMT', numberOfColumns: 2, titleText: '일반여행사'},
			{startColumnName: 'AGN_DIS_AMT', numberOfColumns: 2, titleText: '총판여행사'},
			]
	});
	
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
	
	var url = "/product/selectProductInfo.do";
	
	var formData = formIdAllToMap('frmDetail');
	var param = {"BAS_YY" :formData.BAS_YY
				,"SSN_GBN":formData.SSN_GBN
				,"PROD_COND":formData.PROD_COND};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid1", data.result);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
	});
	
	//복사등록 비활성화 여부 설정
	var cBtnCopy = document.getElementById("cBtnCopy");
	if(param.SSN_GBN == 9) {
		cBtnCopy.disabled = false;
	} else {
		cBtnCopy.disabled = true;
	}
	vRowsPerPage = btGrid.getGridRowSel('grid1_pager');
	
	//미리보기 비활성화 여부 설정
	var cBtnUser1 = document.getElementById("cBtnUser1");
	if(param.SSN_GBN != 9){
		cBtnUser1.disabled = false;
	} else {
		cBtnUser1.disabled = true;
	}
}

//그리드 더블클릭 - 상세조회
function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid1").getRowData(rowid);
	var formData = formIdAllToMap('frmDetail');
	var param = {
		"modify" : true,
		"BAS_YY" : formData.BAS_YY,							// 기준년도
		"SSN_GBN" : gridData["SSN_GBN"],					// 시즌구분
		"HDNG_GBN" : gridData["HDNG_GBN"],					// 항목구분
		"PROD_COND" : gridData["PROD_COND"],				// 조건
		"PROD_COND2" : gridData["PROD_COND2"],				// 조건
		"HDNG_GBN_CODE" : gridData["HDNG_GBN_CODE"],		// 항목 코드
		"COM_AMT" : gridData["COM_AMT"],					// 일반 금액
		"COM_BAS_PER" : gridData["COM_BAS_PER"],			// 일반 기준인원수
		"COM_BAS_DAY" : gridData["COM_BAS_DAY"],			// 일반 기준일수
		"COM_CNTN" : gridData["COM_CNTN"],					// 일반 기타내용
		"AGN_COM_AMT" : gridData["AGN_COM_AMT"],			// 총판여행사 금액
		"AGN_COM_BAS_PER" : gridData["AGN_COM_BAS_PER"],	// 총판여행사 기준인원수
		"AGN_COM_BAS_DAY" : gridData["AGN_COM_BAS_DAY"],	// 총판여행사 기준일수
		"AGN_COM_CNTN" : gridData["AGN_COM_CNTN"],			// 총판여행사 기타내용
		"AGN_DIS_AMT" : gridData["AGN_DIS_AMT"],			// 일반여행사 금액
		"AGN_DIS_BAS_PER" : gridData["AGN_DIS_BAS_PER"],	// 일반여행사 기준인원수
		"AGN_DIS_BAS_DAY" : gridData["AGN_DIS_BAS_DAY"],	// 일반여행사 기준일수
		"AGN_DIS_CNTN" : gridData["AGN_DIS_CNTN"],			// 일반여행사 기타내용
		"BAS_YY" : gridData["BAS_YY"],						// 기준년도
		"BAS_YY_SEQ" : gridData["BAS_YY_SEQ"],				// 기간년도순번
		"PROD_SEQ" : gridData["PROD_SEQ"],					// 상품순번
		
		"ST_DT1" : gridData["ST_DT1"],						// 시작일
		"ED_DT1" : gridData["ED_DT1"],						// 종료일
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
		if(data.BAS_YY != "" && data.SSN_GBN != ""){
			$("#BAS_YY").val(data.BAS_YY);
			$("#SSN_GBN").val(data.SSN_GBN);
		}
		cSearch();
	});
}

//복사등록 팝업
function cCopy(param){
	var url = "/popup/ProductCopyPopUp.do";
	var pid = "productCopyPopUp";	//팝업 페이지의 최상위 div ID
	var formData = formIdAllToMap('frmDetail');
	var param = { 
			"branch" : "normal"
	}
	
	popupOpen(url, pid, param, function(data){
		if(data.BAS_YY != ""){
			$("#BAS_YY").val(data.BAS_YY);
			$("#SSN_GBN").val(9);
		}
		cSearch();
	});
}

//미리보기
function cUser1(){
	var year = "year=" + $("#BAS_YY").val();
	var season = "&ssnGbn=" + $("#SSN_GBN").val();
	window.open("https://doollee.synology.me:8087/productInfoView.do?" + year + season);
}

//기준년도 관리 팝업
function cUser2(param){
	var url = "/popup/ProductPeriodPopUp.do";
	var pid = "productPeriodPopUp";	//팝업 페이지의 최상위 div ID
	
	popupOpen(url, pid, param, function(data){
		cSearch();
	});
}
</script>

<c:import url="../import/frameBottom.jsp" />