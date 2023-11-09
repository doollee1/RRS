<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Deputy Management
	 * @Description :  Deputy Management
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="DeputyManagerEX" />
</c:import>

<div class="top_button_h_margin"></div>
	
	
	<div id="ctu_wrap">
		<form id="frmSearch" action="#" onsubmit="return false">
		<div class="tab_top_search">
		<table>
			<tbody>
				<tr>
					<td class="small_td">User ID</td>
					<td><input type="text" id="S_USER_ID" name="S_USER_ID" class="cmc_txt" style="float:left;" value="${loginVO.userId}"disabled="" readonly></td>					
					<td class="small_td">User Name</td>
		      		<td><input type="text" id="S_USER_NM" name="S_USER_NM" class="cmc_txt" style="float:left;" value="${loginVO.nameFull}"disabled="" readonly></td>
		      		<td class="small_td">Department</td>
		      		<td>
		      			<input type="text" name="S_DEPT_CD" id="S_DEPT_CD" class="cmc_txt disabled"  disabled="" readonly="readonly" style="width:calc(50% - 68px); float:left; margin-right:2px;"/>	
						<p style="float:left;margin-left:3px; margin-right:4px;">/</p>
						<input type="text" name="S_DEPT_NM" id="S_DEPT_NM" class="cmc_txt disabled"  disabled="" readonly="readonly" style="width:calc(50%); float:left; margin-right:2px;"/>		
						<button class="grid_popupbtn"' id='btn_manager' type='button' onclick='deptPopup();'></button>
		      		</td>
				</tr>
			</tbody>
		</table>
		</div>
		</form>
	</div>
		
	<div>
		<ul>
			<li style="float: left; width: 49%; list-style-type: none; padding: 20px 10px 0 0;">
				<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:0px;">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left">
							<h4><s:message code='title.userlist'/></h4>
						</div>	
						<div class="ct_grid_top_right">
							<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
							<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
						</div>
					</div>
					<div>
					<table id="grid1"></table><div id="grid1_pager"></div>
					</div>
				</div>
			</li>
			<li style="float: left; width: 49%; list-style-type: none; padding: 20px 10px 0 0;">
				<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left;">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left">
							<h4><s:message code='title.deputyList'/></h4>
						</div>	
						<div class="ct_grid_top_right">
							<button class='btn btn-default' id='btnAdd_D' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
							<input type="hidden"  name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
							<input type="hidden"  name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
						</div>						
					</div>
					<div>
					<table id="grid2"></table><div id="grid2_pager"></div>
					</div>
				</div>		
			</li>
		</ul>
	
	
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
  var lastsel3;
  var toDay = getToday();
  
	//초기 로드
	$(function() {

		initLayout();
		createGrid1();
		createGrid2();
		createCodeBox('APRV_TP');
		setCommBtn('Add', false);
		
		$("#S-APPROVAL_ID").attr("disabled",false).attr("readonly",false);
		$("#cmm_pop_APPROVAL_ID").attr("hidden",false);
		
		
		if(policy.indexOf('ADMIN') > -1){
			$("#S_USER_ID").attr("disabled",false).attr("readonly",false);
			$("#S_USER_NM").attr("disabled",false).attr("readonly",false);
		}
		fn_codeval({type:'USER',btn_id:'cmm_pop_APPROVAL_ID',code:'S-APPROVAL_ID', name:'S-APPROVAL_NM'});
		
		$('#S_APPROVAL_ID').focus();
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
			grid1_onCilckRow(e, rowid, status);
		});

		// validation change
		$("#grid1").bind("change", function() {
			$("#grid1").jqGrid('setCell', $("#grid1").getGridParam('selrow'), 'ROW_STATUS', 'U');
		});
		
		$("#grid2").bind("change", function() {
			var changeRowId = $('#grid2').jqGrid('getGridParam', 'selrow');
			$('#grid2_' + changeRowId + '_CHK').prop('checked', true);
			if($('#grid2').jqGrid('getRowData', changeRowId).ROW_STATUS != "I"){
				$("#grid2").jqGrid('setCell', $("#grid2").getGridParam('selrow'), 'ROW_STATUS', 'U');
			}
		});

		
		$('#grid1').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				if(index == 4){
					openUserPopup('grid1',rowId);
				}
			}
		});
		
		$('#grid2').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				if(index == 4){
					openUserPopup('grid2',rowId);
				}
			}
		});
		
		$("#btnAdd_H").click(function(){
			btGrid.gridAddRow("grid1", "last");
		});
		
		$("#btnAdd_D").click(function(){
			addDeputyDetail();
		});

		if(auth.substring(1,2) =='N'){
			$("#btnAdd_H").hide();
			$("#btnAdd_D").hide();
		}
		
		$('#S-APPROVAL_ID').on('keypress', function (e) {
			if(e.which == 13){
				cSearch()
			}
		});
		
		cSearch();
		DeputyDetailSearch(null, null);
		
	});

	function createGrid1(){
		var colName = [ 
	        'DEPT_CD',
			'<s:message code='system.department'/>',
			'<s:message code='system.UserID'/>',
			'<s:message code='system.Username'/>'
		];
		
		var colModel = [		
			{ name: 'DEPT_CD', width: 50, align: 'center'},
			{ name: 'DEPT_NM', width: 100},
			{ name: 'USER_ID', width: 50, align: 'center'},
			{ name: 'NAME_FULL'}
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
				height:550,
				sortable:false
		};
		
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}
	
	function createGrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid2\')" /> ',
						'SEQ',
						'DEPT_CD',
		                '<s:message code='system.department'/>',
						'<s:message code='system.UserID'/>',
						'<s:message code='system.Username'/>',
						'<s:message code='quotation.validFrom'/>',
						'<s:message code='quotation.validTo'/>',
						'<s:message code='lead.reason'/>',
						'ROW_STATUS',
						'<s:message code='common.status'/>'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 20,align : 'center',formatter : gridCboxFormat, hidden:true},
			{ name: 'SEQ', width: 70, align: 'left', hidden:true},
			{ name: 'DEPT_CD', width: 70, align: 'left', hidden:true},
			{ name: 'DEPT_NM', width: 100, align: 'left' },
			{ name: 'DEPUTY_ID', width: 70, align: 'left', classes: 'gridbtnsearch', editable:false, editoptions:{maxlength:'8', 
	              dataEvents:[{
	            	  type:"change",
					  fn:function(e){
						  setRowStatus('grid2'); }}]
				} 
			},
			{ name: 'DEPUTY_NM', width: 120, align: 'left', editoptions:{maxlength:15}},
			{ name: 'FROM_DT', width: 70, align: 'center', editable: true, reformatAfterEdit : false , formatter: 'date',
				formatoptions: {srcformat: 'd.m.Y', newformat: 'd.m.Y', defaultValue:null },
				editoptions: {size: 12, maxlengh: 12,
					dataInit: function (element) {
						$(element).datepicker({ dateFormat: 'dd.mm.yy' })
					}, dataEvents:[{type:"change", fn:function(e){ setRowStatus('grid2'); } }]
				}
			},
			{ name: 'TO_DT', width: 70, align: 'center',  editable: true, reformatAfterEdit : false , formatter: 'date',
				formatoptions: {srcformat: 'd.m.Y', newformat: 'd.m.Y', defaultValue:null },
				editoptions: {size: 12, maxlengh: 12,
					dataInit: function (element) {
						$(element).datepicker({ dateFormat: 'dd.mm.yy' })
					}, dataEvents:[{type:"change", fn:function(e){ setRowStatus('grid2'); } }]
				}
			},
			{ name: 'REASON', width: 250, align: 'left', editable:true, editoptions:{maxlength:100}},
			{ name: 'ROW_STATUS', width: 90, hidden:true},
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
				height:550
		};
		
		btGrid.createGrid('grid2', colName, colModel, gSetting);
	}

	function cSearch() {
		
		var page = $("#grid1").getGridParam("page");
		var rowNum = $("#grid1").getGridParam("rowNum");	
		
		var url = "<c:url value="/common/selectUserInfo.do"/>";		
		var param = {'param' : {
			  S_USER_ID: $("#S_USER_ID").val()
			, S_USER_NM: $("#S_USER_NM").val()
			, DEPT_CD: $("#S_DEPT_CD").val()
		    , CURRENT_PAGE: page
		    , ROWS_PER_PAGE: rowNum
		}};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			clearGrid("grid2");
			if(data.result.length > 0){
				$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
			}
		});
	}
	
	function cSave(){
		
		btGrid.gridSaveRow('grid1');
		btGrid.gridSaveRow('grid2');
		
		var selr = $('#grid1').jqGrid('getGridParam', 'selrow');
		var gridData1 = $("#grid1").getRowData(selr);
		if (fn_empty(gridData1["USER_ID"])) {
			args = '<s:message code='system.UserID'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}		
		if (!confirm("<s:message code='confirm.save'/>")) return;
						
		var gridData2 = $('#grid2').getRowData();
		var formData = formIdAllToMap('frmSearch');
		
		var url = "<c:url value="/common/savedDeputyEX.do"/>";
		var param = {
				  "USER_ID" : gridData1.USER_ID
				, "detail" : gridData2
		};
		
		fn_ajax(url, false, param, function(data, xhr) {
			if (data.dup == 'Y') {
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			} else {
				alert("<s:message code='info.save'/>");
				cSearch();
			}	
		});
	}
	
	function grid1_onCilckRow(e, rowid, status){		
		DeputyDetailSearch(null, rowid);
	}
	
	function DeputyDetailSearch(currentPage, rowid){
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
		var url = "/common/selectDeputyDetail.do";
		
		var formData = formIdAllToMap('frmSearch');
		formData["APPROVAL_ID"] = rowData["USER_ID"];
		
		var param = {"param":formData};
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid2", data.result);
			btGrid.gridQueryPaging($('#grid2'), 'DeputyDetailSearch', data.result);
		});
	}
	
	function addDeputyDetail(){
		btGrid.gridSaveRow('grid1');
		var rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
		var rowData = $("#grid1").getRowData(rowid);
		$('#grid2').jqGrid('setSelection', rowid);
		//ROW_STATUS = I 신규 ROW
		var data = {"FROM_DT" : toDay, "TO_DT" : toDay};
		btGrid.gridAddRow("grid2", "last", data);
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

	function openUserPopup(gridId, rowId){
		
		var url = '/popup/UserPopup2.do';
		var pid = 'userPopup';
		var param = {'SEARCH' : 'ONLY_USER_NM'};
		
		popupOpen(url, pid, param, function(data) {
			if (data.length == 1) {
				
				jQuery("#"+ gridId).setCell(rowId, "DEPT_CD", data[0].DEPT_CD);
				jQuery("#"+ gridId).setCell(rowId, "DEPT_NM", data[0].DEPT_NM);
					
				if(gridId == 'grid1'){
					jQuery("#"+ gridId).setCell(rowId, "USER_ID", data[0].USER_ID);
					jQuery("#"+ gridId).setCell(rowId, "NAME_FULL", data[0].NAME_FULL);
				}else{
					jQuery("#"+ gridId).setCell(rowId, "DEPUTY_ID", data[0].USER_ID);
					jQuery("#"+ gridId).setCell(rowId, "DEPUTY_NM", data[0].NAME_FULL);
				}
			}
		});
	}
	
	function deptPopup() {
		
		var url = "/common/DeptPopup.do";
		var pid = "deptPopup";
		var param = {
			  "S_DEPT_CD" : $("#S_DEPT_CD").val()
			, "S_DEPT_NM" : $("#S_DEPT_NM").val()
		};
				
		popupOpen (url, pid, param, function(data) {
			if(!fn_empty(data)){
				$('#S_DEPT_CD').val(data[0].DEPT_CD);
				$('#S_DEPT_NM').val(data[0].DEPT_NM);
			}
		});
	}
	
</script>

<c:import url="../import/frameBottom.jsp" />