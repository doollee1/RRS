<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : DeptManager
 * @Description : Dept Manager Program
 */
%>
<c:import url="../import/frameTop.jsp">
   	<c:param name="progcd" value="BC03" />
</c:import>
<style>
#grid2_pager {display:none;}
</style>
<div style="padding-top:12px;"></div>
<hr>
<div id="ctd_wrap">
	<div class="ctu_gl_wrap ctu_resize" style="width:calc(35% - 10px); height:calc(50%); padding-top:-95px;">
		<div id="ctd_dg_wrap" style="margin-bottom:40px">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="mail.ResultList"/></h4>
				</div>		
			</div>
			<table id="grid1">
				<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
				<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			</table>
			<div id="grid1_pager"></div>
		</div>		
	</div>
	<div class="ctu_gr_wrap ctu_resize" style="width:calc(65% - 10px); height:calc(50%); padding-top:0px;">
		<form id="frmMail" action="#">
		<input type="hidden" name="isStatus" id="isStatus" />
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code="mail.MailContents"/></h4>
			</div>
		</div>
		
		<table class="tblForm" style="border:1px solid #ddd; padding-top:5px;">

			<tr>
				<th width="110px"><s:message code="mail.TypeCode"/></th>
				<td><select id="MAIL_CD" name="MAIL_CD" class="cmc_combo" style="width:200px"></select>
					<input type="text" name="MAIL_NM" id="MAIL_NM" class="cmc_txt" maxlength="50" style="width:150px;"/>
				</td>
				<th><p><s:message code="mail.Language"/></p></th>
				<td>
					<select id="MAIL_LANG" name="MAIL_LANG" class="cmc_combo" style="width:200px;"></select>
					<button class="cBtnclass cls cBtnCopy_style" id="btnPreview" name="btnPreview" type="button">Preview</button>
				</td>
			</tr>
			<tr>
				<th><s:message code="mail.MailTitle"/></th>
				<td colspan="3" height="160px">
					<table id="grid2"></table>
					<div id="grid2_pager"></div>
				</td>
			</tr>
			<tr>
				<th><s:message code="mail.BodyLine"/></th>
				<td colspan="3"><input type="text" name="BODY_TITLE_TXT" id="BODY_TITLE_TXT" class="cmc_txt" maxlength="40" style="width:195px" value="Dear"/>
					<select id="BODY_TITLE_TYPE" name="BODY_TITLE_TYPE" class="cmc_combo" style="width:calc(50% - 45px);">
						<option value=""></option>
						<option value="Madam or Sir">Madam or Sir</option>
						<option value="Damen und Herren">Damen und Herren</option>
					</select>
				</td>
			</tr>
			<tr>
				<th><s:message code="mail.MailBody"/></th>
				<td colspan="3"><textarea id="BODY_CONTENTS" name="BODY_CONTENTS" style="height:130px; min-height:100px; width:99%; overflow:auto; margin-right:10px;"></textarea></td>
			</tr>
			<tr>
				<th><s:message code="mail.AttachedFile"/></th>
				<td colspan="3">
					<select id="ATTACH_FILE_YN" name="ATTACH_FILE_YN" class="cmc_combo" style="width:200px">
						<option value=""></option>
						<option value="Y">[Y] Y</option>
						<option value="N">[N] N</option>
					</select>					
				</td>
			</tr>
			<tr>
				<th><s:message code="mail.Using"/></th>
				<td><select id="USED_OR_NOT" name="USED_OR_NOT" class="cmc_combo" style="width:200px">
				</select></td>
				<th><p><s:message code="mail.Updated"/></p></th>
				<td><input type="text" name="UPT_DT" id="UPT_DT" class="cmc_txt" maxlength="40" disabled="disabled" style="width:calc(50% - 50px);"/>
					<input type="text" name="UPT_ID" id="UPT_ID" class="cmc_txt" maxlength="40" disabled="disabled" style="width:calc(50% - 50px);"/></td>
			</tr>
		</table>
		
				
		<div id="ctd_dg_wrap" style="margin-bottom:40px">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="mail.RecipientList"/></h4>
				</div>
				<div class="ct_grid_top_right">
					<button class='btn btn-default' id='item_btnPfAdd' name='item_btnPfAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
					<button class='btn btn-default' id='item_btnPfDel' name='item_btnPfDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
				</div>	
			</div>
		
			<table id="grid3">
				<input type="hidden"  name="GRID3_CURRENT_PAGE"  id="GRID3_CURRENT_PAGE" />
				<input type="hidden"  name="GRID3_ROWS_PER_PAGE"  id="GRID3_ROWS_PER_PAGE" />
			</table>
			<div id="grid3_pager"></div>
		</div>

		</form>
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
  

$(function() {
	
	var cnt = 0;
	
	initLayout();
	
	createGrid1();
	createGrid2();
	createGrid3();

	$('#cBtnAdd').text("New");
		
 	$('#MAIL_CD').on('change', function (e) {
		if ( $("#MAIL_CD").val() != '' ) {
			var orgText = $("#MAIL_CD option:selected").text();			
			var orginTxt = orgText.split('] ');
	 		
			$('#MAIL_NM').val(orginTxt[1]);
			
			titleSearch();
			recipientSearch();
		} else {
			$('#MAIL_NM').val('');			
		}
	});
 	
 	$('#item_btnPfAdd').click(function() {
		if('' != $('#MAIL_CD').val()){
			$("#isStatus").val("U");
			var data = {"ROW_STATUS" : "I"};
			btGrid.gridAddRow("grid3", "last", data);				
		}
	}); 	

 	$('#item_btnPfDel').click(function() {
 		setHideRow('grid3');
	});
 	
 	$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
		grid1_onCilckRow(e, rowid, status);
	});
 	
 	$('#btnPreview').click(function() {
 		mailPreview();
 	});
 	
 	cSearch();
});

function createGrid1() {
	var colName = [
	              '<s:message code="mail.grd.Mailcd"/>'
	            , '<s:message code="mail.grd.Lang"/>'
                , '<s:message code="mail.grd.MailType"/>'
                , '<s:message code="mail.grd.Langauge"/>'
                , '<s:message code="mail.grd.Use"/>'
                  ];
   
    var colModel = [
                   {name:'MAIL_CD',width:80, hidden:true}
                 , {name:'MAIL_LANG',width:30, hidden:true}                   
                 , {name:'MAIL_CD_NM',width:80}
                 , {name:'LANGUAGE',width:30, align: 'center' }
                 , {name:'STATUS', width:20, align: 'center' }
                 ];
   
	 var gSetting = {
			 pgflg:true,
			 exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			 colsetting : true,  // 컬럼 설정 버튼 노출여부
			 searchInit : false,  // 데이터 검색 버튼 노출여부
			 resizeing : true,
			 rownumbers:false,
			 shrinkToFit: true,
			 autowidth: true,
			 queryPagingGrid:true, // 쿼리 페이징 처리 여부
			 height:664
	};
	
    btGrid.createGrid('grid1', colName, colModel, gSetting);
}


function createGrid2() {
	var colName = [
                  '<s:message code="mail.grd.Seq"/>'
                , '<s:message code="mail.grd.Type"/>'
                , '<s:message code="mail.grd.TitleText"/>'
                , '<s:message code="mail.grd.Use"/>'
                , '<s:message code="mail.grd.Priority"/>'
    ];
   
    var colModel = [
                   {name:'SEQ',hidden:true}
                 , {name:'TITLE_TYPE', width:120, align:'left', editable:true, edittype:'select', formatter : 'select'
                	                 , editoptions: {value:'${TITLE_TYPE}', dataEvents: [{ type: 'change', fn: function(e) { setRowStatus('grid2'); }}] // btGrid.gridSaveRow('grid2');}}]           	 
                   }}                 
                 , {name:'TITLE_TEXT', width:450, align:'left', editable:true
                	 			     , editoptions:{maxlength:'50', dataEvents:[{ type:"change",fn:function(e){ setRowStatus('grid2'); }}] // btGrid.gridSaveRow('grid2');}}]      
                   }}
                 , {name:'USE_YN', width: 80, align:'center', editable:true, edittype:'select', formatter : 'select'
                	             , editoptions:{value:'Y:Y;N:N', dataEvents: [{ type: 'change', fn: function(e) { setRowStatus('grid2'); }}] // btGrid.gridSaveRow('grid2');}}]                   	 
			       }}
                 , {name:'PRIORITY', width: 70, align:'center', editable:true 
                	               , editoptions:{maxlength:'2', dataEvents:[{ type:"change",fn:function(e){ setRowStatus('grid2'); }}] // btGrid.gridSaveRow('grid2');}}]      
                   }}
    ];
   
	var gSetting = {
			 pgflg:true,
			 exportflg : false,  //엑셀, pdf 출력 버튼 노출여부
			 colsetting : false,  // 컬럼 설정 버튼 노출여부
			 searchInit : false,  // 데이터 검색 버튼 노출여부
			 resizeing : true,
			 rownumbers:false,
			 shrinkToFit: false,
			 autowidth: true,
			 queryPagingGrid:false, // 쿼리 페이징 처리 여부
			 height:133
	};
	
    btGrid.createGrid('grid2', colName, colModel, gSetting);
}

function createGrid3() {
	var colName = [
                  '<s:message code="mail.grd.Seq"/>'
			    , '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid3\')" />'
                , '<s:message code="mail.grd.Type"/>'
                , '<s:message code="mail.grd.SRType"/>'
                , '<s:message code="mail.grd.SRName"/>'
                , '<s:message code="mail.grd.E_MailAddr"/>'
                , '<s:message code="mail.grd.Use"/>'
				, 'ROW_STATUS'
                  ];
   
    var colModel = [
                   {name:'SEQ',width:80,hidden:true}
				 , { name: 'CHK', width : 20, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
                 , {name:'RCPNT_TYPE', width:80, align:'left', editable:true, edittype:'select', formatter : 'select'
                	                 , editoptions: {value:'${RCPNT_TYPE}', dataEvents:[{ type:"change",fn:function(e){ setRowStatus('grid3'); }}] // btGrid.gridSaveRow('grid3');}}]
                   }}     
                 , {name:'RECEIVER_TYPE', width:100, align:'left', editable:true, edittype:'select', formatter : 'select'
                	 , editoptions: {value:'${RECEIVER_TYPE}'
                     			, dataEvents: [{ type: 'change'
                     				, fn: function(e) {
                     					var selRow = $('#grid3').jqGrid('getGridParam', 'selrow');
                     					if ( this.value == '004') $("#grid3").jqGrid('setCell', selRow, 'E_MAIL', 'Sales.Coordination@q-cells.com');
            							else $("#grid3").jqGrid('setCell', selRow, 'E_MAIL', '');
                     					setRowStatus('grid3'); //btGrid.gridSaveRow('grid3');
            						}
                     			}]
                	 }
                   }     
                 , {name:'RECV_NM', width: 100, align: 'left', editable:true 
                	               , editoptions:{maxlength:'50', dataEvents:[{ type:"change",fn:function(e){ setRowStatus('grid3'); }}] // btGrid.gridSaveRow('grid3');}}]
                   }}
                 , {name:'E_MAIL', width: 200, align: 'left', editable:true 
                	               , editoptions:{maxlength:'150', dataEvents:[{ type:"change",fn:function(e){ setRowStatus('grid3'); }}] // btGrid.gridSaveRow('grid3');}}]
                   }}
                 , {name:'USE_YN', width: 50, align:'center', editable:true, edittype:'select', formatter : 'select'
                	             , editoptions:{value:'Y:Y;N:N', dataEvents:[{ type:"change",fn:function(e){ setRowStatus('grid3'); }}] // btGrid.gridSaveRow('grid3');}}]
                   }}
     			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
                 ];
   
	 var gSetting = {
			 pgflg:true,
			 exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			 colsetting : true,  // 컬럼 설정 버튼 노출여부
			 searchInit : false,  // 데이터 검색 버튼 노출여부
			 resizeing : true,
			 rownumbers:false,
			 shrinkToFit: true,
			 autowidth: true,
			 queryPagingGrid:true, // 쿼리 페이징 처리 여부
			 height:205
			 };
	
    btGrid.createGrid('grid3', colName, colModel, gSetting);
}

function initLayout(){
	
	//Util.validator.applyCurrency(currencyElms);
	
	var codeBoxArray = [  'MAIL_CD'
						, 'MAIL_LANG'
						, 'USED_OR_NOT'
					   ];
			
	createCodeBoxByEdit(codeBoxArray, true);
	
	$("#MAIL_LANG").val(getCookie("Language"));
	
	$("#isStatus").val("M");	

	titleSearch();
	recipientSearch();
}

function cAdd() {
	$("#frmMail")[0].reset();
	titleSearch();
	recipientSearch();
	$("#isStatus").val("C");
}

function cSave() {
// 	if(!fn_inputCheckByPrefix('frmMail', '')){
// 		return;
// 	}
	
	if(confirm("<s:message code='confirm.save'/>")){

		var recipientGrid = setRecipientData(); // $('#grid3').getRowData();
		var mailData = formIdAllToMap('frmMail');
		var titleGrid = $('#grid2').getRowData();
		var mailBody = {"BODY_CONTENTS" : $('#BODY_CONTENTS').val()};
		
		if ( cnt > 1 ) {
			alert("<s:message code='error.chooseSender'/>");
			return;
		}
		
		
		var param = {"param" : {
								  "mailData" : mailData
								, "titleGrid" : titleGrid
								, "recipientGrid" : recipientGrid
								, "mailBody" : mailBody
								}
					};
		//console.log(param);
		var url = '/common/saveMailContents.do';
		
		fn_ajax(url, false, param, function(data, xhr){
			alert("<s:message code='info.save'/>");
			
			cSearch();
		});
		
	}
}

function grid1_onCilckRow(e, rowid, status){
	if(fn_empty(rowid)){
		rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
	}

	var rowData = $("#grid1").getRowData(rowid);
	var url = "/common/selectMailContents.do";

	var param = {"param":rowData};
	
	console.log(param);
	
	fn_ajax(url, false, param, function(data, xhr){
		
		//초기화
		$("#frmMail")[0].reset();
		
		if(data.selectMailBody != null){			
			//bind
			fn_dataBindByPrefix('frmMail', '', data.selectMailBody);			
			$("#isStatus").val("U");
			
			reloadGrid("grid2", data.selectMailTitle);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#grid2'), 'cSearch', data.selectMailTitle);  // 그리드 페이징 설정
			
			reloadGrid("grid3", data.selectMailRecipient);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#grid3'), 'cSearch', data.selectMailRecipient);  // 그리드 페이징 설정
		}else{
			alert('<s:message code="info.nodata.msg"/>');
		}
		
	});
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
	
	var url = '/common/searchMailContents.do';
	
	var formData = formIdAllToMap('frmSearch');
	var param = {"param":formData};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid1", data.result);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
	});
}

function titleSearch() {
	var url = '/common/searchMailTitle.do';
	var param = { 
				'MAIL_CD': $("#MAIL_CD").val()
			  , 'MAIL_LANG': $("#MAIL_LANG").val()
				};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid2", data.result);
	});
}

function recipientSearch(currentPage) {
	var vCurrentPage = 1;
	var vRowsPerPage;
	if(!fn_empty(currentPage)){
		vCurrentPage = currentPage;
	} else if(!fn_empty($('#GRID3_CURRENT_PAGE').val())) {
		vCurrentPage = $('#GRID3_CURRENT_PAGE').val();
	} else {
		vCurrentPage = 1;
	}
	vRowsPerPage = btGrid.getGridRowSel('grid3_pager');
	$('#GRID3_CURRENT_PAGE').val(vCurrentPage);
	$('#GRID3_ROWS_PER_PAGE').val(vRowsPerPage);
	
	var url = '/common/searchMailRecipient.do';
	var param = { 
				'MAIL_CD': $("#MAIL_CD").val()
			  , 'MAIL_LANG': $("#MAIL_LANG").val()
				};
	
	fn_ajax(url, false, param, function(data, xhr){
		reloadGrid("grid3", data.result);
	});
}

function mailPreview() {
	
	if ( $("#MAIL_CD").val() != '' &&  $("#MAIL_LANG").val() != '' ) {
		var url = "/popup/mailPreview.do";
		var pid = "MailPreviewPopup";
		var param = { 
				'MAIL_CD': $("#MAIL_CD").val()
			  , 'MAIL_LANG': $("#MAIL_LANG").val()
			  , 'BTN_YN': 'N'
				};
		param.window = window;

		popupOpen(url, pid, param, function(e, selectedData) {
			//console.log('selectedData::'+selectedData);		
		});	
	}
	
}

function setRecipientData(){
	saveAllGrid();
	var ids = $("#grid3").jqGrid("getDataIDs");
	var gridData = [];
	cnt = 0;
	
	for(var i = 0; i < ids.length; i++){
		var rowData = $("#grid3").getRowData(ids[i]);
		var auth = "";
		
		if($('#grid3_' + ids[i] + '_CHK').prop('checked')){
			auth += "Y";
		}else{
			auth += "N";
		}
		
		if (rowData["RCPNT_TYPE"] == '001' ) cnt++
		
		var data = {
				  "SEQ" :  rowData["SEQ"]
				, "CHK" : auth
				, "RCPNT_TYPE" : rowData["RCPNT_TYPE"]
				, "RECEIVER_TYPE" : rowData["RECEIVER_TYPE"]
				, "RECV_NM" : rowData["RECV_NM"]
				, "E_MAIL" : rowData["E_MAIL"]
				, "USE_YN" : rowData["USE_YN"]
				, "ROW_STATUS" : ('N' == auth) ? rowData["ROW_STATUS"] : 'D'
				}

		if ( rowData["ROW_STATUS"] == 'U' || rowData["ROW_STATUS"] == 'D' ) 			
			$("#isStatus").val("U");
		
		gridData.push(data);
	}
	
	return gridData;
}

function saveAllGrid(){
	btGrid.gridSaveRow('grid2');
	btGrid.gridSaveRow('grid3');
}

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

function setHideRow(tId){
	var ids = $('#' + tId).jqGrid('getDataIDs');
	for (var i = 0, len = ids.length; i < len; i++) {
		if($('#' + tId + '_' + ids[i] + '_CHK').prop('checked')){
			$('#' + tId).jqGrid('setCell', ids[i], 'ROW_STATUS', 'D')
			var rowIdx = $('#' + tId).getInd(ids[i]);
			$('#' + tId).find('tbody tr:eq(' + rowIdx + ')').hide();
		}
	}
	btGrid.gridSaveRow(tId);
}

</script> 

<c:import url="../import/frameBottom.jsp" />