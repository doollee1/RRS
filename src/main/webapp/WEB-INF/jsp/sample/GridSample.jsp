<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : GridSample
	 * @Description : 그리드 샘플 화면
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="GridSample" />
</c:import>

<div id="ctm_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="sech_list">
					<div>대메뉴</div>
					<select id="S_SYSTEM_CD" name="S_SYSTEM_CD" class="cmc_combo">
						<option value="" selected="selected">==전체==</option>								
						<c:forEach var="i" items="${systemlist}">
							<option value="${i.code}">${i.value}</option>
						</c:forEach>
					</select>
				</li>
				<li class="sech_list">
					<div>메뉴그룹</div>
					<select id="S_PROG_GROUP" name="S_PROG_GROUP" class="cmc_combo">
						<option value="" selected="selected">==전체==</option>		
					</select>
				</li>
				<li class="sech_list">
					<div>사용유무</div>
					<select id="S_STATUS" name="S_STATUS" class="cmc_combo">
						<option value="" selected="selected">==전체==</option>								
						<c:forEach var="i" items="${useyn}">
							<option value="${i.code}">${i.value}</option>
						</c:forEach>
					</select>
				</li>
			</ul>
		</div>
	</form>
	<!-- 검색조건 영역 끝 -->
	
	<div id="tabs">
		<ul>
			<li class="matrix_tab"><a href="#tab1">tab1</a></li>
			<li class="matrix_tab"><a href="#tab2">tab2</a></li>
			<li class="matrix_tab"><a href="#tab3">tab3</a></li>
			<li class="matrix_tab"><a href="#tab4">tab4</a></li>
		</ul>
<form id="frmSearch" action="#">
		<!----- tab 1 ----->
			<div id="tab1">
				<!-- ---customer notes -->
				<div>
					<button style="float:right;"class='btn btn-default' id='' name='' type='button'><i class='fa fa-edit'></i>edit</button>
					<h4>Customer Notes(printed)</h4>
				</div>								
				<textarea style="height:100px; min-height:100px; width:99%; overflow:auto; margin-right:10px; padding-right:10px;"></textarea>
				<!-- ----notes---- -->
					<div>
						<button style="float:right;"class='btn btn-default' id='' name='' type='button'><i class='fa fa-edit'></i>edit</button>
						<h4>Notes</h4>
					</div>
				<table class="table_line">
					<tr>
						<td>Text Type</td>
						<td>Text</td>
						<td>Language</td>
					</tr>
					<tr>
						<td><select>Description</select></td>
						<td>Text</td>
						<td><select>Description</select></td>
					</tr>
				</table>
				<!-- ----privates note --- -->
				<div>
					<button style="float:right;"class='btn btn-default' id='' name='' type='button'><i class='fa fa-edit'></i>edit</button>
					<h4>Privates Notes</h4>
				</div>
				<textarea style="height:100px; min-height:100px; width:99%; overflow:auto; padding-right:10px;"></textarea>		
			</div>
			<!----- tab 2 ----->
			<div id="tab2">
				
			</div>
			<!----- tab 3 ----->
			<div id="tab3">
				
			</div>
			<!----- tab 4 ----->
			<div id="tab4">
				
			</div>
				
		</form>
			<!-- 그리드 끝 -->
			<p>&nbsp;</p>
</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">중메뉴목록</div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:8px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">프로그램목록</div>
			<div class="ct_grid_top_right">
				<input type="button" id="btnAdd" value="추가"/>
				<input type="button" id="btnDel" value="삭제"/>
				<input type="button" id="btnSave" value="저장"/>
				<input type="hidden"  name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
				<input type="hidden"  name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
			</div>
		</div>
		<table id="grid2"></table>
		<div id="grid2_pager"></div>
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
	//초기 로드
	$(function() {
		initLayout();
		createGrid1();
		creategrid2();
		
		// 그리드 로우 클릭시 이벤트 발생
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});
		
		$("#btnAdd").click(function(e){
			addProgram();
		});
		
		$("#btnDel").click(function(e){
			delProgram();
		});
		
		$("#btnSave").click(function(e){
			saveProgram();
		});
		
		$("#S_SYSTEM_CD").change(function(e){
			changeMidMenu();
		});
		
	});
	
	//그리드 컬럼 설정
	function createGrid1(){
		var colName = ['회사코드','시스템코드','프로그램코드','프로그램명','프로그램영어명','레벨','그룹','정렬','사용유무'];
		var colModel = [
			{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
			{ name: 'SYSTEM_CD', width: 120, align: 'center' },
			{ name: 'PROG_CD', width: 120, align: 'center' },
			{ name: 'PROG_NM', width: 180 },
			{ name: 'PROG_ENG', width: 180 },
			{ name: 'PROG_LV', width: 70, hidden:true },
			{ name: 'PROG_GROUP', width: 70, hidden:true },
			{ name: 'PRIORITY', width: 70, align:'right',formatter: 'integer' },
			{ name: 'STATUS_NM', width: 70, align: 'center'}
	  	];
		
		var gSetting = {
		        pgflg:true,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : false,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				resizeing : true,
				rownumbers:false,
				queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}

	//그리드 컬럼 설정
	function creategrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid2\')" /> ', //그리드 헤더에 체크 박스 눌렀을 때 전체 선택 되게 할때 필요
						'회사코드','시스템코드','프로그램코드','프로그램명','프로그램영어명','레벨','URL','그룹','정렬','TEST','사용유무'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat},  //그리드 체크박스 컬럼 formatter : gridCboxFormat 필요
			{ name: 'COMP_CD', width: 80, align: 'center', hidden: true },
			{ name: 'SYSTEM_CD', width: 120, align: 'center' },
			{ name: 'PROG_CD', width: 150, align: 'left', editable:true },
			{ name: 'PROG_NM', width: 180, editable:true },
			{ name: 'PROG_ENG', width: 180, editable:true },
			{ name: 'PROG_LV', width: 70, editable:true, align:'right' },
			{ name: 'PROG_URL', width: 250, editable:true },
			{ name: 'PROG_GROUP', width: 70, align:'center' },
			{ name: 'PRIORITY', width: 70, editable:true, align:'right',formatter: 'integer' },
			{ name: 'CHANGETEST', width: 70, editable:true, align:'right',
				editoptions:{
					dataEvents:[{
						type:"change",
						fn:function(e){
							this.value = fn_getDateFormat(this.value);
						}
					}]
				}
			},
			{ name: 'STATUS', width: 70, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}} //그리드 select box 처리
			
	  	];
		
		var gSetting = {
		        pgflg:true,
		        colsetting : false, // 컬럼 설정 버튼 노출여부
				searchInit : false, // 데이터 검색 버튼 노출여부
				resizeing : true,
				rownumbers:false,
				footerrow:true,		// 하단의 합계 로우 노출여부
				queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화// 그리드 생성 및 초기화
		btGrid.createGrid('grid2', colName, colModel, gSetting);
	}
	
	function grid1_onCilckRow(e, rowid, status){
		progSearch(null, rowid);
	}
	
	function addProgram(){
		var rowId = $('#grid1').jqGrid('getGridParam', 'selrow');
		var rowData = $("#grid1").getRowData(rowId);
		var addData = {
			"COMP_CD" : rowData["COMP_CD"]
		   ,"SYSTEM_CD" : rowData["SYSTEM_CD"]
		   ,"PROG_GROUP" : rowData["PROG_GROUP"]
		};
		// 그리드 로우 추가
		btGrid.gridAddRow("grid2", "last", addData);
	}
	
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
		vRowsPerPage = btGrid.getGridRowSel('grid1_pager'); //현재 선택된 페이지 번호 설정
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/system/selectProgInfo.do";
		
		var formData = formIdAllToMap('frmSearch');  // 조회 조건 form의 컨트롤들의 데이터 설정
		formData["S_PROG_LV"] = "0";
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);  // 그리드 페이징 설정 
			$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
		});
	}
	
	function delProgram(){
		var ids = $("#grid2").jqGrid("getDataIDs"); // 해당 그리드의 전체 로우의 아이디 조회
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){  //그리드의 체크 박스 체크 여부
				btGrid.gridDelRow("grid2", ids[i]);  // 해당 id의 로우 삭제
			}
		}
	}
	
	function saveProgram(){
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid2');   // 그리드 edit 모드에서 복귀
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid2").getRowData(ids[i]));
			}
		}
		
		if(cnt < 1){
			alert("저장할 대메뉴를 선택하십시오.");
			return;
		}
		
		for(var i = 0; i < gridData.length; i++){
			if(fn_empty(gridData[i]["SYSTEM_CD"])){
				alert("대메뉴 코드를 입력하세요.");
				return;
			}
			
			if(fn_empty(gridData[i]["PROG_CD"])){
				alert("프로그램 코드를 입력하세요.");
				return;
			}
			
			if(fn_empty(gridData[i]["PROG_LV"])){
				alert("프로그램 레벨를 입력하세요.");
				return;
			}
		}
	}
	
	function progSearch(currentPage, rowid){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE2').val())) {
			vCurrentPage = $('#CURRENT_PAGE2').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('grid2_pager');
		$('#CURRENT_PAGE2').val(vCurrentPage);
		$('#ROWS_PER_PAGE2').val(vRowsPerPage);
		
		if(fn_empty(rowid)){
			rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
		}

		var rowData = $("#grid1").getRowData(rowid);
		var url = "/system/selectProgInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		formData["S_SYSTEM_CD"] = rowData["SYSTEM_CD"];
		formData["S_PROG_GROUP"] = rowData["PROG_CD"];
		formData["CURRENT_PAGE"] = $('#CURRENT_PAGE2').val();
		formData["ROWS_PER_PAGE"] = $('#ROWS_PER_PAGE2').val();
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid2", data.result);
			btGrid.gridQueryPaging($('#grid2'), 'progSearch', data.result);
			if(data.result.length > 0){
				$('#grid2').jqGrid('setSelection', $('#grid2').jqGrid('getDataIDs')[0]);
			}
		});
	}
	
	function changeMidMenu(){
		if(!$("#S_SYSTEM_CD").val()){
			$("#S_PROG_GROUP").find("option").remove();
			$("#S_PROG_GROUP").append("<option value='' selected='selected'>==전체==</option>");
			return;
		}
		
		var url = "/system/selectMiddleMenuCombo.do";
		var param = {"param" : {
			"SYSTEM_CD" : $("#S_SYSTEM_CD").val()
		}};
		
		fn_ajax(url, false, param, function(data, xhr){
			$("#S_PROG_GROUP").find("option").remove();
			$("#S_PROG_GROUP").append("<option value='' selected='selected'>==전체==</option>");
			for(var i = 0; i < data.menulist.length; i++){
				$("#S_PROG_GROUP").append("<option value='" + data.menulist[i].code + "'>" + data.menulist[i].value + "</option>");
			}
		});
	}
	
	function cExcel(){
		//그리드 데이터 가져오기
		var griddata = $('#grid2').getRowData();

		if(fn_empty(griddata)) {
			alert("먼저 조회를 해주세요.");
			return;
		}
		
		var colNms = excelToMap();
		
	 	var param = { 'COL_NM':colNms
	 				 ,'TITLE':'SampleExcel'
					};
		
		fn_formSubmit('/sample/excelSample.do', param);	
	}
	
	function excelToMap() {
		
		var colNms = $("#grid2").jqGrid('getGridParam','colNames');
		var colid = $("#grid2")[0].p.colModel;
		var _string =  '%' ;
		//남아있는 제품 입력 폼 idx 값 가져오기
		for(var i= 0 ; i < colid.length; i++) {
			if(colid[i].name != "CHK"){
				if(i == (colid.length -1)) {
					 _string += ''+colid[i].name+':'		+ colNms[i] +'';
				}else  _string += ''+colid[i].name+':'		+ colNms[i] +',';
			}
		}
		_string +=  '%' ;
		//var pramDataList = "[" + _string + "]";
		return _string;
	}
	
	/* 그리드 헤더 체크박스 선택 */
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
		btGrid.gridSaveRow('grid2');
		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				if(gid == "grid2"){
					if($("#" + gid).jqGrid("getCell", ids[i], "PROG_LV") == "1"){   //특정 로우만 체크박스 체크 되도록
						$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
					}else{
						$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
					}
				}else{
					$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
				}
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
		$('#grid2').jqGrid('setSelection', $('#grid2').jqGrid('getGridParam', 'selrow'));
	}

	//그리드 체크박스 이벤트
	function grid_cbox_onclick(gid, rowid, colkey) {
		btGrid.gridSaveRow('grid2');
		if($("#" + gid).jqGrid("getCell", rowid, "PROG_LV") == "1"){   //특정 로우만 체크박스 체크 되도록
			$('#' + gid + '_' + rowid + '_CHK').prop('checked', true);
		}else{
			$('#' + gid + '_' + rowid + '_CHK').prop('checked', false);
		}
		$('#grid2').jqGrid('setSelection', $('#grid2').jqGrid('getGridParam', 'selrow'));
	}
</script>

<c:import url="../import/frameBottom.jsp" />