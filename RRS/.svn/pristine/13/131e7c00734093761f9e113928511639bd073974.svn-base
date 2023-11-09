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
   	<c:param name="progcd" value="DeptManager" />
</c:import>
<div style="padding-top:12px;"></div>
<hr>
<div id="ctd_wrap">
	<div class="ctu_gl_wrap ctu_resize" style="width:calc(35% - 10px); height:calc(50%); padding-top:-95px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='system.departmentlist'/></h4>
			</div>
		</div>		
		<div style="width:100%;height:300px;overflow:hidden; background-color:white; margin-top:-1px; border-top:1px solid #ddd;">
			<div id="zDeptTreeView" class="ztreeTreeView" style="padding:5px 0px 5px 0px; width:99.6%; height:279px; overflow-x:hidden; border-bottom:1px solid #ddd; border-left:1px solid #ddd; border-right:1px solid #ddd;"></div> <!-- 트리부분 -->
		</div>
	</div>
	<div class="ctu_gr_wrap ctu_resize" style="width:calc(65% - 10px); height:calc(50%); padding-top:0px;">
		<form id="frmDetail" action="#">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='system.detailinfo'/></h4>
			</div>
		</div>		
				<table class="tblForm">
					<colgroup>
						<col width="130px" />
				        <col />
				    </colgroup>
					<tr>
						<input type="hidden" name="COMP_CD" value="1000" />
						<input type="hidden" name="ISNEW" value="1" />
						<th width="170"><span>*</span><s:message code='system.departmentcode'/></th>
						<td><input type="text" name="DEPT_CD" id="DEPT_CD" class="cmc_txt" class="cmc_txt disabled" disabled="" readonly="readonly"  maxlength="10" ess="ess" style="width:calc(50% - 50px);" /></td>
					</tr>
					<tr>
						<th><span>*</span><s:message code='system.departmentname'/></th>
						<td><input type="text" name="DEPT_NM" id="DEPT_NM" class="cmc_txt" maxlength="40" ess="ess" style="width:calc(50% - 50px);"/></td>
					</tr>
					<tr>
						<th><s:message code='system.depteng'/></th>
						<td><input type="text" name="DEPT_EN" id="DEPT_EN" class="cmc_txt" maxlength="40" style="width:calc(50% - 50px);"/></td>
					</tr>
					<tr>
						<th><s:message code='system.deptfr'/></th>
						<td><input type="text" name="DEPT_FR" id="DEPT_FR" class="cmc_txt" maxlength="40" style="width:calc(50% - 50px);"/></td>
					</tr>
					<tr>
						<th><s:message code='system.upperdepartmentcode'/></th>
						<td><input type="text" name="UPPER_CD" id="UPPER_CD" class="cmc_txt disabled"  disabled="" readonly="readonly"  ess="ess" style="width:calc(50% - 50px); float:left; margin-right:2px;"/>		
						<button class="grid_popupbtn"' id='btn_department' type='button' onclick='deptPopup();'></button>
						</td>
					</tr>
					<tr>
						<th><s:message code='system.upperdepartmentname'/></th>
						<td><input type="text" name="UPPER_NM" id="UPPER_NM" class="cmc_txt disabled" disabled="" readonly="readonly"  style="width:calc(50% - 50px);"/></td>
					</tr>
					<tr>
						<th><s:message code='system.departmenttype'/></th>
						<td>
							<select id="DEPT_TP" name="DEPT_TP" class="cmc_combo" ess="ess" style="width:calc(50% - 45px);">
							</select>
						</td>
					</tr>
					<tr>
						<th><s:message code='system.deptmgr'/></th>
						<td><input type="text" name="DEPT_MGR" id="DEPT_MGR" class="cmc_txt disabled"  disabled="" readonly="readonly" style="width:calc(25% - 68px); float:left; margin-right:2px;"/>	
						<p style="float:left;margin-left:3px; margin-right:4px;">/</p>
						<input type="text" name="DEPT_MGR_NM" id="DEPT_MGR_NM" class="cmc_txt disabled"  disabled="" readonly="readonly" style="width:calc(25%); float:left; margin-right:2px;"/>		
						<button class="grid_popupbtn"' id='btn_manager' type='button' onclick='managerPopup();'></button>
						</td>
					</tr>
					<tr>
						<th><s:message code='system.effectiveperiod'/></th>
						<td>
							<input id="START_DT" name="START_DT" style="width:calc(25% - 44px); float:left;" data-type="date" disabled="" readonly><p style="float:left;margin-left:3px; margin-right:4px;">~</p>
							<input id="STOP_DT" name="STOP_DT" style="width:calc(25% - 44px); float:left;" data-type="date" disabled="" readonly>
						</td>
					</tr>
					<tr>
						<th><s:message code='system.usedornot'/></th>
						<td>
							<select id="USED_OR_NOT" name="USED_OR_NOT" class="cmc_combo" ess="ess" style="width:calc(50% - 45px);">
							</select>
						</td>
					</tr>
				</table>
		</form>
	</div>
	<div id="ctd_dg_wrap" style="margin-bottom:40px">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.userlist'/></h4>
			</div>		
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
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
  
//init
var u_deptcd; //신규부서 등록 시 상위부서코드로 가져옴.
var u_deptnm;
$(function() {
   initLayout();
   createGrid1();
   
	//dynamic select box create function
	createCodeBox('DEPT_TP',false);
	createCodeBox('USED_OR_NOT',false);
	
  	 //demartment search
 	 cSearch();
  	 
});

function createGrid1() {
   var colName = ['<s:message code='system.compcd'/>',
                  '<s:message code='system.UserID'/>',
                  '<s:message code='system.name'/>',
                  '<s:message code='system.secondname'/>',
                  '<s:message code='system.fullname'/>',
                  '<s:message code='system.department'/>',
                  '<s:message code='system.email'/>',
                  '<s:message code='common.status'/>'
];
   var colModel = [
      {name:'COMP_CD',index:'COMP_CD',width:80,hidden:true},
      {name:'USER_ID',index:'USER_ID',width:80},
      {name:'NAME_1ST', width: 100, align: 'left' },
	  {name:'NAME_2ND', width: 100, align: 'left' },
	  {name:'NAME_FULL', width: 150, align: 'left' },
	  {name:'DEPT_NM',index:'DEPT_NM', width:150,align:'left'},
      {name:'E_MAIL',index:'E_MAIL',width:150},
	  {name:'STATUS',index:'STATUS', width: 70, align: 'center'}
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
			height:368
	};
	
   btGrid.createGrid('grid1', colName, colModel, gSetting);
}
	
function cAdd() {
	
	$('[name="ISNEW"]').val('0');
	$('[name="DEPT_CD"]').val('');  
	$('[name="DEPT_NM"]').val('');  
	$('[name="DEPT_EN"]').val('');  
	$('[name="DEPT_FR"]').val('');  
	$('[name="UPPER_CD"]').val(u_deptcd);  
	$('[name="UPPER_NM"]').val(u_deptnm);  
	$('[name="SAP_CD"]').val('');  
	$('[name="USED_OR_NOT"]').val('Y');  
	$('[name="DEPT_MGR"]').val('');  
	$('[name="DEPT_MGR_NM"]').val('');  
	
	$('#START_DT').val($.datepicker.formatDate('dd.mm.yy', new Date()));
	$('[name="DEPT_CD"]').attr("disabled",false).attr("readonly",false);
	$('[name="DEPT_NM"]').attr("disabled",false).attr("readonly",false);
	clearGrid("grid1");
}

function cSave() {
	//필수입력 체크

	if (fn_inputCheck('frmDetail') == false) return;
	
	if (confirm("<s:message code='confirm.save'/>")) {
		var formdata = formIdAllToMap('frmDetail');
		
		var url = '/common/saveDeptInfo.do';
		var param = {'paramData':formdata};

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

function cSearch() { 
	$('[name="ISNEW"]').val('1');
	gv_searchData = formIdToMap('frmSearch');

	var setting = {
		    view: {
		        showLine: false,
		        selectedMulti: false,
		        dblClickExpand: false
		    },
		    data: {
		        simpleData: {
		            enable: true
		        }
		    }
		};
	
	var url = '/common/getDeptList.do';
	var param = {};
	
	fn_ajax(url, false, param, function(data, xhr){
		var result = data.result;
		var zNodes = treeModel( result, 'root');
		$.fn.zTree.init($("#zDeptTreeView"), setting, result);
		//$("#zDeptTreeView_"+[1]+"_a").addClass('level0 curSelectedNode');
		$("#zDeptTreeView_"+[1]+"_a").click();
	});
}

//부서상세 조회
function detailSearch(deptcd){
	var url = '/common/getDeptDetail.do';
	var param = {'DEPT_CD':deptcd};
	$('[name="DEPT_CD"]').val('');  
	$('[name="DEPT_NM"]').val('');  
	$('[name="DEPT_EN"]').val('');  
	$('[name="DEPT_FR"]').val('');  
	$('[name="UPPER_CD"]').val('');  
	$('[name="UPPER_NM"]').val('');  
	$('[name="SAP_CD"]').val('');  
	$('[name="USED_OR_NOT"]').val('Y');
	$('[name="DEPT_MGR"]').val('');
	$('[name="DEPT_MGR_NM"]').val('');
	
	$('[name="ISNEW"]').val('1');
	fn_ajax(url, false, param, function(data, xhr){
				
		fn_dataBind('frmDetail', data.resultDeptDetail);
		u_deptcd =  data.resultDeptDetail.DEPT_CD;
		u_deptnm =  data.resultDeptDetail.DEPT_NM;
		 
	});
}
//부서별 사용자 조회
function userSearch(deptcd){

	var url = '/common/getDeptUser.do';
	var sendData = {'DEPT_CD':deptcd};
	
	fn_ajax(url, false, sendData, function(data, xhr){
		
		reloadGrid("grid1", data.resultUserList);
		btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.resultUserList);
		
		for(i=0;i< data.resultUserList.length;i++){
			if(!fn_empty(data.resultUserList[i].DEPT_MGR)){
				$('#grid1').jqGrid('setCell',i + 1,"USER_ID","",{'color':'blue','font-weight':'bold'});
				$('#grid1').jqGrid('setCell',i + 1,"NAME_1ST","",{'color':'blue','font-weight':'bold'});
				$('#grid1').jqGrid('setCell',i + 1,"NAME_2ND","",{'color':'blue','font-weight':'bold'});
				$('#grid1').jqGrid('setCell',i + 1,"NAME_FULL","",{'color':'blue','font-weight':'bold'});
				$('#grid1').jqGrid('setCell',i + 1,"DEPT_NM","",{'color':'blue','font-weight':'bold'});
				$('#grid1').jqGrid('setCell',i + 1,"E_MAIL","",{'color':'blue','font-weight':'bold'});
				$('#grid1').jqGrid('setCell',i + 1,"STATUS","",{'color':'blue','font-weight':'bold'});
			}
		}
	});
	
}
function deptPopup(){

	var url = "/common/DeptPopup.do";
	var pid = "deptPopup"
	var param = {"S_DEPT_CD" : $("#UPPER_CD").val() };
	
	popupOpen(url, pid, param, function(data){
		if(!fn_empty(data)){
			$('#UPPER_CD').val(data[0].DEPT_CD);
			$('#UPPER_NM').val(data[0].DEPT_NM);			
		}
	});
}

function managerPopup(){

	var url = "/popup/UserPopup2.do";
	var pid = "UserPopup2"
	var param = { "S_CODE" : $('#DEPT_MGR_NM').val()};
	
	popupOpen(url, pid, param, function(data){
		if(!fn_empty(data)){
			$('#DEPT_MGR').val(data[0].USER_ID);
			$('#DEPT_MGR_NM').val(data[0].NAME_FULL);			
		}
	});
}
</script> 

<c:import url="../import/frameBottom.jsp" />