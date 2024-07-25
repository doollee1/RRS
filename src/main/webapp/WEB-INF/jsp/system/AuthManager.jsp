<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : AuthManager
	 * @Description : Auth Manager (권한 관리 화면)
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SY03" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize"></div>
<!-- 검색조건 영역 끝 -->

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><s:message code='system.usedornot'/></td>
						<td  class="medium_td">
							<select id="USED_OR_NOT" name="USED_OR_NOT" class="" data-dbcolumn="USED_OR_NOT"></select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	<!-- 검색조건 영역 끝 -->
	<div class="ct_grid_top_wrap">
		<div class="ct_grid_top_left">
			<h4><s:message code='title.authorizationlist'/></h4>
		</div>
	</div>

	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
	<!-- 그리드 끝 -->
	<p>&nbsp;</p>
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
	/********************************************
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	var args;
	$(function() {
		initLayout();
		createGrid1();
		createCodeBox('USED_OR_NOT',true);

		$('#grid1').jqGrid('setGridParam', {
			onCellSelect: function (rowid, index, content, event) {
				var rowData = $(this).jqGrid("getGridParam", 'colModel');
				var status  = $(this).jqGrid('getCell', rowid, 'ROW_STATUS');

				if ( status == 'I' ) {
					$(this).jqGrid('setColProp', "POLICY_CD",{editable:true});
				} else {
					$(this).jqGrid('setColProp', "POLICY_CD",{editable:false});
				}
			}
		});
		cSearch();
	});

	/********************************************
	 * @Subject : 권한 목록 그리드 설정
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function createGrid1(){
		var colName = [ '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'grid1\')" /> ',
						'<s:message code='system.compcd'/>',
						'<s:message code='system.authorizationcode'/>',
						'<s:message code='system.authorizationname'/>',
						'<s:message code='system.authorizationdescription'/>',
						'<s:message code='system.usedornot'/>',
						'ROW_STATUS'
					  ];
		var colModel = [
			{name : 'CHK',        index : 'CHK', width : 10, align : 'center', formatter : gridCboxFormat, sortable: false},
			{ name: 'COMP_CD',    width: 100, align: 'center', hidden: true },
			{ name: 'POLICY_CD',  width: 120, align: 'left',   editable: false ,editoptions: {maxlength:10}},
			{ name: 'POLICY_NM',  width: 180, editable: true , editoptions: {maxlength:50}},
			{ name: 'POLICY_DSC', width: 180, editable: true , editoptions: {maxlength:2000}},
			{ name: 'STATUS',     width: 70,  align: 'center', editable: true, edittype:"select", formatter : "select", editoptions:{value:'${griduseyn}'}},
			{ name: 'ROW_STATUS', width: 10,  align: 'center', hidden: true }
		];
		var gSetting = {
				pgflg:           true,
				exportflg :      false,  //엑셀, pdf 출력 버튼 노출여부
				colsetting :     true,
				searchInit :     false,
				resizeing :      true,
				rownumbers:      false,
				shrinkToFit:     true,
				autowidth:       true,
				queryPagingGrid: true,  // 쿼리 페이징 처리 여부
				height: 632
		};

		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}

	/********************************************
	 * @Subject : 추가 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function cAdd(){
		var addData = {"COMP_CD" : "1000", "ROW_STATUS" : "I"};
		btGrid.gridAddRow("grid1", "last",addData);
	}

	/********************************************
	 * @Subject : 검색 버튼 설정
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
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

		var url = "/system/selectAuthInfo.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};

		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
		});
	}

	/********************************************
	 * @Subject : 저장 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function cSave(){
		var ids      = $("#grid1").jqGrid("getDataIDs");
		var gridData = [];
		var cnt      = 0;
		btGrid.gridSaveRow('grid1');
		for(var i = 0; i < ids.length; i++){
			if($('#grid1_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid1").getRowData(ids[i]));
			}
		}

		if(cnt < 1){
			args = '<s:message code="system.authorizationcode"/>';
			alert("<s:message code='errors.saveNull' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}

		for(var i = 0; i < gridData.length; i++){
			if(fn_empty(gridData[i]["POLICY_CD"])){
				args = '<s:message code="system.authorizationcode"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}

			if(fn_empty(gridData[i]["POLICY_NM"])){
				args = '<s:message code="system.authorizationname"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
		}

		if(confirm("<s:message code='confirm.save'/>")){
			var formData = formIdAllToMap('frmSearch');
			var url      = '/system/saveAuthInfo.do';
			var param    = {"param" : formData,"gridData" : gridData};
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

	/********************************************
	 * @Subject : 삭제 버튼 클릭
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function cDel(){
		var ids      = $("#grid1").jqGrid("getDataIDs");
		var gridData = [];
		var cnt      = 0;
		btGrid.gridSaveRow('grid1');
		for(var i = 0; i < ids.length; i++){
			if($('#grid1_' + ids[i] + '_CHK').prop('checked')){
				cnt++;
				gridData.push($("#grid1").getRowData(ids[i]));
			}
		}

		if(cnt < 1){
			alert("삭제할 데이타를 선택하십시오.");
			return;
		}

		if(confirm("삭제하시겠습니까?")){
			var url = '/system/deleteAuthInfo.do';
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("삭제하였습니다.");
				cSearch();
			});
		}
	}

	/********************************************
	 * @Subject : 그리드 헤더 체크박스 선택
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
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

	/********************************************
	 * @Subject : 그리드 헤더 체크박스 클릭 이벤트
	 * @Content :
	 * @Since   : 2024.07.11
	 * @Author  :
	 ********************************************/
	function grid_cbox_onclick(gid, rowid, colkey) {
	}
</script>

<c:import url="../import/frameBottom.jsp" />