<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Product Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="ProductReport" />
</c:import>
	
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
							<td class="small_td"><p><s:message code="material.materialCode"/></p></td>
							<td class="medium_td"><input type="text" name="MATL_CD" id="MATL_CD" style="width:209px;" maxlength="10" onKeyPress="fn_onlyNum(this)" >
							<td width="20px"></td>
							<td class="small_td"><p><s:message code="report.quotation.materialdec"/></p></td>
							<td class="medium_td"><input type="text" name="MATL_NM" id="MATL_NM" style="width:209px;"></td>
							<td class="small_td"><p><s:message code="material.plant"/></p></td>
							<td class="medium_td"><select id="PLANT_CD" name="PLANT_CD"  style="width:214px;" class=""></select></td>
						</tr>
						<tr>
							<td class="small_td"><p><s:message code="customer.SalesOrg"/></p></td>
							<td class="medium_td"><select name="SALES_ORG_CD" id="SALES_ORG_CD" style="width:214px;"></select></td>
							<td width="20px"></td>
							<td class="small_td"><p><s:message code="customer.DistChannel"/></p></td>
							<td class="medium_td"><select name="DISTRB_CH" id="DISTRB_CH" style="width:214px;"></select></td>
							<td class="small_td"><p><s:message code="customer.Division"/></p></td>
							<td class="medium_td"><select name="DIV_CD" id="DIV_CD" style="width:214px;"></select>
							</td>
							</tr>
					</tbody>
				</table>
			</div>
	</form>
	<!-- 검색조건 영역 끝 -->
		
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='title.prudoctreport'/></h4>
			</div>
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
		setCommBtn('Search', true);				
		initLayout();
		createGrid1();

		$('#MATL_CD').focus();
		
		var codeBoxArray = [ 'PLANT_CD'
							,'SALES_ORG_CD'
							,'DISTRB_CH'
							,'DIV_CD'
						   ];
				
		createCodeBoxByArr(codeBoxArray, true);

		$("#PLANT_CD").val('1000');
		$("#BOM_USAGE").val('5');
		
		$('#MATL_CD, #MATL_NM').on('keyup', function (e) {
			if(e.which == 13){
				cSearch();
			}
		});
		
	});
	
	function createGrid1(){
		var colName = [
		     		  '<s:message code="material.material"/>'
		     		, '<s:message code="material.grid.desc"/>'
		     		, '<s:message code="material.basicDataText"/>'
		     		, '<s:message code="material.plant"/>'
		     		, '<s:message code="customer.SalesOrg"/>'
		     		, '<s:message code="customer.DistChannel"/>'
		     		, '<s:message code="customer.Division"/>'
		     		, '<s:message code="material.xPlantStatus"/>'
		     		, '<s:message code="material.grid.bum"/>'
		     		, '<s:message code="material.output"/>'
		     		, '<s:message code="quotation.matlGrp"/>'
		     		];
		     	var colModel = [
		     		  { name: 'MATERIAL', width: 60, align: 'center', }
		     		, { name: 'DESCRIPTION', width: 170, align: 'left'}
		     		, { name: 'BASIC_DATA_TXT', width: 150, align: 'left' }
		     		, { name: 'PLANT', width: 150, align: 'left', hidden:true}
		     		, { name: 'SALES_ORG', width: 150, align: 'left'}
		     		, { name: 'DISTR_CHL', width: 100, align: 'left' }
		     		, { name: 'DIVISION', width: 70, align: 'left'}
		     		, { name: 'X_PLANT_STATUS', width: 100, align: 'left' }
		     		, { name: 'BUM', width: 70, align: 'center'}
		     		, { name: 'OUTPUT', width: 70, align: 'left' }
		     		, { name: 'MATERIAL_GRP', width: 120, align: 'left' }
		     		];
		     	
		var gSetting = {
		        pgflg:true,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: true,
				autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height:609
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
		
		var url = "/report/retrieveProductReport.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, true, param, function(data, xhr){
				reloadGrid("grid1", data.result);
				btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
		});
	}
	
	//공통버튼 - 엑셀 다운 클릭
	function cExcel() {
		if (confirm("<s:message code='info.excel'/>")  == true) { 
			
			var colNms = excelToMap();
			
			var param = {"MATL_CD": 	$("#MATL_CD").val()
					    ,"MATL_NM": 	$("#MATL_NM").val()
					    ,"PLANT_CD":  	$("#PLANT_CD").val()
					    ,"SALES_ORG_CD":$("#SALES_ORG_CD").val()
					    ,"DISTRB_CH":	$("#DISTRB_CH").val()
					    ,"DIV_CD":		$("#DIV_CD").val()
					    ,'COL_NM':	   colNms
					  }
		};
		fn_formSubmit('/report/retrieveProductReportAll.do', param);
	}
	
	function excelToMap() {
		
		var colNms = $("#grid1").jqGrid('getGridParam','colNames');
		var colid = $("#grid1")[0].p.colModel;
		var _string =  '%' ;
		for(var i= 0 ; i < colid.length; i++) {
			if(colid[i].name != "CHK"){
				if(i == (colid.length -1)) {
					 _string += ''+colid[i].name+':'		+ colNms[i] +'';
				}else  _string += ''+colid[i].name+':'		+ colNms[i] +',';
			}
		}
		_string +=  '%' ;
		return _string;
	}
</script>
<c:import url="../import/frameBottom.jsp" />