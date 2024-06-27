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
.notice_file_del {margin:3px; margin-right:0px; font-size:11px;}
.downLink {padding:0px 3px 0px 3px; font-size:15px;}
#pdfUpload {wdith:100%;}
#ATTACHFILE {display:table-cell; float: right;padding-left:105px;}
#ATTACHFILE .MultiFile-wrap {margin-top:5px; margin-left:5px; margin-bottom:5px;}
#ATTACHFILE .MultiFile-wrap input[type=file] {width:300px;}
#ATTACHFILE .MultiFile-label {font-size:15px;}

#invoice_popup_top_wrap {display:flex; justify-content:space-between;}
#invoice_popup_date_box {display:flex; flex-direction:column; gap:5px; padding-top:6px; background-position:left 12px;}
#invoice_popup_date_box input[type=text] {margin-left:5px;}
#invoice_row_box {text-align:right;}
</style>

<div id="p_invoicePopup">
    <div id="divBtns">
		<div id="divWindowpath">
			<span id="title1"></span><span id="title2"></span><span id="title3"></span>
		</div>
		<div id="divBtn">
			<button class="btn btn-default" id="btn_preview" onclick='cExcelSample(this);'><i class="fa fa-cube"></i><s:message code='button.preview'/></button>
			<button class="btn btn-default" id="btn_send"><i class="fa fa-phone"></i><s:message code='button.send'/></button>
			<button class="btn btn-default" id="btn_save"><i class="fa fa-save"></i><s:message code='button.save'/></button>
			<button class="btn btn-default" id="btn_del"><i class="fa fa-trash"></i><s:message code='button.delete'/></button>
            <button class="btn btn-default" id="btn_close"><i class="fa fa-close"></i><s:message code='button.close'/></button>
		</div>
        
	</div>

	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div id="invoice_popup_top_wrap">
			<div id="invoice_popup_date_box" class="ct_grid_top_left">
				<div id="invoice_popup_dt">
					발행일자<input type="text" class="cmc_txt" id="POP_INV_REG_DT" name="POP_INV_REG_DT" data-type="date" style="width:20 .5%;"/>
				</div>
				<div>
					예약기한<input type="text" class="cmc_txt" id="POP_EXP_DT" name="POP_EXP_DT" data-type="date" style="width:20 .5%;"/>
					예약금<input type="text" id="POP_DEP_AMT" name="POP_DEP_AMT" style="text-align: right" value="0" class="withComma" >
				</div>
			</div>
			<div id="invoice_row_box">
				<input type="hidden" id="hFileUid" name="hFileUid" />
				<div id="pdfUpload">
					<div id="ATTACHFILE"></div>
					<div id="invoicePdfAttach"></div>
				</div>
				<div>
					<button class="btn btn-default" id="btn_addRow" style="align:right" ><i class="fa fa-plus-square-o"></i><s:message code='button.addRow'/></button>
            		<button class="btn btn-default" id="btn_delRow" style="align:right" ><i class="fa fa-plus-square-o"></i><s:message code='button.delRow'/></button>
				</div>
			</div>
		</div>
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
	var chk_in_dt;
	var chk_out_dt;
	var min_date;
	var prc_sts;
	var file;
	var temp_file_uid;
	
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
			fn_init($(this).data());
		}
	});
	
	function fn_init(recevicedData) {
		seq        = recevicedData.SEQ;
		req_dt     = recevicedData.REQ_DT;
		mem_gbn    = recevicedData.MEM_GBN;
		email      = recevicedData.EMAIL;
		chk_in_dt  = recevicedData.CHK_IN_DT;
		chk_out_dt = recevicedData.CHK_OUT_DT;
		prc_sts    = recevicedData.PRC_STS;	
		
		//04(예약신청), 05(입금대기)
		if(prc_sts == "04" || prc_sts == "05"){  
			//$("#POP_EXP_DT,#POP_DEP_AMT , #btn_send, #btn_preview").attr("disabled",true);
			$("#btn_send, #btn_preview").attr("disabled",true);
		//01(예약요청-일반), 02(예약요청-멤버), 03(예약가능), 06(예약확정), 07(환불요청)
		}else if(prc_sts == "01" || prc_sts == "02" || prc_sts == "03" || prc_sts == "06" || prc_sts == "07"){ 
			//$("#POP_EXP_DT,#POP_DEP_AMT , #btn_send, #btn_preview , #btn_del , #btn_addRow , #btn_delRow").attr("disabled",true);
			$("#POP_EXP_DT, #POP_INV_REG_DT, #btn_send, #btn_preview , #btn_del ").attr("disabled",true);
		}
		//08(환불완료), 09(예약취소), 10(입금완료)
		else if(prc_sts == "08" || prc_sts == "09" || prc_sts == "10"){ 
			$("#btn_save, #btn_del").attr("disabled",true);  //저장, 삭제 버튼 비활성화
		}
		
		$("#POP_DEP_AMT").val(fn_comma(recevicedData.DEP_AMT));
		if(!fn_empty(recevicedData.EXP_DT)){
			$("#POP_EXP_DT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(recevicedData.EXP_DT)));
		}
		if(!fn_empty(recevicedData.INV_REG_DT)){
			$("#POP_INV_REG_DT").val(Util.converter.dateFormat1(Util.converter.dateFormat3(recevicedData.INV_REG_DT)));
		}
		
		createGrid();
		cSearch();
		
		//첨부파일 업로드 부분 만드는
		$("#ATTACHFILE").mkFileUpload("PDF", "/reserve/uploadPdf.do", "pdf",1);
		$("#fileupload_PDF").attr("style", "cursor:default");

		ajaxUpload();
	}
	
	function cSearch(currentPage){
		var url = "/reserve/invoiceSelectList.do";
		var formData = formIdAllToMap('frmSearch');
		var sum_tot = 0;
		var param = {"SEQ"     : seq
				   , "REQ_DT"  : req_dt
				   , "MEM_GBN" : mem_gbn
				   , "CHK_IN_DT" : chk_in_dt
				   , "CHK_OUT_DT" : chk_out_dt
				   };
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.result , function(i , val){
				val.STATUS_V = "R";
				sum_tot += val.TOT_AMT;
			});
			reloadGrid("invoiceGrid", data.result);
			
			var colModel = $("#invoiceGrid").jqGrid('getGridParam', 'colModel'); 
			for(var i =0; i < data.result.length; i++){
				jQuery("#invoiceGrid").setCell(i+1);
			}
			
			//첨부파일이 있으면 output()함수로 첨부파일을 표시해준다
			file = data.fileResult;
			if(file.length == 0){
				//file = $("#hFileUid").val();
				temp_file_uid="";
			}else{
				//기존 첨부파일의 uid 저장
				temp_file_uid = file[0]["FILE_UID"];
				$("#hFileUid").val(temp_file_uid);
				output(file,seq,req_dt);	
			}
			
			btGrid.gridResizing('invoiceGrid');
		    $("#PartnerSchGrid_pager_right").html('<tr" id="sumtot_amt" style="text-align:right">Total Price: '+fn_comma(sum_tot)+'</div>');
	    });
		
		$('#POP_INV_REG_DT').datepicker({
	        dateFormat : 'yy.mm.dd',
		    showOn : 'both',
		    disabled : 'disabled'
		 }).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		     function(e) {
		 });
		
		$('#POP_EXP_DT').datepicker({
	        dateFormat : 'yy.mm.dd',
		    showOn : 'both'
		 }).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		     function(e) {
		 });
	
	}
	
	$(".withComma").on("keyup" , function(){
		var tmpValue = $(this).val().replace(/[^0-9,]/g,'');
		tmpValue = tmpValue.replace(/[,]/g,'');
		// 천단위 콤마 처리 후 값 강제변경
	    $(this).val(numberWithCommas(tmpValue));
	});
	
	// 천단위 콤마 (소수점포함)
	function numberWithCommas(num) {
	    var parts = num.toString().split(".");	
	    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
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
				                  //alert("Please enter a valid number");
				                  alert("숫자를 입력해 주세요.");
				                  element.value = ''; }
				                })
				               }, maxlength:5
						      }
						  }
						, { name: 'ITEM_CD',  width : 220, align: 'left'   , editable:true , edittype:"select", formatter : "select"}
						, { name: 'ITEM_NM',  width : 220, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'AMT_SIGN', width : 50 , align: 'center' , editable:true, edittype:"select" ,  editoptions:{value:{"￦" : "￦"}}} 
						, { name: 'PER_AMT',  width : 70 , align: 'right' , editable:true, formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{    
				            dataInit: function(element) {
				                $(element).keyup(function(){
				                 var val1 = element.value;
				                 var num = new Number(val1);
				                 if(isNaN(num)){
				                  alert("숫자를 입력해 주세요.");
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
				                  alert("숫자를 입력해 주세요.");
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
				                  alert("숫자를 입력해 주세요.");
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
		//첨부파일이 없을 경우
		if($("#ATTACHFILE input[type=file]").val() == null || $("#ATTACHFILE input[type=file]").val() == ""){
			insertVoiceInfo();
		}else{
			//기존 첨부파일이 있는 경우
			if(!fn_empty(file)){
				insertVoiceInfo();
			}
			//첨부파일을 추가하는 경우
			else{
				$("#multiform_PDF").submit();
			}
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
		var rowId =$("#invoiceGrid").jqGrid('getGridParam','selrow');
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
					, "DEL_AMT" : $("#invoiceGrid").jqGrid("getCell", rowId, "TOT_AMT")
					, "DEP_AMT" : $("#POP_DEP_AMT").val().replaceAll(",","")
					, "EXP_DT"  : $("#POP_EXP_DT").val().replaceAll(".","")
					, "CHG_PRC_STS" : "04"
			        }
			
				fn_ajax(url, false, param, function(data, xhr){
					if(data.resultCd == "-1"){
						alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
					} else if (data.resultCd == "1") {
					    alert("<s:message code='product.info.delete'/>");
						cSearch();
					} else if (data.resultCd == "0") {
						popupClose($('#p_invoicePopup').data('pid'));
					}
				});
		}
	});
	
	
	//이메일 전송하기
	$("#btn_send").on("click" , function(){
		console.log("======= 전송하기 =======");
		var fileUid = $('#hFileUid').val();
		console.log("=== hFileUid : "+fileUid);

		//pdf파일 업로드 확인
		if(!fileUid){
			alert("pdf 파일 업로드 후 저장 버튼을 클릭해 주세요.");
			return false;
		}
		
		var exp_dt = $("#POP_EXP_DT").val().replaceAll(".","");
        var dep_amt = parseInt($("#POP_DEP_AMT").val().replaceAll(",",""));
		var param = { "REQ_DT"  : req_dt
				    , "SEQ"     : seq
				    , "EMAIL"   : email
				    , "MEM_GBN" : mem_gbn
				    , "FILE_UID": fileUid
		}

		if(!fn_empty(exp_dt)) param.EXP_DT  = exp_dt;
		if(dep_amt != 0)      param.DEP_AMT = dep_amt;
		else {
	        if(fn_empty(exp_dt)){
	        	alert("예약기한을 확인해주세요.");
				return false;
	        }
			if(exp_dt > chk_in_dt){
				alert("예약기한이 체크인날짜 이후입니다. 예약기한을 확인해주세요.");
				return false;
			}
		}
		
		console.log("param : "+JSON.stringify(param));
		
		
		if(!confirm("<s:message code='confirm.send'/>")){  //전송하시겠습니까?
			return false;
		}
		var url = "/report/retrieveEmailPdfReportSend.do";  //pdf이메일전송
		fn_ajax(url, false, param, function(data, xhr){
		    if(!data.resultCd){
				alert("<s:message code='error.sendmail' javaScriptEscape='false'/>");  //메일 전송실패했습니다.
			}else{
				alert("<s:message code='success.sendemail'/>");  //메일 전송완료했습니다.
				cSearch();
			}
		});
		
	});
	
	
	//공통버튼 - 엑셀 다운 클릭
	window.cExcelSample = function(data) {
		var exp_dt = $("#POP_EXP_DT").val().replaceAll(".","");
        var dep_amt = parseInt($("#POP_DEP_AMT").val().replaceAll(",",""));
		var param = { "REQ_DT"  : req_dt
				    , "SEQ"     : seq
				    , "EMAIL"   : email
				    , "MEM_GBN" : mem_gbn
				    , "WK_GBN"	: ""
		}

		if(!fn_empty(exp_dt)) param.EXP_DT  = exp_dt;
		if(dep_amt != 0)      param.DEP_AMT = dep_amt;
		else {
	        if(fn_empty(exp_dt)){
	        	alert("예약기한을 확인해주세요.");
				return false;
	        }
			if(exp_dt > chk_in_dt){
				alert("예약기한이 체크인날짜 이후입니다. 예약기한을 확인해주세요.");
				return false;
			}
		}
		
		if(data.id == "btn_preview")
		{
			param.WK_GBN = "R";
			fn_formSubmit('/report/retrieveCustomerReportAll.do', param);
		} 
	}
	
	$("#invoiceGrid").bind("change , keyup" , function(){
		var changeRowId  = $('#invoiceGrid').jqGrid('getGridParam', 'selrow');
		var rowCnt       = $('#invoiceGrid').getGridParam('reccount');
		var ids          = $('#invoiceGrid').jqGrid('getDataIDs');
		var full_tot_amt = 0;
		
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
    
		for(var i = 0 ; i < ids.length ; i ++ ){
			full_tot_amt += parseInt(fn_uncomma($(this).jqGrid('getCell', ids[i] ,'TOT_AMT')));
		}
		$("#sumtot_amt").text('Total Price: '+fn_comma(full_tot_amt));
	    $("#sumtot_amt").append('<div dir="ltr" id="sumtot_amt" style="text-align:right">Total Price: '+fn_comma(full_tot_amt)+'</div>');
	});
	
	function insertVoiceInfo(result){
		btGrid.gridSaveRow('invoiceGrid');
		var gridData  = $("#invoiceGrid").getRowData();
		var ids = $("#invoiceGrid").jqGrid("getDataIDs");
		var gridDataChk = [];
		var cnt = 0;
		var errChk=0;
		
		for(var i = 0; i < ids.length; i++){
			gridDataChk.push($("#invoiceGrid").getRowData(ids[i]));
		}
		
		var exp_dt = $("#POP_EXP_DT").val().replaceAll(".","");
	    var dep_amt = parseInt($("#POP_DEP_AMT").val().replaceAll(",",""));
	    if(fn_empty(exp_dt)){
	    	alert("예약기한을 확인해주세요.");
			return false;
	    }
		if(exp_dt > chk_in_dt){
			alert("예약기한이 체크인날짜 이후입니다. 예약기한을 확인해주세요.");
			return false;
		}
		
		var file_uid = $("#hFileUid").val();
		if(!fn_empty(result)){
			file_uid = result[0]["FILE_UID"];
		}
		//파일만 추가/변경 했을 경우
		if(fn_empty(file) && temp_file_uid != file_uid){
			//변경사항이 없다는 에러 넘기기
			cnt++;
			//넘어가는 첫번째 그리드의 STATUS_V 을 업데이트로 변경
			gridDataChk[0]["STATUS_V"] = 'U';
		}
		
		var args = '';
		$.each(gridData , function(i , json){
			$.each(json, function(k , value){
				
				//console.log("json[STATUS_V] : "+json["STATUS_V"]);
				if(k == "STATUS_V" && json[k] !='R'){
					cnt++;
					return;
				}
			
				//console.log("json[ITEM_CD] : "+json["ITEM_CD"]);
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
		
		if(errChk > 0){
			var args = '<s:message code="invoice.item_cd"/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>"); //항목코드는 필수 입력값입니다.
			return;
		}
		
		for(var i = 0; i < gridDataChk.length; i++){
			if(fn_empty(gridDataChk[i]["ORDER"])){
				args = '<s:message code="invoice.order"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>"); //정렬순서는 필수 입력값입니다.
				return;
			}
			if(fn_empty(gridDataChk[i]["ITEM_CD"]) ){
				args = '<s:message code="invoice.item_cd"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>"); //항목코드는 필수 입력값입니다.
				return;
			}
			if(fn_empty(gridDataChk[i]["ITEM_NM"])){
				args = '<s:message code="invoice.item_nm"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");  //항목표시명은 필수 입력값입니다.
				return;
			}
			if(fn_empty(gridDataChk[i]["PER_AMT"])){
				args = '<s:message code="invoice.per_amt"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");  //단위금액은 필수 입력값입니다.
				return;
			} 
			if(fn_empty(gridDataChk[i]["USE_DAY"])){
				args = '<s:message code="invoice.use_day"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");  //사용/횟수은 필수 입력값입니다.
				return;
			}
			if(fn_empty(gridDataChk[i]["USE_NUM"])){
				args = '<s:message code="invoice.use_num"/>';
				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");  //수량은  필수 입력값입니다.
				return;
			}
		}

		var url = '/reserve/saveInvoiceManager.do';
		var param = {"detail"      : gridDataChk
				   , "SEQ"         : seq 
				   , "REQ_DT"      : req_dt
				   , "FILE_UID"    : file_uid
				   };
		if(!fn_empty(exp_dt)) param.EXP_DT  = exp_dt;
		if(dep_amt != 0)      param.DEP_AMT = dep_amt;
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("인보이스 저장 오류입니다. 시스템 관리자에게 문의해 주세요.");   
				}else{
					alert("<s:message code='info.save'/>");  //저장하였습니다.
					//예약기간, 예약금, 전송, 미리보기 활성화
					$("#POP_EXP_DT, #POP_DEP_AMT , #btn_send, #btn_preview").attr("disabled",false);
					cSearch();
					popupClose($('#p_invoicePopup').data('pid'));
					
				}
			});
		}
	}
	
	function ajaxUpload(){
		$('#multiform_PDF').ajaxForm({
	     	cache: false,
	     	dataType:"json",
	     	data:{
	     		"fileuid" : $("#hFileUid").val()
	     	},
	       	//보내기전 validation check가 필요할경우
	       	beforeSubmit: function (data, frm, opt) {
				return true;
			},
			//submit이후의 처리
			success: function(data, statusText){
				//새롭게 업로드된 uid를 가져와서 세팅
				$("#hFileUid").val(data.result[0]["FILE_UID"]);
				insertVoiceInfo(data.result);
			},
	        //ajax error
	       	error: function(e){
				alert("<s:message code='fail.common.msg'/>");
			}                               
		});
	}
	
});

//첨부파일이 있는 경우 첨부파일 다운로드 링크와 삭제버튼 추가
function output(data,seq,req_dt){
	if(data){
		$("#ATTACHFILE").hide();
	}
	//PDF첨부파일은 한개만 있으므로
	item = data[0];
	//그 전 내용을 지워준다
	$("#invoicePdfAttach").empty();
	//PDF파일 표시 및 다운로드와 삭제 로직 연결
	var link = "/reserve/downloadInvoicePdf.do?f=" + item.NEW_FILE_NM + "&of=" + item.SRC_FILE_NM;
	var deleteLink = "/reserve/deleteInvoicePdf.do?seq="+seq+"&req_dt="+req_dt;
	$("#invoicePdfAttach").append("<span>등록된 PDF파일 : </span>");
	$("#invoicePdfAttach").append("<a class='downLink' href='#' onclick=\"fileDownload('" + link + "');\">" + item.SRC_FILE_NM + "</a>");   //item.SRC_FILE_NM
	$("#invoicePdfAttach").append("<span class='clipdel'><a href='#' onclick=\"fileDelete2('" +deleteLink + "', '" + item.FILE_UID + "', '" + item.NEW_FILE_NM + "');\"><span class='notice_file_del'>Delete</span></a></span>");
	$("#invoicePdfAttach").append("<br/>");
}

//PDF 파일 삭제 시 인보이스 팝업창이 닫히도록
function fileDelete2(url, fileUid, fileName){
	//if(confirm("삭제하시겠습니까?")){
	if(confirm("PDF파일을 삭제하시겠습니까?")){
		var param = { "param" : {
				"fileUid" : fileUid,
				"fileName" : fileName
			}
		};
		
		//PDF파일 삭제 후 invocie 팝업창 닫기
		fn_ajax(url, false, param, function(data, xhr){
			alert("삭제에 성공했습니다.");
			//alert("Deleted.");
			popupClose($("#p_invoicePopup").attr('id'));
		});
	}
}
</script>