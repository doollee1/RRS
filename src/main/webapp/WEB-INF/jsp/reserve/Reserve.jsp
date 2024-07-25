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
	<c:param name="progcd" value="RV01" />
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
						<td class="medium_td" id="SEARCH_TD">
							<select id="SEARCH" name="SEARCH" class="">
								<option value="T1.REQ_DT">예약 일자</option>
								<option value="T1.CHK_IN_DT">체크인 일자</option>
							</select>
						<input type="text" name="RESERVE_STDT" id="RESERVE_STDT" data-type="date" style="width:90px; float:left; text-align: center;"/>
							<p style="float:left;">-</p>
							<input type="text" name="RESERVE_EDDT" id="RESERVE_EDDT" data-type="date" style="width:90px;float:left; text-align: center;"/>
						</td>
						<td class="blank_td"></td>
						<td class="small_td" id="INVOCIE"><p>인보이스 발행유무</p></td>
						<td class="medium_td" id="INVOCIE_YN">
							<select id="INVOICE_YN" name="INVOICE_YN" class="">
								<option value="">전체</option>
								<option value="Y">유</option>
								<option value="N">무</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="reservation.division"/></p></td>
						<td class="medium_td" id="MEMBER_TD">
							<select id="MEM_GBN" name="MEM_GBN" class="">
								<option value="">전체</option>
								<c:forEach var="i" items="${mem_gbn}">
									<option value="${i.CODE}">${i.CODE_NM}</option>
								</c:forEach>
							</select>
						</td>
						<td class="blank_td"></td>
						<td class="small_td" id="STATUS"><p>입금예약상태</p></td>
						<td class="medium_td">
							<select id="PRC_STS" name="PRC_STS" class="">
								<option value="">전체</option>
								<c:forEach var="i" items="${prc_sts}">
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

<style type="text/css">
	.tab_top_search2 .medium_td { width: 360px; text-align : center;}
	.tab_top_search2 .small_td { text-align : center;}
	.tab_top_search2 .small_td p {margin-left:10px;}
	.tab_top_search2 .blank_td { width:50px;}
	#ct_wrap select {text-align:center;}
	#MEMBER_TD { width: 200px; }
	#RESERVE_DT {width:240px;}
	#SEARCH {width:105px; float:left; margin-left:5px; margin-right:5px;}
	#MEM_GBN {width:350px; }
	#INVOICE_YN {width:300px; }
	#PRC_STS {width:300px;}
</style>

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
	/* 초기 로드 */
	$(function() {
		var args;
		var datagrid;
		fn_Init();
	});
	
	/******************************************** 
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content : 화면, 조회 조건 이벤트, 그리드 이벤트 셋팅
	 * @See     : createQuotationGrid() / reservePopup2() / cSearch()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function fn_Init(){
		var toDay     = preMonth();        //이전달 첫날
		var lastMonth = getlastMonth();    //이번달 마지막날

		$("#RESERVE_STDT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay).substr(0,6)+'01'));
		$("#RESERVE_EDDT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(lastMonth)));
		$('#SEARCH option:eq(0)').prop("selected" , true);
		createQuotationGrid();
		
		/* 예약 등록 버튼 추가 */
		$("#cBtnAdd").text("예약등록");

		/* 그리드 로우 클릭시 상세조회 팝업 open */
		$('#quotationGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid) {
				var selRowData = $("#quotationGrid").jqGrid("getRowData",rowid);
				param          = {};
				param.SEQ      = selRowData.SEQ;
				param.REQ_DT   = selRowData.REQ_DT.replaceAll(".",""); 
				//reservePopup(param);
				reservePopup2(param);
			}
		}); 
		cSearch();
	}
	
	/******************************************** 
	 * @Subject : 그리드 생성 함수
	 * @Content : 조회 내역 그리드 생성 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function createQuotationGrid() {
		var colName = [ 
			'<s:message code="reservation.seq"/>',
			'입금예약상태', 
			'<s:message code="reservation.mem_gbn"/>',
			'에이전시구분',
			'에이전시명',
			'<s:message code="reservation.date"/>',
			'<s:message code="reservation.reserveSeq"/>',
			'<s:message code="reservation.member"/>',
			'<s:message code="reservation.product_gbn"/>',
			'<s:message code="reservation.checkIn"/>',
			'<s:message code="reservation.checkOut"/>',
			'<s:message code="reservation.totalCnt"/>',
			'<s:message code="reservation.amount"/>',
			'<s:message code="reservation.totAmount"/>',
			'<s:message code="reservation.flight"/>',
			'인보이스 발행일자',
			'<s:message code="reservation.prodCnt"/>',
		];
		var colModel = [ 
			{name : 'ROWNUM'    , width : 70  , align : 'center'}, 
			{name : 'STATE_NM'  , width : 100 , align : 'center', ref : 'linkq'},
			{name : 'MEM_NM'    , width : 70  , align : 'center'},
			{name : 'AGN_GB_NM' , width : 80  , align : 'center'},
			{name : 'AGN_CD_NM' , width : 70  , align : 'center'}, 
			{name : 'REQ_DT'    , width : 100 , align : 'center'}, 
			{name : 'SEQ'       , width : 70  , align : 'center'}, 
			{name : 'REQ_HAN_NM', width : 70  , align : 'center'}, 
			{name : 'PROD_NM'   , width : 200 , align : 'center'}, 
			{name : 'CHK_IN_DT' , width : 100 , align : 'center'}, 
			{name : 'CHK_OUT_DT', width : 100 , align : 'center'}, 
			{name : 'TOT_PERSON', width : 70  , align : 'center'}, 
			{name : 'DEP_AMT'   , width : 100 , align : 'right'}, 
			{name : 'TOT_AMT'   , width : 100 , align : 'right'}, 
			{name : 'FLIGHT_OUT', width : 100 , align : 'center'}, 
			{name : 'INV_REG_DT', width : 120 , align : 'center'}, 
			{name : 'PROD_SEQ'  , width : 100 , align : 'center', ref : 'linkq', hidden : true} 
			];
		var gSetting = {
			pgflg      : true,
			exportflg  : true,         //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,
			searchInit : false,
			resizeing  : true,
			rownumbers : false,
			//shrinkToFit: true,
			//autowidth: true,
			queryPagingGrid : true,    // 쿼리 페이징 처리 여부
			height     : 487
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('quotationGrid', colName, colModel, gSetting);
	}

	/******************************************** 
	 * @Subject : 조회 함수
	 * @Content : 조회 내역 값 화면 셋팅
	 * @See     : fn_dataSet()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function cSearch(currentPage) {
		if(!validation()) return; 
		var url = "/reserve/reserveSelectList.do";
		var formData = { "SEARCH"       : $("#SEARCH option:selected").val()
					   , "RESERVE_STDT" : $("#RESERVE_STDT").val().replaceAll(/\./gi, '')
					   , "RESERVE_EDDT" : $("#RESERVE_EDDT").val().replaceAll(/\./gi, '')
					   , "MEM_GBN"      : $("#MEM_GBN option:selected").val()
					   , "PRC_STS"      : $("#PRC_STS option:selected").val()
					   , "INVOICE_YN"   : $("#INVOICE_YN").val()
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
	
	/******************************************** 
	 * @Subject : 시작 일자, 종료일자 체크 함수
	 * @Content : 시작 일자가 종료일자보다 클 경우 alert
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function validation(){
		var stdt = $("#RESERVE_STDT").val().replaceAll(/\./gi, '')
		var eddt = $("#RESERVE_EDDT").val().replaceAll(/\./gi, '')
		if(stdt > eddt){
			alert("시작 일자가 종료 일자보다 큽니다. 날짜를 확인해 주세요.");
			return false;
		}
		return true;
	}

	function openCustomerPopUp(custVal) {
		var url   = "/customer/customerSearchPopup.do";
		var pid   = "CustomerSearchPopup";    //팝업 페이지의 취상위 div ID
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
	
	/******************************************** 
	 * @Subject : 데이터 형식 변경 함수
	 * @Content : 날짜 포멧 변경, 숫자 콤마 추가
	 * @See     : fn_comma()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function fn_dataSet(data){
		var array = [];
		for (var i = 0; i < data.length; i++) {
			var obj = new Object;
			$.each(data[i] , function(key , value){
				if(key == "REQ_DT" || key == "CHK_IN_DT" || key == "CHK_OUT_DT"){
					value = Util.converter.dateFormat1(value);
				}else if(key == "TOT_PERSON" || key == "DEP_AMT" || key == "TOT_AMT"){
					value = fn_comma(value);
				}else if(key == "INV_REG_DT"){
					if(value != '')
						value = Util.converter.dateFormat1(value);
				}
				
				obj[key] = value;
				delete obj;
			});
			array.push(obj);
		}
		return array;
	}

	/******************************************** 
	 * @Subject : 예약 등록 버튼 함수
	 * @Content : 
	 * @See     : reservePopup2()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function cAdd() {
		//reservePopup();
		reservePopup2();
	}
	
	function reservePopup(param) {
		var url = "/reserve/reserveRegi.do";
		//var pid = "p_reserveRegi";      //팝업 페이지의 취상위 div ID
		var pid = "p_reserveListRegi";    //팝업 페이지의 취상위 div ID 

		popupOpen(url, pid, param, function(data) {
			cSearch();
		});
	}
	
	/******************************************** 
	 * @Subject : 팝업 Open 함수
	 * @Content : 등록 or 상세 팝업 Open
	 * @See     : cSearch()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function reservePopup2(param) {
		var url = "/reserve/reserveRegi2.do";
		var pid = "p_reserveListRegi";    //팝업 페이지의 취상위 div ID 

		popupOpen(url, pid, param, function(data) {
			cSearch();
		});
	}
</script>
<c:import url="../import/frameBottom.jsp" />
