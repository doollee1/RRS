<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%
/**
 * @Name : invoicePopup
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
			<button class="btn btn-default" id="btn_preview" onclick='cExcelSample(this);'><i class="fa fa-cube"></i><s:message code='button.preview'/></button>
			<button class="btn btn-default" id="btn_send"    onclick='cExcelSample(this);'><i class="fa fa-phone"></i><s:message code='button.send'/></button>
			<button class="btn btn-default" id="btn_save"><i class="fa fa-save"></i><s:message code='button.save'/></button>
			<button class="btn btn-default" id="btn_del"><i class="fa fa-trash"></i><s:message code='button.delete'/></button>
            <button class="btn btn-default" id="btn_close"><i class="fa fa-close"></i><s:message code='button.close'/></button>
            <br><br>
            <p style="text-align:right">
            <button class="btn btn-default" id="btn_addRow" style="align:right" ><i class="fa fa-plus-square-o"></i><s:message code='button.addRow'/></button>
            <button class="btn btn-default" id="btn_delRow" style="align:right" ><i class="fa fa-plus-square-o"></i><s:message code='button.delRow'/></button>
            </p>
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
	var mem_gbn;
	var email;
	
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
			seq     = $(this).data("SEQ");
			req_dt  = $(this).data("REQ_DT");
			mem_gbn = $(this).data("MEM_GBN");
			email   = $(this).data("EMAIL");
			createGrid();
			
			//gridColspan();
			cSearch();
		}
	});
	
	function cSearch(currentPage){
		var url = "/reserve/invoiceSelectList.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"SEQ"     : seq
				   , "REQ_DT"  : req_dt
				   , "MEM_GBN" : mem_gbn
				   };
		fn_ajax(url, true, param, function(data, xhr){
			
			$.each(data.result , function(i , val){
				//val.TOT_AMT = parseInt(val.TOT_AMT).toLocaleString();
				//val.PER_AMT = parseInt(val.PER_AMT).toLocaleString();
				val.STATUS_V = "R";
			});
			
			reloadGrid("invoiceGrid", data.result);

			var colModel = $("#invoiceGrid").jqGrid('getGridParam', 'colModel'); 
			for(var i =0; i < data.result.length; i++){
				jQuery("#invoiceGrid").setCell(i+1);
			}

			btGrid.gridResizing('invoiceGrid');
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
		
		btGrid.gridResizing('grid1');
	}
	
	function createGrid(){
		var url = "/reserve/invoiceItemList.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"MEM_GBN" : mem_gbn
				   };
		var obj = new Object();
		obj +=":;";
		
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.selectList , function(i , v){
				if (!v.CODE) {
					return;
				}
				obj += v.CODE + ':'+ v.CODE_NM + ';';
			});
			obj = obj.substr(0, obj.length-1);
			
			$("#invoiceGrid").setColProp('ITEM_CD', {  formatter : "select", editoptions: { value:obj}});
	    });
		
		var colName = [
						  '<s:message code="invoice.seq"/>'
						, '<s:message code="invoice.order"/>'
						, '<s:message code="invoice.item_cd"/>'
						, '<s:message code="invoice.item_nm"/>'
						, '<s:message code="invoice.amt_sign"/>'
						, '<s:message code="invoice.per_amt"/>'
						, '<s:message code="invoice.use_day"/>'
						, '<s:message code="invoice.use_unit"/>'
						, '<s:message code="invoice.use_num"/>'
						, '<s:message code="invoice.num_unit"/>'
						, '<s:message code="invoice.tot_amt"/>'
						, '<s:message code="invoice.reg_dtm"/>'
						, '<s:message code="invoice.upd_dtm"/>'
						, 'PREV_ITEM_CD'
						, 'PREV_ORDER'
						, 'STATUS_V'
					];

		var colModel = [
						  { name: 'SEQ',      width : 1 , align: 'center' , hidden : true, editoptions:{readonly: true}}
						, { name: 'ORDER',    width : 50 , align: 'center' , editable:true, editoptions:{dataInit: function(element) {
			                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }, maxlength:5
						      }
						  }
						, { name: 'ITEM_CD',  width : 120, align: 'left'   , editable:true , edittype:"select", formatter : "select"}
						, { name: 'ITEM_NM',  width : 120, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'AMT_SIGN', width : 50 , align: 'center' , editable:true, edittype:"select" ,  editoptions:{value:{"￦" : "￦" , "$" : "$"}}} 
						, { name: 'PER_AMT',  width : 70 , align: 'right' , editable:true, formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }, maxlength:15 
				              }
                           } 
						, { name: 'USE_DAY',  width : 60 , align: 'center' , editable:true,editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }, maxlength:5
				              }
                           }
						, { name: 'UNIT_DAY', width : 50 , align: 'center'  , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${REF_CHR3}'}}
						, { name: 'USE_NUM'	,  width : 60 , align: 'center' , editable:true, editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("Please enter a valid number");
				                  element.value = ''; }
				                })
				               }, maxlength:5
				              }
                           }
						, { name: 'UNIT_NUM', width : 50 , align: 'center' ,  editable:true,edittype:"select" , formatter : "select",  editoptions:{value:'${REF_CHR4}'}}
						, { name: 'TOT_AMT',  width : 120, align: 'right' ,  formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{readonly: true}}
						, { name: 'REG_DTM',  width : 140, align: 'center' ,  editoptions:{readonly: true}}
						, { name: 'UPD_DTM',  width : 140, align: 'center' ,  editoptions:{readonly: true}}
						, { name: 'PREV_ITEM_CD',  width : 100, align: 'center',  hidden : true ,editoptions:{readonly: true}}
						, { name: 'PREV_ORDER',  width : 100, align: 'center',  hidden : true ,editoptions:{readonly: true}}
						, { name: 'STATUS_V',  width : 100, align: 'center',  hidden : true ,editoptions:{readonly: true}}
						
					];
		
		var gSetting = {
		        pgflg:false,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : false,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: false,
				autowidth: true,
				queryPagingGrid:false, // 쿼리 페이징 처리 여부
				height : 200
		};
		
		// 그리드 생성 및 초기화
		btGrid.createGrid('invoiceGrid', colName, colModel, gSetting);
		
		$('#invoiceGrid').jqGrid('setGroupHeaders', {
			useColSpanStyle: true, 
			groupHeaders:[
				{startColumnName: 'USE_DAY', numberOfColumns: 4, titleText: '사용'},
				]
		});
	}
	
	$("#btn_addRow").on("click" , function(){
		btGrid.gridSaveRow('invoiceGrid');
		var rowId = $('#invoiceGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#invoiceGrid").getRowData(rowId);
		var data = {"SEQ" : seq  , "STATUS_V" : "I"};
		btGrid.gridAddRow("invoiceGrid", "last", data);
	});
	
	$("#btn_save").on("click" , function(){
		btGrid.gridSaveRow('invoiceGrid');
		var gridData  = $("#invoiceGrid").getRowData();
		var ids = $("#invoiceGrid").jqGrid("getDataIDs");
		var gridDataChk = [];
		var cnt = 0;
		var errChk=0;
		
		for(var i = 0; i < ids.length; i++){
			gridDataChk.push($("#invoiceGrid").getRowData(ids[i]));
		}

		var args = '';
		$.each(gridData , function(i , json){
			$.each(json, function(k , value){
				if(k == "STATUS_V" && json[k] !='R'){
					cnt++;
					return;
				}
			
				if(k == "ITEM_CD" && json[k].indexOf("Object") >-1 ){
					errChk++;
					return;
				}
				
				if(k == "SEQ" || k == "PER_AMT" || k == "USE_DAY" || k == "USE_NUM" || k == "TOT_AMT" ){
					if(k == "PER_AMT" || k == "TOT_AMT") json[k] = parseInt(value.replaceAll("," , ""));
					else                                 json[k] = parseInt(value);
				}
				
				
			});
		});
		
		if(cnt == 0){
			alert("<s:message code='errors.noChange' javaScriptEscape='false'/>"); 
			return;
		}
		if(errChk > 0){
			var args = '<s:message code="invoice.item_cd"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			return;
		}
		
		for(var i = 0; i < gridDataChk.length; i++){
			if(fn_empty(gridDataChk[i]["ORDER"])){
				args = '<s:message code="invoice.order"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			if(fn_empty(gridDataChk[i]["ITEM_CD"]) ){
				args = '<s:message code="invoice.item_cd"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			if(fn_empty(gridDataChk[i]["ITEM_NM"])){
				args = '<s:message code="invoice.item_nm"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			if(fn_empty(gridDataChk[i]["PER_AMT"])){
				args = '<s:message code="invoice.per_amt"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			} 
			if(fn_empty(gridDataChk[i]["USE_DAY"])){
				args = '<s:message code="invoice.use_day"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
			if(fn_empty(gridDataChk[i]["USE_NUM"])){
				args = '<s:message code="invoice.use_num"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
				return;
			}
		}

		var url = '/reserve/saveInvoiceManager.do';
		var param = {"detail"   : gridDataChk
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
	
	$("#btn_delRow").on("click" , function(){
		var rowId =$("#invoiceGrid").jqGrid('getGridParam','selrow');
		var args = "";
		if (rowId == null) {
			args = '<s:message code='title.row'/>';
    		alert("<s:message code='errors.selectdel' arguments='" + args + "' javaScriptEscape='false'/>");

    		return;
		}else{
			var grdData = $("#invoiceGrid").jqGrid("getCell", rowId, "STATUS_V");
			
			if(grdData != 'I'){
				alert("<s:message code='errors.statusR' javaScriptEscape='false'/>"); 
	    		return;
	    	} else {
	    			$("#invoiceGrid").jqGrid("delRowData",rowId);
	    	}
		}
	});
	
	//닫기
	$("#btn_close").on("click" , function(){
		popupClose($('#p_invoicePopup').data('pid'));
	});
	$("#btn_del").on("click" , function(){
		var rowId   = $('#invoiceGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#invoiceGrid").getRowData(rowId);
		var args    = "";
		if(rowId == "" || rowId == null){
    		alert("<s:message code='errors.selectdel' arguments='행(을)' javaScriptEscape='false'/>");
			return;
		}
		var grdData = $("#invoiceGrid").jqGrid("getCell", rowId, "STATUS_V");
		
		if(grdData == 'I'){
			alert("<s:message code='errors.statusI' javaScriptEscape='false'/>"); 
    		return;
    	}
		args =  $("#"+rowId+"_ITEM_NM").val()
		if(confirm("<s:message code='confirm.delRow' arguments='" + args + "' javaScriptEscape='false'/>")){
			var url = '/reserve/deleteInvoiceManager.do';
			var param = { "REQ_DT"  : req_dt
					, "SEQ"     : seq
					, "ITEM_CD" : $("#invoiceGrid").jqGrid("getCell", rowId, "PREV_ITEM_CD")
					, "ORDER" 	: $("#invoiceGrid").jqGrid("getCell", rowId, "PREV_ORDER")
			        }
			alert($("#invoiceGrid").jqGrid("getCell", rowId, "PREV_ITEM_CD"));
				fn_ajax(url, false, param, function(data, xhr){
					if(data.resultCd == "-1"){
						alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
					}else{
					    alert("<s:message code='product.info.delete'/>");
						cSearch();
					}
				});
		}
	});
	
	//공통버튼 - 엑셀 다운 클릭
	window.cExcelSample = function(data) {
		var param = { "REQ_DT"  : req_dt
				    , "SEQ"     : seq
				    , "EMAIL"   : email
				    , "MEM_GBN" : mem_gbn
				    , "WK_GBN"	: ""
		}
		
		if(data.id == "btn_preview") param.WK_GBN = "R";
		else {
			if(!confirm("<s:message code='confirm.send'/>")){
				return false;
			}
		}
		fn_formSubmit('/report/retrieveCustomerReportAll.do', param);
		
		if(!(data.id == "btn_preview"))
		{
			
			var url = "/report/retrieveCustomerReportSend.do";
			fn_ajax(url, false, param, function(data, xhr){
			    
			    if(data.resultCd == "-1"){
					alert("<s:message code='error.sendmail' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='success.sendemail'/>");
					cSearch();
				}
			});
			
		}
	}
	
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
			$(this).jqGrid('setCell' , changeRowId , 'TOT_AMT' , tot_amt);
		}else{
			$(this).jqGrid('setCell' , changeRowId , 'TOT_AMT' , 0);
		}
	});
});

</script>