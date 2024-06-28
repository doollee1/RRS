<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : UserPopup2 (Single select)
 */
%>
<div id="UserPopup2">
	<!-- 검색조건부분 시작 -->
	<div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
		<div id="divBtn">
			<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'><i class='fa fa-file-o'></i><s:message code='button.search'/></button>
		</div>
	</div>
	<div class="popup_search">
		<form id="frmUserSearch" action="#">
		<div class="tab_top_search">
		<input type="hidden"  name="DEPT_CD"  id="DEPT_CD" />
		<table>
			<tbody>
				<tr>
					<td class="small_td" id="td_user_title"><s:message code='system.UserID'/></td>
		      		<td class="medium_td" id="td_user_input"><p><input type="text" id="S_USER_ID" name="S_USER_ID"></p></td>
		      		<td class="small_td"><s:message code='system.Username'/></td>
		      		<td class="medium_td"><p><input type="text" id="S_USER_NM" name="S_USER_NM" class="cmc_txt" /></p></td>
				</tr>
			</tbody>
		</table>
		</div>
		</form>
		</div>

	<!-- 검색조건부분 끝 -->
	<div class="pop_grid_wrap">
		<!--   <div class="pop_grid_top_wrap">
			<h4><s:message code="title.userlist"/></h4>
		</div>
		-->
		<table id="popGrid1"></table>
		<div id="popGrid1_item_pager"></div>
	</div>
</div>

<script type="text/javascript">
var args;
$(function() {
	$('#UserPopup2').dialog({
		title: '<s:message code="title.userlist"/>',
		autoOpen: false,
		height: 480,
		width: 910,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': { 
				text: '<s:message code='button.confirm'/>',
				click: function() {		
					var selRows = $('#popGrid1').jqGrid('getGridParam', 'selrow');
					var gridData = [$('#popGrid1').getRowData(selRows)];
					
					p_rtnData = gridData;
					popupClose($(this).data('pid'));
					
				}
			},
			'<s:message code='button.cancel'/>': {
				text: '<s:message code='button.cancel'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#UserPopup2 .pop_grid_wrap').height($(this).height() - $('#UserPopup2 .popup_search').outerHeight(true) - 10);
			if($(this).data('SEARCH') == 'ONLY_USER_NM'){
				$("#td_user_title").hide();
				$("#td_user_input").hide();
			}
			
			if($(this).data('SEARCH') == 'S_USER_ID'){
				$('#S_USER_ID').val($(this).data('S_CODE'));
			}else{
				$('#S_USER_NM').val($(this).data('S_CODE'));
			}
			
			if(!fn_empty($(this).data('S_DEPT_CD'))){
				$('#DEPT_CD').val($(this).data('S_DEPT_CD'));
			}
			createPopGrid1();				
			//popupSearch();
			
			/* 그리드 이벤트 */
			$('#popGrid1').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					var gridData = [$('#popGrid1').getRowData(rowid)];
					p_rtnData = gridData;
					popupClose($(this).data('pid'));
		    	}
			});
			
			$("#S_USER_ID").keyup(function(event){
			    if(event.keyCode == 13){
			        popupSearch();
			    }
			});
			
			$("#S_USER_NM").keyup(function(event){
			    if(event.keyCode == 13){
			        popupSearch();
			    }
			});
			
			$("#btnSearch").click(function(){
				popupSearch();
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
	
	$("#btn_department").click(function(e){

		var url = "/common/DeptPopup.do";
		var pid = "deptPopup"
		var param = {"S_DEPT_CD" : $("#DEPT_CD").val()};
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				$("#DEPT_CD").val(data[0].DEPT_CD);
				$("#DEPT_NM").text(data[0].DEPT_NM);
			}
		});
	})
});

function createPopGrid1(){
	var colName = ['<s:message code='system.compcd'/>',
	               '<s:message code='system.UserID'/>',
	               '<s:message code='system.name'/>',
	               '<s:message code='system.usertype'/>',
	               '<s:message code='system.usergroup'/>',
	               '<s:message code='system.department'/>',
	               '<s:message code='system.departmentname'/>',
	               '<s:message code='system.usedornot'/>',
	               'ADDR',
	               'TEL_NO',
	               'E_MAIL'];
	var colModel = [
		{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
		{ name: 'USER_ID', width: 70, align: 'center' },
		{ name: 'NAME_FULL', width: 120, align: 'left' },
		{ name: 'USER_TP_NM', width: 70, align: 'left' },
		{ name: 'USER_GD', width: 70 },
		{ name: 'DEPT_CD', width: 70, align: 'center', hidden: true },
		{ name: 'DEPT_NM', width: 120, align: 'left'},
		{ name: 'STATUS_NM', width: 70, align: 'center'},
		{ name: 'ADDR', width: 70, align: 'center', hidden: true },
		{ name: 'TEL_NO', width: 70, align: 'center', hidden: true },
		{ name: 'E_MAIL', width: 70, align: 'center', hidden: true }
	];
	
	var gSetting = {
			pgflg:true,
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true, // 쿼리 페이징 처리 여부
			height:277
	};
	
	btGrid.createGrid('popGrid1', colName, colModel, gSetting);
}

//Search
function popupSearch() {
	var url = "/common/selectUserInfo.do";
	
	var formData = formIdAllToMap('frmUserSearch');
	var param = {"param":formData};

	fn_ajax(url, false, param, function(data, xhr){
		var gridData = data.result;
		$('#popGrid1').jqGrid('clearGridData');
	    $('#popGrid1').jqGrid('setGridParam', {data:gridData});
	    $('#popGrid1').trigger('reloadGrid');
	});
} 

</script>