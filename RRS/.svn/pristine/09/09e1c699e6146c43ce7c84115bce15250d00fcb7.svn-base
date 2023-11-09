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
	<c:param name="progcd" value="DeputyManagement" />
</c:import>

<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#" onsubmit="return false">
	<div class="tab_top_search">
	<table>
		<tbody>
			<tr>
				<td class="small_td">Approval Type</td>
				<td><select id="APRV_TP" name="APRV_TP" class=""></select></td>
				<td class="small_td">Approval Id</td>
	      		<td><input type="text" id="S-APPROVAL_ID" name="S-APPROVAL_ID" class="cmc_txt" disabled="" readonly="readonly"/ style="float:left;"> <!-- value="${loginVO.userId}" -->
	      		<button class="grid_popupbtn" id="cmm_pop_APPROVAL_ID" name="cmm_pop_APPROVAL_ID" type='button'></button>
				<p class="data_under_text" name="S-APPROVAL_NM" id="S-APPROVAL_NM"></p></td>
			</tr>
		</tbody>
	</table>
	</div>
	</form>
</div>

	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4 ><s:message code='title.approverList'/></h4>
			</div>	
			<div class="ct_grid_top_right">
				<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
				<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		</div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
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
	<table id="grid2"></table>
	<div id="grid2_pager"></div>
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
		
		/*
		if(policy.indexOf('ADMIN') > -1){
			$("#S-APPROVAL_ID").attr("disabled",false).attr("readonly",false);
			$("#cmm_pop_APPROVAL_ID").attr("hidden",false);
		}*/
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
		var colName = ['CHK',
		               'SEQ',
		               'DEPT_CD',
						'<s:message code='system.department'/>',
						'<s:message code='system.UserID'/>',
						'<s:message code='system.Username'/>',
						'Amount',
						' ',
						'Range',
						' ',
						'ROW_STATUS'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 40,align : 'center',formatter : gridCboxFormat, hidden:true},
			{ name: 'SEQ', width: 80, align: 'left', hidden:true},
			{ name: 'DEPT_CD', width: 80, align: 'left', hidden:true},
			{ name: 'DEPT_NM', width: 80, align: 'left'},
			{ name: 'APPROVAL_ID', width: 80, align: 'center', classes: 'gridbtnsearch', editable:false, editoptions:{maxlength:'8', 
	              dataEvents:[{
	            	  type:"change",
					  fn:function(e){
						  setRowStatus('grid1');
					  }
				  }]} },
			{ name: 'APPROVAL_NM', width: 120, align: 'left',editoptions:{maxlength:100}},
			{ name: 'AMOUNT', width: 120, align: 'left',editable:true , editoptions:{ maxlength:10
				, dataInit: function(element) {
					$(element).keypress(function (event) {
						if (event.which && ((event.which <= 43) || (event.which >= 58)) && event.which != 8) { 
							event.preventDefault();
						}
					})
				} ,dataEvents:[ {	 

					type:"change", fn:function(e) { 
						setRowStatus('grid1'); 
						syncAmount('AMOUNT');
					}
				} ]},
			cellattr: function(rowId, val, rawObject) {
			    if (rowId == 1) {
			    	return "class='gridbtnSign01'";
			    }else{
			    	return "class='gridbtnSign05'";
			    }
			}},
			{ name: 'AMOUNT_R', width: 10, align: 'center',editoptions:{maxlength:10}, hidden:true},
			{ name: 'RANGE', width: 120, align: 'left', editable:true , editoptions:{maxlength:100
				, dataInit: function(element) {
				$(element).keypress(function (event) {
					if (event.which && ((event.which <= 43) || (event.which >= 58)) && (event.which != 8)) { 
						event.preventDefault();
					}
				})
			} , dataEvents:[ { type:"change", fn:function(e){setRowStatus('grid1'); syncAmount('RANGE');} } ]},
			cellattr: function(rowId, val, rawObject) {
			    if (rowId == 1) {
			    	return "class='gridbtnSign03' style='width: 86%;'";
			    }else if(rowId == 2){
			    	return "class='gridbtnSign04' style='width: 86%;'";
			    }else{
			    	return "class='gridbtnSign05' style='width: 86%;'";
			    }
			}},
			{ name: 'RANGE_R', width: 10, align: 'center',editoptions:{maxlength:100}, hidden:true},
			{ name: 'ROW_STATUS', width: 90, hidden:true}
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
				height:100,
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
				height:439
		};
		
		btGrid.createGrid('grid2', colName, colModel, gSetting);
	}

	function cSearch(){

		var url = "/common/selectApprovalIdList.do";
		
		var param = {'param' : {APPROVAL_ID : $("#S-APPROVAL_ID").val(),
					 			APRV_TP : $("#APRV_TP").val()}};
		
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

		if(fn_empty(gridData1["APPROVAL_ID"])){
			args = '<s:message code='system.UserID'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		var ids = $("#grid1").jqGrid("getDataIDs");
		var updateCounter = 0;
		for(var i = 0; i < ids.length; i++){
			var gridData1 = $("#grid1").getRowData(selr);
			
			(gridData1["ROW_STATUS"] == "U") ? updateCounter++ : '';
			
			if(1 < updateCounter){
				break;
			}
		}
		
		(1 < updateCounter) ? alert("<s:message code='errors.masterOneSave'/>") : '';
		var gridData2 = $('#grid2').getRowData();

		if(confirm("<s:message code='confirm.save'/>")){
			var formData = formIdAllToMap('frmSearch');
			
			var url = '/common/savedDeputy.do';
			var param = {"master" : gridData1,"detail" : gridData2, "type" :$("#APRV_TP").val()};
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					cSearch();
				}	
			});
		}
	}
	
	function grid1_onCilckRow(e, rowid, status){
		
		var ids = $('#grid1').jqGrid('getDataIDs');
		for (var i = 1, len = ids.length; i < len; i++) {
			if(i == rowid){
				$('#grid1_' + i + '_CHK').prop('checked', true);
			}else{
				$('#grid1_' + i + '_CHK').prop('checked', false);
			}
		}
		
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
		formData["APPROVAL_ID"] = rowData["APPROVAL_ID"];
		
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
		var pid = 'UserPopup2';
		var param = {'SEARCH' : 'ONLY_USER_NM'};
		
		popupOpen(url, pid, param, function(data) {
			if (data.length == 1) {
					jQuery("#"+ gridId).setCell(rowId, "DEPT_CD", data[0].DEPT_CD);
					jQuery("#"+ gridId).setCell(rowId, "DEPT_NM", data[0].DEPT_NM);
					
				if(gridId == 'grid1'){
					jQuery("#"+ gridId).setCell(rowId, "APPROVAL_ID", data[0].USER_ID);
					jQuery("#"+ gridId).setCell(rowId, "APPROVAL_NM", data[0].NAME_FULL);
				}else{
					jQuery("#"+ gridId).setCell(rowId, "DEPUTY_ID", data[0].USER_ID);
					jQuery("#"+ gridId).setCell(rowId, "DEPUTY_NM", data[0].NAME_FULL);
				}
			}
		});
	}
	function syncAmount(type){
		
		var ids = $('#grid1').jqGrid('getDataIDs');
		var selRow = $('#grid1').jqGrid('getGridParam', 'selrow');
		// var data = $("#grid1").jqGrid('getCell', selRow, type);
		var data = $('#' + selRow + '_' + type).val();
		
		var loopFlg = true;		
		if(type == 'RANGE' && selRow < 2){
			loopFlg = false;
			$("#grid1").jqGrid('setCell', ids[0], type, '0');
		}
		
		if(loopFlg){
			for(var i = 0; i < ids.length; i++){
				if(type == 'RANGE'){
					if(0 < i){
						$("#grid1").jqGrid('setCell', ids[i], type, data);
					}else{
						$("#grid1").jqGrid('setCell', ids[i], type, '0');
					}
				}else{
					$("#grid1").jqGrid('setCell', ids[i], type, data);
				}
			}
		}
	}
</script>

<c:import url="../import/frameBottom.jsp" />