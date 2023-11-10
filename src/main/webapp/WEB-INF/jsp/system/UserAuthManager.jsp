<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : UserAuthManager
	 * @Description : User Auth Manager
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SY07" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize">
</div>
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
						<td class="medium_td"><p><input type="text" name="S_POLICY_CD" id="S_POLICY_CD" style="ime-mode:disabled;margin-right:30px;"></p></td>
						<td class="small_td"><s:message code='system.authorizationname'/></td>
						<td class="medium_td"><p><input type="text" name="S_POLICY_NM" id="S_POLICY_NM" style="ime-mode:disabled"></p></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>	
	<!-- 검색조건 영역 끝 -->
	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
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
	</div>
	<!-- 그리드 끝 -->
	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.userlist'/></h4>
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
		initLayout();
		createGrid1();
		creategrid2();
		setCommBtn('Add', false);
		setCommBtn('Save', false);
		
		$("#S_POLICY_CD").focus();
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});
		
		//onchange event
		$("#grid2").bind("change", function() {
			$('#grid2_' + $('#grid2').jqGrid('getGridParam', 'selrow') + '_CHK').prop('checked', true);
		});
		
		$("#btnAdd").click(function(e){
			addUserAuth();
		});
		
		$("#btnSave").click(function(e){
			saveUserAuth();
		});
		
		if(auth.substring(1,2) =='N'){
			$("#btnAdd").hide();
		}
		
		if(auth.substring(3,4) =='N'){
			$("#btnSave").hide();
		}
		cSearch();
		progAuthSearch(null, null);
	});
	
	function createGrid1(){
		var colName = ['회사코드',
		               '<s:message code='search.authorizationcode'/>',
		               '<s:message code='system.authorizationname'/>',
		               '<s:message code='system.authorizationdescription'/>',
		               '<s:message code='system.usedornot'/>'];
		var colModel = [
			{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
			{ name: 'POLICY_CD', width: 120, align: 'left' },
			{ name: 'POLICY_NM', width: 180 },
			{ name: 'POLICY_DSC', width: 180 },
			{ name: 'STATUS_NM', width: 70, align: 'center'},
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

	function creategrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;margin-left:8px" onclick="hdCheckboxAll(event, \'grid2\')" /> ',
						'회사코드',
						'<s:message code='system.authorizationcode'/>',
						'<s:message code='system.UserID'/>',
						'<s:message code='system.name'/>',
						'<s:message code='system.usertype'/>',
						'<s:message code='system.usergroup'/>',
						'<s:message code='system.department'/>',
						'<s:message code='system.departmentname'/>',
						'<s:message code='system.usedornot'/>'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat, hidden: true, sortable: false},
			{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
			{ name: 'POLICY_CD', width: 120, align: 'left' },
			{ name: 'USER_ID', width: 120, align: 'left' },
			{ name: 'NAME_FULL', width: 120, align: 'left' },
			{ name: 'USER_TP_NM', width: 120, align: 'center' },
			{ name: 'USER_GD', width: 80, align: 'center' },
			{ name: 'DEPT_CD', width: 120, align: 'left',  hidden: true},
			{ name: 'DEPT_NM', width: 120, align: 'left'},
			{ name: 'STATUS', width: 70, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}}
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
	
	function grid1_onCilckRow(e, rowid, status){
		progAuthSearch(null, rowid);
	}
	//사용자 추가 팝업
	function addUserAuth(){
		var url = '/popup/UserPopup.do';
		var pid = 'UserPopup';
		
		popupOpen(url, pid, null, function(data) {
			var ids = $("#grid2").jqGrid("getDataIDs");
			var rowid = $('#grid1').jqGrid('getGridParam', 'selrow');

			var rowData1 = $("#grid1").getRowData(rowid);
			
			for(var i = 0; i < data.length; i++){
				var flag = true;
				for(var j = 0; j < ids.length; j++){
					var rowData2 = $("#grid2").getRowData(ids[j]);
					if(rowData2["COMP_CD"] == data[i]["COMP_CD"] && rowData2["USER_ID"] == data[i]["USER_ID"]){
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
	//권한조회
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
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
			$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
		});
	}
	
	
	function saveUserAuth(){
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			if($('#grid2_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				var rowData = $("#grid2").getRowData(ids[i]);
				var data = {
					"COMP_CD" :  rowData["COMP_CD"],
					"POLICY_CD" : rowData["POLICY_CD"],
					"USER_ID" : rowData["USER_ID"],
					"NAME_FULL" : rowData["NAME_FULL"],
					"STATUS" : rowData["STATUS"]
				}
				gridData.push(data);
			}
		}
		
		if(cnt < 1){
			args = '<s:message code="button.user"/>';
			alert("<s:message code='errors.saveNull' arguments='" + args + "' javaScriptEscape='false'/>");

			return;
		}
		
		if(confirm("<s:message code='confirm.save'/>")){
			var url = '/system/saveUserAuthInfo.do';
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("<s:message code='info.save'/>");
				cSearch();
			});
		}
	}
	
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

		var rowData = $("#grid1").getRowData(rowid);
		var url = "/system/selectUserAuthInfo.do";
		
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
		
	}
</script>

<c:import url="../import/frameBottom.jsp" />