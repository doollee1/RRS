<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Mail History
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="BC04" />
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
						<td class="small_td"><p><s:message code="mail.grd.MailType"/></p></td>
						<td class="medium_td"><select id="MAIL_CD" name="MAIL_CD" class=""></select>
						</td>
						<td class="small_td"><p><s:message code="mail.grd.oemail"/></p></td>
						<td class="medium_td"><p><input type="text" id="MAIL_TO" name="MAIL_TO" class="cmc_txt" /></p></td>
						<td class="small_td"><p><s:message code="mail.grd.senddt"/></p></td>
						<td><input type="text" id="SEND_DATE" name="SEND_DATE" data-type="date" readonly="true"/>
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
				<h4><s:message code="mail.grd.mailhis"/></h4>
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
	//초기 로드
	$(function() {
		initLayout();
		createGrid1();
		createCodeBox('MAIL_CD',true);
		
		/* 그리드 grid1 이벤트 */
		$('#grid1').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				grid1_ondblClickRow(rowid, iRow, iCol, e);
			}
		}); 
		
		$('#MAIL_TO').on('keypress', function (e) {
			if(e.which == 13){
				cSearch(null)
			}
		});
		
	});

	function createGrid1(){
		var colName = ['<s:message code='mail.grd.MailType'/>',
		               '<s:message code='mail.grd.mailnm'/>',
		               '<s:message code='mail.Language'/>',
		               '<s:message code='mail.grd.femail'/>',
		               '<s:message code='mail.grd.oemail'/>',
		               '<s:message code='mail.grd.cemail'/>',
		               '<s:message code='notice.grd.title'/>',
		               '<s:message code='mail.MailContents'/>',
		               '<s:message code='mail.AttachedFile'/>',
		               '<s:message code='mail.grd.senddt'/>' 
		               
		               ];
		var colModel = [
			{ name: 'MAIL_CD', width: 50, align: 'center' },
			{ name: 'MAIL_NM', width: 70, align: 'center' , hidden :true},
			{ name: 'LANG', width: 50, align: 'center' },
			{ name: 'MAIL_FROM', width: 100, align: 'left'},
			{ name: 'MAIL_TO', width: 100, align: 'left' },
			{ name: 'MAIL_CC', width: 100, align: 'left', hidden :true},
			{ name: 'MAIL_TITLE', width: 150, align: 'left'},
			{ name: 'MAIL_CONTENTS', width: 200, align: 'left', hidden :true},
			{ name: 'ATTACH_FILE_YN', width: 50, align: 'left', hidden :true},
			{ name: 'SEND_DATE', width: 100, align: 'center'}
	  	];
		
		var gSetting = {
		        pgflg:true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				shrinkToFit: true,
				autowidth: true,
				height:632
		};
		
		btGrid.createGrid('grid1', colName, colModel, gSetting);
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
		
		var url = "/common/selectMailHistory.do";
		
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
			}
		);
	}
	
	function grid1_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#grid1").getRowData(rowid);
		var url = "/popup/mailHis.do";
		var pid = "MailHisPopup";
		var param = {
		    'MAIL_CD': 			gridData["MAIL_CD"]
		  , 'LANG' 	: 			gridData["LANG"]
		  , 'MAIL_FROM':		gridData["MAIL_FROM"]
		  , 'MAIL_TO':			gridData["MAIL_TO"]
		  , 'MAIL_CC':			gridData["MAIL_CC"]
		  , 'MAIL_NM':			gridData["MAIL_NM"]
		  , 'MAIL_TITLE':		gridData["MAIL_TITLE"]
		  , 'MAIL_CONTENTS':	gridData["MAIL_CONTENTS"]
		  , 'ATTACH_FILE_YN':	gridData["ATTACH_FILE_YN"]
		  , 'SEND_DATE':		gridData["SEND_DATE"]
		};
		
		param.window = window;
		popupOpen(url, pid, param, function(e, selectedData) {
		});	

	}

</script>

<c:import url="../import/frameBottom.jsp" />