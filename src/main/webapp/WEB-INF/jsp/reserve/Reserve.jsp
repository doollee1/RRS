<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Sales Order Report
	 * @Description : Sales Order Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<%-- <c:param name="progcd" value="SalesReport" /> --%>
	<c:param name="progcd" value="Reserve" />
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
					    <td class="small_td"><p><s:message code="reservation.period"/></p></td>
                        <td class="medium_td">
                            <select id="SEARCH" name="SEARCH" class="">
                                <option value="REQ_DT">예약 일자</option>
                                <option value="CHK_IN_DT">체크인 일자</option>
                            </select>
                        </td>
						<td class="medium_td">
						    <input type="text" name="RESERVE_STDT" id="RESERVE_STDT" data-type="date" style="width:90px; float:left;"/>
						    <p style="float:left;">-</p>
						    <input type="text" name="RESERVE_EDDT" id="RESERVE_EDDT" data-type="date" style="width:90px;float:left;"/>
					    </td>
						<td class="small_td"><p><s:message code="reservation.state"/></p></td>
						<td class="medium_td">
						    <select id="PRC_STS" name="PRC_STS" class="">
						        <option value="">전체</option>
							    <c:forEach var="i" items="${prc_sts}">
								    <option value="${i.CODE}">${i.CODE_NM}</option>
							    </c:forEach>
						    </select>
						</td>
					</tr>
					<tr>
					    <td class="small_td"><p><s:message code="reservation.division"/></p></td>
						<td class="medium_td">
						    <select id="MEM_GBN" name="MEM_GBN" class="">
						        <option value="">전체</option>
							    <c:forEach var="i" items="${mem_gbn}">
								    <option value="${i.CODE}">${i.CODE_NM}</option>
							    </c:forEach>
						    </select>
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
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<table id="quotationGrid"></table>
			<div id="quotationGrid_pager"></div>
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
		var args;
		var datagrid;
		fn_Init();
	});
	
	function fn_Init(){
		var toDay = getToday();
		var lastMonth = getlastMonth();
		
		$("#RESERVE_STDT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay).substr(0,6)+'01'));
		$("#RESERVE_EDDT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay)));
		$('#SEARCH option:eq(0)').prop("selected" , true);
        createQuotationGrid();
		
		$("#divBtn").append("<button class='cBtnclass cBtnSearch_style' id='cBtnSearch' type='button' onclick='cSearch();'>조회</button>");
		$("#divBtn").append("<button class='cBtnclass cBtnAdd_style' id='cBtnAdd' type='button' onclick='cAdd();'>예약등록</button>");
		$("#divBtn").append("<button class='cBtnclass cBtnCancel_style' id='cBtnSearch' type='button' onclick='cSearch();'>닫기</button>");
		
		/* 그리드 로우 클릭시 상세조회 팝업 open */
		$('#quotationGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid) {
				var selRowData = $("#quotationGrid").jqGrid("getRowData",rowid);
				param = {};                       
				param.SEQ    = selRowData.SEQ;    
				param.REQ_DT = selRowData.REQ_DT; 
				reservePopup(param);              
			}
		}); 
		
		cSearch();
		
	}
	function createQuotationGrid() {
		var colName = [ '<s:message code="reservation.seq"/>',
				'<s:message code="reservation.mem_gbn"/>',
				'<s:message code="reservation.date"/>',
				'<s:message code="reservation.member"/>',
				'<s:message code="reservation.product_gbn"/>',
				'<s:message code="reservation.checkIn"/>',
				'<s:message code="reservation.checkOut"/>',
				'<s:message code="reservation.totalCnt"/>',
				'<s:message code="reservation.amount"/>',
				'<s:message code="reservation.totAmount"/>',
				'<s:message code="reservation.flight"/>',
				'<s:message code="reservation.state"/>', '상품순번"/>' ];
		var colModel = [ 
		    {name : 'SEQ'       , width : 70  , align : 'center'}, 
		    {name : 'MEM_NM'    , width : 70  , align : 'center'}, 
		    {name : 'REQ_DT'    , width : 100 , align : 'center'}, 
		    {name : 'REQ_HAN_NM', width : 70  , align : 'center'}, 
		    {name : 'CONTENTS'  , width : 70  , align : 'center'}, 
		    {name : 'CHK_IN_DT' , width : 70  , align : 'center'}, 
		    {name : 'CHK_OUT_DT', width : 150 , align : 'center'}, 
		    {name : 'TOT_PERSON', width : 150 , align : 'center'}, 
		    {name : 'DEP_AMT'   , width : 70  , align : 'center'}, 
		    {name : 'TOT_AMT'   , width : 100 , align : 'center'}, 
		    {name : 'FLIGHT_OUT', width : 100 , align : 'center'}, 
		    {name : 'STATE_NM'  , width : 100 , align : 'center', ref : 'linkq'}, 
		    {name : 'PROD_SEQ'  , width : 100 , align : 'center', ref : 'linkq', hidden : true} 
		    ];

		var gSetting = {
			pgflg : true,
			exportflg : true, //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,
			searchInit : false,
			resizeing : true,
			rownumbers : false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid : true, // 쿼리 페이징 처리 여부
			height : 487
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('quotationGrid', colName, colModel, gSetting);
	}

	function cSearch(currentPage) {
		var url = "/reserve/reserveSelectList.do";
		var formData = { "SEARCH"       : $("#SEARCH option:selected").val()
				       //, "RESERVE_STDT" : $("#RESERVE_STDT").val().replaceAll(/\./gi, '')
				       , "RESERVE_STDT" : '20230101'
				       , "RESERVE_EDDT" : $("#RESERVE_EDDT").val().replaceAll(/\./gi, '')
				       , "MEM_GBN"      : $("#MEM_GBN option:selected").val()
				       , "PRC_STS"      : $("#PRC_STS option:selected").val()
		               };
		var param = {"param":formData};
		fn_ajax(url, true, param, function(data, xhr) {
		    reloadGrid("quotationGrid", data.result);
			btGrid.gridQueryPaging($('#quotationGrid'), 'cSearch',data.result);
			var colModel = $("#quotationGrid").jqGrid('getGridParam','colModel');
			for (var i = 0; i < data.result.length; i++) {
				jQuery("#quotationGrid").setCell(i + 1);
			}
		});
	}

	function openCustomerPopUp(custVal) {
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup"; //팝업 페이지의 취상위 div ID
		var param = {
			'CUST_CD' : custVal
		};

		popupOpen(url, pid, param, function(e, selecedData) {
			if (!fn_empty(selecedData)) {
				$("#SOLD_CUST_CD").val(selecedData.CUST_CD);
				$("#SOLD_CUST_NM").text(selecedData.CUST_NM);
			}
		});
	}

	function cAdd() {
		reservePopup();
	}
	function reservePopup(param) {
		var url = "/reserve/reserveRegi.do";
		var pid = "p_reserveRegi"; //팝업 페이지의 취상위 div ID

		popupOpen(url, pid, param, function(data) {
			//cSearch();
		});
	}
</script>
<c:import url="../import/frameBottom.jsp" />
