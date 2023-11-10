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
						<td class="small_td"><p><s:message code="customer.custCd"/></p></td>
						<td class="medium_td"><p><input type="text" id="CUST_CD" name="CUST_CD" class="cmc_txt" /></p></td>						
						<td class="small_td"><p><s:message code="customer.regDate"/></p></td>
						<td><input type="text" id="REG_DT" name="REG_DT" data-type="date" readonly="readonly"/></td>
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
				<h4><s:message code="customer.grd.createreqhis"/></h4>
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

		$('#MAIL_TO').on('keypress', function (e) {
			if(e.which == 13){
				cSearch(null)
			}
		});
		
	});

	function createGrid1(){
		var colName = ['<s:message code='customer.Code'/>',
		               '<s:message code='customer.Name'/>',
		               '<s:message code='customer.reqcredit'/>' + '  (EUR)',
		               '<s:message code='customer.requestorDate'/>',
		               '<s:message code='customer.requestorId'/>',
		               '<s:message code='customer.requestor'/>',
		               '<s:message code='customer.updateDate'/>',
		               '<s:message code='customer.updateid'/>'  
		               ];
		var colModel = [
			{ name: 'CUST_CD', width: 100, align: 'center' },
			{ name: 'CUST_NM', width: 100, align: 'center' },			
			{ name: 'REQ_CREDIT', width: 100, align: 'center'},
			{ name: 'REG_DT', width: 100, align: 'center' , formatter: 'date', formatoptions: {srcformat: 'ISO8601Short', newformat: 'd.m.Y', masks : {ISO8601Short:"Y-m-d" }}},
			{ name: 'REG_ID', width: 100, align: 'center'},
			{ name: 'REQUESTOR', width: 100, align: 'center'},
			{ name: 'UPT_DT', width: 100, align: 'center' , hidden: 'true'},
			{ name: 'UPT_ID', width: 100, align: 'center' , hidden: 'true'},
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
	
	function cSearch(currentPage) {

		var page = $("#grid1").getGridParam("page");
		var rowNum = $("#grid1").getGridParam("rowNum");		
		var param = {
			  CUST_CD: $("#CUST_CD").val()
		    , REG_DT: $("#REG_DT").val()
		    , CURRENT_PAGE: page
		    , ROWS_PER_PAGE: rowNum
		}
		
		var url = "<c:url value="/customer/selectCreditRequestHistory.do" />";	
		
		fn_ajax(url, true, param, function(data, xhr) {			
			if (!fn_empty(data)) {
				reloadGrid("grid1", data.result);				
				btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
			} 			
		});
	}	

</script>

<c:import url="../import/frameBottom.jsp" />