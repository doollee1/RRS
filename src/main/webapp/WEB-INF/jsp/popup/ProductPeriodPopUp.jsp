<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="BAS_YY" id="BAS_YY" />
		<input type="hidden" name="BAS_YY_SEQ" id="BAS_YY_SEQ" />
		<input type="hidden" name="PROD_SEQ" id="PROD_SEQ" />
	</form>
</div>

<div id="productPeriodPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divBtn">
			<button class='btn btn-default ' id='cBtnSearch' type='button' onclick=''>조회</button>
			<button class="btn btn-default" id="btn_save"><s:message code='button.save'/></button>
			<button class="btn btn-default" id="btn_del"><s:message code='button.delete'/></button>
<!--          <button class='btn btn-default ' id='cBtnAdd' type='button' onclick='cAdd()'>등록</button> -->
			<button class='btn btn-default ' id='cBtnCancel' type='button' onclick=''>닫기</button>
		</div>
	</div>
   
	<!---------->
	<div class="ct_grid_top_left">
		<h4>조회조건</h4>
	</div>   
	<div class="tab_top_search">
		<table>
			<colgroup>
				<col width="100px" />
				<col width="200px" />
			</colgroup>
			 
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="product.baseyear"/></p></td>
					<td>
						<select id="BAS_YY_PP" name="BAS_YY_PP" class="cmc_combo" style=width:80%;>
						<c:forEach var="i" items="${basyy}">
	     					<option value="${i.BAS_YY}">${i.BAS_YY}</option>
						</c:forEach>
			         </select>
			      </td>
			   </tr>
			</tbody>
		</table>
	</div> 
   
	<!-- grid start -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4>조회내역</h4>
			</div>   
			<div class="ct_grid_top_right">
				<button class='btn btn-default cBtnclass cBtnCopy_style' id='cBtnCopy' style="align:right" type='button' onclick='cCopy()'>복사등록</button>
				<button class="btn btn-default" id="btn_addRow" style="align:right" ><i class="fa fa-plus-square-o"></i><s:message code='button.addRow'/></button>
				<button class="btn btn-default" id="btn_delRow" style="align:right" ><i class="fa fa-plus-square-o"></i><s:message code='button.delRow'/></button>
			</div>
		</div>
		<table id="periodGrid"></table>
	</div>
	<!-- grid end -->
	<br>
</div>

<script type="text/javascript">
$(function(){
	$('#productPeriodPopUp').dialog({
		title: '<s:message code="product.pop_period"/>',
		autoOpen: false,
		height: 'auto',
		width: 750,
		modal: true,
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		},
		open: function() {
			createGrid();
			cSearch();
			
			/* 그리드 이벤트
			$('#periodGrid').jqGrid('setGridParam', {
				  onSelectRow: function(rowid, iRow, iCol, e) {
					  periodGrid_onSelRow(rowid, iRow, iCol, e);
				  }
			}); 
			
			$('#periodGrid').jqGrid('setGridParam', {
				ondblClickRow: function(rowid, iRow, iCol, e) {
					periodGrid_ondblClickRow(rowid, iRow, iCol, e);
				}
			});
			*/
		},
	});
	
	//조회
	function cSearch(currentPage){
		var url = "/product/selectPeriodInfo.do";
		
		var formData = formIdAllToMap('frmProductPeriod');
		var param = {"BAS_YY" : $("#BAS_YY_PP").val()};
		
		fn_ajax(url, false, param, function(data, xhr){
			$.each(data.result , function(i , val){
				val.STATUS_P = "R";
// 				val.ST_DT1 = val.ST_DT1.substr(0, 4) + "-" + val.ST_DT1.substr(4, 2) + "-" + val.ST_DT1.substr(6, 2);
// 				val.ED_DT1 = val.ED_DT1.substr(0, 4) + "-" + val.ED_DT1.substr(4, 2) + "-" + val.ED_DT1.substr(6, 2);
// 				if(val.ST_DT2 != undefined && val.ED_DT2 != undefined){
// 					val.ST_DT2 = val.ST_DT2.substr(0, 4) + "-" + val.ST_DT2.substr(4, 2) + "-" + val.ST_DT2.substr(6, 2);
// 					val.ED_DT2 = val.ED_DT2.substr(0, 4) + "-" + val.ED_DT2.substr(4, 2) + "-" + val.ED_DT2.substr(6, 2);
// 				}
// 				if(val.ST_DT3 != undefined && val.ED_DT3 != undefined){
// 					val.ST_DT3 = val.ST_DT3.substr(0, 4) + "-" + val.ST_DT3.substr(4, 2) + "-" + val.ST_DT3.substr(6, 2);
// 					val.ED_DT3 = val.ED_DT3.substr(0, 4) + "-" + val.ED_DT3.substr(4, 2) + "-" + val.ED_DT3.substr(6, 2);
// 				}
			});
			reloadGrid("periodGrid", data.result);
			var colModel = $("#periodGrid").jqGrid('getGridParam', 'colModel'); 
			for(var i =0; i < data.result.length; i++){
				jQuery("#periodGrid").setCell(i+1);
			};
			
			btGrid.gridResizing('periodGrid');
		});
		
		//조회결과 없을 시 비활성화 및 alert
		if($("#BAS_YY_PP").val() == ""){
			$("#BAS_YY_PP").attr("disabled", true);
			$("#cBtnSearch").attr("disabled", true);
			alert("년도별 기간관리를 마저 등록해 주세요.");
		};
	};
	
	$("#BAS_YY_PP").change(function(){
		$("#cBtnSearch").attr("disabled", false);
	});
	
	//그리드 그리기
	function createGrid(){
		var url = "/product/productSeasonList.do";
		var param = {};
		var obj = new Object();
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.selectList , function(i , v){
				if (v.CODE == "3"){
					return;
				} else {
					obj[v.CODE] = v.CODE_NM;
				} 
			});
			
			$("#periodGrid").setColProp('SSN_GBN', { editoptions: { value:obj}});
		 });
		
		 var colName = ['<s:message code="product.season"/>',
						'<s:message code="product.stdt1"/>',
						'<s:message code="product.eddt1"/>',
						'<s:message code="product.stdt2"/>',
						'<s:message code="product.eddt2"/>',
						'<s:message code="product.stdt3"/>',
						'<s:message code="product.eddt3"/>',
						'BAS_YY',
						'BAS_YY_SEQ',
						'STATUS_P'
						];
		
		var colModel = [
			{ name: 'SSN_GBN',  width : 5, align: 'center', editable:true , edittype:"select"},
			{ name: 'ST_DT1', width: 7, align: 'center', editable:true, 
				editoptions:{
					dataInit: function(element){
						$(element).keyup(function(){
							var val1 = element.value;
							var num = new Number(val1);
							if(isNaN(num)){
								alert("숫자만 입력 가능합니다.");
								element.value = ''; 
							}
						})
					}, maxlength:8
			   }
			},
			{ name: 'ED_DT1', width: 7, align: 'center', editable:true,
				editoptions:{
					dataInit: function(element){
						$(element).keyup(function(){
						   var val1 = element.value;
						   var num = new Number(val1);
						   if(isNaN(num)){
							   alert("숫자만 입력 가능합니다.");
							   element.value = ''; 
						   }
						})
				   }, maxlength:8
			   }
			},
			{ name: 'ST_DT2', width: 7, align: 'center', editable:true,
		      editoptions:{
		         dataInit: function(element){
		            $(element).keyup(function(){
		               var val1 = element.value;
		               var num = new Number(val1);
		               if(isNaN(num)){
		                  alert("숫자만 입력 가능합니다.");
		                  element.value = ''; 
		               }
		                })
		         }, maxlength:8
		      }
			},
			{ name: 'ED_DT2', width: 7, align: 'center', editable:true,
				editoptions:{
					dataInit: function(element){
						$(element).keyup(function(){
							var val1 = element.value;
							var num = new Number(val1);
							if(isNaN(num)){
								alert("숫자만 입력 가능합니다.");
								element.value = ''; 
							}
						})
					}, maxlength:8
				}
			},
			{ name: 'ST_DT3', width: 7, align: 'center', editable:true,
				editoptions:{
					dataInit: function(element){
						$(element).keyup(function(){
							var val1 = element.value;
							var num = new Number(val1);
							if(isNaN(num)){
								alert("숫자만 입력 가능합니다.");
								element.value = ''; 
							}
						 })
					}, maxlength:8
				}
			},
			{ name: 'ED_DT3', width: 7, align: 'center', editable:true,
				editoptions:{
					dataInit: function(element){
						$(element).keyup(function(){
							var val1 = element.value;
							var num = new Number(val1);
							if(isNaN(num)){
								alert("숫자만 입력 가능합니다.");
								element.value = ''; 
							}
						})
					}, maxlength:8
				}
			},
			{ name: 'BAS_YY', width : 100, align: 'center', hidden:true, editoptions:{readonly: true}},
			{ name: 'BAS_YY_SEQ', width : 100, align: 'center', hidden:true, editoptions:{readonly: true}},
			{ name: 'STATUS_P', width : 100, align: 'center', hidden:true, editoptions:{readonly: true}}
			];
		
		var gSetting = {
			height:200,
			pgflg:false,
			exportflg : false,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : false,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:false // 쿼리 페이징 처리 여부     

		};
		btGrid.createGrid('periodGrid', colName, colModel, gSetting);
			  
	}
	
	$(".withComma").on("keyup" , function(){
		var tmpValue = $(this).val().replace(/[^0-9,]/g,'');
		tmpValue = tmpValue.replace(/[,]/g,'');
		// 천단위 콤마 처리 후 값 강제변경
	    $(this).val(numberWithCommas(tmpValue));
	});
	
	//조회 버튼
	$("#cBtnSearch").on("click", function(){
		cSearch();
	});
	
	//닫기 버튼
	$("#cBtnCancel").on("click", function(){
		$('#productPeriodPopUp').dialog('close');
	});
	
	//행추가
	$("#btn_addRow").on("click" , function(){
		btGrid.gridSaveRow('periodGrid');
		var rowId = $('#periodGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#periodGrid").getRowData(rowId);
		var data = {
				"BAS_YY" : $("#BAS_YY_PP").val(),
				"BAS_YY_SEQ" : rowData["BAS_YY_SEQ"],
				"STATUS_P" : "I"
			};
		btGrid.gridAddRow("periodGrid", "last", data);
	});
   
	//행삭제
	$("#btn_delRow").on("click" , function(){
		var rowId =$("#periodGrid").jqGrid('getGridParam','selrow');
		var args = "";
		if (rowId == null) {
			args = '<s:message code='title.row'/>';
				alert("<s:message code='errors.selectdel' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
		}else{
			var grdData = $("#periodGrid").jqGrid("getCell", rowId, "STATUS_P");
			if(grdData != 'I'){
				alert("<s:message code='errors.statusR' javaScriptEscape='false'/>"); 
				return;
			} else {
				$("#periodGrid").jqGrid("delRowData",rowId);
			}
		}
	});
   
	//저장버튼
	$("#btn_save").on("click" , function(){
		btGrid.gridSaveRow('periodGrid');
		var gridData  = $("#periodGrid").getRowData();
		var ids = $("#periodGrid").jqGrid("getDataIDs");
		var gridDataChk = [];
		var cnt = 0;
		
		for(var i = 0; i < ids.length; i++){
			var saveSsn = $("#periodGrid").jqGrid('getCell', ids[i] ,'SSN_GBN');
			
			if(saveSsn == "시즌"){
				$("#periodGrid").jqGrid('setCell' , ids[i] , 'SSN_GBN' , 1);
			} else if (saveSsn == "비시즌"){
				$("#periodGrid").jqGrid('setCell' , ids[i] , 'SSN_GBN' , 2);
			}
			
			gridDataChk.push($("#periodGrid").getRowData(ids[i]));
		}

		var args = '';
		$.each(gridData , function(i , json){
			$.each(json, function(k , value){

				if(k == "STATUS_P" && json[k] != 'R'){
					cnt++;
					return;
				}
				
			});
		});
		
		if(cnt == 0){
			alert("<s:message code='errors.noChange' javaScriptEscape='false'/>");
			cSearch();
			return;
		}
		
		for(var i = 0; i < gridDataChk.length; i++){
			if(fn_empty(gridDataChk[i]["SSN_GBN"])){
				args = '<s:message code="product.season"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			if(fn_empty(gridDataChk[i]["ST_DT1"]) ){
				args = '<s:message code="product.stdt1"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			if(fn_empty(gridDataChk[i]["ED_DT1"])){
				args = '<s:message code="product.eddt1"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			
			if((fn_empty(gridDataChk[i]["ST_DT2"]) && !fn_empty(gridDataChk[i]["ED_DT2"])) ||
				(!fn_empty(gridDataChk[i]["ST_DT2"]) && fn_empty(gridDataChk[i]["ED_DT2"]))){
				alert("시작일2 및 종료일2를 입력해주세요.");
				cSearch();
				return;
			} 
			
			if((fn_empty(gridDataChk[i]["ST_DT3"]) && !fn_empty(gridDataChk[i]["ED_DT3"])) ||
				(!fn_empty(gridDataChk[i]["ST_DT3"]) && fn_empty(gridDataChk[i]["ED_DT3"]))){
				alert("시작일3 및 종료일3을 입력해주세요.");
				cSearch();
				return;
			} 
			
			if(gridDataChk[i]["ST_DT1"] >= gridDataChk[i]["ED_DT1"]){
				alert("종료일은 시작일과 같거나 과거일 수 없습니다.");
				cSearch();
				return;
			}
			
			if(!fn_empty(gridDataChk[i]["ST_DT2"]) && !fn_empty(gridDataChk[i]["ED_DT2"])){
				if (gridDataChk[i]["ST_DT2"] <= gridDataChk[i]["ED_DT1"]) {
					alert("시작일2는 종료일1보다 과거일 수 없습니다..")
					cSearch();
					return;
				} else if (gridDataChk[i]["ST_DT2"] >= gridDataChk[i]["ED_DT2"]) {
					alert("종료일2는 시작일2와 같거나 과거일 수 없습니다.")
					cSearch();	
					return;
				}
			}
			
			if(!fn_empty(gridDataChk[i]["ST_DT3"]) && !fn_empty(gridDataChk[i]["ED_DT3"])){
				if (gridDataChk[i]["ST_DT3"] <= gridDataChk[i]["ED_DT2"]) {
					alert("시작일3은 종료일2보다 과거일 수 없습니다.")
					cSearch();
					return;
				} else if (gridDataChk[i]["ST_DT3"] >= gridDataChk[i]["ED_DT3"]) {
					alert("종료일3은 시작일2와 같거나 과거일 수 없습니다.")
					cSearch();	
					return;
				}
			}
		}
		
		var url = '/product/savePeriodInfo.do';
		var param = {"detail"      : gridDataChk
					,"BAS_YY"      : $("#BAS_YY_PP").val()
					};
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.SAVE == 'N'){
					alert("<s:message code='errors.dup' javaScriptEscape='false'/>");
					cSearch();
				}else{
					alert("<s:message code='info.save'/>");
					cSearch();
				}
			});
		}
	});
   
	//삭제 버튼
	$("#btn_del").on("click" , function(){
		var rowId =$("#periodGrid").jqGrid('getGridParam','selrow');
		var args    = "";
		if(rowId == "" || rowId == null){
			alert("<s:message code='errors.selectdel' arguments='행(을)' javaScriptEscape='false'/>");
			return;
		}
		var grdData = $("#periodGrid").jqGrid("getCell", rowId, "STATUS_P");
		var selBas = $("#periodGrid").jqGrid("getCell", rowId, "BAS_YY");
		var selSeq = $("#periodGrid").jqGrid("getCell", rowId, "BAS_YY_SEQ");
		
		if(grdData == 'I'){
			alert("<s:message code='errors.statusI' javaScriptEscape='false'/>"); 
			return;
		}
		
		var param = {
					 "BAS_YY"       : selBas
					,"BAS_YY_SEQ"    : selSeq
					}
		var url = "/product/deletePeriodInfo.do"
		
		if(confirm("<s:message code='confirm.delete'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				alert("<s:message code='product.info.delete'/>");
				cSearch();      
			});
		}
	});
   
	$("#periodGrid").bind("change , keyup" , function(){
		var changeRowId  = $('#periodGrid').jqGrid('getGridParam', 'selrow');
		var rowCnt       = $('#periodGrid').getGridParam('reccount');
		var ids          = $('#periodGrid').jqGrid('getDataIDs');
		
		if($('#periodGrid').jqGrid('getRowData', changeRowId).STATUS_P != "I"){
			$("#periodGrid").jqGrid('setCell',changeRowId , 'STATUS_P', 'U');
		}
	});
});

function periodGrid_onSelRow(rowid, iRow, iCol, e){
}

/*
//그리드 더블클릭 - 상세조회
function periodGrid_ondblClickRow(rowid, iRow, iCol, e){
	var rowId =$("#periodGrid").jqGrid('getGridParam','selrow');
	var grdData = $("#periodGrid").jqGrid("getCell", rowId, "STATUS_P");
	
	if(grdData != 'I'){
		var gridData = $("#periodGrid").getRowData(rowid);
		var formData = formIdAllToMap('frmProductPeriod');
		var param = {
			"modify" : true,
			"BAS_YY" : gridData["BAS_YY"],            // 기준년도
			"BAS_YY_SEQ" : gridData["BAS_YY_SEQ"],      // 기준년도 순번
			"SSN_GBN" : gridData["SSN_GBN"],         // 시즌구분
			"ST_DT1" : gridData["ST_DT1"],            // 시작일1
			"ED_DT1" : gridData["ED_DT1"],            // 종료일1
			"ST_DT2" : gridData["ST_DT2"],            // 시작일2
			"ED_DT2" : gridData["ED_DT2"],            // 종료일2
			"ST_DT3" : gridData["ST_DT3"],            // 시작일3
			"ED_DT3" : gridData["ED_DT3"],            // 종료일3
		};
		productPeriodDetailPopUp(param);
	}
}
*/

/*
//등록 버튼
function cAdd(){
	productPeriodDetailPopUp();
}
*/

/*
//상세조회 및 등록 팝업
function productPeriodDetailPopUp(param){
	var url = "/popup/ProductPeriodDetailPopUp.do";
	var pid = "productPeriodDetailPopUp";  //팝업 페이지의 최상위 div ID
	
	popupOpen(url, pid, param, function(data) {
		cSearch();
	});
}
*/

//복사등록 팝업
function cCopy(param){
	var url = "/popup/ProductCopyPopUp.do";
	var pid = "productCopyPopUp";   //팝업 페이지의 최상위 div ID
	var formData = formIdAllToMap('frmProductPeriod');
	var param = { 
		"branch" : "period",
		"P_BAS_YY" : $("#BAS_YY_PP option:eq(0)").val()
	};
	
	popupOpen(url, pid, param, function(data){
		if(data.BAS_YY != ""){
			$('#productPeriodPopUp').dialog('close');
			
			var url = "/popup/ProductPeriodPopUp.do";
			var pid = "productPeriodPopUp";   //팝업 페이지의 최상위 div ID
			var param = {"BAS_YY_PP" : data.BAS_YY};
			
			popupOpen(url, pid, param, function(data){
			});
		};
	});
};

function validation(){
}

</script>