<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : UserPopup
 */
%>
<div id="UserPopup">

		<div class="oms_popup_button">
			<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
	      		<i class='fa fa-search'></i><s:message code='button.search'/></button>
		</div>
		
	<div class="ctm_sech_wrap">
		<form id="frmUserSearch" action="#">
		<table class="tab_top_search" width="100%">
				<tr>
					<td class="small_td"><s:message code='system.UserID'/></td>
		      		<td><p><input type="text" id="S_USER_ID" name="S_USER_ID"></p></td>
		      		<td class="small_td"><s:message code='system.Username'/></td>
		      		<td><p><input type="text" id="S_USER_NM" name="S_USER_NM" class="cmc_txt" /></p></td>
				</tr>
		</table>
		</form>
	</div>
	<!-- 검색조건부분 끝 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="title.userlist"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="popGrid1"></table>
		<div id="popGrid1_item_pager"></div>
	</div>
</div>

<script type="text/javascript">
var args;
$(function() {
	$('#UserPopup').dialog({
		title: '<s:message code="title.userlist"/>',
		autoOpen: false,
		height: 500,
		width: 930,
		modal: true,
		buttons: {
			'<s:message code='button.confirm'/>': { 
				text: '<s:message code='button.confirm'/>',
				click: function() {
					var ids = $("#popGrid1").jqGrid("getDataIDs");
					var gridData = [];
					var cnt = 0;
					btGrid.gridSaveRow('popGrid1');
					for(var i = 0; i < ids.length; i++){
						if($('#popGrid1_' + ids[i] + '_CHK').prop('checked')){
							cnt++;
							gridData.push($("#popGrid1").getRowData(ids[i]));
						}
					}
					
					if(cnt < 1){
						args = '<s:message code='button.user'/>';
						alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");

						return;
					}
					
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
			$('#UserPopup .pop_grid_wrap').height($(this).height() - $('#UserPopup .popup_search').outerHeight(true) - 10);
			
			createPopGrid1();
								
			//popupSearch();
			$("#S_USER_ID").focus();
			$("#btnSearch").click(function(){
				popupSearch();
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
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

function createPopGrid1(){
	var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'popGrid1\')" /> ',
	               '<s:message code='system.compcd'/>',
	               '<s:message code='system.UserID'/>',
	               '<s:message code='system.name'/>',
	               '<s:message code='system.usertype'/>',
	               '<s:message code='system.usergroup'/>',
	               '<s:message code='system.department'/>',
	               '<s:message code='system.departmentname'/>',
	               '<s:message code='system.usedornot'/>'];
	var colModel = [
		{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat},
		{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
		{ name: 'USER_ID', width: 70, align: 'center' },
		{ name: 'NAME_FULL', width: 120, align: 'left' },
		{ name: 'USER_TP_NM', width: 70, align: 'left' },
		{ name: 'USER_GD', width: 70 },
		{ name: 'DEPT_CD', width: 70, align: 'center', hidden: true },
		{ name: 'DEPT_NM', width: 120, align: 'left'},
		{ name: 'STATUS_NM', width: 70, align: 'center'}
	];
	
	var gSetting = {
			height: 252,
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
	
	btGrid.createGrid('popGrid1', colName, colModel, gSetting);
}

//Search
function popupSearch() {
	var url = "/common/selectUserInfo.do";
	
	var formData = formIdAllToMap('frmUserSearch');
	var param = {"param":formData};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("popGrid1", data.result);
	});
} 

/* grid head check box select */
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

//grid checkbox event
function grid_cbox_onclick(gid, rowid, colkey) {
	
}
</script>