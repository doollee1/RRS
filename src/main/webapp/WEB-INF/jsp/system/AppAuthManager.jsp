<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : AppAuthManager
	 * @Description : Program Auth Manager (프로그램 권한 관리 화면)
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SY04" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize"></div>
<!-- 검색조건 영역 끝 -->

<!-- dummy -->
<div class="top_button_h_margin"></div>
<div id="ctu_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />

		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><s:message code='system.authorizationcode'/></td>
						<td class="medium_td"><input type="text" name="S_POLICY_CD" id="S_POLICY_CD" style="ime-mode:disabled"></td>
						<td class="small_td"><s:message code='system.authorizationname'/></td>
						<td class="medium_td"><input type="text" name="S_POLICY_NM" id="S_POLICY_NM" style="ime-mode:disabled"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<!-- 검색조건 영역 끝 -->
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.authorizationlist'/></h4>
			</div>
			<div class="ct_grid_top_right">
				<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
				<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			</div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
		<!-- 그리드 끝 -->
		<!-- 그리드 시작 -->
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code='title.programlist'/></h4>
				</div>
				<div class="ct_grid_top_right">
					<button type='button' class='btn btn-default' id='btnAdd'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
					<button type='button' class='btn btn-default' id='btnSave'><i class='fa fa-save'></i><s:message code='button.save'/></button>
					<input type="hidden" name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
					<input type="hidden" name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
				</div>
			</div>
			<table id="grid2"></table>
			<div id="grid2_pager"></div>
		</div>
		<!-- 그리드 끝 -->
	</div>
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
	var args;

	/******************************************** 
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	$(function() {
		initLayout();
		createGrid1();
		creategrid2();

		setCommBtn('Add', false);
		setCommBtn('Save', false);

		createCodeBox('USED_OR_NOT',true);
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});

		$("#btnAdd").click(function(e){
			addProgAuth();
		});

		$("#btnSave").click(function(e){
			saveProgrAuth();
		});

		if(auth.substring(1,2) =='N'){
			$("#btnAdd").hide();
		}

		if(auth.substring(3,4) =='N'){
			$("#btnSave").hide();
		}

		cSearch();
		$("#S_POLICY_CD").focus();
		progAuthSearch(null,null);
	});

	/******************************************** 
	 * @Subject : 권한목록 그리드 설정
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function createGrid1(){
		var colName = ['회사코드',
					   '<s:message code='system.authorizationcode'/>',
					   '<s:message code='system.authorizationname'/>',
					   '<s:message code='system.authorizationdescription'/>',
					   '<s:message code='system.usedornot'/>'
					  ];
		var colModel = [
			{ name: 'COMP_CD',    width: 100, align: 'center', hidden: true },
			{ name: 'POLICY_CD',  width: 120, align: 'left' },
			{ name: 'POLICY_NM',  width: 180 },
			{ name: 'POLICY_DSC', width: 180 },
			{ name: 'STATUS_NM',  width: 70,  align: 'center'},
		];
		var gSetting = {
				pgflg:           true,
				exportflg :      true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting :     true,
				searchInit :     false,
				resizeing :      true,
				rownumbers:      false,
				shrinkToFit:     true,
				autowidth:       true,
				queryPagingGrid: true, // 쿼리 페이징 처리 여부
				height:139
		};

		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}

	/******************************************** 
	 * @Subject : 프로그램목록 그리드 설정
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function creategrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;margin-left:8px" onclick="hdCheckboxAll(event, \'grid2\')" /> ',
						'회사코드',
						'<s:message code='system.authorizationcode'/>',
						'<s:message code='system.systemcode'/>',
						'<s:message code='system.programcode'/>',
						'<s:message code='system.programname'/>',
						'<s:message code='system.usedornot'/>',
						'<s:message code='system.inquiry'/>',
						'<s:message code='system.add'/>',
						'<s:message code='system.delete'/>',
						'<s:message code='system.save'/>',
						'<s:message code='system.print'/>',
						'<s:message code='system.upload'/>',
						'<s:message code='system.exceldownload'/>',
						'<s:message code='system.PDFdownload'/>',
						'<s:message code='system.cancel'/>',
						'<s:message code='system.user1'/>',
						'<s:message code='system.user2'/>',
						'<s:message code='system.user3'/>',
						'<s:message code='system.user4'/>',
						'<s:message code='system.user5'/>'];
		var colModel = [
			{name : 'CHK',       index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat, hidden: true, sortable: false},
			{ name: 'COMP_CD',   width: 100, align: 'center', hidden: true },
			{ name: 'POLICY_CD', width: 70,  align: 'left' },
			{ name: 'SYSTEM_CD', width: 70,  align: 'center' },
			{ name: 'PROG_CD',   width: 100, align: 'left' },
			{ name: 'PROG_NM',   width: 100 },
			{ name: 'STATUS',    width: 50,  align: 'center', editable:true, edittype:"select", formatter : "select"
				, editoptions:{value:'${griduseyn}'
				, dataEvents:[{
					type:"change",
					fn:function(e){
						$(this).focusout();
						$('#grid2_' + $("#grid2").getGridParam('selrow') + '_CHK').prop('checked', true);
					}
					}]
				}
			},
			{ name: 'AUTH_SEARCH', width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_ADD',    width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_DEL',    width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_SAVE',   width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_PRINT',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_UPLOAD', width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_EXCEL',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_PDF',    width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_CANCEL', width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_USER1',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_USER2',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_USER3',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_USER4',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false },
			{ name: 'AUTH_USER5',  width: 40, align : 'center', formatter : gridCboxFormat, sortable: false }
		];
		var gSetting = {
				pgflg:           true,
				exportflg :      false,  //엑셀, pdf 출력 버튼 노출여부
				colsetting :     true,
				searchInit :     false,
				resizeing :      true,
				rownumbers:      false,
				shrinkToFit:     true,
				autowidth:       true,
				queryPagingGrid: true, // 쿼리 페이징 처리 여부
				height:403
		};

		btGrid.createGrid('grid2', colName, colModel, gSetting);
	}

	/******************************************** 
	 * @Subject : 검색 버튼 클릭
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
		
		var url = "/system/selectAuthInfo.do";
		var formData = formIdAllToMap('frmSearch');
		formData["S_PROG_LV"] = "0";
		var param = {"param":formData};

		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			if(data.result.length === 0) {
				clearGrid('grid2');
			}

			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
			if(data.result.length > 0){
				$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
			}
		});
	}

	/******************************************** 
	 * @Subject : 권한목록 그리드 행 클릭
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function grid1_onCilckRow(e, rowid, status){
		progAuthSearch(null, rowid);
	}

	/******************************************** 
	 * @Subject : 프로그램목록 추가 버튼 클릭
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function addProgAuth(){
		var url = '/popup/ProgPopup.do';
		var pid = 'ProgPopup';

		popupOpen(url, pid, null, function(data) {
			var ids      = $("#grid2").jqGrid("getDataIDs");
			var rowid    = $('#grid1').jqGrid('getGridParam', 'selrow');
			var rowData1 = $("#grid1").getRowData(rowid);

			for(var i = 0; i < data.length; i++){
				var flag = true;
				for(var j = 0; j < ids.length; j++){
					var rowData2 = $("#grid2").getRowData(ids[j]);
					if(rowData2["COMP_CD"] == data[i]["COMP_CD"] && rowData2["SYSTEM_CD"] == data[i]["SYSTEM_CD"] && rowData2["PROG_CD"] == data[i]["PROG_CD"]){
						flag = false;
						alert("<s:message code='errors.dup' javaScriptEscape='false'/>");
					}
				}
				if(flag){
					data[i]["CHK"] = "Y";
					data[i]["POLICY_CD"] = rowData1["POLICY_CD"];
					btGrid.gridAddRow("grid2", "last", data[i]);
				}
			}
		});
	}

	/******************************************** 
	 * @Subject : 프로그램목록 저장 버튼 클릭
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function saveProgrAuth(){
		var cnt = 0;
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				var rowData = $("#grid2").getRowData(ids[i]);
				var data = {
					"COMP_CD" :   rowData["COMP_CD"],
					"POLICY_CD" : rowData["POLICY_CD"],
					"SYSTEM_CD" : rowData["SYSTEM_CD"],
					"PROG_CD" :   rowData["PROG_CD"],
					"PROG_NM" :   rowData["PROG_NM"],
					"STATUS" :    rowData["STATUS"]
				}
				var auth = "";
				if($('#grid2_' + ids[i] + '_AUTH_SEARCH').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_ADD').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_DEL').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_SAVE').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_PRINT').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_UPLOAD').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_EXCEL').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_PDF').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_CANCEL').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_USER1').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_USER2').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_USER3').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_USER4').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}
				if($('#grid2_' + ids[i] + '_AUTH_USER5').prop('checked')){
					auth += "Y";
				}else{
					auth += "N";
				}

				data["AUTH"] = auth;
				gridData.push(data);
			}
		}

		if(cnt < 1){
			args = '<s:message code='system.programcode'/>';
			alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}

		if(confirm("<s:message code='confirm.save'/>")){
			var url   = '/system/saveAppAuthInfo.do';
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("<s:message code='info.save'/>");
				cSearch();
			});
		}
	}

	/******************************************** 
	 * @Subject : 권한목록 행 클릭시 실행되는 함수
	 * @Content : 해당 행의 권한코드와 일치하는 프로그램들을 조회
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function progAuthSearch(currentPage, rowid){
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

		var rowData  = $("#grid1").getRowData(rowid);
		var url      = "/system/selectAppAuthInfo.do";
		var formData = formIdAllToMap('frmSearch');
		formData["POLICY_CD"] = rowData["POLICY_CD"];
		formData["CURRENT_PAGE"] = $('#CURRENT_PAGE2').val();
		formData["ROWS_PER_PAGE"] = $('#ROWS_PER_PAGE2').val();
		var param = {"param":formData};

		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid2", data.result);
			btGrid.gridQueryPaging($('#grid2'), 'progAuthSearch', data.result);
			if(data.result.length > 0){
				$('#grid2').jqGrid('setSelection', $('#grid2').jqGrid('getDataIDs')[0]);
			}
		});
	}

	/* 그리드 헤더 체크박스 선택 */
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

	//그리드 체크박스 이벤트
	function grid_cbox_onclick(gid, rowid, colkey) {
		$('#grid2_' + rowid + '_CHK').prop('checked', true);
	}
</script>

<c:import url="../import/frameBottom.jsp" />