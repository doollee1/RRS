<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : MemberUserPopup
 */
%>
<div id="memberUserPopup">

	<div class="oms_popup_button">
		<button class='btn btn-default' id='btn_memberUserAddPopup' type='button''>
      		등록
      	</button>
      	<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
      		삭제
      	</button>
      	<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
			엑셀업로드
      	</button>
	
	</div>
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_wrap">	
			<table id="grid_deptMG"></table>
			<div id="pager_deptMG"></div>
		</div>	
		<!-- 그리드 끝 -->
	</div>
</div>
<script type="text/javascript">
$(function() {
	$('#memberUserPopup').dialog({
		title:'멤버 회원 정보',
		autoOpen: false,
		height: 468,
		width: 930,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': { 
				text: '<s:message code='button.confirm'/>',
				click: function() {		
					var selRows = $('#grid_deptMG').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#grid_deptMG').getRowData(selRows)];
					
					p_rtnData = gridData;

					parent.$('#DEPT_CD').val(p_rtnData[0].DEPT_CD);
					parent.$('#DEPT_NM').val(p_rtnData[0].DEPT_NM);						

					popupClose($('#memberUserPopup').data('pid'));
					
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
			$('#memberUserPopup .pop_grid_wrap').height($(this).height() - $('#memberUserPopup.popup_search').outerHeight(true) - 70);
			
			$('#S_DEPT_CD').val($(this).data('S_DEPT_CD'));
			
			grid_deptMG_Load();
			popupSearch();

			$('[name="S_DEPT_CD"]').focus();
			
			/* 그리드 이벤트 */
			$('#grid_deptMG').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
					// popupClose($('#memberUserPopup').data('pid'));
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
	
	$("#btn_memberUserAddPopup").click(function(e) {
		console.log("memberUserAddPopup button");
		var url = "/rrs/MemberUserAddPopup.do";
		var pid = "p_MemberUserAdd";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid);
	});
});

function grid_deptMG_Load() {

	/*
	var colName = ['<s:message code='system.compcd'/>',
				   '<s:message code='system.departmentcode'/>',
				   '<s:message code='system.departmentname'/>',
			       '<s:message code='system.upperdepartmentcode'/>',
				   '<s:message code='system.upperdepartmentname'/>',
				   '<s:message code='system.level'/>'];
	var colModel = [
					{name:'COMP_CD',index:'COMP_CD',width:120,hidden:true},
					{name:'DEPT_CD',index:'DEPT_CD',width:100},
					{name:'DEPT_NM',index:'DEPT_NM',width:130},
					{name:'UPPER_CD',index:'UPPER_CD',width:100},
					{name:'UPPER_NM',index:'UPPER_NM',width:130},
					{name:'LVL',index:'LVL',width:50}
	];
	*/
	
	var colName = [
		'순번',
		'이름',
		'영문이름',
		'전화번호',
		''
	];
	
	var colModel = [
		{ name: 'ROWNUM', width: 100, align: 'center' },
		{ name: 'HAN_NAME', width: 100, align: 'center' },
		{ name: 'ENG_NAME', width: 100, align: 'center' },
		{ name: 'TEL_NO', width: 100, align: 'center' },
		{ name: 'CHK', index: 'CHK', width: 50, align: 'center', formatter: gridCboxFormat, sortable: false }
	];
	
	

	var gSetting = {
			height: 277,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
	btGrid.createGrid('grid_deptMG', colName, colModel, gSetting);
	
}

// popupSearch
function popupSearch() {
	// var v_searchData = formIdToMap('frmDeptMGSearch');
	// var sendData = {'param':v_searchData};
	var sendData = {};
	var url = '/rrs/selectMemberUserInfo.do';
	
	fn_ajax(url, false, sendData, function(data, xhr) {
		var gridData = data.result;
		$('#grid_deptMG').jqGrid('clearGridData');
	    $('#grid_deptMG').jqGrid('setGridParam', {data:gridData});
	    $('#grid_deptMG').trigger('reloadGrid');
	});
}

function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid_deptMG").getRowData(rowid);
	var param = {
		"HAN_NAME" : gridData["HAN_NAME"],
		"ENG_NAME" : gridData["ENG_NAME"],
		"TEL_NO" : gridData["TEL_NO"]
	};
	console.log('param: ', param)
	memberUserPopup(param);
}

function memberUserPopup(param){
	var url = "/rrs/MemberUserAddPopup.do";
	var pid = "p_MemberUserAdd";  //팝업 페이지의 취상위 div ID

	popupOpen(url, pid, param);
}


/* function memberUserAddPopup() {
	console.log("memberUserAddPopup button");
	var url = "/rrs/MemberUserAddPopup.do";
	var pid = "p_MemberUserAdd";  //팝업 페이지의 취상위 div ID

	popupOpen(url, pid);
} */
</script>
