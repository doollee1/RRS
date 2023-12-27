<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : NoticeList
	 */
%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="BB01" />
</c:import>
	
<!-- dummy -->
<div class="top_button_h_margin"></div>	

<div id="ctm_wrap">
<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="reservation.title1"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
	</div>
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#" >
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<!------------->
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
					    <td class="small_td"><p>조회기간</p></td>
						<td class="medium_td">
						    <input type="text" name="fromDate" id="fromDate" data-type="date" style="width:90px; float:left; text-align: center;"/>
						    <p style="float:left;">-</p>
						    <input type="text" name="toDate" id="toDate" data-type="date" style="width:90px;float:left; text-align: center;"/>
					    </td>
					    <td class="small_td"><p>상태:</p></td>
					   	<td class="medium_td">
						    <select id="REG_STS" name="REG_STS" class="">
						        <option value="1" selected>접수</option>
							    <option value="2">완료</option>
							    <option value="">전체</option>
						    </select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-------------->
	</form>
	<!-- 검색조건 영역 끝 -->
	

</div>


<div id="ctm_wrap">
	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>Qna</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<table id="quotationGrid"></table>
			<div id="quotationGrid_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script type="text/javascript">
$(function() {
	var args;
	var datagrid;
	fn_Init();
});

function fn_Init(){
	var fromDay=getOneWeekBefore();
	var toDay = getToday();
	console.log(fromDay);
	console.log(toDay);
	var lastMonth = getlastMonth();
	
	$("#fromDate").val(Util.converter.dateFormat1(Util.converter.dateFormat3(fromDay)));
	$("#toDate").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay)));
	createQuotationGrid();
	
	$('#quotationGrid').jqGrid('setGridParam', {
		ondblClickRow: function(rowid) {
			
			var selRowData = $("#quotationGrid").jqGrid("getRowData",rowid);
			param = {};                       
			param.QNA_SEQ    = selRowData.QNA_SEQ;
			console.log(param);
			reservePopup(param);              
		}
	}); 
	
	cSearch();
}

function createQuotationGrid() {
	var colName = [ '순번',
			'등록일자',
			'등록자',
			'제목',
			'상태'];
	var colModel = [ 
	    {name : 'QNA_SEQ'       , width : 150  , align : 'center'}, 
	    {name : 'REG_DT'    , width : 150  , align : 'center'}, 
	    {name : 'REG_ID'    , width : 150 , align : 'center'}, 
	    {name : 'TITLE', width : 250  , align : 'center'}, 
	    {name : 'STATE_NM'  , width : 150  , align : 'center'}, 
	    ];
	var gSetting = {
		pgflg : true,
		exportflg : true, //엑셀, pdf 출력 버튼 노출여부
		colsetting : true,
		searchInit : false,
		resizeing : true,
		rownumbers : false,
		shrinkToFit: true,
		autowidth: true,
		queryPagingGrid : true, // 쿼리 페이징 처리 여부
		height : 487
	};
	// 그리드 생성 및 초기화
	btGrid.createGrid('quotationGrid', colName, colModel, gSetting);
}

function cSearch(currentPage) {
	var url = "/common/qnaSelectList.do";
	var formData = { "REG_STS"       : $("#REG_STS option:selected").val()
			       //, "RESERVE_STDT" : $("#RESERVE_STDT").val().replaceAll(/\./gi, '')
			       , "fromDate" : $("#fromDate").val().replaceAll(/\./gi, '')
			       , "toDate" : $("#toDate").val().replaceAll(/\./gi, '')
	               };
	
	var param = {"param":formData};
	fn_ajax(url, true, param, function(data, xhr) {
		
	
	    reloadGrid("quotationGrid", fn_dataSet(data.result));
		btGrid.gridQueryPaging($('#quotationGrid'), 'cSearch',data.result);
		var colModel = $("#quotationGrid").jqGrid('getGridParam','colModel');
		for (var i = 0; i < data.result.length; i++) {
			jQuery("#quotationGrid").setCell(i + 1);
		}
	});
}

function getOneWeekBefore(){
	var today = new Date();
	var dd = today.getDate()-6;
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();

	if(dd < 10) {
		dd='0'+dd
	}
	
	if(mm < 10) {
		mm='0'+mm
	}
	
	return dd + '.' + mm + '.'+yyyy;
}

function fn_dataSet(data){
    var array = [];
    for (var i = 0; i < data.length; i++) {
       var obj = new Object;
       $.each(data[i] , function(key , value){
          if(key == "REG_DT" || key == "CHK_IN_DT" || key == "CHK_OUT_DT"){
             value = Util.converter.dateFormat1(value);
          }else if(key == "TOT_PERSON" || key == "DEP_AMT" || key == "TOT_AMT"){
             value = fn_comma(value);
          }
          obj[key] = value;
          delete obj;
       });
         array.push(obj);
    }
    return array;
 }

function reservePopup(param) {
	var url = "/common/QnaView.do";
	var pid = "noticePopup"; //팝업 페이지의 취상위 div ID

	popupOpen(url, pid, param, function(data) {
		console.log(url);
		//cSearch();
	});
}
</script>

<c:import url="../import/frameBottom.jsp" />