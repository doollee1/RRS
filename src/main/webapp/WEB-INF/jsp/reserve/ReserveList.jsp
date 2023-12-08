<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Sales Order Report
	 * @Description : Sales Order Report
	 */
%>
<%-- <c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SalesReport" />
	<c:param name="progcd" value="SalesReport" />
</c:import>
 --%>
<!--- 검색버튼 ---->
<div id="divBtns">
	<div id="divWindowpath">
		<span id="title1"></span><span id="title2"></span><span id="title3"></span>
	</div>
</div>
<!---------->

<div id="ctu_wrap">	
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="reservation.title1"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
	</div>
	<form id="frmSearch" action="#" >
		<div class="tab_top_search2">
			<input type="hidden" name="CURRENT_PAGE" id="CURRENT_PAGE">
			<input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE">
			<input type="hidden" name="H_RESERV_STARD" id="H_RESERV_STARD">
			<input type="hidden" name="H_RESERV_FRDT" id="H_RESERV_FRDT">
			<input type="hidden" name="H_RESERV_TODT" id="H_RESERV_TODT">
			<input type="hidden" name="H_REV_STS" id="H_REV_STS">
			<input type="hidden" name="H_MEM_GBN" id="H_MEM_GBN">
			<table>
				<tbody>
					<tr>  
					    <td class="small_td"><p><s:message code="reservation.period"/></p></td>
                        <td class="medium_td"><select id="RESERV_STARD" name="RESERV_STARD" class=""></select></td>
						<td class="medium_td"><input type="text" name="RESERV_FRDT" id=RESERV_FRDT data-type="date" style="width:90px; float:left;"/>
						<p style="float:left;">-</p>
						<input type="text" name="RESERV_TODT" id="RESERV_TODT" style="width:90px;float:left;" data-type="date"/></td>
						<td class="small_td"><p><s:message code="reservation.state"/></p></td>
						<td class="medium_td"><select id="REV_STS" name="REV_STS" class=""></select></td>
					</tr>
					<tr>
					    <td class="small_td"><p><s:message code="reservation.division"/></p></td>
						<td class="medium_td"><select id="MEM_GBN" name="MEM_GBN" class=""></select></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<!-------------------->

<div id="ctm_wrap">
	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4><s:message code="reservation.title2"/></h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
			<table id="quotationGrid"></table>
			<div id="quotationGrid_pager"></div>
		</div>
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
  var args;
  var datagrid;
	//초기 로드
	$(function() {
		var toDay = getToday();
		var lastMonth = getlastMonth();
		var codeBoxArray = [ 'RESERV_STARD'   /* 예약 구분 */
 		                    ,'REV_STS'        /* 예약 상태 */
		                    ,'MEM_GBN'        /* 멤버 구분 */
							];
				
		createCodeBoxByArr(codeBoxArray, true);
		
		/* db작업 이전 가라데이터 적재  */
		var retVal = [
		    {     '01' : '예약 일자'
		        , '02' : '체크인 일자'
		    },
		    {     '01' : '예약요청-일반'
	            , '02' : '예약요청-멤버'
	            , '03' : '예약가능'
	            , '04' : '예약신청'
	            , '05' : '입금대기'
	            , '06' : '예약확정'
	            , '07' : '예약취소'
	        },
	        {     '00' : '전체'
	            , '01' : '멤버'
	            , '02' : '일반'
	            , '03' : '교민'
	            , '04' : '에이전시'}
	        ];
		
	    for(i = 0; i < codeBoxArray.length; i++){
			$("#" + codeBoxArray[i]).empty().data('options');
			$.each(retVal[i], function(index , val){
				$("#" + codeBoxArray[i]).append('<option value=' + index + '>' +  val + '</option>');
			});
		}
		$("#RESERV_FRDT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay).substr(0,6)+'01'));
		$("#RESERV_TODT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(toDay)));
		
		createQuotationGrid();
		
		$("#divBtn").append("<button class='cBtnclass cBtnSearch_style' id='cBtnSearch' type='button' onclick='cSearch();'>조회</button>");
		$("#divBtn").append("<button class='cBtnclass cBtnAdd_style' id='cBtnAdd' type='button' onclick='cAdd();'>예약등록</button>");
		$("#divBtn").append("<button class='cBtnclass cBtnCancel_style' id='cBtnSearch' type='button' onclick='cSearch();'>닫기</button>");
		
		/* 그리드 로우 클릭시 상세조회 팝업 open */
		/* $('#quotationGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid) {
				var selRowData = $("#quotationGrid").jqGrid("getRowData",rowid);
				console.log(selRowData);
				param = {};                       
				param.SEQ    = selRowData.SEQ;    
				param.REQ_DT = selRowData.REQ_DT; 
				reservePopup(param);              
			}
		});  */
		
		cSearch();
	});

	function createQuotationGrid(){
		var colName = [
				  '<s:message code="reservation.seq"/>'
				, '<s:message code="reservation.mem_gbn"/>'
				, '<s:message code="reservation.date"/>'
				, '<s:message code="reservation.member"/>'
				, '<s:message code="reservation.product_gbn"/>'
				, '<s:message code="reservation.checkIn"/>'
				, '<s:message code="reservation.checkOut"/>'
				, '<s:message code="reservation.totalCnt"/>'
				, '<s:message code="reservation.amount"/>'
				, '<s:message code="reservation.totAmount"/>'
				, '<s:message code="reservation.flight"/>'
				, '<s:message code="reservation.state"/>'
			];
		var colModel = [
				  { name: 'SEQ', width : 70, align: 'center' }
				, { name: 'MEM_NM', width : 70, align: 'center' }
				, { name: 'REQ_DT', width : 100, align: 'center' }
				, { name: 'REQ_HAN_NM', width : 70, align: 'center' }
				, { name: 'CONTENTS', width : 70, align: 'center' }
				, { name: 'CHK_IN_DT', width : 70, align: 'center' }
				, { name: 'CHK_OUT_DT', width : 150, align: 'center' }
				, { name: 'TOT_PERSON', width : 150, align: 'center' }
				, { name: 'DEP_AMT', width : 70, align: 'center' }
				, { name: 'TOT_AMT', width : 100, align: 'center' }
				, { name: 'FLIGHT_OUT', width : 100, align: 'center' }
				, { name: 'STATE_NM', width : 100, align: 'center' ,ref : 'linkq' }
			];
		
		var gSetting = {
		        pgflg:true,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				//shrinkToFit: true,
				//autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 487
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('quotationGrid', colName, colModel, gSetting);
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
		vRowsPerPage = btGrid.getGridRowSel('quotationGrid_pager');
		$('#CURRENT_PAGE'  ).val(vCurrentPage);
		$('#ROWS_PER_PAGE' ).val(vRowsPerPage);
		$("#H_RESERV_STARD").val($("#RESERV_STARD").val());
		$("#H_RESERV_FRDT" ).val($("#RESERV_FRDT").val().split('.').join(''));
		$("#H_RESERV_TODT" ).val($("#RESERV_TODT").val().split('.').join(''));
		$("#H_REV_STS"     ).val($("#REV_STS").val());
		$("#H_MEM_GBN"     ).val($("#MEM_GBN").val());
		
		var url = "/reserve/reserveSelectList.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		fn_ajax(url, true, param, function(data, xhr){
			reloadGrid("quotationGrid", data.result);
			
			btGrid.gridQueryPaging($('#quotationGrid'), 'cSearch', data.result);
			var colModel = $("#quotationGrid").jqGrid('getGridParam', 'colModel'); 
			for(var i =0; i < data.result.length; i++){
				jQuery("#quotationGrid").setCell(i+1);
			}
		});
	}

	function cAdd(){
		reservePopup();
	}
	
    function reservePopup(param){
		var url = "/reserve/reserveRegi.do";
		var pid = "p_reserveRegi";  //팝업 페이지의 취상위 div ID
	    
		popupOpen(url, pid, param, function(data) {
			//cSearch();
		});
	}
	
</script>
<c:import url="../import/frameBottom.jsp" />