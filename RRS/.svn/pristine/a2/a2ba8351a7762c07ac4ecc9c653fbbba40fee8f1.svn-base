<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : ProgPopup
 */
%>
<div id="ProgPopup">
	<!--- 검색버튼 ---->
		<div class="oms_popup_button">
			<button class='btn btn-default' id='btn_search' type='button' onclick='popupSearch();'>
	      		<i class='fa fa-search'></i><s:message code='button.search'/></button>
		</div>
		
	<div class="ctm_sech_wrap">
		<form id="frmProgSearch" action="#">
		<table class="tab_top_search" width="100%">
			<tr>
				<td class="small_td"><s:message code='title.sample'/></td>
				<td><select id="S_SYSTEM_CD" name="S_SYSTEM_CD" class="cmc_combo">
						<option value="" selected="selected"><s:message code='common.all'/></option>	<!-- ==전체== -->
						<c:forEach var="i" items="${systemlist}">
							<option value="${i.code}">${i.value}</option>
						</c:forEach>
					</select></td>
				<td class="small_td"><s:message code='search.menugroup'/></td>
				<td><select id="S_PROG_GROUP" name="S_PROG_GROUP" class="cmc_combo">
						<option value="" selected="selected"><s:message code='common.all'/></option>		<!-- ==전체== -->
					</select></td>
				<td class="small_td"><s:message code='system.usedornot'/></td>
				<td><select id="S_STATUS" name="S_STATUS" class="cmc_combo">
						<option value="" selected="selected"><s:message code='common.all'/></option>		<!-- ==전체== -->
						<c:forEach var="i" items="${useyn}">
							<option value="${i.code}">${i.value}</option>
						</c:forEach>
					</select></td>
				</tr>
		</table>
		</form>
	</div>
	<!-- 검색조건부분 끝 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code='title.programlist'/></h4></div>		<!-- 프로그램목록 -->
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="popGrid1"></table>
		<div id="popGrid1_item_pager"></div>
	</div>
</div>

<script type="text/javascript">
var args;
$(function() {
	$('#ProgPopup').dialog({
		title: '<s:message code="title.programlist"/>',
		autoOpen: false,
		height: 500,
		width: 930,
		modal: true,
		buttons: {
			'확인': { 
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
						args = '<s:message code='system.programcode'/>';
						alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");

						return;
					}
					
					p_rtnData = gridData;
					popupClose($(this).data('pid'));
				}
			},
			'취소': {
				text: '<s:message code='button.cancel'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#ProgPopup .pop_grid_wrap').height($(this).height() - $('#ProgPopup .popup_search').outerHeight(true) - 10);
			
			createPopGrid1();
								
			popupSearch();
			
			$("#S_SYSTEM_CD").change(function(e){
				changeMidMenu();
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
					 '<s:message code='system.compcd'/>'
					,'<s:message code='system.systemcode'/>'
					,'<s:message code='system.programcode'/>'
					,'<s:message code='system.programname'/>'
					,'<s:message code='system.programenglishname'/>'
					,'<s:message code='system.programfrenchname'/>'
					,'<s:message code='system.programetcname'/>'
					,'<s:message code='system.level'/>'
					,'<s:message code='system.usedornot'/>'
					];
	var colModel = [
		{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat},
		{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
		{ name: 'SYSTEM_CD', width: 70, align: 'center' },
		{ name: 'PROG_CD', width: 120, align: 'left' },
		{ name: 'PROG_NM', width: 180 },
		{ name: 'PROG_EN', width: 180 },
		{ name: 'PROG_FR', width: 180, editable:true,editoptions:{maxlength:50}},
		{ name: 'PROG_4TH', width: 180, editable:true,editoptions:{maxlength:50}, hidden: true},
		{ name: 'PROG_LV', width: 50 },
		{ name: 'STATUS', width: 70, align: 'center', editable:false, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}}
		];
	
	var gSetting = {
			height: 240,
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

//검색
function popupSearch() {
	var url = "/system/selectProgInfo.do";
	
	var formData = formIdAllToMap('frmProgSearch');
	var param = {"param":formData};
	
	fn_ajax(url, true, param, function(data, xhr){
		reloadGrid("popGrid1", data.result);
	});
}

function changeMidMenu(){
	if(!$("#S_SYSTEM_CD").val()){
		$("#S_PROG_GROUP").find("option").remove();
		$("#S_PROG_GROUP").append("<option value='' selected='selected'>ALL</option>");
		return;
	}
	
	var url = "/system/selectMiddleMenuCombo.do";
	var param = {"param" : {
		"SYSTEM_CD" : $("#S_SYSTEM_CD").val()
	}};
	
	fn_ajax(url, true, param, function(data, xhr){
		$("#S_PROG_GROUP").find("option").remove();
		$("#S_PROG_GROUP").append("<option value='' selected='selected'>ALL</option>");
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