<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Reserve Report(예약 현황)
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="RV02" />
</c:import>
<div id="ctu_wrap">	
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="reservation.title1"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
	</div>
	<form id="frmSearch" action="#" >
		<div class="tab_top_search2">
			<table>
				<tbody>
					<tr>  
					    <td class="small_td"><p>조회월</p></td>
						<td class="medium_td">
						    <input type="text" name="SEARCH_DT" id="SEARCH_DT" data-type="date" style="width:90px; float:left;"/>
					    </td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<!-------------------->

<div id="ctm_wrap">
	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="reservation.title2"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px; overflow:auto;">
			<table id="reserveReportGrid"></table>
			<div id="reserveReportGrid_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
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
		fn_Init();
	});
	
	function fn_Init(){
		var toDay = getToday();
		$("#SEARCH_DT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay)));
        
		createreserveReportGrid();
        setsetGroupHeadersGrid();
		// cSearch();
	}
	
	function createreserveReportGrid() {
		var colName = [
			'순번',
			'회원 구분',
			'리조트 CF번호',
			'한글',
			'영문',
			'인보이스 발행일자',
			'입금일자',
			'금액',
			'입금일자',
			'금액',
			'도착',
			'출발',
			'도착',
			'출발',
			'예약인원',
			'트윈',
			'더블',
			'프리미엄트윈',
			'프리미엄킹',
			'평일',
			'토(오전)',
			'토(오후)',
			'일(오전)',
			'일(오후)',
		];
				
		var colModel = [
			{name: 'ROWNUM', width: 70, align: 'center'},
			{name: 'MEM_NM', width: 100, align: 'center'},
			{name: 'CONFIRM_NO', width: 100, align: 'center'},
			{name: 'REQ_HAN_NM', width: 100, align: 'center'},
			{name: 'REQ_ENG_NM', width: 100, align: 'center'},
			{name: 'INV_REG_DT', width: 100, align: 'center'},
			{name: 'DEP_IN_DT', width: 100, align: 'center'},
			{name: 'DEP_AMT', width: 100, align: 'center'},
			{name: 'BAL_IN_DT', width: 100, align: 'center'},
			{name: 'BAL_AMT', width: 100, align: 'center'},
			{name: 'PICK_IN', width: 100, align: 'center'},
			{name: 'PICK_OUT', width: 100, align: 'center'},
			{name: 'FLIGHT_IN', width: 100, align: 'center'},
			{name: 'FLIGHT_OUT', width: 100, align: 'center'},
			{name: 'TOT_PERSON', width: 100, align: 'center'},
			{name: 'CNT_D1', width: 100, align: 'center'},
			{name: 'CNT_D2', width: 100, align: 'center'},
			{name: 'CNT_P1', width: 100, align: 'center'},
			{name: 'CNT_P1', width: 100, align: 'center'},
			{name: 'ROUNDING_WEEK', width: 100, align: 'center'},
			{name: 'ROUNDING_SAT_MORNING', width: 100, align: 'center'},
			{name: 'ROUNDING_SAT_AFTERNOON', width: 100, align: 'center'},
			{name: 'ROUNDING_SUN_MORNING', width: 100, align: 'center'},
			{name: 'ROUNDING_SUN_AFTERNOON', width: 100, align: 'center'},
		];
		
		var gSetting = {
			pgflg : true,
			exportflg : true, //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,
			searchInit : false,
			resizeing : true,
			rownumbers : false,
			shrinkToFit: false,
			autowidth: true,
			queryPagingGrid : true, // 쿼리 페이징 처리 여부
			height : 600
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('reserveReportGrid', colName, colModel, gSetting);
	}
	
	function setsetGroupHeadersGrid() {
		$('#reserveReportGrid').jqGrid('setGroupHeaders', {
			useColSpanStyle: true,
			groupHeaders: [
				{startColumnName: 'REQ_HAN_NM', numberOfColumns: 2, titleText: '예약자'},
				{startColumnName: 'DEP_IN_DT', numberOfColumns: 2, titleText: '예약금'},
				{startColumnName: 'BAL_IN_DT', numberOfColumns: 2, titleText: '잔금'},
				{startColumnName: 'PICK_IN', numberOfColumns: 2, titleText: '픽업차량'},
				{startColumnName: 'FLIGHT_IN', numberOfColumns: 2, titleText: '항공편'},
				{startColumnName: 'CNT_D1', numberOfColumns: 4, titleText: '리조트(숙박)'},
				{startColumnName: 'weekday', numberOfColumns: 5, titleText: '골프(라운딩)'},
			]
		});
	}

	function cSearch(currentPage) {
		var url = "/reserve/reserveReportSelectList.do";
		var formData = {"SEARCH_DT": $("#SEARCH_DT").val().replaceAll(/\./gi, '').substr(0,6)};
		var param = {"param":formData};
		console.log('param: ', param)
		fn_ajax(url, true, param, function(data, xhr) {
			console.log('result data: ', data)
		    reloadGrid("reserveReportGrid", data.result);
			btGrid.gridQueryPaging($('#reserveReportGrid'), 'cSearch', data.result);
			var colModel = $("#reserveReportGrid").jqGrid('getGridParam','colModel');
			for (var i = 0; i < data.result.length; i++) {
				jQuery("#reserveReportGrid").setCell(i + 1);
			}
		});
	}
</script>
<c:import url="../import/frameBottom.jsp" />
