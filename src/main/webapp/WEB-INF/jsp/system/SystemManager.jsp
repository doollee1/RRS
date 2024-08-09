<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : SystemManager
	 * @Description : 메뉴 관리 화면
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SY01" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize"></div>
<!-- 검색조건 영역 끝 -->

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><s:message code='system.usedornot'/></td>
						<td>
							<select id="USED_OR_NOT" name="USED_OR_NOT" class=""></select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>

	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.mainmenulist'/></h4>
			</div>
			<div class="ct_grid_top_right">
				<button type='button' class='btn btn-default' id='btnAdd_h'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
				<button type='button' class='btn btn-default' id='btnSave_h'><i class='fa fa-save'></i><s:message code='button.save'/></button>
				<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
				<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			</div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
	<!-- 그리드 끝 -->

	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.submenulist'/></h4>
			</div>
			<div class="ct_grid_top_right">
				<button type='button' class='btn btn-default' id='btnAdd_d'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
				<button type='button' class='btn btn-default' id='btnSave_d'><i class='fa fa-save'></i><s:message code='button.save'/></button>
				<input type="hidden" name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
				<input type="hidden" name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
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
	var args ;

	/********************************************
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	$(function() {
		initLayout();
		createGrid1();
		createGrid2();
		
		setCommBtn('Add', false);
		setCommBtn('Save', false);
		createCodeBox('USED_OR_NOT',true);

		/* 대메뉴 목록 그리드 행 클릭시*/
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});

		/* 대메뉴 그리드 추가 버튼*/
		$("#btnAdd_h").click(function(e){
			var data = {"ROW_STATUS" : "I"};
			btGrid.gridAddRow("grid1", "last", data);
			clearGrid("grid2");
		});

		/* 대메뉴 그리드 저장 버튼 */
		$("#btnSave_h").click(function(e){
			cSave();
		});

		/* 중메뉴 그리드 추가 버튼 */
		$("#btnAdd_d").click(function(e){
			addMenuGroup();
		});

		/* 중메뉴 그리드 저장 버튼 */
		$("#btnSave_d").click(function(e){
			saveMenuGroup();
		});

		/* 대메뉴 그리드 값 변경 이벤트 */
		$("#grid1").bind("change", function() {
			var changeRowId = $('#grid1').jqGrid('getGridParam', 'selrow');
			$('#grid1_' + changeRowId + '_CHK').prop('checked', true);
			if($('#grid1').jqGrid('getRowData', changeRowId).ROW_STATUS != "I"){
				$("#grid1").jqGrid('setCell', $("#grid1").getGridParam('selrow'), 'ROW_STATUS', 'U');
			}
		});

		/* 중메뉴 그리드 값 변경 이벤트*/
		$("#grid2").bind("change", function() {
			var changeRowId = $('#grid2').jqGrid('getGridParam', 'selrow');
			$('#grid2_' + changeRowId + '_CHK').prop('checked', true);
			if($('#grid2').jqGrid('getRowData', changeRowId).ROW_STATUS != "I"){
				$("#grid2").jqGrid('setCell', $("#grid2").getGridParam('selrow'), 'ROW_STATUS', 'U');
			}
		});

		$('#grid2').jqGrid('setGridParam', {
			onCellSelect: function (rowid, index, content, event) {
				keyValue = $(this).jqGrid('getCell', rowid, 'PROG_CD');
			}
		});

		$('#grid2').on('keypress', function (e) {
			var changeRowId = $('#grid2').jqGrid('getGridParam', 'selrow');
			if((keyValue != $('#grid2').jqGrid('getRowData', changeRowId).PROG_CD)){
				if($('#grid2').jqGrid('getRowData', changeRowId).ROW_STATUS != "I"){
					$("#grid2").jqGrid('setCell', $("#grid2").getGridParam('selrow'), 'PROG_CD', keyValue);
				}
			}
		});

		if(auth.substring(1,2) =='N'){
			$("#btnAdd_h").hide();
			$("#btnAdd_d").hide();
		}

		if(auth.substring(3,4) =='N'){
			$("#btnSave_h").hide();
			$("#btnSave_d").hide();
		}
		cSearch();
		//menuSearch();
	});

	/********************************************
	 * @Subject : 대메뉴 그리드 설정 및 초기화
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function createGrid1(){
		var colName = ['<input type="checkbox" style="margin-top:1px;margin-left:8px" onclick="hdCheckboxAll(event, \'grid1\')" /> ',
						'<s:message code='system.compcd'/>',
						'<s:message code='system.systemcode'/>',
						'<s:message code='system.systemname'/>',
						'<s:message code='system.systemenglishname'/>',
						'<s:message code='system.systemfrenchname'/>',
						'<s:message code='system.systemetcname'/>',
						'<s:message code='system.sortorder'/>',
						'<s:message code='system.usedornot'/>',
						'ROW_STATUS'
						];
		var colModel = [
			{ name: 'CHK',        index : 'CHK', width : 20,   align : 'center', formatter : gridCboxFormat, hidden: true, sortable: false},
			{ name: 'COMP_CD',    width: 100, align: 'center', hidden: true },
			{ name: 'SYSTEM_CD',  width: 120, align: 'center', editable:true , editoptions:{maxlength:10}},
			{ name: 'SYSTEM_NM',  width: 180, editable:true,   editoptions:{maxlength:50}},
			{ name: 'SYSTEM_EN',  width: 180, editable:true,   editoptions:{maxlength:50}},
			{ name: 'SYSTEM_FR',  width: 180, editable:true,   editoptions:{maxlength:50}},
			{ name: 'SYSTEM_4TH', width: 180, editable:true,   editoptions:{maxlength:50}, hidden: true},
			{ name: 'PRIORITY',   width: 70,  editable:true,   align:'right', formatter: 'integer', editoptions:{maxlength:10}},
			{ name: 'STATUS',     width: 70,  align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}},
			{ name: 'ROW_STATUS', width: 10,  align: 'center', hidden: true }
		];

		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: true,
				autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height:271
		};

		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}

	/********************************************
	 * @Subject : 중메뉴 그리드 설정 및 초기화
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function createGrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid2\')" /> ',
					   '<s:message code='system.compcd'/>',
						'<s:message code='system.systemcode'/>',
						'<s:message code='system.programcode'/>',
						'<s:message code='system.programname'/>',
						'<s:message code='system.programenglishname'/>',
						'<s:message code='system.programfrenchname'/>',
						'<s:message code='system.programetcname'/>',
						'<s:message code='system.level'/>',
						'<s:message code='system.group'/>',
						'<s:message code='system.sortorder'/>',
						'<s:message code='system.usedornot'/>',
						'ROW_STATUS'];
		var colModel = [
			{ name: 'CHK',        index : 'CHK', width : 20, align : 'center', formatter : gridCboxFormat, hidden: true},
			{ name: 'COMP_CD',    width: 100, align: 'center', hidden: true },
			{ name: 'SYSTEM_CD',  width: 120, align: 'center' },
			{ name: 'PROG_CD',    width: 120, align: 'center', editable:true ,editoptions:{maxlength:20}},
			{ name: 'PROG_NM',    width: 180, editable:true, editoptions:{maxlength:50}},
			{ name: 'PROG_EN',    width: 180, editable:true, editoptions:{maxlength:50}},
			{ name: 'PROG_FR',    width: 180, editable:true, editoptions:{maxlength:50}},
			{ name: 'PROG_4TH',   width: 180, editable:true, editoptions:{maxlength:50}, hidden: true},
			{ name: 'PROG_LV',    width: 70,  hidden:true },
			{ name: 'PROG_GROUP', width: 70,  hidden:true },
			{ name: 'PRIORITY',   width: 70,  editable:true, align:'right',formatter: 'integer',editoptions:{maxlength:10}},
			{ name: 'STATUS',     width: 70,  align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}},
			{ name: 'ROW_STATUS', width: 10,  align: 'center', hidden: true }
		];

		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: true,
				autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height:271
		};

		btGrid.createGrid('grid2', colName, colModel, gSetting);
	}

	/********************************************
	 * @Subject : 대메뉴 그리드 행 클릭 시
	 * @Content : 기존의 중메뉴 그리드를 초기화 후 다시 조회
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function grid1_onCilckRow(e, rowid, status){
		if(rowid.indexOf("new") > -1){
			clearGrid("grid2");
		}
		btGrid.gridSaveRow('grid1');
		menuSearch(null, rowid);
	}

	/********************************************
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
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
		var url = "/system/selectSystemInfo.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};

		fn_ajax(url, false, param, function(data, xhr){
			if(fn_empty(data)){
				clearGrid("grid2");
				//$('#btnAdd').hide();
				//$('#btnSave').hide();
				//initLayout();
			}else{
				reloadGrid("grid1", data.result);
				btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
				if(data.result.length > 0){
					$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
				}else{
					$("#grid2").jqGrid("clearGridData", true);
				}
			}
		});
	}

	/********************************************
	 * @Content : 대메뉴 그리드 저장 버튼
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function cSave(){
		var ids = $("#grid1").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid1');
		for(var i = 0; i < ids.length; i++){
			if($('#grid1_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid1").getRowData(ids[i]));
			}
		}

		if(cnt < 1){
			args = '<s:message code='system.systemcode'/>';
			alert("<s:message code='errors.saveNull' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}

		for(var i = 0; i < gridData.length; i++){
			if(fn_empty(gridData[i]["SYSTEM_CD"])){
				args = '<s:message code='system.systemcode'/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}

			if(fn_empty(gridData[i]["SYSTEM_NM"])){
				args = '<s:message code='system.systemname'/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
		}

		if(confirm("<s:message code='confirm.save'/>")){
			var formData = formIdAllToMap('frmSearch');
			var url = '/system/saveSystemInfo.do';
			var param = {"param" : formData,"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				if(data.isDup == 'N'){
					alert("<s:message code='info.save'/>");
					cSearch();
				}else{
					alert("<s:message code='errors.dup' javaScriptEscape='false'/>");
				}
			});
		}
	}

	/********************************************
	 * @Subject : 인쇄 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function cPrint(){
		pagePrintPreview();
	}

	/********************************************
	 * @Subject : 엑셀 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function cExcel(){
		//그리드 데이터 가져오기
		var griddata = $('#grid1').getRowData();

		if(fn_empty(griddata)) {
			alert("<s:message code='info.nodata.msg' javaScriptEscape='false'/>");
			return;
		}

		var colNms = excelToMap();
		var param = { 'S_STATUS':$("#S_STATUS").val()
					 ,'COL_NM':colNms
					 ,'TITLE':'<s:message code='search.mainmenulist'/>'
					};
		fn_formSubmit('/system/excelSystemInfo.do', param);
	}

	/********************************************
	 * @Subject : 엑셀 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function excelToMap() {
		var colNms = $("#grid1").jqGrid('getGridParam','colNames');
		var colid = $("#grid1")[0].p.colModel;
		var _string =  '%' ;
		//남아있는 제품 입력 폼 idx 값 가져오기
		for(var i= 0 ; i < colid.length; i++) {
			if(colid[i].name != "CHK"){
				if(i == (colid.length -1)) {
					 _string += ''+colid[i].name+':'        + colNms[i] +'';
				}else  _string += ''+colid[i].name+':'      + colNms[i] +',';
			}
		}
		_string +=  '%' ;
		//var pramDataList = "[" + _string + "]";
		return _string;
	}

	/********************************************
	 * @Subject : 중메뉴 조회 함수
	 * @Content : 대메뉴 행을 클릭 하면 그에 포함된 중메뉴를 조회한다
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function menuSearch(currentPage, rowid){
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
			rowid = $('#grid2').jqGrid('getGridParam', 'selrow');
		}

		var rowData = $("#grid1").getRowData(rowid);
		var url = "/system/selectProgInfo.do";

		if(rowData["ROW_STATUS"] == "I"){
			$("#grid1").setColProp("SYSTEM_CD", {editable : true});
			btGrid.gridEditRow("grid1", rowid);
			return;
		}else{
			$("#grid1").setColProp("SYSTEM_CD", {editable : false});
		}

		btGrid.gridEditRow("grid1", rowid);
		var formData = formIdAllToMap('frmSearch');
		formData["S_SYSTEM_CD"] = rowData["SYSTEM_CD"];
		formData["S_PROG_LV"] = "0";
		formData["CURRENT_PAGE"] = $('#CURRENT_PAGE2').val();
		formData["ROWS_PER_PAGE"] = $('#ROWS_PER_PAGE2').val();
		var param = {"param":formData};
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid2", data.result);
			btGrid.gridQueryPaging($('#grid2'), 'menuSearch', data.result);
//          if(data.result.length > 0){
//              $('#grid2').jqGrid('setSelection', $('#grid2').jqGrid('getDataIDs')[0]);
//          }
		});
	}

	/********************************************
	 * @Subject : 중메뉴 그리드 추가 버튼
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function addMenuGroup(){
		var rowId = $('#grid1').jqGrid('getGridParam', 'selrow');
		var rowData = $("#grid1").getRowData(rowId);
		var addData = {"SYSTEM_CD" : rowData["SYSTEM_CD"], "ROW_STATUS" : "I"};
		btGrid.gridAddRow("grid2", "last", addData);
	}

	/********************************************
	 * @Subject : 중메뉴 그리드 저장 버튼
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function saveMenuGroup(){
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid2").getRowData(ids[i]));
			}
		}

		if(cnt < 1){
			args = '<s:message code='system.programcode'/>';
			alert("<s:message code='errors.saveNull' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}

		for(var i = 0; i < gridData.length; i++){
			if(fn_empty(gridData[i]["SYSTEM_CD"])){
				args = '<s:message code='system.systemcode'/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}

			if(fn_empty(gridData[i]["PROG_CD"])){
				args = '<s:message code='system.programcode'/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}

			gridData[i]["PROG_LV"] = 0;
			gridData[i]["PROG_GROUP"] = gridData[i]["PROG_CD"];
		}

		if(confirm("<s:message code='confirm.save'/>")){
			var formData = formIdAllToMap('frmSearch');
			var url = '/system/saveProgInfo.do';
			var param = {"param" : formData,"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.dup' javaScriptEscape='false'/>");
				}else{
					alert("<s:message code='info.save'/>");
					cSearch();
				}
			});
		}
	}

	/********************************************
	 * @Subject : 그리드 헤더 체크박스 선택
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;

		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
	}

	/********************************************
	 * @Subject : 그리드 체크박스 이벤트
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function grid_cbox_onclick(gid, rowid, colkey) {
	}
</script>

<c:import url="../import/frameBottom.jsp" />