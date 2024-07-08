<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : User
	 * 회원정보
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
						<td class="small_td"><p>회원구분</p></td>
						<td class="medium_td">
							<select id="S_MEM_GBN" name="S_MEM_GBN" class="cmc_combo" style="width:80px;">
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
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.userlist'/></h4>
			</div>	
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="grid1" class="user_info_table"></table>
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
		// setCommBtn("User6", false);	// hide bookmark button
		$('#cBtnUser1').text("멤버정보등록");
		$('#cBtnUser1').addClass("cBtnUser1_style");
		
		initLayout();
		createGrid1();
		//cSearch();
		
		
		
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
		var colName = [
			'순번',
			'회원구분',
			'이름',
			'영문이름',
			'전화번호',
			'ID',
			'Email',
			'개인정보 동의 여부',
			'선택'
		]
		var colModel = [
			{ name: 'ROWNUM', width: 50, align: 'center' },
			{ name: 'MEM_NM', width: 100, align: 'center' },
			{ name: 'HAN_NAME', width: 100, align: 'center' },
			{ name: 'ENG_NAME', width: 100, align: 'center' },
			{ name: 'TEL_NO', width: 100, align: 'center' },
			{ name: 'USER_ID', width: 100, align: 'center' },
			{ name: 'EMAIL', width: 120, align: 'center' },
			{ name: 'PERINFO_AGREE_YN', width: 100, align: 'center' },
			{ name: 'CHK', index: 'CHK', width: 50, align: 'center', formatter: gridCboxFormat, sortable: false }
		]
		
		var gSetting = {
				height:632,
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
		var param = {
			"USER_ID" : gridData["USER_ID"],
		};
		userPopup(param);
	}
	
	function setTelNoHypen() {
		var rowDataList = $("#grid1").getRowData();
		for(var i=0; i<rowDataList.length; i++) {
			var convert_TEL_NO = rowDataList[i].TEL_NO.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
			$("#grid1").jqGrid('setCell', i+1, 'TEL_NO', convert_TEL_NO);
		}
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
	function cUser1(param) {
		var url = "/rrs/MemberUserPopup.do";
		var pid = "p_MemberUser";  //팝업 페이지의 취상위 div ID

		popupOpen(url, pid, param, function(data) {
			$( 'input' ).remove('#SEARCH_MEMBER_ID');
			cSearch();
		});
	}
	
	function cDel(){
		var ids = $("#grid1").jqGrid("getDataIDs");
		var gridData = [];
		var cnt = 0;
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
			var url = '/rrs/deleteUserInfo.do';
			var param = {"gridData" : gridData};
			fn_ajax(url, false, param, function(data, xhr){
				alert("삭제하였습니다.");
				cSearch();
			});
		}
	}
	
	//grid checkbox event
	function grid_cbox_onclick(gid, rowid, colkey) {
		
	}
</script>

<c:import url="../import/frameBottom.jsp" />