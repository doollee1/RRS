<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : w_mymenu.jsp
 */
%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="bookMarkReg" />
</c:import>

<div id="ctu_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />

		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><s:message code="title.mainmenuName"/></td>
						<td class="medium_td">
							<select id="S_SYSTEM_CD" name="S_SYSTEM_CD" class="cmc_combo">
									<option value="" selected="selected"><s:message code="common.all"/></option>
								<c:forEach var="i" items="${systemlist}">
									<option value="${i.code}">${i.value}</option>
								</c:forEach>
							</select>
						</td>
						<td class="small_td"><s:message code="title.submenuName"/></td>
						<td class="medium_td">
							<select id="S_PROG_GROUP" name="S_PROG_GROUP" class="cmc_combo">
								<option value="" selected="selected"><s:message code="common.all"/></option>
							</select>
						</td>
						<td class="small_td"><s:message code="title.programName"/></td>
						<td class="medium_td">
							<select id="S_PROG_CD" name="S_PROG_CD" class="cmc_combo">
								<option value="" selected="selected"><s:message code="common.all"/></option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<!-- 검색조건 영역 끝 -->

<div style="float:left;width:calc(50% - 42px);height:calc(100% - 40px);padding:0px 0 0 0">
	<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code="common.all"/></h4>
			</div>
		<div class="ct_grid_top_right"></div>
	</div>
	<!-- 좌측 그리드 -->
	<table id="grid1"></table>
	<div id="grid1_pager"></div>
</div>

<div style="float:left;display:table;width:80px;height:calc(100% - 40px);padding:40px 0 0 0;">
	<div style="display:table-cell;text-align:center;vertical-align:middle;">
		<input type="image" src="/images/bookmark_arrow_right.png" id="btn_g2Add" value="" style="width:30px;height:30px;cursor:pointer;" />
		<div class="emptyH15"></div>
		<input type="image" src="/images/bookmark_arrow_left.png" id="btn_g2Del" value="" style="width:30px;height:30px;cursor:pointer;" />
	</div>
</div>

<div style="float:left;width:calc(50% - 42px);height:calc(100% - 40px);padding-top:0px">
	<div class="ct_grid_top_wrap">
		<div class="ct_grid_top_left">
			<h4><s:message code="system.mymenu"/></h4>
		</div>
		<div class="ct_grid_top_right"></div>
	</div>
	<!-- 우측 그리드 -->
	<table id="grid2"></table>
	<div id="grid2_pager"></div>
</div>
<div class="cls"></div>

<script type="text/javascript">
var args;

/********************************************
 * @Subject : 화면 OPEN 시 최초 실행 함수
 * @Content :
 * @Since   : 2024.07.11
 * @Author  :
 ********************************************/
$(function() {
	initLayout();
	grid1_Load();
	grid2_Load();
	cSearch();

	$("#S_SYSTEM_CD").change(function(e){
		changeMidMenu();
		//cSearch();
	});

	$("#S_PROG_GROUP").change(function(e){
		changeProgMenu();
		//cSearch();
	});

	$("#S_PROG_CD").change(function(e){
		//cSearch();
	});

	//추가 이벤트
	$('#btn_g2Add').on('click', function() {
		var rowId = [];
		var rowData = [];
		var rowId =$("#grid1").jqGrid('getGridParam','selarrrow');
		var gridIds2 = $("#grid2").jqGrid("getDataIDs");
		var sameFlg = false;
		var insertRow = 0;

		if (rowId.length < 1) {
			args = '<s:message code='title.menu'/>';
			alert("<s:message code='errors.saveNull' arguments='" + args + "' javaScriptEscape='false'/>");
			return;

		} else {
			for(var i=0; i<rowId.length; i++) {
				if(fn_empty(gridIds2)){
					rowData[i] = jQuery("#grid1").getRowData(rowId[i]);
					btGrid.gridAddRow("grid2", "last", rowData[i]);
				}else{
					for(var j = 0; j < gridIds2.length; j++){
						var selectRow = jQuery("#grid1").getRowData(rowId[i]).PROG_CD;
						var myRow = jQuery("#grid2").getRowData(gridIds2[j]).PROG_CD;

						if(selectRow == myRow){
							sameFlg = true;
							break;
						}else{
							sameFlg = false;
							insertRow = i;
						}
					}

					if(!sameFlg){
						btGrid.gridAddRow("grid2", "last", jQuery("#grid1").getRowData(rowId[insertRow]));
					}
				}
			}
			$('#grid2').jqGrid('setColProp', 'chkId', {editable:true});
		}
	});

	//삭제 이벤트
	$('#btn_g2Del').on('click', function() {
		var rowId =$("#grid2").jqGrid('getGridParam','selarrrow');
		var selRowIdsLength = rowId.length;

		if (rowId.length < 1) {
			args = '<s:message code='title.menu'/>';
			alert("<s:message code='errors.selectdel' arguments='" + args + "' javaScriptEscape='false'/>");
			return;

		} else {
			for(var i=0; i<selRowIdsLength; i++) {
				$("#grid2").jqGrid("delRowData",rowId[0]);
			}
		}
	});
});

	/********************************************
	 * @Subject : 검색 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
function cSearch() {
	gv_searchData = formIdToMap('frmSearch');
	var sid       = 'sid_getMenuList';
	var url       = '/system/getMenuList.do';
	var sendData  = {'searchData':gv_searchData};

	//fn_sendData(sid, url, sendData);
	fn_ajax(url, true, sendData, function(data, xhr){
		if(data.MESSAGE != "OK"){
			alert("메뉴 리스트 조회 오류, 시스템관리자에게 문의하세요.");
		} else {
			if(!fn_empty(data.resultMenuList)){
				reloadGrid("grid1", data.resultMenuList);   //그리드 재로드
				btGrid.gridResizing('grid1');        		//그리드 리사이킹		
				
				//내메뉴 리스트 조회
				getMyMenu();
				
			} else {
				alert("메뉴 리스트 조회 오류, 시스템관리자에게 문의하세요.");
			}
		}
	});
	
	
}

	/********************************************
	 * @Subject : 저장 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
function cSave() {
	if (confirm("<s:message code='confirm.save'/>") == true) {
		btGrid.gridSaveRow('grid2');
		var selRows   = $('#grid2').jqGrid('getGridParam', 'selrow');
		var gridData2 = $('#grid2').getRowData();
		var formdata  = formIdToMap('frmSearch');
		var sid       = 'sid_saveMyMenuList';
		var url       = '/system/saveMyMenuList.do';
		var sendData  = {'paramData':formdata, 'paramDataList':gridData2};

		fn_sendData(sid, url, sendData);
	}
}

function cfn_save2() {
		btGrid.gridSaveRow('grid2');
		var griddata = $('#grid2').getRowData();
		var formdata = formIdToMap('frmSearch');
		var sid      = 'sid_saveMyMenuList';
		var url      = '/system/saveMyMenuList.do';
		var sendData = {'paramData':formdata, 'paramDataList':griddata};

		fn_sendData(sid, url, sendData);
}

	/********************************************
	 * @Subject : 좌측 그리드 설정
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
function grid1_Load() {
	var colName = [];
	colName.push('<s:message code='title.mainmenuName'/>');
	colName.push('<s:message code='title.submenuName'/>');
	colName.push('<s:message code='title.programName'/>');
	colName.push('<s:message code='title.programName'/>');

	var colModel = [];
	colModel.push({name:'PROG_NM3', index:'PROG_NM3', width:100});
	colModel.push({name:'PROG_NM2', index:'PROG_NM2', width:100});
	colModel.push({name:'PROG_NM1', index:'PROG_NM1', width:100});
	colModel.push({name:'PROG_CD',  index:'PROG_CD',  width:100, hidden:true});

	var setting = {
		multiselect:true,
		pgflg:true,
		exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		colsetting : true,  // 컬럼 설정 버튼 노출여부
		searchInit : false,  // 데이터 검색 버튼 노출여부
		resizeing : true,
		rownumbers:false,
		shrinkToFit: true,
		autowidth: true,
		queryPagingGrid:true ,// 쿼리 페이징 처리 여부
		height:633
		};

	btGrid.createGrid('grid1', colName, colModel, setting);
}

	/********************************************
	 * @Subject : 우측 그리드 설정
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
function grid2_Load() {
	var colName = [];
	colName.push('<s:message code='title.mainmenuName'/>');
	colName.push('<s:message code='title.submenuName'/>');
	colName.push('<s:message code='title.programName'/>');
	colName.push('<s:message code='title.programName'/>');
	colName.push('<s:message code='common.sortorder'/>');

	var colModel = [];
	colModel.push({name:'PROG_NM3', index:'PROG_NM3', width:100});
	colModel.push({name:'PROG_NM2', index:'PROG_NM2', width:100});
	colModel.push({name:'PROG_NM1', index:'PROG_NM1', width:100});
	colModel.push({name:'PROG_CD',  index:'PROG_CD',  width:100, hidden:true});
	colModel.push({name:'PRIORITY', index:'PRIOIRTY', width:100, editable:true, classes:'gridnessasary'});

	var setting = {
			multiselect:true,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true, // 쿼리 페이징 처리 여부
			height:633
		};

	btGrid.createGrid('grid2', colName, colModel, setting);
}

	/********************************************
	 * @Subject : 마이메뉴 조회
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
function getMyMenu() {
	gv_searchData = formIdToMap('frmSearch');

	var sid      = 'sid_getMyMenuList';
	var url      = '/system/getMyMenuList.do';
	var sendData = {'searchData':gv_searchData};

	//fn_sendData(sid, url, sendData);
	fn_ajax(url, true, sendData, function(data, xhr){
		if(data.MESSAGE != "OK"){
			alert("마이메뉴 리스트 조회 오류, 시스템관리자에게 문의하세요.");
		} else {
			if(!fn_empty(data.resultMenuList)){
				reloadGrid("grid2", data.resultMenuList);   //그리드 재로드
				btGrid.gridResizing('grid2');        		//그리드 리사이킹													
			} else {
				alert("마이메뉴 리스트 조회 오류, 시스템관리자에게 문의하세요.");
			}
		}
	});
}

	/********************************************
	 * @Subject : 요청한 데이터 처리 callback
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
function fn_callback(sid, data, message, code) {
		 	
	// 검색
/* 	if (sid == 'sid_getMenuList') {
		var gridData = data.resultMenuList;
		$('#grid1').jqGrid('clearGridData');
		$('#grid1').jqGrid('setGridParam', {data:gridData});
		$('#grid1').trigger('reloadGrid');
				
	} else if (sid == 'sid_getMyMenuList') {
			var gridData = data.resultMenuList;
			$('#grid2').jqGrid('clearGridData');
			$('#grid2').jqGrid('setGridParam', {data:gridData});
			$('#grid2').trigger('reloadGrid');						

	} else if(sid == 'sid_saveMyMenuList') {
		alert("<s:message code='info.save'/>");
		cSearch();
	} */
	
	alert("<s:message code='info.save'/>");
	cSearch();
}

function changeMidMenu(){
	if(!$("#S_SYSTEM_CD").val()){
		$("#S_PROG_GROUP").find("option").remove();
		$("#S_PROG_GROUP").append("<option value='' selected='selected'><s:message code="common.all"/></option>");
		return;
	}

	var url   = "/system/selectMiddleMenuCombo.do";
	var param = {"param" : {
		"SYSTEM_CD" : $("#S_SYSTEM_CD").val()
	}};

	fn_ajax(url, false, param, function(data, xhr){
		$("#S_PROG_GROUP").find("option").remove();
		$("#S_PROG_GROUP").append("<option value='' selected='selected'><s:message code="common.all"/></option>");
		for(var i = 0; i < data.menulist.length; i++){
			$("#S_PROG_GROUP").append("<option value='" + data.menulist[i].code + "'>" + data.menulist[i].value + "</option>");
		}
	});
}

function changeProgMenu(){
	if(!$("#S_PROG_GROUP").val()){
		$("#S_PROG_CD").find("option").remove();
		$("#S_PROG_CD").append("<option value='' selected='selected'><s:message code="common.all"/></option>");
		return;
	}

	var url   = "/system/selectProgramCombo.do";
	var param = {"param" : {
		"S_PROG_GROUP" : $("#S_PROG_GROUP").val()
	}};

	fn_ajax(url, false, param, function(data, xhr){
		$("#S_PROG_CD").find("option").remove();
		$("#S_PROG_CD").append("<option value='' selected='selected'><s:message code="common.all"/></option>");
		for(var i = 0; i < data.proglist.length; i++){
			$("#S_PROG_CD").append("<option value='" + data.proglist[i].code + "'>" + data.proglist[i].value + "</option>");
		}
	});
}

</script>

<c:import url="../import/frameBottom.jsp" />