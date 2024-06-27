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
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<div class="tab_top_search2">
			<table>
				<tbody>
					<tr>  
					    <td class="small_td"><p style="margin:0 0 4px 18px">조회기간</p></td>
					    <td class="small_td" style="text-align:center;">
					    	<select id="S_DATE_GBN" name="S_DATE_GBN" class="cmc_combo" style="width:100px;">
					    		<option value="S_REQ">예약일자</option>
					    		<option value="S_CHK_IN">체크인</option>
					    	</select>
					    </td>
						<td class="medium_td" style="display:flex; margin-top:3px;">
						    <input type="text" name="FROM_DT" id="FROM_DT" data-type="date" style="text-align:center; width:90px; float:left; "/>
						    <div style="margin:0 10px 0 10px;">-</div>
						    <input type="text" name="TO_DT" id="TO_DT" data-type="date" style="text-align:center; width:90px; float:left;"/>
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
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px; overflow:auto; margin-top:5px;">
			<table id="reserveReportGrid"></table>
			<div id="reserveReportGrid_pager"></div>
		</div>
	</div>
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left" style="display:flex; justify-content:space-between;padding:10px 0; height:25px;">
				<h4 style="margin:0;">예약 라운딩</h4>
				<button class="cBtnclass cBtnSave_style" id="cBtnSave" type="button" onclick="cSave();">저장</button></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<div class="ctu_g_wrap" id="dayTable" style= width:100%; float:left; padding-top:0px; overflow:auto;">
			<table id="reserveDayReportGrid"></table>
			<div id="reserveDayReportGrid_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
</div>

<style type="text/css">
	.ui-jqgrid .ui-jqgrid-hdiv { border-top:1px solid #b9b9b9;}
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
	//초기 날짜 세팅값
	var origin_FROM_DT    = '';	
	var origin_TO_DT      = '';
	var origin_CHK_IN_DT  = '';
	var origin_CHK_OUT_DT = '';
	var selectNum  = "";		// 선택 그리드 순번
	
	$(function() {
		setCommBtn("Save", false);
		fn_Init(); //초기 로드
	});
	
	function fn_Init(){
		var fromDay = getMonthFirstDay();
		var toDay   = getToday();
		
		origin_FROM_DT = Util.converter.dateFormat1(Util.converter.dateFormat3(fromDay));
		origin_TO_DT   = Util.converter.dateFormat1(Util.converter.dateFormat3(toDay));
		
		$("#FROM_DT").val(origin_FROM_DT);
		$("#TO_DT").val(origin_TO_DT);
		viewGrid();	// 초기 grid 생성
	}
	
	function viewGrid(vFROM_DT, vTO_DT) {
		let FROM_DT = '';
		let TO_DT = '';
		if(fn_empty(vFROM_DT)) {
			FROM_DT = $("#FROM_DT").val();
		} else {
			FROM_DT = vFROM_DT;
		}
		
		if(fn_empty(vTO_DT)) {
			TO_DT = $("#TO_DT").val();

		} else {
			TO_DT = vTO_DT;
		}
		createreserveReportGrid(FROM_DT, TO_DT);
		setGroupHeadersGrid(FROM_DT, TO_DT);
	}
	
	function createreserveReportGrid(FROM_DT, TO_DT) {
		var defaultColName = [
			'예약 라운딩',
			'순번',
			'일자',
			'순번',
			'회원 구분',
			'한글',
			'영문',
			'전화번호',
			'상태',
			'도착',
			'출발',
			'예약인원',
			'상품',
			'체크인',
			'체크아웃',
			'도착',
			'출발',
			'트윈',
			'킹',
			'룸 추가 일수',
			'룸 추가 개수',
			'프리미엄 일수',
			'프리미엄 개수',
			'발행일자',
			'총금액',
			'입금일자',
			'금액',
			'입금일자',
			'금액',
			'평일',
			'토(오후)',
			'일(오후)',
			'추가사항',
			'상세조회'
		];
				
		var defaultColModel = [
			{name : 'DAYWEEK'     , width :10, align : 'center', hidden:true },	//예약라운딩값
			{name: 'ROWNUM'       , width: 70,  align: 'center'}, //순번
			{name: 'REQ_DT'       , width: 80,  align: 'center'}, //일자
			{name: 'SEQ'          , width: 70,  align: 'center'}, //순번
			{name: 'MEM_GBN'      , width: 80,  align: 'center'}, //회원구분
			{name: 'REQ_HAN_NM'   , width: 100, align: 'center'}, //예약자 한글명
			{name: 'REQ_ENG_NM'   , width: 100, align: 'center'}, //예약자 영문
			{name: 'REQ_TEL_NO'   , width: 100, align: 'center'}, //예약자 전화번호
			{name: 'PRC_STS'      , width: 100, align: 'center'}, //예약상태
			{name: 'FLIGHT_IN'    , width: 80,  align: 'center'}, //항공편 도착
			{name: 'FLIGHT_OUT'   , width: 80,  align: 'center'}, //항공편 출발
			{name: 'TOT_PERSON'   , width: 80,  align: 'center'}, //예약인원
			{name: 'PROD_SEQ'     , width: 160, align: 'center'}, //상품
			{name: 'CHK_IN_DT'    , width: 80,  align: 'center'}, //체크인
			{name: 'CHK_OUT_DT'   , width: 80,  align: 'center'}, //체크아웃
			{name: 'PICK_IN'      , width: 70,  align: 'center'}, //픽업차량 도착
			{name: 'PICK_OUT'     , width: 70,  align: 'center'}, //픽업차량 출발
			{name: 'TWIN_CNT'     , width: 70,  align: 'center'}, //트윈
			{name: 'KING_CNT'     , width: 80,  align: 'center'}, //킹
			{name: 'ROOM_ADD_IL'  , width: 80,  align: 'center'}, //룸추가 일수
			{name: 'ROOM_ADD_CNT' , width: 80,  align: 'center'}, //룸추가 개수
			{name: 'PRIM_ADD_IL'  , width: 80,  align: 'center'}, //프리미엄추가 일수
			{name: 'PRIM_ADD_CNT' , width: 80,  align: 'center'}, //프리미엄추가 개수
			{name: 'INV_REG_DT'   , width: 80,  align: 'center'}, //인보이스 발행일자
			{name: 'TOT_AMT'      , width: 80,  align: 'right' }, //인보이스 총금액
			{name: 'DEP_IN_DT'    , width: 80,  align: 'center'}, //예약금 입금일자
			{name: 'DEP_AMT'      , width: 80,  align: 'right' }, //예약금 금액
			{name: 'BAL_IN_DT'    , width: 80,  align: 'center'}, //잔액 입금일자
			{name: 'BAL_AMT'      , width: 80,  align: 'right' }, //잔액 금액
			{name: 'ROUNDING_WEEK', width: 70,  align: 'center'}, //골프 평일
			{name: 'ROUNDING_SAT' , width: 70,  align: 'center'}, //골프 토(오후)
			{name: 'ROUNDING_SUN' , width: 70,  align: 'center'}, //골프 일(오후)
			{name: 'REMARK'       , width: 200, align: 'center'},  //추가사항
			{name: 'DETAIL_REPORT', width: 100, align: 'center', formatter:showDetail}
		];

		var gSetting = {
			pgflg : true,
			exportflg : true, //엑셀, pdf 출력 버튼 노출여부
			colsetting : false,
			searchInit : false,
			resizeing : true,
			rownumbers : false,
			shrinkToFit: false,
			autowidth: true,
			queryPagingGrid : true, // 쿼리 페이징 처리 여부
			height : 280, 
		};

		// 그리드 생성 및 초기화
		btGrid.createGrid('reserveReportGrid', defaultColName, defaultColModel, gSetting);
		
		//룸추가 일수 + 룸추가 개수
		var newWidth = $("#reserveReportGrid_ROOM_ADD_IL").width() + $("#reserveReportGrid_ROOM_ADD_CNT").outerWidth(true);
		jQuery("#reserveReportGrid").jqGrid("setLabel", "ROOM_ADD_IL", "룸추가", "", { style: "width: " + newWidth + "px;", colspan: "2" });
		jQuery("#reserveReportGrid").jqGrid("setLabel", "ROOM_ADD_CNT", "", "", {style: "display: none"});
		
		//프리미엄 룸추가 일수 + 프리미엄 룸추가 개수
		var newWidth2 = $("#reserveReportGrid_PRIM_ADD_IL").width() + $("#reserveReportGrid_PRIM_ADD_CNT").outerWidth(true);
		jQuery("#reserveReportGrid").jqGrid("setLabel", "PRIM_ADD_IL", "프리미엄 룸추가", "", { style: "width: " + newWidth2 + "px;", colspan: "2" });
		jQuery("#reserveReportGrid").jqGrid("setLabel", "PRIM_ADD_CNT", "", "", {style: "display: none"});
	}
	
	// 월별 그리드 
	function createreserveDayReportGrid(FROM_DT, TO_DT) {
		const sFromDt = FROM_DT.replaceAll(".","");
		const sToDt   = TO_DT.replaceAll(".","");

		const colModel = [];
		const colName  = [];
		var cnt = 0;
		var last = "";

		for(var i=sFromDt; i<=sToDt; i++) {
			var dd   = ''+i;
			var year = dd.substr(0, 4);
			var mon  = dd.substr(4, 2);		
			var day  = dd.substr(6, 2);
			
			colModel[cnt] = {
					name: 'day'+i,
					width: 90,
					align: 'center',
					editable: true,
			};
			var dayWeekName = getDayOfWeek(year + "." + mon + "." + day);
			colName[cnt] = i + " (" + dayWeekName + ")";
			
			var last = new Date(year, mon, 0);
			last = last.getDate();
			if (day == last) {
				if (mon == '12') {
					//i = i+10001 - last - 1100;
					i = i+8900-last;
				} else {
					i = i+100-last;
				}
			}
			
			cnt ++;
		}
		var gSetting = {
			pgflg : true,
			exportflg : true, //엑셀, pdf 출력 버튼 노출여부
			colsetting : false,
			searchInit : false,
			resizeing : true,
			rownumbers : false,
			shrinkToFit: false,
			autowidth: true,
			queryPagingGrid : false, // 쿼리 페이징 처리 여부
			height : 100, 
		};
		
		// 그리드 생성 및 초기화
		btGrid.createGrid('reserveDayReportGrid', colName, colModel, gSetting);
		
	}
	
	// 그리드 헤더 세팅
	function setGroupHeadersGrid(FROM_DT, TO_DT) {
		const defaultGroupHeader = [
			{startColumnName: 'REQ_DT'    , numberOfColumns: 2, titleText: '예약일자'},
			{startColumnName: 'REQ_HAN_NM', numberOfColumns: 3, titleText: '예약자'},
			{startColumnName: 'FLIGHT_IN' , numberOfColumns: 2, titleText: '항공편'},
			{startColumnName: 'PICK_IN'   , numberOfColumns: 2, titleText: '픽업차량'},
			{startColumnName: 'TWIN_CNT'  , numberOfColumns: 6, titleText: '리조트(숙박)'},
			{startColumnName: 'INV_REG_DT', numberOfColumns: 2, titleText: '인보이스'},
			{startColumnName: 'DEP_IN_DT' , numberOfColumns: 2, titleText: '예약금'},
			{startColumnName: 'BAL_IN_DT' , numberOfColumns: 2, titleText: '잔금'},
			{startColumnName: 'ROUNDING_WEEK'  , numberOfColumns: 3, titleText: '골프(라운딩)'},
		];

		$('#reserveReportGrid').jqGrid('setGroupHeaders', {
			useColSpanStyle: true,
			groupHeaders: defaultGroupHeader,
		});
	}
	
	//상세정보보기 버튼
	function showDetail(cellvalue, options, rowObject){
		var str = "";
		var rowid = options.rowId;

		str += "<div>";
		str += "<button class='btn btn-default' onclick=\"javascript:fn_detail('" + rowid + "')\"> 상 세 보 기 </button>";
		str += "</div>";
		
		return str;
	}
	
	//상세정보보기 버튼 클릭시 팝업창
	function fn_detail(rowid){
		var selRowData = $("#reserveReportGrid").jqGrid("getRowData",rowid);
		
	    var url = "/reserve/reserveRegi3.do";
	    var pid = "p_reserveListRegi"; //팝업 페이지의 취상위 div ID
	    var param = {};                       
		param.SEQ    = selRowData.SEQ;    
		param.REQ_DT = selRowData.REQ_DT.replaceAll(".",""); 
		param.DETAIL = 'Y';
		
	    popupOpen(url, pid, param, function(data) {
	    });
	}
	
	// 조회
	function cSearch(currentPage) {
		// paging
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE').val())) {
			vCurrentPage = $('#CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('reserveReportGrid_pager');
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var FROM_DT = $("#FROM_DT").val();
		var TO_DT   = $("#TO_DT").val();
		var url = "/reserve/reserveReportSelectList.do";
		var formData = formIdAllToMap('frmSearch');
		formData.FROM_DT = formData.FROM_DT.replaceAll(/\./gi, '');
		formData.TO_DT   = formData.TO_DT.replaceAll(/\./gi, '');
		var param = {"param":formData};
		
		if((origin_FROM_DT.substr(0,7) !== FROM_DT.substr(0,7)) || (origin_TO_DT.substr(0,7) !== TO_DT.substr(0,7))) {
			origin_FROM_DT = FROM_DT;
			origin_TO_DT   = TO_DT;
			$.jgrid.gridUnload("#reserveReportGrid");	// grid 초기화
			viewGrid(FROM_DT, TO_DT);
		}

		fn_ajax(url, true, param, function(data, xhr) {
		    reloadGrid("reserveReportGrid", fn_dataSet(data.result));
			btGrid.gridQueryPaging($('#reserveReportGrid'), 'cSearch', data.result);
			
			$('#reserveReportGrid').bind('jqGridSelectRow', function(e, rowid, status) {
				grid1_onCilckRow(e, rowid, status);
			});
			
			var dayWeek = "";
			
			for(let i=0; i<data.result.length; i++) {
				// 일자별 현황값 추가
				dayWeek = "";
				const reservationDayList = data.result[i].dayOfReservation;
				if(reservationDayList.length > 0) {
					for(let j=0; j<reservationDayList.length; j++) {
						const dt  = Number(reservationDayList[j].BAS_DT);
						const numOfPerson = reservationDayList[j].PER_STR;		
						
						dayWeek += "day" + dt + "/" + numOfPerson + ",";
					}

				}
				$('#reserveReportGrid').jqGrid('setCell', [i+1], 'DAYWEEK', dayWeek);
			}
		});
	}
	
	// 조회내역 그리드 클릭 이벤트
	function grid1_onCilckRow(e, rowid, status){
		selectNum = rowid;	// 선택 그리드 순번
		origin_CHK_IN_DT  = $('#reserveReportGrid').jqGrid('getRowData',rowid).CHK_IN_DT;
		origin_CHK_OUT_DT = $('#reserveReportGrid').jqGrid('getRowData',rowid).CHK_OUT_DT;
		
		$.jgrid.gridUnload("#reserveDayReportGrid");
		
		if (($('#reserveReportGrid').jqGrid('getRowData',rowid).CHK_IN_DT != "") && ($('#reserveReportGrid').jqGrid('getRowData',rowid).CHK_OUT_DT != "")) {
			// 월별 그리드 조회 기간에 맞게 다시 셋팅
			createreserveDayReportGrid(origin_CHK_IN_DT, origin_CHK_OUT_DT);
			$("#reserveDayReportGrid").jqGrid("addRowData", 0, {}, 'first'); 

			var dayArr = ($('#reserveReportGrid').jqGrid('getRowData',rowid).DAYWEEK).split(",");
			for(var i=0; i<dayArr.length; i++) {
				var sDay = dayArr[i].split("/");
				$('#reserveDayReportGrid').jqGrid('setCell', 0, sDay[0], sDay[1]);
			}	
			
			// 주말 음영 처리
			const weekendOfMonth = getWeekendOfMonth(origin_CHK_IN_DT, origin_CHK_OUT_DT);
			for(let j=0; j<weekendOfMonth.length; j++) {
				$('#reserveDayReportGrid').jqGrid('setCell', 0, "day"+weekendOfMonth[j], "", {'background-color':'#FFCB9E'});
			}
		}	
	}
	
	// 예약 라운딩 그리드 row 초기화, 세팅
	function DayGridSet() {
		var FROM_DT = $("#FROM_DT").val();
		var TO_DT   = $("#TO_DT").val();
		
		$("#reserveDayReportGrid").clearGridData();
		$("#reserveDayReportGrid").jqGrid("addRowData", 0, {}, 'first'); 

		// 주말 음영 처리
		const weekendOfMonth = getWeekendOfMonth(FROM_DT, TO_DT);
		for(let j=0; j<weekendOfMonth.length; j++) {
			$('#reserveDayReportGrid').jqGrid('setCell', 0, "day"+weekendOfMonth[j], "", {'background-color':'#FFCB9E'});
		}
	}
	
	function cSave() {
		btGrid.gridSaveRow('reserveDayReportGrid');
		
		const ids = selectNum;
		const gridData = [];
		gridData.push($("#reserveDayReportGrid").getRowData(0));
		
		const url = '/reserve/saveReserveList.do';
		const param = {"param":{"FROM_DT"  : origin_CHK_IN_DT.replaceAll(/\./gi, ''),
					   "TO_DT"    : origin_CHK_OUT_DT.replaceAll(/\./gi, ''),
					   "REQ_DT"   : $("#reserveReportGrid").getRowData(selectNum).REQ_DT.replaceAll(/\./gi, ''),
					   "REQ_SEQ"  : $("#reserveReportGrid").getRowData(selectNum).SEQ,
					   "gridData" : gridData}
					   };
		
		fn_ajax(url, false, param, function(data, xhr){
			alert("저장하였습니다.");
			cSearch();
		}); 
	}
	
	//데이터 포멧 변경
	function fn_dataSet(data){
		var array = [];
		for (var i = 0; i < data.length; i++) {
			var obj = new Object;
			$.each(data[i] , function(key , value){
				//날짜 변경 YYYYMMDD > YYYY.MM.DD
				//예약일자 / 체크인 / 체크아웃 / 인보이스발행일자 / 예약금입금일자 / 잔금입금일자
				if((key == "REQ_DT" || key == "CHK_IN_DT" || key == "CHK_OUT_DT" || key == "DEP_IN_DT" || key == "INV_REG_DT" || key == "BAL_IN_DT") && value != ""){
					value = Util.converter.dateFormat1(value);
				}
				//금액에  ',' 추가
				else if(key == "TOT_AMT" || key == "DEP_AMT" || key == "BAL_AMT"){
					value = fn_comma(value);
				}
				//전화번호에  '-' 추가
				else if(key == "REQ_TEL_NO"){
					value = formatPhoneNumber(value);
				}
				
				obj[key] = value;
				delete obj;
			});
	        array.push(obj);
		}
		return array;
	}
	
	// 무슨 요일인지 체크
	//ex) getDayOfWeek('2022-06-13')
	function getDayOfWeek(yyyyMMdd) { 
	    const week = ['일', '월', '화', '수', '목', '금', '토'];
	    const dayOfWeek = week[new Date(yyyyMMdd).getDay()];
	    return dayOfWeek;
	}
	
	// 주말인 날짜 리턴
	function getWeekendOfMonth(FROM_DT, TO_DT) {
		const from_dt = FROM_DT.replaceAll(/\./gi, '');
		const to_dt   = TO_DT.replaceAll(/\./gi, '');

		const weekendOfMonth = [];
		for(let i=from_dt; i<=to_dt; i++) {
			const dd   = ''+i;
			const year = dd.substr(0, 4);
			const mon  = dd.substr(4, 2);
			const day  = dd.substr(6, 2);
			
			const dayOfWeek = getDayOfWeek(year + "." + mon + "." + day);
			if(dayOfWeek == '토' || dayOfWeek == '일') {
				weekendOfMonth.push(i);
			}
		}
		return weekendOfMonth;
	}
	
	//전화번호 변환
	function formatPhoneNumber (input) {
	    var cleanInput = input.replaceAll(/[^0-9]/g, "");
	    var result = "";
	    var length = cleanInput.length;
	    if(length === 8) {
	        result = cleanInput.replace(/(\d{4})(\d{4})/, '$1-$2');
	    } else if(cleanInput.startsWith("02") && (length === 9 || length === 10)) {
	        result = cleanInput.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-$2-$3');
	    } else if(!cleanInput.startsWith("02") && (length === 10 || length === 11)) {
	        result = cleanInput.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
	    } else {
	        result = undefined;
	    }
	    return result;
	}
	
	
	//현재 월의 1일 구하기
	function getMonthFirstDay(){
		var today = new Date();
		var dd = '01';
		var mm = today.getMonth() + 1;
		var yyyy = today.getFullYear();

		if(mm < 10) {
			mm='0'+mm
		}

		return dd + '.' + mm + '.'+yyyy;
	}
</script>
<c:import url="../import/frameBottom.jsp" />
