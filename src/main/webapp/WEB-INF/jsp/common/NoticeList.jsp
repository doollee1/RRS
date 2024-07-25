<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : NoticeList
	 */
%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="BB01" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctm_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#" >
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<!------------->
		<div class="tab_top_search">
			<table>
				<tbody>
					<tr>
						<td class="small_td"><p><s:message code="notice.title"/></p></td>
						<td class="medium_td"><p><input type="text" id="S_TITLE" name="S_TITLE" class="cmc_txt"/></p></td>
						<td class="small_td"><p><s:message code="notice.content"/></p></td>
						<td class="medium_td"><p><input type="text" id="S_CONTENT" name="S_CONTENT" class="cmc_txt" /></p></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-------------->
	</form>
	<!-- 검색조건 영역 끝 -->

	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code="notice.subject"/></h4>
			</div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="grid1"></table>
		<div id="grid1_pager"></div>
	</div>
	<!-- 그리드 끝 -->
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
	$(function() {
		$('#cBtnUser1').text("<s:message code='notice.btn.new'/>");
		$('#cBtnUser1').addClass("cls");
		$('#cBtnUser1').addClass("cBtnWrite_style");

		initLayout();
		createGrid1();

		/* 그리드 grid1 클릭 이벤트 */
		$('#grid1').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				grid1_ondblClickRow(rowid, iRow, iCol, e);
			}
		});

		cSearch();

		$('.tab_top_search input').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } });
	});

	/******************************************** 
	 * @Subject : 공지사항 그리드 설정
	 * @Content : 
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function createGrid1(){
		var colName = ['<s:message code='notice.grd.no'/>',
					   '<s:message code='notice.grd.title'/>',
					   '<s:message code='notice.grd.reg_nm'/>',
					   '<s:message code='notice.grd.reg_dt'/>',
					   '<s:message code='notice.grd.cnt'/>',
					   '<s:message code='common.status'/>' 
					   ];

		var colModel = [
			{ name: 'NOTICE_NO', width: 100 , align: 'center' },
			{ name: 'TITLE'    , width: 1000, align: 'left'   },
			{ name: 'REG_NM'   , width: 150 , align: 'center' },
			{ name: 'REG_DT'   , width: 150 , align: 'center' },
			{ name: 'CNT'      , width: 100 , align: 'center' },
			{ name: 'NEW_YN'   , width: 100 , align: 'center', hidden :true }
		];

		var gSetting = {
				pgflg           : true,
				searchInit      : false,
				resizeing       : true,
				rownumbers      : false,
				queryPagingGrid : true,
				shrinkToFit     : true,
				autowidth       : true,
				height:632
		};

		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}

	/******************************************** 
	 * @Subject : 검색 버튼 클릭
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

		var url = "/common/selectNoticeList.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};

		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("grid1", data.result);
			btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);

			var colModel = $("#grid1").jqGrid('getGridParam', 'colModel');
			var html = '<img src="/images/board_new_icon.gif"/>';

			for(var i =0; i < data.result.length; i++){
				if(data.result[i].NEW_YN == 'Y'){
					jQuery("#grid1").setCell(i+1, "TITLE", data.result[i].TITLE + '&nbsp;&nbsp;&nbsp;&nbsp;' + html);
				}
			}
		});
	}

	/******************************************** 
	 * @Subject : 공지사항 그리드 더블클릭 이벤트
	 * @Content : 해당 공지사항의 상세정보로 넘어감
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function grid1_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#grid1").getRowData(rowid);

		var param = {
			"NOTICE_NO" : gridData["NOTICE_NO"]
		};

		fn_pageMove("/common/NoticeView.do", param);
	}

	/******************************************** 
	 * @Subject : 추가 버튼 클릭
	 * @Content : 공지사항 작성 페이지로 넘어감
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	function cAdd(){
		fn_pageMove("/common/NoticeWrite.do");
	}
</script>

<c:import url="../import/frameBottom.jsp" />