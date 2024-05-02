<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Manager
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="HO02" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>
	
<div id="ctm_wrap">
	<!-- Search condition start -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<!------------->
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
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
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.userlist'/></h4>
			</div>	
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
	<!-- grid end -->
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
  	$(document).on("keyup", "input[noSpecial]", function() {$(this).val( $(this).val().replace(/[^ㄱ-힣a-zA-Z0-9]/gi,"") );});
  
	//init
	$(function() {
		$('#cBtnAdd').text("<s:message code='notice.btn.new'/>");
		$('#cBtnAdd').addClass("cls");
		$('#cBtnAdd').addClass("cBtnWrite_style");
		
		initLayout();
		createGrid1();
		cSearch();
		
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
	});

	function createGrid1(){
		var colName = ['<s:message code='system.UserID'/>',
					'<s:message code='system.fullname'/>',
					'텔리그램ID',
					'텔리그램토큰',
					'<s:message code='system.compcd'/>']
		var colModel = [
			{ name: 'USER_ID', width: 80, align: 'center' },
			{ name: 'NAME_1ST', width: 80, align: 'center' },
			{ name: 'CHAT_ID', width: 80, align: 'center'},
			{ name: 'TELEGRAM_TOKEN', width: 160, align: 'center'},
			{ name: 'COMP_CD', width: 100, align: 'center', hidden: true },
	  	];
		
		var gSetting = {
				height:632,
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
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
		
		var url = "/common/selectUserInfo.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
		});
	}
	
	function grid1_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#grid1").getRowData(rowid);
		var param = {
			"COMP_CD" : gridData["COMP_CD"],
			"USER_ID" : gridData["USER_ID"],
			"USER_TP" : gridData["USER_TP"],
			"CRE_TP" : gridData["CRE_TP"],
			"AUTH" :auth
		};
		userPopup(param);
	}
	
	function cAdd(){
		userPopup();
	}
	
	function userPopup(param){
		var url = "/common/UserInfoPopup.do";
		var pid = "p_UserInfo";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid, param, function(data) {
			cSearch();
		});
	}
</script>

<c:import url="../import/frameBottom.jsp" />