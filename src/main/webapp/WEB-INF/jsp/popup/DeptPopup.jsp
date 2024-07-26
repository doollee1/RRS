<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : DeptPopup
 */
%>
<div id="deptPopup">
		<div class="oms_popup_button">
			<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
				<i class='fa fa-search'></i><s:message code='button.search'/></button>
		</div>

	<div class="ctm_sech_wrap">
	<form id="frmDeptMGSearch" method="post" action="#">
	<table class="tab_top_search" width="100%">
		<tbody>
			<tr>
				<td class="small_td"><s:message code='system.departmentcode'/></td>
				<td><p><input type="text" id="S_DEPT_CD" name="S_DEPT_CD"></p></td>
				<td class="small_td"><s:message code='system.departmentname'/></td>
				<td><p><input type="text" id="S_DEPT_NM" name="S_DEPT_NM" class="cmc_txt" /></p></td><td></td><td></td><td></td><td></td>
		</tbody>
	</table>
	</form>
	</div>
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<!-- -
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code='system.departmentlist'/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		 -->
	<div class="pop_grid_wrap">
		<table id="grid_deptMG"></table>
		<div id="pager_deptMG"></div>
	</div>
	<!-- 그리드 끝 -->
	</div>
</div>
<script type="text/javascript">
	/********************************************
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content : 팝업창 설정
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
$(function() {
	$('#deptPopup').dialog({
		title   : '<s:message code='system.departmentinfo'/>',
		autoOpen: false,
		height  : 468,
		width   : 930,
		modal   : true,
		buttons: {
			'<s:message code='button.confirm'/>': {
				text: '<s:message code='button.confirm'/>',
				click: function() {
					var selRows = $('#grid_deptMG').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#grid_deptMG').getRowData(selRows)];
					p_rtnData = gridData;
					parent.$('#DEPT_CD').val(p_rtnData[0].DEPT_CD);
					parent.$('#DEPT_NM').val(p_rtnData[0].DEPT_NM);
					popupClose($('#deptPopup').data('pid'));
				}
			},
			'<s:message code='button.close'/>': {
				text:'<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#deptPopup .pop_grid_wrap').height($(this).height() - $('#deptPopup.popup_search').outerHeight(true) - 70);
			$('#S_DEPT_CD').val($(this).data('S_DEPT_CD'));

			grid_deptMG_Load();
			$('[name="S_DEPT_CD"]').focus();

			/* 그리드 더블클릭 이벤트 */
			$('#grid_deptMG').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var gridData = [$('#grid_deptMG').getRowData(rowid)];
					p_rtnData = gridData;
					parent.$('#DEPT_CD').val(p_rtnData[0].DEPT_CD);
					parent.$('#DEPT_NM').val(p_rtnData[0].DEPT_NM);
					popupClose($('#deptPopup').data('pid'));
				}
			});

			$("#S_DEPT_CD").keyup(function(event){
				if(event.keyCode == 13){
					popupSearch();
				}
			});

			$("#S_DEPT_NM").keyup(function(event){
				if(event.keyCode == 13){
					popupSearch();
				}
			});

			gridData = $(this).data('gridData');
			if (fn_empty(gridData) == false) {
				$('#grid1').jqGrid('clearGridData');
				$('#grid1').jqGrid('setGridParam', {data:gridData});
				$('#grid1').trigger('reloadGrid');
			}
		},

		close: function(e, ui) {
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

	/********************************************
	 * @Subject : 그리드 설정 및 초기화
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function grid_deptMG_Load() {
	var colName = ['<s:message code='system.compcd'/>',
				   '<s:message code='system.departmentcode'/>',
				   '<s:message code='system.departmentname'/>',
				   '<s:message code='system.upperdepartmentcode'/>',
				   '<s:message code='system.upperdepartmentname'/>',
				   '<s:message code='system.level'/>'
				  ];
	var colModel = [
					{name:'COMP_CD',  index:'COMP_CD',  width:120, hidden:true},
					{name:'DEPT_CD',  index:'DEPT_CD',  width:100},
					{name:'DEPT_NM',  index:'DEPT_NM',  width:130},
					{name:'UPPER_CD', index:'UPPER_CD', width:100},
					{name:'UPPER_NM', index:'UPPER_NM', width:130},
					{name:'LVL',      index:'LVL',      width:50}
	];
	var gSetting = {
			height         : 277,
			pgflg          : true,
			exportflg      : true,   // 엑셀, pdf 출력 버튼 노출여부
			colsetting     : true,   // 컬럼 설정 버튼 노출여부
			searchInit     : false,  // 데이터 검색 버튼 노출여부
			resizeing      : true,
			rownumbers     : false,
			shrinkToFit    : true,
			autowidth      : true,
			queryPagingGrid: true    // 쿼리 페이징 처리 여부
		};
	btGrid.createGrid('grid_deptMG', colName, colModel, gSetting);
}

	/********************************************
	 * @Subject : 조회 함수
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
function popupSearch() {
	var v_searchData = formIdToMap('frmDeptMGSearch');
	var sendData = {'param':v_searchData};
	var url = '/common/selectDeptPopup.do';

	fn_ajax(url, false, sendData, function(data, xhr) {
		var gridData = data.result;
		$('#grid_deptMG').jqGrid('clearGridData');
		$('#grid_deptMG').jqGrid('setGridParam', {data:gridData});
		$('#grid_deptMG').trigger('reloadGrid');
	});
}
</script>
