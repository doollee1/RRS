<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : CommonCodeManager
	 * @Description :  Common Code Manager Program
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SY05" />
</c:import>

<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<form id="frmSearch" action="#">
	<div class="tab_top_search">
	<table>
		<tbody>
			<tr>
				<td class="small_td"><s:message code='search.code'/></td>
	      		<td class="medium_td"><p><input type="text" id="S_HEAD_CD" name="S_HEAD_CD"></p></td>
	      		<td class="small_td"><s:message code='search.codename'/></td>
	      		<td class="medium_td"><p><input type="text" id="S_HEAD_NM" name="S_HEAD_NM" class="cmc_txt" /></p></td>
			</tr>
		</tbody>
	</table>
	</div>
	</form>
</div>

	<div class="ctu_g_wrap" style="width:100%; height:calc(50% - 20px); float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4 ><s:message code='title.commoncodemaster'/></h4>
			</div>	
			<div class="ct_grid_top_right">
				<button class='btn btn-default' id='btnAdd_H' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
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
				<h4><s:message code='title.commoncodedetail'/></h4>
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
	//초기 로드
	$(function() {
		initLayout();
		createGrid1();
		createGrid2();
		cSearch();
		setCommBtn('Add', false);
		
		$('#S_HEAD_CD').focus();
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
			
			$("#grid2").jqGrid("saveRow",changeRowId);
		});
		
		$('#grid2').jqGrid('setGridParam', {
			onCellSelect: function (rowid, index, content, event) {
				keyValue = $(this).jqGrid('getCell', rowid, 'CODE');
			}
		});
		
		$('#grid2').on('keypress', function (e) {
			var changeRowId = $('#grid2').jqGrid('getGridParam', 'selrow');
			if((keyValue != $('#grid2').jqGrid('getRowData', changeRowId).CODE)){
				if($('#grid2').jqGrid('getRowData', changeRowId).ROW_STATUS != "I"){
					$("#grid2").jqGrid('setCell', $("#grid2").getGridParam('selrow'), 'CODE', keyValue);
				}
			}
		});

		$("#btnAdd_H").click(function(){
			btGrid.gridAddRow("grid1", "last");
		});
		
		$("#btnAdd_D").click(function(){
			addCommonCodeDetail();
		});

		if(auth.substring(1,2) =='N'){
			$("#btnAdd_H").hide();
			$("#btnAdd_D").hide();
		}
		
		commonDetailSearch(null, null);
		
	});

	//공통코드 마스터
	function createGrid1(){
		var colName = ['CHK',
						'<s:message code='common.headercode'/>',
						'HEAD_ID',
						'<s:message code='common.headername'/>',
						'<s:message code='common.headername_en'/>',
						'<s:message code='common.headername_fr'/>',
						'<s:message code='common.headername_4th'/>',
						'<s:message code='common.relationcode1'/>',
						'<s:message code='common.relationcode2'/>',
						'<s:message code='common.relationcode3'/>',
						'<s:message code='common.relationcode4'/>',
						'<s:message code='common.relationcode5'/>',
						'<s:message code='common.relationNum1'/>',
						'<s:message code='common.relationNum2'/>',
						'<s:message code='common.relationNum3'/>',
						'<s:message code='common.relationNum4'/>',
						'<s:message code='common.relationNum5'/>',
						'<s:message code='common.note'/>',
						'ROW_STATUS',
						'<s:message code='common.status'/>'];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 40,align : 'center',formatter : gridCboxFormat, hidden:true},
			{ name: 'HEAD_CD', width: 80, align: 'center'},
			{ name: 'HEAD_ID', width: 90, align: 'center',editable:true, editoptions:{maxlength:100}},
			{ name: 'HEAD_NM', width: 115, align: 'left', editable:true, editoptions:{maxlength:100}},
			{ name: 'HEAD_EN', width: 110, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'HEAD_FR', width: 135, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'HEAD_4TH', width: 120, align: 'left', hidden : true, editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_CHR1', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_CHR2', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_CHR3', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_CHR4', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_CHR5', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_NUM1', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_NUM2', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_NUM3', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_NUM4', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REF_NUM5', width: 90, align: 'left', editable:true , editoptions:{maxlength:100}},
			{ name: 'REMARKS', width: 180, editable:true , editoptions:{maxlength:200}},
			{ name: 'ROW_STATUS', width: 100, hidden:true},
			{ name: 'STATUS', width: 85, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${status}'}}
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
				height:270
		};
		
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}
	
	//공통코드 디테일
	function createGrid2(){
		var colName = ['<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid2\')" /> ',
						'<s:message code='common.headercode'/>',
						'<s:message code='common.detailedcode'/>',
						'<s:message code='common.actualusecode'/>',
						'<s:message code='common.codename'/>',
						'<s:message code='common.codename_en'/>',
						'<s:message code='common.codename_fr'/>',
						'<s:message code='common.codename_4th'/>',
						'<s:message code='common.relationcode1'/>',
						'<s:message code='common.relationcode2'/>',
						'<s:message code='common.relationcode3'/>',
						'<s:message code='common.relationcode4'/>',
						'<s:message code='common.relationcode5'/>',
						'<s:message code='common.relationNum1'/>',
						'<s:message code='common.relationNum2'/>',
						'<s:message code='common.relationNum3'/>',
						'<s:message code='common.relationNum4'/>',
						'<s:message code='common.relationNum5'/>',
						'<s:message code='common.sortorder'/>',
						'ROW_STATUS',
						'<s:message code='common.status'/>',
						'삭제'
						];
		var colModel = [
			{name : 'CHK',index : 'CHK',width : 0,align : 'center',formatter : gridCboxFormat, hidden:true},
			{ name: 'HEAD_CD', width: 75, align: 'center' },
			{ name: 'CODE', width: 80, align: 'left', editable:true, editoptions:{maxlength:15}},
			{ name: 'READ_CD', width: 100, align: 'left', editable:true, editoptions:{maxlength:15}},
			{ name: 'CODE_NM', width: 100, align: 'left', editable:true, editoptions:{maxlength:100}},
			{ name: 'CODE_EN', width: 105, align: 'left', editable:true, editoptions:{maxlength:100}},
			{ name: 'CODE_FR', width: 150, align: 'left', editable:true, editoptions:{maxlength:100}},
			{ name: 'CODE_4TH', width: 120, align: 'left', editable:true, editoptions:{maxlength:100}, hidden : true},
			{ name: 'REF_CHR1', width: 90, align: 'left', editable:true, editoptions:{maxlength:150}},
			{ name: 'REF_CHR2', width: 90, align: 'left', editable:true, editoptions:{maxlength:150}},
			{ name: 'REF_CHR3', width: 90, align: 'left', editable:true, editoptions:{maxlength:150}},
			{ name: 'REF_CHR4', width: 90, align: 'left', editable:true, editoptions:{maxlength:150}},
			{ name: 'REF_CHR5', width: 90, align: 'left', editable:true, editoptions:{maxlength:150}},
			{ name: 'REF_NUM1', width: 90, align: 'right', editable:true, editoptions:{maxlength:22}, formatter: 'integer' },
			{ name: 'REF_NUM2', width: 90, align: 'right', editable:true, editoptions:{maxlength:22}, formatter: 'integer' },
			{ name: 'REF_NUM3', width: 90, align: 'right', editable:true, editoptions:{maxlength:22}, formatter: 'integer' },
			{ name: 'REF_NUM4', width: 90, align: 'right', editable:true, editoptions:{maxlength:22}, formatter: 'integer' },
			{ name: 'REF_NUM5', width: 90, align: 'right', editable:true, editoptions:{maxlength:22}, formatter: 'integer'},
			{ name: 'PRIORITY', width: 90, align: 'right', editable:true, editoptions:{maxlength:3}, formatter: 'integer' },
			{ name: 'ROW_STATUS', width: 100, hidden:true},
			{ name: 'STATUS', width: 80, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{value:'${status}'}},
			{ name: 'CHK2'   , index : 'CHK2', width : 50, align : 'center', formatter : gridCboxFormat, sortable: false}
	  	];
		
		var gSetting = {
		        pgflg:true,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: false,
				autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height:269
		};
		
		btGrid.createGrid('grid2', colName, colModel, gSetting);
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
		
		var url = "/common/selectCommonCodeMasterInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
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

		if(fn_empty(gridData1["HEAD_NM"])){
			args = '<s:message code='common.headername'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		if(fn_empty(gridData1["STATUS"])){
			$("#grid1").jqGrid('setCell', $("#grid1").getGridParam('selrow'), 'STATUS', 'Y');
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
			
			var url = '/common/saveCommonCodeMasterInfo.do';
			var param = {"master" : gridData1,"detail" : gridData2};
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
		
		commonDetailSearch(null, rowid);
	}
	
	function commonDetailSearch(currentPage, rowid){
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
		var url = "/common/selectCommonCodeDetailInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		formData["HEAD_CD"] = rowData["HEAD_CD"];
		formData["CURRENT_PAGE"] = $('#CURRENT_PAGE2').val();
		formData["ROWS_PER_PAGE"] = $('#ROWS_PER_PAGE2').val();
		
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid2", data.result);
			btGrid.gridQueryPaging($('#grid2'), 'commonDetailSearch', data.result);
		});
	}
	
	function addCommonCodeDetail(){
		btGrid.gridSaveRow('grid1');
		var rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
		var rowData = $("#grid1").getRowData(rowid);
		$('#grid2').jqGrid('setSelection', rowid);
		//ROW_STATUS = I 신규 ROW
		var data = {"HEAD_CD" : rowData["HEAD_CD"], "ROW_STATUS" : "I", "STATUS" : rowData["STATUS"]};
		btGrid.gridAddRow("grid2", "last", data);
	}
	
	function cDel(){
		var ids = $("#grid2").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
		
		btGrid.gridSaveRow('grid2');
		for(var i = 0; i < ids.length; i++){
			console.log($('#grid2_' + ids[i] + '_CHK2').prop('checked'));
			if($('#grid2_' + ids[i] + '_CHK2').prop('checked')){
				cnt++;
				gridData.push($("#grid2").getRowData(ids[i]));
			}
		}
		
		if(cnt < 1){
			alert("삭제할 데이터를 선택하십시오.");
			return;
		}
		
		if(confirm("삭제하시겠습니까?")){
			var url = '/common/deleteCommonCodeDetailInfo.do';
			var param = {"gridData" : gridData};
			
			fn_ajax(url, false, param, function(data, xhr){
				if(data.success){
					alert("삭제하였습니다.");
				}else{
					alert("삭제에 실패했습니다. "+data.message);
				}
				
				cSearch();
			});
		}
	}
	
	//그리드 체크박스 이벤트
	function grid_cbox_onclick(gid, rowid, colkey) {
	}
</script>

<c:import url="../import/frameBottom.jsp" />