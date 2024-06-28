<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : AppManager
	 * @Description : Program Manager
	 */
%>  
<c:import url="../import/frameTop.jsp">   
	<c:param name="progcd" value="SY02" />
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
						<td class="small_td"><s:message code='title.mainmenulist'/></td>
						<td class="medium_td">
							<p><select id="S_SYSTEM_CD" name="S_SYSTEM_CD" class="">
								<option value="" selected="selected">All</option>								
								<c:forEach var="i" items="${systemlist}">
									<option value="${i.code}">${i.value}</option>
								</c:forEach>
							</select></p>							
						</td>
<%-- 						<td class="small_td"><s:message code='search.menugroup'/></td> --%>
<!-- 						<td width="150"> -->
<%-- 							<select id="S_PROG_GROUP" name="S_PROG_GROUP" class=""> --%>
<!-- 								<option value="" selected="selected">All</option> -->
<%-- 							</select> --%>
<!-- 						</td> -->
						<td class="small_td"><s:message code='system.usedornot'/></td>
						<td class="medium_td"><p><select id="USED_OR_NOT" name="USED_OR_NOT" class="">
							</select></p>
						</td>
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
				<h4><s:message code='title.submenulist'/></h4>
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
		
		createCodeBox('USED_OR_NOT',true);
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});
		
		//onchange event
		$("#grid2").bind("change", function() {
			$('#grid2_' + $('#grid2').jqGrid('getGridParam', 'selrow') + '_CHK').prop('checked', true);
		});
		
		$("#btnAdd").click(function(e){
			addProgram();
		});
		
		/*
		$("#btnDel").click(function(e){
			delProgram();
		});
		*/
		
		$("#btnSave").click(function(e){
			saveProgram();
		});
		
		$("#S_SYSTEM_CD").change(function(e){
			changeMidMenu();
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
			$("#btnAdd").hide();
		}
		
		if(auth.substring(3,4) =='N'){
			$("#btnSave").hide();
		}
		
		cSearch();
		progSearch(null, null);
	});
	
	function createGrid1(){
		var colName = ['회사코드',
		               '<s:message code='system.systemcode'/>',
		               '<s:message code='system.programcode'/>',
		               '<s:message code='system.programname'/>',
		               '<s:message code='system.programenglishname'/>',
						'<s:message code='system.programfrenchname'/>',
						'<s:message code='system.programetcname'/>',
		               '<s:message code='system.level'/>',
		               '<s:message code='system.group'/>',
		               '<s:message code='system.sortorder'/>',
		               '<s:message code='system.usedornot'/>'];
		var colModel = [
			{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
			{ name: 'SYSTEM_CD', width: 120, align: 'center' },
			{ name: 'PROG_CD', width: 120, align: 'center' },
			{ name: 'PROG_NM', width: 180 },
			{ name: 'PROG_EN', width: 180 },
			{ name: 'PROG_FR', width: 180,},
			{ name: 'PROG_4TH', width: 180, hidden: true},
			{ name: 'PROG_LV', width: 70, hidden:true },
			{ name: 'PROG_GROUP', width: 70, hidden:true },
			{ name: 'PRIORITY', width: 70, align:'right',formatter: 'integer' },
			{ name: 'STATUS', width: 70, align: 'center', editable:false, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}},
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
						'<s:message code='system.systemcode'/>',
						'<s:message code='system.programcode'/>',
						'<s:message code='system.programname'/>',
						'<s:message code='system.programenglishname'/>',
						'<s:message code='system.programfrenchname'/>',
						'<s:message code='system.programetcname'/>',
						'<s:message code='system.level'/>',
						'URL',
						'<s:message code='system.group'/>',
						'<s:message code='system.sortorder'/>',
						'<s:message code='system.usedornot'/>',
						'ROW_STATUS'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat, hidden: true , sortable: false},
			{ name: 'COMP_CD', width: 80, align: 'center', hidden: true },
			{ name: 'SYSTEM_CD', width: 120, align: 'center' },
			{ name: 'PROG_CD', width: 150, align: 'left', editable:true ,editoptions:{maxlength:20}},
			{ name: 'PROG_NM', width: 180, editable:true,editoptions:{maxlength:50}},
			{ name: 'PROG_EN', width: 180, editable:true,editoptions:{maxlength:50}},
			{ name: 'PROG_FR', width: 180, editable:true,editoptions:{maxlength:50}},
			{ name: 'PROG_4TH', width: 180, editable:true,editoptions:{maxlength:50}, hidden: true},
			{ name: 'PROG_LV', width: 70, editable:true, align:'right',editoptions:{maxlength:10}},
			{ name: 'PROG_URL', width: 250, editable:true,editoptions:{maxlength:100}},
			{ name: 'PROG_GROUP', width: 70, align:'center' },
			{ name: 'PRIORITY', width: 70, editable:true, align:'right',formatter: 'integer',editoptions:{maxlength:10}},
			{ name: 'STATUS', width: 70, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}},
			{ name: 'ROW_STATUS', width: 10, align: 'center', hidden: true }
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
		progSearch(null, rowid);
	}
	
	function addProgram(){
		var rowId = $('#grid1').jqGrid('getGridParam', 'selrow');
		var rowData = $("#grid1").getRowData(rowId);
		var addData = {
			"COMP_CD" : rowData["COMP_CD"]
		   ,"SYSTEM_CD" : rowData["SYSTEM_CD"]
		   ,"PROG_GROUP" : rowData["PROG_GROUP"]
		   ,"PROG_LV" : '1'
		   ,"ROW_STATUS" : "I"
		};
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
		vRowsPerPage = btGrid.getGridRowSel('grid1_pager');
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/system/selectProgInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		formData["S_PROG_LV"] = "0";
		var param = {"param":formData};
		
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
			if(data.result.length > 0){
				$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
			}else{
				$("#grid2").jqGrid("clearGridData", true);
			}
		});

	}
	
	/*
	function delProgram(){
		
	}
	*/
	
	function saveProgram(){
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
			alert('<s:message code="info.selectprog"/>');
			return;
		}
		
		for(var i = 0; i < gridData.length; i++){
			if(fn_empty(gridData[i]["SYSTEM_CD"])){
				alert('<s:message code="info.entercode"/>');
				return;
			}
			
			if(fn_empty(gridData[i]["PROG_CD"])){
				alert('<s:message code="info.entercode"/>');
				return;
			}
			
			if(fn_empty(gridData[i]["PROG_LV"])){
				alert('<s:message code="info.enterlevel"/>');
				return;
			}
		}

		if(confirm("<s:message code='confirm.save'/>")){
			var formData = formIdAllToMap('frmSearch');
			
			var url = '/system/saveProgInfo.do';
			var param = {"param" : formData,"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
				}else{
					alert('<s:message code="info.save"/>');
					cSearch();	
				}
			});
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
// 			if(data.result.length > 0){
// 				$('#grid2').jqGrid('setSelection', $('#grid2').jqGrid('getDataIDs')[0]);
// 			}
		});
	}
	
	function changeMidMenu(){
		if(!$("#S_SYSTEM_CD").val()){
			$("#S_PROG_GROUP").find("option").remove();
			$("#S_PROG_GROUP").append("<option value='' selected='selected'>All</option>");
			return;
		}
		
		var url = "/system/selectMiddleMenuCombo.do";
		var param = {"param" : {
			"SYSTEM_CD" : $("#S_SYSTEM_CD").val()
		}};
		
		fn_ajax(url, false, param, function(data, xhr){
			$("#S_PROG_GROUP").find("option").remove();
			$("#S_PROG_GROUP").append("<option value='' selected='selected'>All</option>");
			for(var i = 0; i < data.menulist.length; i++){
				$("#S_PROG_GROUP").append("<option value='" + data.menulist[i].code + "'>" + data.menulist[i].value + "</option>");
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