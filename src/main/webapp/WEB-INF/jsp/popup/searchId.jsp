<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : chgStatusPopup
 */
%>
<style>
.pbtn_default {margin: 0 3px -1px 5px;padding: 3px 10px 3px 10px;border: 1px solid #a9cbeb !important;background: #bdd6ee !important;color: #2269b1;}
</style>
<div id="p_searchIdPopup">
	<!-- Search condition start -->
	<form id="frmSearch">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<!------------->
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><p>회원구분</p></td>
						<td class="medium_td">
							<select id="S_MEM_GBN" name="S_MEM_GBN" class="cmc_combo" style="width:150px;">
								<option value="">전체</option>
								<c:forEach var="i" items="${mem_gbn}">
							    	<option value="${i.CODE}">${i.CODE_NM}</option>
						    	</c:forEach>
							</select>
						</td>
						<td class="small_td"><p><s:message code='system.UserID'/></p></td>
						<td class="medium_td"><input type="text" id="S_USER_ID" name="S_USER_ID" class="cmc_txt" maxlength="20" noSpecial /></td>
						<td class="small_td"><p><s:message code='system.Username'/></p></td>
						<td class="medium_td"><input type="text" id="S_USER_NM" name="S_USER_NM" class="cmc_txt" maxlength="30" noSpecial /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-------------->	
	</form>
	<!-- Search condition end -->
	
	
	<!-- grid start -->
	<div id="ctm_mg_wrap">
		<table id="grid1" class="user_info_table"></table>
		<div id="grid1_pager"></div>
	</div>
	<!-- grid end -->
</div>

<script type="text/javascript">
$(function() {
	var day = new Date();
	var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
	
	$('#p_searchIdPopup').dialog({
		title :'<s:message code='reservation.searchId'/>',
		autoOpen : false,
		height: 470,
		width: 1076.4,
		modal : true,
		buttons : {
			'<s:message code='button.search'/>' : {
				text: '<s:message code='button.search'/>',
				click: function() {
					cSearch();
				}
			},
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close");
				}
			},
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			createGrid1();
			
			/* grid1 Event */
			$('#grid1').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					grid1_ondblClickRow(rowid, iRow, iCol, e);
				}
			});
			
			$('#S_USER_ID').on('keypress', function (e) {
				if(e.which == 13){
					cSearch(null)
				}
			});
			
			$('#S_USER_NM').on('keypress', function (e) {
				if(e.which == 13){
					cSearch(null)
				}
			});
		}
	});
	
	
});

function createGrid1(){
	var colName = [
		'순번',
		'회원구분',
		'이름',
		'영문이름',
		'전화번호',
		'ID',
		'Email',
		'',
		'회원구분'
	]
	var colModel = [
		{ name: 'ROWNUM', width: 100, align: 'center' },
		{ name: 'MEM_NM', width: 100, align: 'center' },
		{ name: 'HAN_NAME', width: 100, align: 'center' },
		{ name: 'ENG_NAME', width: 100, align: 'center' },
		{ name: 'TEL_NO', width: 100, align: 'center' },
		{ name: 'USER_ID', width: 100, align: 'center' },
		{ name: 'EMAIL', width: 100, align: 'center' },
		{ name: 'CHK', index: 'CHK', width: 50, align: 'center', formatter: gridCboxFormat, sortable: false },
		{ name: 'MEM_GBN', width : 0  , align : 'center', hidden:true }
	]
	
	var gSetting = {
			height:"300",
			pgflg:true,
			exportflg : false,  //엑셀, pdf 출력 버튼 노출여부, td 태그안에 체크박스가 들어가 있어 pdf 생성시 에러발생
			colsetting : false,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부				
	};
	
	btGrid.createGrid('grid1', colName, colModel, gSetting);
	btGrid.gridResizing('grid1');
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
	
	var url = "/rrs/selectUserInfo.do";
	
	var formData = formIdAllToMap('frmSearch');
	var param = {"param":formData};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid1", data.result);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
	});
	setTelNoHypen();
}

function grid1_ondblClickRow(rowid, iRow, iCol, e){
	var gridData = $("#grid1").getRowData(rowid);
	p_rtnData = {
		"USER_ID"    : gridData["USER_ID"],
		"MEM_GBN"    : gridData["MEM_GBN"],
		"REQ_HAN_NM" : gridData["HAN_NAME"],
		"REQ_ENG_NM" : gridData["ENG_NAME"],
		"REQ_TEL_NO" : gridData["TEL_NO"],
	};
	popupClose($('#p_searchIdPopup').data('pid'));
}

function setTelNoHypen() {
	var rowDataList = $("#grid1").getRowData();
	for(var i=0; i<rowDataList.length; i++) {
		var convert_TEL_NO = rowDataList[i].TEL_NO.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
		$("#grid1").jqGrid('setCell', i+1, 'TEL_NO', convert_TEL_NO);
	}
}

</script>