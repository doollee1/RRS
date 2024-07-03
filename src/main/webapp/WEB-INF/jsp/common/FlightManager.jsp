<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : FlightManager
	 * @Description : FlightManager
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="RV05" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize">
</div>
<!-- 검색조건 영역 끝 -->

<!-- dummy -->
<div class="top_button_h_margin"></div>
<div id="ctu_wrap">
	<!-- 검색조건 영역 시작 -->
	<div id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td">조회조건</td>
						<td class="medium_td">
							<select id="FLIGHT_TIME" name="FLIGHT_TIME" onchange="chageLangSelect()">
								<option value="500180">출발 항공편</option>
								<option value="500190">도착 항공편</option>
								<option value="500160">야간할증 항공편</option>
							</select>
						</td>
						<td class="small_td">검색어</td>
						<td>
							<input id="FLIGHT_NAME" type="text" placeholder="항공기명을 입력해주세요."></input>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 검색조건 영역 끝 -->
	<div class="ct_grid_top_wrap">
		<div class="ct_grid_top_left">
			<h4 style="display:inline">항공편 목록</h4>
			<span style="color:red; opacity: 60%; margin-left:425px">※출발시간과 도착시간은 4자리 숫자로 입력해주세요.</span>
		</div>
		<div class="ct_grid_top_right">
			<button class='cBtn cBtnAdd_style' id='cBtnAdd' type='button' onclick='cAdd();'>추가</button>
			<button class='cBtn cBtnDel_style' id='cBtnDel' type='button' onclick='cDel();'>삭제</button>
		</div>
	</div>		
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<table id="flightgrid"></table>
	    <div id="flightgrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
	<p>&nbsp;</p>
</div>

<style type="text/css">
	.cBtn {border:1px solid #ccc; border-radius:4px; padding-left:23px;  padding-right:8px; background-color:transparent !important; height:25px;}
	.cBtn:hover {border:1px solid #ff6600; border-radius:4px; padding-right:8px;background-color:transparent;}
	.ct_grid_top_left {padding-top:3px; padding-bottom:3px;}
	.ct_grid_top_wrap {height:25px;}
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
	//초기 로드
	var args;
	var flight_time;
	
	$(function() {
		initLayout();
		createGrid();

		$("#flightgrid").on("change",function(){
			var changeRowId  = $("#flightgrid").jqGrid("getGridParam", "selrow");
			
			if($("#flightgrid").jqGrid("getRowData", changeRowId).STATE != "I"){
				$("#flightgrid").jqGrid("setCell",changeRowId , "STATE", "U"); 
			}
			
			$("#flightgrid").jqGrid("saveRow",changeRowId);
		});
		
		cSearch();
	});
	
	function createGrid(){
		var colName = [ '순번',
						'헤더코드',
						'상세코드',
						'항공편',
						'출발시간',
						'도착시간',
						'항공사코드',
						'사용여부',
						'삭제',
						'상태'
						];
		var colModel = [
			{ name : 'ROWNUM'  , width: 70 , align : 'center'},
			{ name : 'HEAD_CD' , width: 50 , align : 'center', hidden:true},
			{ name : 'CODE'    , width: 50 , align : 'center', hidden:true},
			{ name : 'CODE_NM' , width: 100, align : 'center', formatter:codeFormat, editable:true},
			{ name : 'REF_CHR1', width: 100, align : 'center', formatter:timeFormat, unformat: unTimeFormat, editable:true},
			{ name : 'REF_CHR2', width: 100, align : 'center', formatter:timeFormat, unformat: unTimeFormat, editable:true},
			{ name : 'REF_CHR3', width: 60 , align : 'center', formatter:'integer' , editable:true},
			{ name : 'STATUS'  , width: 40 , align : 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:{"Y":"Y","N":"N"}}},
			{ name : 'CHK'     , index : 'CHK', width : 40, align : 'center', formatter : gridCboxFormat, sortable: false},
			{ name : 'STATE'   , hidden:true}
	  	];
		var gSetting = {
		        pgflg          : true,
		        exportflg      : false, //엑셀, pdf 출력 버튼 노출여부
		        colsetting     : false,
				searchInit     : false,
				resizeing      : true,
				rownumbers     : false,
				shrinkToFit    : true,
				autowidth      : false,
				queryPagingGrid: false, // 쿼리 페이징 처리 여부
				height:630
		};
		
		btGrid.createGrid('flightgrid', colName, colModel, gSetting);
	}
	
	function codeFormat(object){
		var format2 = /^[a-zA-Z0-9](?=.*[a-zA-Z])(?=.*[0-9]).{3,12}$/g;
		var code;
		if( !format2.test(object) ){
			code = "";
		}
		else
			code = object.toUpperCase();
		
		return code;
	}
	
	function timeFormat(object){
		var time;
		var format = /^\d{4}$/;
		
		if(object == " " || object == "" || !format.test(object)){
			time = "";
		}
		else{
			time = object.substr(0,2)+":"+object.substr(2,4);
		}
		
		return time;
	}
	
	function unTimeFormat(object){
		var time = object.replace(":","");
		
		return time;
	}
	
	//조회버튼
	function cSearch(currentPage){
		var url = "/common/selectFlightInfo.do";
		flight_time = $('select#FLIGHT_TIME').val(); //조회조건
		var flight_name = $('#FLIGHT_NAME').val();		 //검색어
		var param = {"TIME":flight_time,
				     "NAME":flight_name
				     };
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("flightgrid",data.result);
		});
	}

	//추가버튼
	function cAdd(){
		var addData = { "HEAD_CD": flight_time,
					    "STATUS" : "Y",
				        "STATE"  : "I"
				      };
		btGrid.gridAddRow("flightgrid", "last", addData);
	}
	
	//저장버튼
	function cSave(){
		if(confirm("<s:message code='confirm.save'/>")){
			var gridData = $("#flightgrid").getRowData();
			var insertData=[];
			var updateData=[];
			
			for(var i=0;i<gridData.length;i++){
				//항공편이 입력된 값만 추가한다
				if(gridData[i].CODE_NM != ""){
					if(gridData[i].STATE == 'I'){
						insertData.push(gridData[i]);
					}
					else if(gridData[i].STATE == 'U'){
						updateData.push(gridData[i]);
					}
				}
			}
			
			if(insertData.length == 0 && updateData.length == 0){
				alert("저장할 항목이 없습니다.");
				return;
			}
			
			var url = '/common/saveFlightInfo.do';
			var param = {"IData" : insertData, //STATE가 I 인 데이터 - insert
					     "UData" : updateData  //STATE가 U 인 데이터 - update
					    };
			
			fn_ajax(url, true, param, function(data, xhr){
				if(data.success){
					alert("<s:message code='info.save'/>");
				}else{
					alert("저장에 실패했습니다.");
				}
				
			    cSearch();
			});
		}
	}
	
	function cDel(){
		var ids = $("#flightgrid").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		
		btGrid.gridSaveRow('flightgrid');
		for(var i = 0; i < ids.length; i++){
			if($('#flightgrid_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#flightgrid").getRowData(ids[i]));
			}
		}
		
		if(cnt < 1){
			alert("삭제할 데이타를 선택하십시오.");
			return;
		}
		
		if(confirm("삭제하시겠습니까?")){
			var url = '/common/deleteFlightInfo.do';
			var param = {"gridData" : gridData};
			
			fn_ajax(url, false, param, function(data, xhr){
				if(data.success){
					alert("삭제하였습니다.");
				}else{
					alert("삭제에 실패했습니다.");
				}
				
				cSearch();
			});
		}
	}
	
	//조회조건 항공편 변경시 검색어 초기화
	function chageLangSelect(){
		$("#FLIGHT_NAME").val("");
		cSearch();
	}
</script>

<c:import url="../import/frameBottom.jsp" />