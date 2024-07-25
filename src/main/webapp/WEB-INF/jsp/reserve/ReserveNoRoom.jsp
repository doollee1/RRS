<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : ReserveNoRoom(객실풀관리)
	 */
%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="RV04" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>
<div id="right_wrap">
	<div class="tab_top_search" id="calendar_noroom" style="border: double 4px; border-color: darkgray">
		<table class="scriptCalendar" id="reserve_noroom_Calendar">
			<thead>
				<tr>
					<td class="calendarBtn" id="btnPrevCalendar">&#60;&#60;</td>
					<td colspan="5">
						<span id="calYear">YYYY</span>년
						<span id="calMonth">MM</span>월
					</td>
					<td class="calendarBtn" id="nextNextCalendar">&#62;&#62;</td>
				</tr>
				<tr>
					<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>

	<h4 class="ct_grid_top_left" style="margin:40px 0 0 65px; color: #ff6600;">※등록</h4>

	<table class="reserve_room_tblForm">
		<tbody>
			<tr>
				<th>등록날짜</th>
				<td><input type="text" name="noRoomDate" id="noRoomDate" style="width:150px; text-align: center;"/></td>
			</tr>
			<tr>
				<th>객실타입</th>
				<td>
					<select name="noRoomType" id="noRoomType" style="width:155px; height:24px; text-align: center;" value="">
						<option value="">-선택-</option>
						<option value="00">전 객실</option>
						<option value="01">트윈</option>
						<option value="02">킹</option>
					</select>
				</td>
			</tr>
		</tbody>
	</table>

	<div>
		<button id="inputRow" type="button" class="btn_noroom" >추가</button>
	</div>
</div>

<div id="ctm_wrap" style="width:50%; margin-left:30px;">
	<div id="ctm_mg_wrap">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left"><h4><s:message code="reservation.title1"/></h4></div>
				<div class="ct_grid_top_right"></div>
			</div>
		</div>
		<!-- 검색조건 영역 시작 -->
		<div id="frmSearch">
			<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
			<input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE" />
			<!------------->
			<div class="tab_top_search">
				<table id="table_reserve_noroom">
					<tbody>
						<tr>
							<td class="small_td" style="width:15%"><p>조회기간</p></td>
							<td class="medium_td">
								<input type="text" name="fromDate" id="fromDate" data-type="date" style="width:90px; float:left; text-align: center;"/>
								<p style="float:left;">-</p>
								<input type="text" name="toDate" id="toDate" data-type="date" style="width:90px;float:left; text-align: center;"/>
							</td>
							<td style=" width:30%; text-align:right;">
								<button id="showRoom" class="cBtnclass cBtnSearch_style" onclick="cSearch()">조회</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-------------->
		</div>
		<!-- 검색조건 영역 끝 -->

	<div id="ctm_wrap">
		<!-- 그리드 시작 -->
		<div id="ctm_mg_wrap">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left"><h4><s:message code="reservation.title2"/></h4></div>
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<table id="roomGrid"></table>
					<div id="quotationGrid_pager"></div>
				</div>
			</div>
		</div>
		<!-- 그리드 끝 -->
	</div>
</div>

<style type="text/css">
	a { color:#000000; text-decoration:none; }
	.calendarBtn { cursor:pointer; }
	.ct_grid_top_left {display:block;}
	#right_wrap { width:45%; float:right; display: grid; justify-content: center; align-items: center; margin-top:28px; }
	#inputRow {float: right; height:25px; margin:10px 62px 0 0;}
	#updateRow {height: 30px; width: 50px; float: right; margin:10px 62px 0 0;}
	#showRoom {margin-left:10px; height:25px;}
	#roomGrid {width:640px;}
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

/******************************************** 
 * @Subject : 객실풀관리 화면
 * @Content : 
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/

$(function() {
	var args;
	var datagrid;
	let row_ID;
	fn_Init();
});

/******************************************** 
 * @Subject : 화면 OPEN 시 최초 실행 함수
 * @Content : 기본 설정 값 셋팅
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function fn_Init(){
	var toDay     = preMonth();        //이전달 첫날
	var lastMonth = getlastMonth();    //이번달 마지막날

	$("#fromDate").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay).substr(0,6)+'01'));
	$("#toDate").val(Util.converter.dateFormat1(Util.converter.dateFormat3(lastMonth)));

	createRoomGrid();
	cSearch();
}

/******************************************** 
 * @Subject : 그리드 세팅 및 생성
 * @Content : 객실풀관리 조회 그리드 세팅 및 생성
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function createRoomGrid() {
	var colName = [
			'순번',
			'일자',
			'객실유형',
			'객실이름',
			'정정',
			'상태'
			];
	var colModel = [
		{name : 'ROWNUM'      , width : 85 , align : 'center'},
		{name : 'REQ_NO_DT'   , width : 220, align : 'center'},
		{name : 'ROOM_TYPE'   , align : 'center', hidden:true},
		{name : 'ROOM_TYPE_NM', width : 220, align : 'center'},
		{name : 'DELETE'      , width : 95 , align : 'center', formatter:delRow},
		{name : 'STATE'       , align : 'center', hidden:true}
		];
	var gSetting = {
			pgflg          : true,
			exportflg      : false,    //엑셀, pdf 출력 버튼 노출여부
			colsetting     : false,    // 컬럼 설정 버튼 노출여부
			searchInit     : false,    // 데이터 검색 버튼 노출여부
			resizeing      : true,
			rownumbers     : false,
			shrinkToFit    : false,
			autowidth      : true,
			queryPagingGrid: false,    // 쿼리 페이징 처리 여부
			height : 500
	};
	
	btGrid.createGrid('roomGrid', colName, colModel, gSetting);
}

/* 그리드내 삭제버튼 생성 */
function delRow(cellvalue, options, rowObject){
	var str = "";
	var rowid = options.rowId;

	str += "<div>";
	str += "<button class='delBtn' onclick=\"javascript:fn_delete('" + rowid + "' )\">[ 삭 제 ]</button>";
	str += "</div>";

	return str;
}

/******************************************** 
 * @Subject : 객실풀관리 화면 조회
 * @Content : 조회조건에 입력된 날짜로 DB에 저장된 값 조회 후 그리드에 추가
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
function cSearch(currentPage) {
	if(!validation()) return;
	$.ajax({
		type:"post",
		url:"/reserve/noRoomList.do",
		data:{"FROM_DATE" : $("#fromDate").val().replaceAll(/\./gi, '')
			 ,"TO_DATE"   : $("#toDate").val().replaceAll(/\./gi, '')
		},
		dataType:"json"
	}).done(function(data){
		if(data.dup == 'N'){
			alert("조회에 실패했습니다. e.message:"+data.message);
		}
		else{
			reloadGrid("roomGrid", data.result);
		}

		formDate();
	});
}

/******************************************** 
 * @Subject : 추가버튼 클릭 시
 * @Content : 선택한 날짜와 객실을 그리드에 추가
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
$("#inputRow").click(function(){
	btGrid.gridSaveRow('roomGrid');
	var rowData = $("#roomGrid").getRowData();
	var date = $("#noRoomDate").val();

	if($("#noRoomDate").val().length == 0){
		alert("<s:message code='info.inputdate'/>");
		return;
	}
	if(!validChk_date(date)){
		alert("올바른 날짜를 입력해주세요");
		return;
	}
	if($("#noRoomType").val() == ""){
		alert("객실 타입을 선택해주세요.");
		return;
	}
	/* 입력된 날짜값을 변경 */
	if(date.length == 8)
		date = date.substring(0,4)+'-'+date.substring(4,6)+'-'+date.substring(6,8);

	/* 기존의 그리드에 있는 값이랑 중복인지 체크 */
	for(var i=0; i < rowData.length; i++){
		if(date == rowData[i]["REQ_NO_DT"] && $("#noRoomType").val() == rowData[i]["ROOM_TYPE"]){
			alert("이미 조회 자료에 있는 값입니다.");
			return;
		}
	}

	var data = {"ROOM_TYPE"    : $("#noRoomType").val(),
				"REQ_NO_DT"    : date,
				"ROOM_TYPE_NM" : findType($("#noRoomType").val()),
				"STATE"        : 'I'
				};
	/* 중복이 없으면 추가 */
	btGrid.gridAddRow("roomGrid", "last", data);
	$("#roomGrid").jqGrid("resetSelection");
});

/******************************************** 
 * @Subject : 저장 버튼 클릭 시
 * @Content : 그리드에 있는 값을 DB에 저장
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
function cSave() {
	if(confirm("<s:message code='confirm.save'/>") == true){
		var gridData   = $("#roomGrid").getRowData();
		var insertData = [];

		/* DB저장을 위해 YYYY-mm-dd 를 YYYYmmdd로 변경 */
		for(var i=0; i < gridData.length; i++) {
			if(gridData[i].STATE == 'I'){
				var ori_Date = gridData[i].REQ_NO_DT.replaceAll(/\-/gi, '');
				gridData[i].REQ_NO_DT = ori_Date;
				insertData.push(gridData[i]);
			}
		}

		/* 신규 추가된 내용이 없을 경우 */
		if(insertData.length == 0){
			alert("저장할 내용이 없습니다.");
			return;
		}

		var url = "/reserve/saveNoRoom.do";
		var param = {"detail"    : insertData};

		fn_ajax(url, true, param, function(data, xhr) {
			if(data.dup == 'N'){
				alert("저장되지 않았습니다.");
			}
			else{
				alert("<s:message code='info.save'/>");
			}
			cSearch();
		});
	}
	else{
		return;
	}
}

/* 저장전 날짜값이 올바른지 체크 */
function validation(){
	var from_date = $("#fromDate").val().replaceAll(/\./gi, '');
	var to_date   = $("#toDate").val().replaceAll(/\./gi, '');
	
	if(from_date > to_date){
		alert("시작일자가 종료일자보다 큽니다. 날짜를 확인해주세요.");
		return false;
	}
	return true;
}

/* DB에서 가져온 날짜와 객실을 화면에 보여주기 전에 표시를 변경함 */
function formDate(){
	var rowDataList = $("#roomGrid").getRowData();
	for(var i = 0; i < rowDataList.length; i++) {
		var ori_Date     = rowDataList[i].REQ_NO_DT;
		var convert_Date = ori_Date.substr(0,4) +"-"+ ori_Date.substr(4,2) +"-"+ ori_Date.substr(6,2);
		$("#roomGrid").jqGrid('setCell', i+1, 'REQ_NO_DT', convert_Date);

		var roomType = rowDataList[i].ROOM_TYPE;
		$("#roomGrid").jqGrid('setCell', i+1, 'ROOM_TYPE_NM', findType(roomType));

		$("#roomGrid").jqGrid("saveRow",rowDataList[i]);
	}
}

/* 객실 타입(ROOM_TYPE)에 따른 객실 이름(ROOM_TYPE_NM) 변경 */
function findType(room){
	switch(room){
	case "00" :
		return "전 객실";
	break;
	case "01" :
		return "트윈";
	break;
	case "02" :
		return "킹";
	break;
	}
}

/* 각 데이터에 알맞는 FORMAT 부여 */
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

/******************************************** 
 * @Subject : 그리드 내 삭제버튼 클릭 시
 * @Content : 해당 그리드 행을 삭제
 * @Since   : 2024.07.11
 * @Author  : 이주형
 ********************************************/
function fn_delete(rowid,idx){
	if(confirm("정말 삭제하시겠습니까?") == true){
		var date = $("#roomGrid").jqGrid("getCell", rowid, "REQ_NO_DT").replaceAll(/\-/gi, '');
		var type = $("#roomGrid").jqGrid("getCell", rowid, "ROOM_TYPE");

		/* DB에 등록된 정보가 아닌 저장전 임시로 그리드에 추가한 값을 지울때 */
		if($("#roomGrid").jqGrid("getCell", rowid, "STATE") == 'I'){
			$("#roomGrid").jqGrid("delRowData", rowid);
			return;
		}

		/* DB에 저장된 값을 지울때 */
		var url = '/reserve/deleteNoRoom.do';
		var param = {
			  "DATE" : date
			, "TYPE" : type
		};

		fn_ajax(url,false,param,function(data,xhr){
			if(data.dup == 'Y'){
				alert("삭제하였습니다.");
			}
			else
				alert("삭제에 실패했습니다.")
			cSearch();
		});
	}
	else{
		return;
	}
}

/* 날짜 입력시 올바른 입력인지 확인 */
function validChk_date(date){
	/* YYYY-MM-DD 일때 */
	var format = /^(19|20|21)\d{2}-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	/* YYYYMMDD 나 YYYYMDD 일때 */
	var format2 = /^(19|20|21)\d{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

	if( format.test(date) || format2.test(date)){
		return true;
	}
	return false;
}

/******************************************** 
 * @Subject : 달력 만드는 스크립트
 * @Content : 달력과 그에 쓰이는 함수 선언
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
document.addEventListener("DOMContentLoaded", function() {
	buildCalendar();

	document.getElementById("btnPrevCalendar").addEventListener("click", function(event) {
		prevCalendar();
	});

	document.getElementById("nextNextCalendar").addEventListener("click", function(event) {
		nextCalendar();
	});
});

var toDay   = new Date();    // 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 toDay에 Date 객체를 넣어줌
var nowDate = new Date();    // 실제 오늘날짜 고정값

/* 이전달 버튼 클릭시 */
function prevCalendar() {
	this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() - 1, toDay.getDate());
	buildCalendar();
}

/* 다음달 버튼 클릭시 */
function nextCalendar() {
	this.toDay = new Date(toDay.getFullYear(), toDay.getMonth() + 1, toDay.getDate());
	buildCalendar();
}

/* 캘린더 오픈 */
/* 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다. */
function buildCalendar() {
	let doMonth = new Date(toDay.getFullYear(), toDay.getMonth(), 1);
	let lastDate = new Date(toDay.getFullYear(), toDay.getMonth() + 1, 0);
	let tbCalendar = document.querySelector(".scriptCalendar > tbody");

	document.getElementById("calYear").innerText = toDay.getFullYear();                       //   YYYY월
	document.getElementById("calMonth").innerText = autoLeftPad((toDay.getMonth() + 1), 2);   //   MM월

	/* 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다. */
	while(tbCalendar.rows.length > 0) {
		tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	}

	/* 첫번째 개행 */
	let row = tbCalendar.insertRow();

	/* 날짜가 표기될 열의 증가값 */
	let dom = 1;

	/* 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
	   7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다. */
	let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

	/* 달력 출력
	   시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다. */
	for(let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
		let column = row.insertCell();
		// 평일( 전월일과 익월일의 데이터 제외 )
		if(Math.sign(day) == 1 && lastDate.getDate() >= day) {
			// 평일 날짜 데이터 삽입
			column.innerText = autoLeftPad(day, 2);
			// 일요일인 경우
			if(dom % 7 == 1) {
				column.style.color = "#FF4D4D";
			}
			// 토요일인 경우
			if(dom % 7 == 0) {
				column.style.color = "#4D4DFF";
				row = tbCalendar.insertRow();   //   토요일이 지나면 다시 가로 행을 한줄 추가한다.
			}
		}
		// 평일 전월일과 익월일의 데이터 날짜변경
		else {
			let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
			column.innerText = autoLeftPad(exceptDay.getDate(), 2);
			column.style.color = "#A9A9A9";
			column.style.backgroundColor = "#E5E5E5";
		}

		// 전월, 명월 음영처리
		// 현재년과 선택 년도가 같은경우
		if(toDay.getFullYear() == nowDate.getFullYear()) {
			// 현재월과 선택월이 같은경우
			if(toDay.getMonth() == nowDate.getMonth()) {
				// 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
				if(nowDate.getDate() > day && Math.sign(day) == 1) {
					column.style.backgroundColor = "#FFFFFF";
					column.style.cursor = "pointer";
					column.onclick = function(){ calendarChoiceDay(this); }
				}
				// 현재일보다 이후이면서 현재월에 포함되는 일인경우
				if(nowDate.getDate() < day && lastDate.getDate() >= day) {
					column.style.backgroundColor = "#FFFFFF";
					column.style.cursor = "pointer";
					column.onclick = function(){ calendarChoiceDay(this); }
				}
				// 현재일인 경우
				else if(nowDate.getDate() == day) {
					column.style.backgroundColor = "#CEE3F6";
					column.style.cursor = "pointer";
					column.onclick = function(){ calendarChoiceDay(this); }
				}
			// 현재월보다 이전인경우
			} else if(toDay.getMonth() < nowDate.getMonth()) {
				if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
					column.style.backgroundColor = "#FFFFFF";
					column.style.cursor = "pointer";
					column.onclick = function(){ calendarChoiceDay(this); }
				}
			}
			// 현재월보다 이후인경우
			else {
				if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
					column.style.backgroundColor = "#FFFFFF";
					column.style.cursor = "pointer";
					column.onclick = function(){ calendarChoiceDay(this); }
				}
			}
		}
		// 선택한년도가 현재년도보다 작은경우
		else if(toDay.getFullYear() < nowDate.getFullYear()) {
			if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
				column.style.backgroundColor = "#FFFFFF";
				column.style.cursor = "pointer";
				column.onclick = function(){ calendarChoiceDay(this); }
				//column.style.backgroundColor = "#E5E5E5";
			}
		}
		// 선택한년도가 현재년도보다 큰경우
		else {
			if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
				column.style.backgroundColor = "#FFFFFF";
				column.style.cursor = "pointer";
				column.onclick = function(){ calendarChoiceDay(this); }
			  //column.style.backgroundColor = "#E5E5E5";
			}
		}
		dom++;
	}
}

/* 날짜 선택시 */
function calendarChoiceDay(column) {
	//   기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
	if(document.getElementsByClassName("choiceDay")[0]) {
		if(document.getElementById("calMonth").innerText == autoLeftPad((nowDate.getMonth() + 1), 2)
			&& document.getElementsByClassName("choiceDay")[0].innerText == autoLeftPad(toDay.getDate(), 2)) {
			document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#CEE3F6";
		}

		else {
			document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
		}
		document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
	}

	//   선택일 체크 표시
	column.style.backgroundColor = "#FF9999";

	//   선택일 클래스명 변경
	column.classList.add("choiceDay");
	column.id = 'choiceDay';

	var choiceday = toDay.getFullYear() +"-"+ autoLeftPad(toDay.getMonth()+1,2) +"-"
					+ document.getElementsByClassName("choiceDay")[0].innerText;

	$("#noRoomDate").val(choiceday);
}

/* 숫자 두자릿수( 00 ) 변경 */
function autoLeftPad(num, digit) {
	if(String(num).length < digit) {
		num = new Array(digit - String(num).length + 1).join("0") + num;
	}
	return num;
}
/* 달력만드는 스크립트 END */
</script>

<c:import url="../import/frameBottom.jsp" />