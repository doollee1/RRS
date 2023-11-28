<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : ReserveRegiPopup
 */
%>
<style>
.pbtn_default {margin: 0 3px -1px 5px;padding: 3px 10px 3px 10px;border: 1px solid #a9cbeb !important;background: #bdd6ee !important;color: #2269b1;}
</style>

<div id="p_invoicePopup">
    <div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
		<div id="divBtn">
			<button class="btn btn-default" id="btn_preview"><i class="fa fa-cube"></i><s:message code='button.preview'/></button>
			<button class="btn btn-default" id="btn_send"><i class="fa fa-phone"></i><s:message code='button.send'/></button>
			<%-- <button class="btn btn-default" id="btn_modify"><i class="fa fa-edit"></i><s:message code='button.modify'/></button> --%>
			<button class="btn btn-default" id="btn_save"><i class="fa fa-save"></i><s:message code='button.save'/></button>
			<button class="btn btn-default" id="btn_add"><i class="fa fa-plus-square-o"></i><s:message code='button.add'/></button>
			<button class="btn btn-default" id="btn_del"><i class="fa fa-trash"></i><s:message code='button.delete'/></button>
		</div>
	</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_wrap">
			<table id="invoiceGrid"></table>
			<div id="PartnerSchGrid_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script type="text/javascript">
$(function() {
	var seq;
	var req_dt;
	$('#p_invoicePopup').dialog({
		title :'<s:message code='invoice.invoiceTitle'/>',
		autoOpen : false,
		height: 'auto',
		width: 1076.4,
		modal : true,
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			createGrid();
			seq    = $(this).data("SEQ");
			req_dt =  $(this).data("REQ_DT");
			cSearch();
			gridColspan();
		}
	});
	
	function cSearch(currentPage){
		var url = "/reserve/invoiceSelectList.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"SEQ" : seq
				   , "REQ_DT" : req_dt
				   };
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.result , function(i , val){
				val.TOT_AMT = parseInt(val.TOT_AMT).toLocaleString();
				val.PER_AMT = parseInt(val.PER_AMT).toLocaleString();
				val.STATUS_V = "R";
			})
			reloadGrid("invoiceGrid", data.result);
			
			var colModel = $("#invoiceGrid").jqGrid('getGridParam', 'colModel'); 
			for(var i =0; i < data.result.length; i++){
				jQuery("#invoiceGrid").setCell(i+1);
			}
		});
	}
	
	function gridColspan(){
		var newWidth1 = $("#jqgh_invoiceGrid_USE_DAY").width() + $("#jqgh_invoiceGrid_UNIT_DAY").width();
		$('#invoiceGrid').jqGrid("setLabel", "USE_DAY", "사용 일/횟수", "", {
		    style: "width: " + newWidth1,
		    colspan: "2"
		});
		$('#invoiceGrid').jqGrid("setLabel", "UNIT_DAY", "", "", {style: "display: none"});
		
		var newWidth2 = $("#jqgh_invoiceGrid_USE_NUM").width() + $("#jqgh_invoiceGrid_UNIT_NUM").width();
		$('#invoiceGrid').jqGrid("setLabel",	 "USE_NUM", "사용 명/갯수", "", {
		    style: "width: " + newWidth2,
		    colspan: "2"
		});
		$('#invoiceGrid').jqGrid("setLabel", "UNIT_NUM", "", "", {style: "display: none"});
	}
	
	function createGrid(){
		var colName = [
						  '<s:message code="invoice.seq"/>'
						, '<s:message code="invoice.order"/>'
						, '<s:message code="invoice.item_cd"/>'
						, '<s:message code="invoice.item_nm"/>'
						, '<s:message code="invoice.amt_sign"/>'
						, '<s:message code="invoice.per_amt"/>'
						, '<s:message code="invoice.use_day"/>'
						, '횟수단위'
						, '<s:message code="invoice.use_amt"/>'
						, '수량단위'
						, '<s:message code="invoice.tot_amt"/>'
						, '<s:message code="invoice.reg_dtm"/>'
						, '<s:message code="invoice.upd_dtm"/>'
						, 'STATUS_V'
					];

		var colModel = [
						  { name: 'SEQ',      width : 70 , align: 'center' , editoptions:{readonly: true}}
						, { name: 'ORDER',    width : 70 , align: 'center' , editable:true, editoptions:{dataInit: function(element) {
			                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }
						      }
						  }
						, { name: 'ITEM_CD',  width : 150, align: 'center' , editable:true, edittype:"select" ,  editoptions:{value:'${selectList}'}}
						, { name: 'ITEM_NM',  width : 150, align: 'center' , editable:true, editoptions:{maxlength:100}}
						, { name: 'AMT_SIGN', width : 50 , align: 'center' , editable:true, edittype:"select" ,  editoptions:{value:{'$':'$','&#8361;':'&#8361;'}}} 
						, { name: 'PER_AMT',  width : 70 , align: 'center' , editable:true, editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }
				              }
                           } 
						, { name: 'USE_DAY',  width : 30 , align: 'center' , editable:true,editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }
				              }
                           }
						, { name: 'UNIT_DAY', width : 50 , align: 'center'  , editable:true, edittype:"select" ,  editoptions:{value:{1:'일',2:'회'}}}
						, { name: 'USE_NUM'	,  width : 30 , align: 'center' , editable:true, editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }
				              }
                           }
						, { name: 'UNIT_NUM', width : 50 , align: 'center' ,  editable:true,edittype:"select" ,  editoptions:{value:{1:'개',2:'명'}}}
						, { name: 'TOT_AMT',  width : 100, align: 'center' ,  editoptions:{readonly: true}}
						, { name: 'REG_DTM',  width : 100, align: 'center' ,  editoptions:{readonly: true}}
						, { name: 'UPD_DTM',  width : 100, align: 'center' ,  editoptions:{readonly: true}}
						, { name: 'STATUS_V',  width : 100, align: 'center',  hidden : true ,editoptions:{readonly: true}}
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
				height : 487
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('invoiceGrid', colName, colModel, gSetting);
	}
	
	$("#btn_add").on("click" , function(){
		btGrid.gridSaveRow('invoiceGrid');
		var rowId = $('#invoiceGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#invoiceGrid").getRowData(rowId);
		var data = {"SEQ" : seq  , "STATUS_V" : "I"};
		btGrid.gridAddRow("invoiceGrid", "last", data);
	});
	
	$("#btn_save").on("click" , function(){
		btGrid.gridSaveRow('invoiceGrid');
		var gridData  = $("#invoiceGrid").getRowData();
		$.each(gridData , function(i , json){
			$.each(json, function(k , value){
				if(k == "SEQ" || k == "PER_AMT" || k == "USE_DAY" || k == "USE_NUM" || k == "TOT_AMT"){
					if(k == "PER_AMT" || k == "TOT_AMT") json[k] = parseInt(value.replaceAll("," , ""));
					else                                 json[k] = parseInt(value);
				}
			});
		});
		
		var url = '/reserve/saveInvoiceManager.do';
		var param = {"detail"   : gridData
				   , "SEQ"      : seq 
				   , "REQ_DT"   : req_dt
				   };
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					cSearch();
				}
			});
		}
	});
	
	$("#btn_del").on("click" , function(){
		var rowId = $('#invoiceGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#invoiceGrid").getRowData(rowId);
		if(rowId == "" || rowId == null){
    		alert("<s:message code='errors.selectdel' arguments='행(을)' javaScriptEscape='false'/>");
			return;
		}
		param = { "REQ_DT"  : req_dt
				, "SEQ"     : seq
				, "ITEM_CD" : $("#"+rowId+"_ITEM_CD").val()
		        }
		if(confirm("<s:message code='confirm.delete'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.resultCd == "-1"){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='success.sendemail'/>");
					cSearch();
				}
			});
		}
	});
	
	$("#invoiceGrid").bind("change , keyup" , function(){
		var changeRowId = $('#invoiceGrid').jqGrid('getGridParam', 'selrow');
		if($('#invoiceGrid').jqGrid('getRowData', changeRowId).STATUS_V != "I"){
			$("#invoiceGrid").jqGrid('setCell',changeRowId , 'STATUS_V', 'U');
		}
		var per_amt = $("#"+changeRowId+"_PER_AMT").val();// == undefined ? $(this).jqGrid('getCell', changeRowId ,"PER_AMT") : $("#"+changeRowId+"_PER_AMT").val();
		var use_day = $("#"+changeRowId+"_USE_DAY").val();// == undefined ? $(this).jqGrid('getCell', changeRowId ,"USE_DAY") : $("#"+changeRowId+"_USE_DAY").val();
		var use_num = $("#"+changeRowId+"_USE_NUM").val();// == undefined ? $(this).jqGrid('getCell', changeRowId ,"USE_NUM") : $("#"+changeRowId+"_USE_NUM").val();
		var tot_amt = parseInt(per_amt.replaceAll("," , "")) * parseInt(use_day.replaceAll("," , "")) * parseInt(use_num.replaceAll("," , ""));
		if(per_amt != "" && use_day != "" && use_num != ""){
			$(this).jqGrid('setCell' , changeRowId , 'TOT_AMT' , tot_amt.toLocaleString());
		}else{
			$(this).jqGrid('setCell' , changeRowId , 'TOT_AMT' , 0);
		}
	});
});

</script>