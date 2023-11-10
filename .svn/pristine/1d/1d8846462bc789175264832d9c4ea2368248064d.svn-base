<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : BOMSearch
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="QshopProduct" />
</c:import>
	
<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">

	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
			<div class="tab_top_search" style="margin-bottom: 5px;">
				<table>
					<tbody>  
						<tr>
							<td class="small_td" style="width:149px;"><p><s:message code="material.materialCode"/></p></td>
							<td class="medium_td" style="width:320px;"><input type="text" name="MATL_CD_ST" id="MATL_CD_ST" style="ime-mode:disabled;" maxlength="10" onKeyPress="fn_onlyNum(this)" >
							<td  width="180px" class="small_td"><p><s:message code="report.quotation.materialdec"/></p></td>
							<td class="medium_td"><input type="text" name="MATL_NM_ST" id="MATL_NM_ST"></td>
							<td>&nbsp;</td>
						</tr>
						<tr style="display: none;">
							<td class="small_td"><p><s:message code="material.plant"/></p></td>
							<td><select id="PLANT_CD" name="PLANT_CD"  class=""></select></td>
							<td class="small_td"><p><s:message code="material.usage"/></p></td>
							<td colspan="3"><select id="BOM_USAGE" name="BOM_USAGE" class=""></select></td>
						</tr></tbody>
				</table>
			</div>
	</form>
	<!-- 검색조건 영역 끝 -->	
		
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div style="display: none;">External oms Module List <c:out value="${today}"/></div>
			<div class="ct_grid_top_left">			
				<ul>				
					<li style="float: left; list-style-type: none;"><h4><s:message code='title.moduleList'/></h4></li>
					<li style="float: right; list-style-type: none;">
					<button type='button' class='btn btn-default' id='btnModuleSearch'><i class='fa fa-plus-square-o'></i><s:message code="button.search"/></button>
					<button type='button' class='btn btn-default' id='btnModuleAdd'><i class='fa fa-plus-square-o'></i><s:message code="button.add"/></button>
					<button type='button' class='btn btn-default' id='btnModuleSave'><i class='fa fa-plus-square-o'></i><s:message code="button.save"/></button>
					<button type='button' class='btn btn-default' id='btnModuleRemove'><i class='fa fa-plus-square-o'></i><s:message code="button.delete"/></button>
					</li>
				</ul>
			</div>
		</div>		
		<table id="gridModule"></table><div id="gridModule_pager"></div>	
	</div>
	<!-- 그리드 끝 -->
	
	<div style="margin-top:350px;">
		<form id="frmSearch2" action="#">	
				<div style="background-color:#e9ecf2; padding:5px; padding-left:20px; border:1px solid #ccc;">
					<table>
						<tbody>  
							<tr>
								<td class="small_td" style="width:149px;"><p><s:message code="material.materialCode"/></p></td>
								<td class="medium_td" style="width:320px;"><input type="text" name="MATL_CD_ST2" id="MATL_CD_ST2" style="ime-mode:disabled;" maxlength="10" onKeyPress="fn_onlyNum(this)" >
								<td  width="180px" class="small_td"><p><s:message code="report.quotation.materialdec"/></p></td>
								<td class="medium_td"><input type="text" name="MATL_NM_ST2" id="MATL_NM_ST2"></td>
								<td>&nbsp;</td>
							</tr>
					</table>
				</div>
		</form>
	</div>	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">	
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left" style="padding-top:5px;">
				<ul>
					<li style="float: left; list-style-type: none;"><h4><s:message code='title.bosList'/></h4></li>
					<li style="float: right; list-style-type: none;">
					<button type='button' class='btn btn-default' id='btnBosSearch'><i class='fa fa-plus-square-o'></i><s:message code="button.search"/></button>
					<button type='button' class='btn btn-default' id='btnBosAdd'><i class='fa fa-plus-square-o'></i><s:message code="button.add"/></button>
					<button type='button' class='btn btn-default' id='btnBosSave'><i class='fa fa-plus-square-o'></i><s:message code="button.save"/></button>
					<button type='button' class='btn btn-default' id='btnBosRemove'><i class='fa fa-plus-square-o'></i><s:message code="button.delete"/></button>
					</li>
				</ul>
			</div>	
		</div>
		<table id="gridBOS"></table><div id="gridBOS_pager"></div>
	</div>
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
  	var boslastsel = null;
  	

			
	
	// get grid rowdata all
	function getGridData (grid, flag) {		
		
		var rowValues = [], ids = [];
		
		if (flag != null && flag != undefined) {
			ids = grid.jqGrid("getGridParam", "selarrrow") // selection row data
		} else {
			ids = grid.jqGrid('getDataIDs');			
		}
		
		$.each (ids, function (k, v) {	
			rowValues.push(grid.jqGrid("getRowData", ids[k]));
		});
		
		return rowValues;
	}	
	
	// remove BOS
	function removeBOS() {
		
		$("#gridBOS").saveRow(boslastsel, false, 'clientArray'); 		
		boslastsel = null;		
				
		var formData = {
				  MATL_CD_ST: $("#MATL_CD_ST2").val()
			    , MATL_NM_ST: $("#MATL_NM_ST2").val()
			    , CURRENT_PAGE: $("#gridBOS").getGridParam("page")
			    , ROWS_PER_PAGE: $("#gridBOS").getGridParam("rowNum")
		}
		
		var gridSelectedRowDatas = getGridData($("#gridBOS"), "SEL");
		var url = "<c:url value="/external/module/removeBOS.do" />";		
		var param = {
			  searchlist : formData
			, boslist : gridSelectedRowDatas
		};		
		
		fn_ajax(url, true, param, function(data) {
			alert('<s:message code="success.delete"/>');		
			if (data != null ) {				
				var ids = $("#gridBOS").jqGrid('getGridParam', 'selarrrow');				 
				for (var i = ids.length-1; i> -1; i--) {					
					$('#gridBOS').jqGrid('delRowData', ids[i]);
				}
				// reloadGrid("gridModule", data.RESULT);   // 그리드 조회 데이터 출력
			}
		});
	}
		
	// save BOS
	function saveBOS() {
				
		$("#gridBOS").saveRow(boslastsel, false, 'clientArray'); 		
		boslastsel = null;
		
		var formData = {
				  MATL_CD_ST: $("#MATL_CD_ST2").val()
			    , MATL_NM_ST: $("#MATL_NM_ST2").val()
			    , CURRENT_PAGE: $("#gridBOS").getGridParam("page")
			    , ROWS_PER_PAGE: $("#gridBOS").getGridParam("rowNum")
		}
		
		var gridRowdatas = getGridData($("#gridBOS"));		
		var url = "<c:url value="/external/module/updateBOS.do" />";		
		var param = {
			  searchlist : formData
			, boslist : gridRowdatas
		};		
		
		fn_ajax(url, true, param, function(data) {
			alert('<s:message code="success.update"/>');			
			if (data != null ) {
				reloadGrid("gridBOS", data.RESULT);   // 그리드 조회 데이터 출력
			}
		});
	}
	
	// remove module
	function removeModule() {
		
		var formData = {
			  MATL_CD_ST: $("#MATL_CD_ST").val()
		    , MATL_NM_ST: $("#MATL_NM_ST").val()
		    , CURRENT_PAGE: $("#gridModule").getGridParam("page")
		    , ROWS_PER_PAGE: $("#gridModule").getGridParam("rowNum")
		}
		
		var gridSelectedRowDatas = getGridData($("#gridModule"), "SEL");
		var url = "<c:url value="/external/module/removeModule.do" />";		
		var param = {
			  searchlist : formData
			, modulelist : gridSelectedRowDatas
		};		
		
		fn_ajax(url, true, param, function(data) {
			alert('<s:message code="success.delete"/>');			
			if (data != null ) {				
				var ids = $("#gridModule").jqGrid('getGridParam', 'selarrrow');				 
				for (var i = ids.length-1; i> -1; i--) {					
					$('#gridModule').jqGrid('delRowData', ids[i]);
				}
				// reloadGrid("gridModule", data.RESULT);   // 그리드 조회 데이터 출력
			}
		});
	}
		
	// save module
	function saveModule() {
	
		var formData = {
			  MATL_CD_ST: $("#MATL_CD_ST").val()
		    , MATL_NM_ST: $("#MATL_NM_ST").val()
		    , CURRENT_PAGE: $("#gridModule").getGridParam("page")
		    , ROWS_PER_PAGE: $("#gridModule").getGridParam("rowNum")
		}
		
		var gridRowdatas = getGridData($("#gridModule"));		
		var url = "<c:url value="/external/module/updateModule.do" />";		
		var param = {
			  searchlist : formData
			, modulelist : gridRowdatas
		};		
		
		fn_ajax(url, true, param, function(data) {
			alert('<s:message code="success.update"/>');
			
			if (data != null ) {
				reloadGrid("gridModule", data.RESULT);   // 그리드 조회 데이터 출력
			}
		});
	}
	
	function isExsistModule (matcd) {
		var bExsist = false;
		
		var ids = $("#gridModule").jqGrid('getDataIDs');
		for (var i=0; i<ids.length; i ++) {			
			var rowdata = $("#gridModule").jqGrid("getRowData", ids[i]);
			var materialcd = rowdata.MATL_CD;
			
			if (materialcd === matcd) {
				bExsist = true
				break;
			}
		}				
		return bExsist;
	}
	
	
	// call module pop up
	function modulePopUpOpen () {
		
		var url = "<c:url value="/external/module/showExternalMaterialPopUp.do" />";
		var pid = "externalMaterialPopUp";  //팝업 페이지의 취상위 div ID
		var param = { DIV_CD: '20', PLANT_CD: '1000', DISTRB_CH: '10'}; // selection only moudule item		
		
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)) {
				// console.log(data);
				// 데이터 처리		
				$.each(data, function (k, v) {					
					var data = {
						  MATL_CD : v.MATL_CD
						, MATL_NM : v.MATL_DESC	
						, MATL_DESC : v.MATL_DESC						
						, PLANT_CD : v.PLANT_CD						
						, SALES_ORG_CD : v.SALES_ORG_CD						
						, DISTRB_CH : v.DISTRB_CH
						, DIV_CD : v.DIV_CD
						, X_P_STATUS : v.X_P_STATUS
						, BUM : v.BUM
						, WP_OUT : v.WP_OUT
						, MATL_GR : v.MATL_GR
						, COMP_CD : '1000'
						, FLAG : 'N'
					};
					
					// 해당 항목이 이미 존재하는지 체크 - 그리드 항목 에서만 체크
					if (!isExsistModule (v.MATL_CD)) {
						btGrid.gridAddRow("gridModule", "last", data);
					}
				});
			}
		});		
	}		
	
	// call material pop up
	function bosPopUpOpen () {
		
		var url = "<c:url value="/external/module/showExternalMaterialPopUp.do" />";
		var pid = "externalMaterialPopUp";  //팝업 페이지의 취상위 div ID
		var param = { DIV_CD: '', PLANT_CD: '1000', DISTRB_CH: '10'}; // selection only BOS item		
		
		popupOpen(url, pid, param, function(data) {
			if (!fn_empty(data)) {
				// console.log(data);
				// 데이터 처리		
				$.each(data, function (k, v) {					
					var data = [{	
						  KIND_CD : ""
						, COUNTRY_CD : ""
						, MATL_CD : v.MATL_CD
						, MATL_DESC : v.MATL_DESC
						, WP_OUT : v.WP_OUT
						, COMP_CD : '1000'
						, FLAG : 'N'
					}];	
					// 항목 추가					
					if (boslastsel != null) {
						$("#gridBOS").saveRow(boslastsel, false, 'clientArray');	
					}
					
					var ids = $("#gridBOS").jqGrid('getDataIDs'); 
					var rowid = ids.length;
					$("#gridBOS").addRowData(++rowid, data, "last");					
					boslastsel = rowid;
				});
			}
		});		
	}
		
	function createModuleGrid() {
     	var colName = [
     				  	  'Material'
     					, 'Description'
     					, 'Description'
     					, 'Company Code'
     					, 'Plant'
     					, 'Sales Org.'
     					, 'Division' 
     					, 'X-Plant Status' 
     					, 'BUM' 
     					, 'Power Output'  
     					, 'Material Grp.'
     					, 'chkflag'
		];     	
     	var colModel = [
			  { name: 'MATL_CD', width: 100, align: 'center', }
			, { name: 'MATL_NM', width: 250, hidden: true}
			, { name: 'MATL_DESC', width: 250  }
			, { name: 'COMP_CD', width: 100, align: 'center' }
			, { name: 'PLANT_CD', width: 100, align: 'center' }
			, { name: 'SALES_ORG_CD', width: 100, align: 'center', hidden: true }
			, { name: 'DIV_CD', width: 100, align: 'center' }
			, { name: 'X_P_STATUS', width: 100, align: 'center' }
			, { name: 'BASIC_UNIT', width: 100, align: 'center' }
			, { name: 'WP_OUT', width: 100, align: 'center' }
			, { name: 'MATL_GR', width: 100, align: 'center' }
			, { name: 'FLAG', width: 50, hidden: true}
   		];
		     	
		var gSetting = {
		        pgflg: true,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : true,
				searchInit : false,
				resizeing : true,
				rownumbers: false,
				shrinkToFit: true,
				autowidth: true,
				queryPagingGrid: true, // 쿼리 페이징 처리 여부
				height: 247,
				multiselect: true
		};
		
		btGrid.createGrid('gridModule', colName, colModel, gSetting);		
	}	
	
	var boslastsel = null;
	function createBOSGrid() {
		// kind
		var __KIND__ = (function () {	
			
			var sJson = "";	
			var headcd = "KIND_CD";
			var url = "<c:url value="/common/getCommonCode.do" />";				
			var param = {"param": headcd + ";" + getCookie("Language")};	
			fn_ajax(url, false, param, function(data, xhr) {
				
				var retVal = data.result.split(';');
				for(i = 0; i < retVal.length; i++){
					var tempVal = retVal[i].split(':');					
					sJson += ''+ tempVal[0] +':' + tempVal[1] + ';';
				}				
				if (sJson.length > 1) {
					sJson = sJson.substring(0, sJson.length -1)
				}
			});			
			return sJson;
		})();			
		
		
		// 국가코드
		var __COUNTRY__ = (function () {	
			var sJson = "";	
			var headcd = "COUNTRY_CD";
			var url = "<c:url value="/external/module/selectCommonCodeList.do" />";
			var param = {
				HEAD_CD: 'COUNTRY_CD'
			};
			
			fn_ajax(url, false, param, function(data, xhr) {
				sJson += ''+ '*' +':' + 'All Countries' + ';';
				$.each(data.result, function (k, v) {
					sJson += ''+ v.code +':' + v.value + ';';
				});			
				if (sJson.length > 1) {
					sJson = sJson.substring(0, sJson.length -1);
				}
			});			
			return sJson;
		})();

		$("#gridBOS").jqGrid({
   			url			: "<c:url value="/external/module/selectBOSList.do" />",
       		editurl		: "clientArray",// 수정 ur
			mtype		: "POST",
        	datatype	: "local",			
      		page		: 1,             
      		colModel	: [            		               
						{ label: '<s:message code="bos.kind"/>'
						    , name: 'KIND_CD', width: 60, align: 'center'
							, editable: true, edittype: "select", formatter : "select"
							, editoptions: {						
								value:  __KIND__,
		                   		dataEvents: [{type: 'change', fn: function(e) {
		                   				
		                   				var arr = this.id.split("_");
		                   				// console.log(">>>id" + arr[0]);
		                   				var countrycd = "";
		                   				var rowid =  arr[0];
		                   				var rowdata = $("#gridBOS").getRowData( rowid );
		                   				var flag = rowdata.FLAG;
		                   				if (flag != "Y") {		                   					
		                   					countrycd = $("#" + rowid + "_COUNTRY_CD").val();		                   		
		                   					if ($(this).val() != "INV" && countrycd == "*") {
		                   						alert('<s:message code="box.invalidType"/>');	
		                   						var before_change = $(this).parent().data('pre-data');//get the pre data
		                   						$(this).val(before_change);
		                   						$(this).parent().data('pre-data', before_change);
		                   					} else {
		                   						$(this).parent().data('pre-data', $(this).val());
		                   					}
		                   				} else {
		                   					$(this).parent().data('pre-data', $(this).val());
		                   				}
		                     		}
		                        }]
							}},
						{label: '<s:message code="bos.country"/>'
						    , name: 'COUNTRY_CD', width: 80
							, editable: true, edittype: "select", formatter : "select", editrules: { required: true }
							, editoptions: {
								value: __COUNTRY__,
								dataEvents: [{type: 'change', fn: function(e) {	                   				
		                   				var arr = this.id.split("_");
		                   				// console.log(">>>id" + arr[0]);
		                   				var kindcd = "";
		                   				var rowid =  arr[0];
		                   				var rowdata = $("#gridBOS").getRowData( rowid );
		                   				var flag = rowdata.FLAG;
		                   				if (flag != "Y") {		                   				
		                   					kindcd = $("#" + rowid + "_KIND_CD").val();
		                   					if ($(this).val() == "*" && kindcd != "INV") {
		                   						alert('<s:message code="box.invalidType"/>');	
		                   						var before_change = $(this).parent().data('pre-data');//get the pre data
		                   						$(this).val(before_change);
		                   						$(this).parent().data('pre-data', before_change);
		                   					} else {
		                   						$(this).parent().data('pre-data', $(this).val());
		                   					}
		                   				} else {
		                   					$(this).parent().data('pre-data', $(this).val());
		                   				}
		                     		}
		                        }]
							
							}},
						{ label: '<s:message code="bos.materialCode"/>', name: 'MATL_CD', width: 80, align: 'center' },
						{ label: '<s:message code="bos.materialDescription"/>', name: 'MATL_DESC', width: 300},		
						{ label: 'company code', name: 'COMP_CD', width: 50, align: 'center', hidden: false },
						{ label: 'chkflag', name: 'FLAG', width: 50, hidden: true}
          	],           	
          	multiselect		: true,
          	viewrecords		: true,
         	width			: $(window).width()-14,
       		height			: 247,
       		rowNum			: 100,			
			rowList			: [100,300,1000],
			rowcontent 		: false,
         	pager			: "#gridBOS_pager",
         	onSelectRow		: function(rowid) { 
    			if (rowid && (rowid != boslastsel)) 
    			{					
    				if (boslastsel != null)
    				{
    					$(this).saveRow(boslastsel, false, 'clientArray');
    				} 
    				
    				var countrycd = "", flag="";
    				var rowdata = $(this).getRowData( rowid );	
    				flag = rowdata.FLAG;
    				countrycd = rowdata.COUNTRY_CD;
    				if (flag == "Y")
    				{ 
    					$(this).setColProp('COUNTRY_CD',{editable: false});
    				}
    				else
    				{    					
    					$(this).setColProp('COUNTRY_CD',{editable: true});					
    				}
    				
    				$(this).editRow(rowid, false);  
    				
    				if (flag == "Y") {
    					
    					var idx = $("#" + rowid + "_KIND_CD option[value='ESS']").index();    				
        				if (countrycd == "*") {        				
            				$("#" + rowid + "_KIND_CD").find("option:eq(" + idx + ")").prop("disabled", true);    					
        				} else {        				
            				$("#" + rowid + "_KIND_CD").find("option:eq(" + idx + ")").prop("disabled", false);
        				}
    				}
    				
    				boslastsel = rowid;
    			} 
         	},
         	gridComplete	: function() {
				
			}
    	});		 
		
		$("#gridBOS").jqGrid('navGrid', "#gridBOS_pager",
			{refresh: true, edit:false, add:false, del:false, search: true, view: true, excel:true}
		);	
	}
	
	function cSearch(currentPage) {

		var page = $("#gridModule").getGridParam("page");
		var rowNum = $("#gridModule").getGridParam("rowNum");		
		var param = {
			  MATL_CD_ST: $("#MATL_CD_ST").val()
		    , MATL_NM_ST: $("#MATL_NM_ST").val()
		    , CURRENT_PAGE: page
		    , ROWS_PER_PAGE: rowNum
		}
		
		var url = "<c:url value="/external/module/selectModuleList.do" />";	
		
		fn_ajax(url, true, param, function(data, xhr) {			
			if (!fn_empty(data)) {
				reloadGrid("gridModule", data.result);				
				btGrid.gridQueryPaging($('#gridModule'), 'cSearch', data.result);
			} 			
		});
	}
	
	
	function bosSearch(currentPage, rowid) {	
		
		var param = {
			  MATL_CD_ST: $("#MATL_CD_ST2").val()
		    , MATL_NM_ST: $("#MATL_NM_ST2").val()
		    , CURRENT_PAGE: $("#gridBOS").getGridParam("page")
		    , ROWS_PER_PAGE: $("#gridBOS").getGridParam("rowNum")
		}	
		
		var url = "<c:url value="/external/module/selectBOSList.do" />";
		
		fn_ajax(url, true, param, function(data, xhr) {			
			if (!fn_empty(data)) {
				reloadGrid("gridBOS", data.result);
				btGrid.gridQueryPaging($('#gridBOS'), 'bosSearch', data.result);
			} 			
		});
	}
	

	//공통버튼 - 엑셀 다운 클릭
	function cExcel() {
		if (confirm('입력한 조회 조건의 내역을 엑셀 저장하시겠습니까?') == true) { 
			
			var colNms = excelToMap();
			var param = {
				  MATL_CD_ST: $("#MATL_CD_ST").val()
			    , MATL_NM_ST: $("#MATL_NM_ST").val()
			    , COL_NM: colNms
			}
	
			var url = "<c:url value="/external/material/selectModuleListAll.do" />";
			fn_formSubmit(url, param);
			
		};
	}
	
	function excelToMap() {
		
		var colNms = $("#gridModule").jqGrid('getGridParam','colNames');
		var colid = $("#gridModule")[0].p.colModel;
		var _string =  '%' ;
		for(var i= 0 ; i < colid.length; i++) {
			if(colid[i].name != "CHK"){
				if(i == (colid.length -1)) {
					 _string += ''+colid[i].name+':'		+ colNms[i] +'';
				}else  _string += ''+colid[i].name+':'		+ colNms[i] +',';
			}
		}
		var colNms2 = $("#gridMaterial").jqGrid('getGridParam','colNames');
		var colid2 = $("#gridMaterial")[0].p.colModel;
		
		for(var i= 0 ; i < colid2.length; i++) {
			if(colid2[i].name != "CHK"){
				if(i == (colid2.length -1)) {
					 _string += ''+colid2[i].name+':'		+ colNms2[i] +'';
				}else  _string += ''+colid2[i].name+':'		+ colNms2[i] +',';
			}
		}
		_string +=  '%' ;
		return _string;
	}
		
	// initialize control
	function initializeControl () {
		var codeBoxArray = [
    			  'PLANT_CD'
    			, 'BOM_USAGE'
    	];
		// set select box      				
		createCodeBoxByArr(codeBoxArray, true);
		
		$('#MATL_CD_ST').focus();
		$("#PLANT_CD").val('1000');
		$("#BOM_USAGE").val('5');
		
		// create grid
		createModuleGrid();
		createBOSGrid();
	}


	
	
	//초기 로드
	$(function() {
		
		setCommBtn('Search', true);				
		initLayout();
		initializeControl();
		
		$('#MATL_CD_ST, #MATL_NM_ST').on('keyup', function (e) {
			if(e.which == 13){
				cSearch();
			}
		});
		
		$("#btnModuleSearch").bind("click", function () {
			cSearch();
		});
		
		// bos 추가 팝업 호출
		$("#btnBosAdd").bind("click", function () {
			bosPopUpOpen();	
		});
		// module 추가 팝업 호출
		$("#btnModuleAdd").bind("click", function () {
			modulePopUpOpen();
		});
		// register module
		$("#btnModuleSave").bind("click", function () {
			saveModule();
		});
		// remove module		
		$("#btnModuleRemove").bind("click", function () {
			if (confirm('<s:message code="confirm.delete"/>')) {
				removeModule();				
			}
		})
		// register BOS
		$("#btnBosSave").bind("click", function () {
			saveBOS();
		});
		// remove BOS
		$("#btnBosRemove").bind("click", function () {
			if (confirm('<s:message code="confirm.delete"/>')) {
				removeBOS();
			}
		});
		
		$("#btnBosSearch").bind("click", function () {			
			bosSearch();
		});
		
		$(window).bind('resize', function(event) {	
			setTimeout(function () {
				$("#gridBOS").setGridWidth($(window).width()-14 , false);	
			}, 100);
		}).trigger("resize");
	});
	
	
</script>
<c:import url="../import/frameBottom.jsp" />