<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Product Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="BomReport" />
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
							<td class="medium_td"><input type="text" name="MATL_CD_ST" id="MATL_CD_ST" style="width:209px;ime-mode:disabled;" maxlength="10" onKeyPress="fn_onlyNum(this)" >
							<td width="20px"></td>
							<td class="small_td"><p><s:message code="report.quotation.materialdec"/></p></td>
							<td class="medium_td"><input type="text" name="MATL_NM_ST" id="MATL_NM_ST" style="width:209px;"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td class="small_td"><p><s:message code="material.plant"/></p></td>
							<td><select id="PLANT_CD" name="PLANT_CD"  style="width:214px;" class=""></select></td>
							<td><p>&nbsp;</p></td>
							<td class="small_td"><p><s:message code="material.usage"/></p></td>
							<td><select id="BOM_USAGE" name="BOM_USAGE" style="width:214px;" class=""></select></td>
							<td>&nbsp;</td>
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
				<h4><s:message code='title.bomreport'/></h4>
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

		$('#MATL_CD_ST').focus();
		
		var codeBoxArray = [ 'PLANT_CD'
							,'BOM_USAGE'
						   ];
				
		createCodeBoxByArr(codeBoxArray, true);

		$("#PLANT_CD").val('1000');
		$("#BOM_USAGE").val('5');
		
		$('#MATL_CD_ST, #MATL_NM_ST').on('keyup', function (e) {
			if(e.which == 13){
				cSearch();
			}
		});
	});
	
	function createGrid1(){
		var colName = [
				  '<s:message code="material.materialCode"/>'
					, '<s:message code="material.material"/>'
					, '<s:message code="physical.werks"/>'
					, '<s:message code="quotation.bomNo"/>'
					, '<s:message code="lead.grd.itemSeq"/>'
					, '<s:message code="material.usage"/>'
					, '<s:message code="lead.Category"/>'
					, '<s:message code="material.baseQuantity"/>'
					, '<s:message code="material.basicUnit"/>'
					, '<s:message code="material.bomStatus"/>'
					, '<s:message code="material.bomCode"/>'
					, '<s:message code="material.bomQty"/>'
					, '<s:message code="material.unit"/>'
					, '<s:message code="quotation.validFrom"/>'
					, '<s:message code="quotation.validTo"/>'
					, '<s:message code="material.delyn"/>'
					, '<s:message code="quotation.itemCat"/>'
					, '<s:message code="quotation.status"/>'
					, '<s:message code="customer.regDate"/>'
					, '<s:message code="customer.regid"/>'
					, '<s:message code="customer.updateDate"/>'
					, '<s:message code="customer.updateid"/>'
			     		];
		var colModel = [
					  { name: 'MATL_CD', width: 80, align: 'center' }
					, { name: 'MATL_NM', width: 130, align: 'left' }
					, { name: 'PLANT_NM', width: 150, align: 'left' }
					, { name: 'BOM_NO', width: 100, align: 'center' }
					, { name: 'ITEM_SEQ', width: 100, align: 'center' }
					, { name: 'BOM_USAGE_NM', width: 130, align: 'left' }
					, { name: 'BOM_CTG_NM', width: 100, align: 'left' }
					, { name: 'BS_QTY', width: 75, align: 'right' }
					, { name: 'BS_UNIT', width: 75, align: 'center' }
					, { name: 'BOM_STS', width: 75, align: 'center' }
					, { name: 'BOM_CD', width: 75, align: 'center' }
					, { name: 'BOM_QTY', width: 70, align: 'right' }
					, { name: 'UNIT_CD', width: 70, align: 'center' }
					, { name: 'VAL_FR_DT_H', width: 100, align: 'center' }
					, { name: 'VAL_FR_DT', width: 100, align: 'center' }
					, { name: 'DEL_YN', width: 70, align: 'center' }
					, { name: 'ITEM_CTG', width: 70, align: 'center' }
					, { name: 'STATUS', width: 70, align: 'center'}
					, { name: 'REG_DT', width: 100, align: 'center',hidden:'true'}
					, { name: 'REG_ID', width: 100, align: 'center',hidden:'true'}
					, { name: 'UPT_DT', width: 100, align: 'center',hidden:'true'}
					, { name: 'UPT_ID', width: 100, align: 'center',hidden:'true'}
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
		
		var url = "/report/retrieveBomReport.do";
		
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
			
			var param = {"MATL_CD_ST": 	$("#MATL_CD_ST").val()
					    ,"MATL_NM_ST": 	$("#MATL_NM_ST").val()
					    ,"PLANT_CD":  $("#PLANT_CD").val()
					    ,"BOM_USAGE":  $("#BOM_USAGE").val()
					    ,'COL_NM':	   colNms}
		};
		fn_formSubmit('/report/retrieveBomReportAll.do', param);
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