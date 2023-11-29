<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : User
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="HO01" />
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
						<td class="medium_td"><input type="text" id="S_USER_ID" name="S_USER_ID" class="cmc_txt" /></td>
						<td class="small_td"><p><s:message code='system.Username'/></p></td>
						<td class="medium_td"><input type="text" id="S_USER_NM" name="S_USER_NM" class="cmc_txt" /></td>
						<td class="small_td"><p><s:message code='system.department'/></p></td>
						<td><input type="text" id="DEPT_CD" name="DEPT_CD" class="cmc_txt" disabled="" readonly="readonly"/ style="float:left;">
						<button class='grid_popupbtn' id='btn_department' type='button'></button>
						<p name="DEPT_NM" id="DEPT_NM"></p></td>
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
	//init
	$(function() {
		setCommBtn("User6", false);	// hide bookmark button
		$('#cBtnUser1').text("멤버정보등록");
		$('#cBtnUser1').addClass("cBtnUser1_style");
		
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
		
		$('#DEPT_CD').on('keyup', function (e) {
			if (e.which  == 8 || e.which  == 46){
				if(fn_empty($("#DEPT_CD").val())){
					$("#DEPT_NM").text("");
				}
			}
		});
		$("#btn_department").click(function(e){

			var url = "/common/DeptPopup.do";
			var pid = "deptPopup"
			var param = {"S_DEPT_CD" : $("#DEPT_CD").val()};
			
			popupOpen(url, pid, param, function(data){
				if(!fn_empty(data)){
					$("#DEPT_CD").val(data[0].DEPT_CD);
					$("#DEPT_NM").text(data[0].DEPT_NM);
				}
			});
		})
		
	});

	function createGrid1(){
		var colName = [
			'순번',
			'회원타입',
			'이름',
			'영문이름',
			'전화번호',
			'ID',
			'Email',
			''
		]
		var colModel = [
			{ name: 'ROWNUM', width: 100, align: 'center' },
			{ name: 'MEM_GBN', width: 100, align: 'center' },
			{ name: 'HAN_NAME', width: 100, align: 'center' },
			{ name: 'ENG_NAME', width: 100, align: 'center' },
			{ name: 'TEL_NO', width: 100, align: 'center' },
			{ name: 'USER_ID', width: 100, align: 'center' },
			{ name: 'EMAIL', width: 100, align: 'center' },
			{ name: 'CHK', index: 'CHK', width: 50, align: 'center', formatter: gridCboxFormat, sortable: false }
		]
		
		var gSetting = {
				height:632,
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
	}
	
	function grid1_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#grid1").getRowData(rowid);
		var param = {
			"USER_ID" : gridData["USER_ID"],
		};
		userPopup(param);
	}
	
	function cAdd() {
		userPopup();
	}
	
	function userPopup(param) {
		var url = "/rrs/UserPopup.do";
		var pid = "p_User";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid, param, function(data) {
			cSearch();
		});
	}
	
	// 멤버정보등록 버튼
	function cUser1() {
		var url = "/rrs/MemberUserPopup.do";
		var pid = "p_MemberUser";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid);
	}
</script>

<c:import url="../import/frameBottom.jsp" />