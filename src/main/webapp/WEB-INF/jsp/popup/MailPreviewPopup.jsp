<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : 
 */
%>
<style>
.cc_icon{background: url("/images/cbtn_copy.png") 4px 3px no-repeat; background-size:16px auto; padding-left:23px;}
</style>
<div id="MailPreviewPopup">
	
	<form id="frmMail" action="#">
	
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<input type="hidden" name="MAIL_CD" id="MAIL_CD" />
		<input type="hidden" name="MAIL_LANG" id="MAIL_LANG" />
		<input type="hidden" name="BTN_YN" id="BTN_YN" />	
		<input type="hidden" name="REJECT_RSN" id="REJECT_RSN" />
		<input type="hidden" name="USER_NAME" id="USER_NAME" value="${loginVO.nameFull}"/>	
		<input type="hidden" name="USER_MAIL" id="USER_MAIL" value="${loginVO.email}"/>	
		
		<textarea name="MAILCONTENT" id="MAILCONTENT" style="display: none;"></textarea>		
		<table width="100%">
	      <tbody>
	      <tr>
	          <td style="border-bottom:1px solid #ddd; padding:5px 0px 10px 0px;">
	          		<i class="fa fa-envelope-o" style="float:left; margin:5px 10px 0px 15px;"></i>
	          		<input type="text" id="MAIL_TITLE_T" style="padding:4px; font-weight:700; width: 93.5%;" />
				</td>
			</tr>
			<tr>
				<td style="padding:10px 0px 10px 15px;">		
				
					<p style="float:left;margin-right:5px;font-weight:700;">FROM :</p><p name="SENDER_T" id="SENDER_T"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">TO :</p><input type="input" name="RECEIVER_T" id="RECEIVER_T"  style="padding:2px; font-weight:700; width: 93.5%;"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">CC :</p><input type="input" name="CARBON_COPY_T" id="CARBON_COPY_T"  style="padding:2px; font-weight:700; width: 93.5%;"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">Attach File :</p><div id="ATTACH_FILE_YN"></div></p><br>
				</td>
			</tr>
			<tr>
				<td style="padding-top:15px; border-top:1px solid #ddd;">
					<textarea name="BODY_CONTENTS_T" id="BODY_CONTENTS_T" style="padding:7px;line-height:2;width:98%;height:245px;/*border:1px solid #fff;*/overflow-y:auto;"></textarea>
				</td>
	        </tr>	        
	       </tbody>
	      </table>
	</div>
	
	</form>
		
</div>

<script type="text/javascript">
var cust_cd;
var cust_nm;
var doc_no;
var doc_gr;
var next;
var amount;
var fileName = '';
var attachFileName ='';
var fileDoc;
var type;
var vatregno;
var doctype;

$(function() {
	$('#MailPreviewPopup').dialog({
		title: 'Mail Preview',
		autoOpen: false,
		height: 550,
		width: 800,
		modal: true,
		buttons: {
			'Send': {
				id: 'Send',
				text: 'Send',
				click: function() {
					if(fn_empty($('#SENDER_T').text()) || fn_empty(document.getElementById('RECEIVER_T').value)){
						alert("<s:message code='error.inputemail'/>");
					}else{
						if($('#MAIL_CD').val() == "QT"){
							var url = "/quotation/sendEmailQt.do";
							var param = {
								MAIL_CD : $('#MAIL_CD').val(),
								SENDER_T :  $('#SENDER_T').text().trim(),
								RECEIVER_T : document.getElementById('RECEIVER_T').value.trim(),
								CARBON_COPY_T : document.getElementById('CARBON_COPY_T').value.trim(),
								BODY_CONTENTS_T: document.getElementById('BODY_CONTENTS_T').value,
								MAIL_TITLE_T: document.getElementById('MAIL_TITLE_T').value,
								FILE_NAME : fileName,
								ATTACH_FILE_NAME : attachFileName
								//DOC : fileDoc
								, REJECT_RSN :  $('#REJECT_RSN').val()
							};
							
							fn_ajax(url, true, param, function(data, xhr){
								if(!fn_empty(data)){
									alert("<s:message code='success.sendemail'/>");
									popupClose($('#MailPreviewPopup').data('pid'));
								}
							});
						}else{
							var url = "/common/sendEmailEtc.do";
							var param = {
								MAIL_CD : $('#MAIL_CD').val(),
								SENDER_T : $('#SENDER_T').text().trim(),
								RECEIVER_T : document.getElementById('RECEIVER_T').value.trim(),
								CARBON_COPY_T : document.getElementById('CARBON_COPY_T').value.trim(),
								BODY_CONTENTS_T: document.getElementById('BODY_CONTENTS_T').value,
								MAIL_TITLE_T: document.getElementById('MAIL_TITLE_T').value,
								FILE_NAME : fileName,
								ATTACH_FILE_NAME : attachFileName,
								REJECT_RSN : $('#REJECT_RSN').val()
							};
							
							fn_ajax(url, true, param, function(data, xhr){
								if(!fn_empty(data)){
									p_rtnData = {"SEND_EMAIL" : "Y"};
									popupClose($('#MailPreviewPopup').data('pid'));
								}
							});
						}
					}
				}
			}
		   , 
		   'Close': {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#MAIL_CD').val($(this).data("MAIL_CD"));
			$('#MAIL_LANG').val($(this).data("MAIL_LANG"));
			$('#BTN_YN').val($(this).data("BTN_YN"));
			fileName = ($(this).data("FILE_NM"));
			fileDoc = ($(this).data("FILE_DOC"));
			cust_cd = $(this).data("CUST_CD");
			cust_nm = $(this).data("CUST_NM");
			doc_no= $(this).data("DOC_NO");
			doc_gr= $(this).data("DOC_GR");
			next = $(this).data("NEXT");
			amount = $(this).data("AMOUNT");
			type = $(this).data("TYPE");
			vatregno = $(this).data("VAT_REG_NO");
			//$("#MAILCONTENT").val($(this).data("MAILCONTENT"));
			
			$('#REJECT_RSN').val($(this).data("REJECT_RSN"));
			rejectRsn = $(this).data("REJECT_RSN");
			
			
			doctype = $(this).data("MAIL_CD");
			
			if ( $(this).data("MAIL_CD") == 'AP' ){
				$('#RECEIVER_T').prop('disabled', true);
			}
			
			
			if( doctype == 'PI' ) {
				if(!fn_empty(fileName)){
					var attFile = fileName.split("^");
					for ( var i=0; i<attFile.length; i++ ){
						attachFileName = attFile[i].split("_", 2);
					    attachFileName = attachFileName.toString().replace(",","_") + ".pdf";
					}
				    output(fileName);
				}else{
					$("#ATTACH_FILE_YN").text('N');
				}
			} else {
				if(!fn_empty(fileName)){
					attachFileName = fileName.split("_", 2);
				    attachFileName = attachFileName.toString().replace(",","_") + ".pdf";
				    output(fileName);
				}else{
					$("#ATTACH_FILE_YN").text('N');
				}
			}
			
			
			function output(data){
				if( doctype == 'PI' ) {
					var attFile = fileName.split("^");
					for ( var i=0; i<attFile.length; i++ ){
						attachFileName = attFile[i].split("_", 2);
					    attachFileName = attachFileName.toString().replace(",","_") + ".pdf";
						var link = "/common/downloadPdfAttach.do?f=" + attFile[i] + "&of=" + attachFileName;
						$("#ATTACH_FILE_YN").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + attachFileName + "</a>");
						if ( (attFile.length - i ) > 1 ) {
							$("#ATTACH_FILE_YN").append(", ");	
						} else {
							$("#ATTACH_FILE_YN").append("<br/>");	
						}
					}
				} else {
					var link = "/common/downloadPdfAttach.do?f=" + fileName + "&of=" + attachFileName;
					$("#ATTACH_FILE_YN").append("<a href='#' onclick=\"fileDownload('" + link + "');\">" + attachFileName + "</a>");
					$("#ATTACH_FILE_YN").append("<br/>");					
				}
			}
			cSearch();
		},		
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});


function cSearch(){
	var url = "/common/mailPreview.do";
	var mail_tp ='';
	if ( doc_gr == 'QT' ) {
		mail_tp = 'QT_YN';
	}else {
		mail_tp = 'SO_YN';
	}
	
	var param = { "param" : { 'MAIL_CD': $('#MAIL_CD').val()
			                , 'MAIL_LANG': $('#MAIL_LANG').val()
			                , 'CUST_CD' : cust_cd
			                , 'MAIL_TP' : mail_tp
			                , 'DOC_NO': doc_no
			                , 'DOC_GR': doc_gr
			                , 'NEXT' : next
			                , 'REJECT_RSN' : rejectRsn

							}
				};
	
	fn_ajax(url, true, param, function(data, xhr){
		
		// mail title
		if(!fn_empty(data.result.TITLE_TEXT)){
			var title = data.result.TITLE_TEXT;
			if ( $('#MAIL_CD').val() =='AP' && doc_gr == 'SO' ) {
				title = title.replace("{DOC_GR}", "Sales Order");
			} else if ( $('#MAIL_CD').val() =='AP' && doc_gr == 'QT' ) {
				title = title.replace("{DOC_GR}", "Quotation");
			} 
			title = title.replace("{DOC_NO}", doc_no);
			title = title.replace("{Customer Name}", cust_cd+' / '+cust_nm);
			title = title.replace("{VAT RegNo}", vatregno);
		}
		document.getElementById('MAIL_TITLE_T').value = title;
		
		// mail contents
		if(!fn_empty(data.result.BODY_CONTENTS)){
			var body_contents = data.result.BODY_CONTENTS;
			body_contents = body_contents.replace("{Receiver Name}",data.result.RECEIVER_NAME);
			body_contents = body_contents.replace("{Requestor Name}",data.result.SENDER_NAME);
			body_contents = body_contents.replace("{Requestor Name2}",data.result.SENDER_NAME);
		}		
		var content = data.result.BODY_TITLE_TXT + ' ' + data.result.BODY_TITLE_TYPE + '\n';
		content += body_contents + '\n\n';		
		if ($('#MAIL_CD').val() =='AP') {
			var link = "";
			//(doc_gr == "QT")? link ="https://omsdev.q-cells.com/popup/QuotationEmailPopup.do?docNo="+ doc_no : link ="https://omsdev.q-cells.com/popup/SalesOrderEmailPopup.do?docNo="+doc_no;
			(doc_gr == "QT")? link ="https://oms.q-cells.com/popup/QuotationEmailPopup.do?docNo="+ doc_no : link ="https://oms.q-cells.com/popup/SalesOrderEmailPopup.do?docNo="+doc_no;
			content += "OMS link: " + link;
			
			content += '\n\n' + 'Approve comment';
			content += '\n\n' + $("#USER_NAME").val() + ' (' + getNow() + ') '  + rejectRsn;
			
			if ( data.result.APPR_COMNT != '' ) {
				var comnt = data.result.APPR_COMNT;
				var comment = comnt.split("^");
				for ( var i=0; i<comment.length; i++ ){
					content += '\n' + comment[i];
				}
			}
		}
		content = content.replace("{MAILCONTENT}",  $("#MailPreviewPopup").data("MAILCONTENT") );				
		if (data.result.SENDER == null || data.result.SENDER == undefined || data.result.SENDER == "") {
			content = content.replace("{Sender}", $("#USER_NAME").val());			
		} else {
			content = content.replace("{Sender}", data.result.SENDER);
		}		
		$('#BODY_CONTENTS_T').text(content);
		
		// sender
		if (data.result.SENDER == null || data.result.SENDER == undefined || data.result.SENDER == "") {
			$('#SENDER_T').text($("#USER_MAIL").val());
		} else {
			$('#SENDER_T').text(data.result.SENDER);
		}
		
		// receiver, cc
		$('#CARBON_COPY_T').val(data.result.CARBON_COPY);		
		if($("#BTN_YN").val() == "Y"){
			if($('#MAIL_CD').val() == 'QT'){ /*Quotation 전송 시 customer의 아이디 가져오기*/
				if(!fn_empty(data.result.RECEIVER_P)){
					$('#RECEIVER_T').val(data.result.RECEIVER_P);
				}
			}else if($('#MAIL_CD').val() == 'PI'){ /*SO 전송 시 customer의 아이디 가져오기*/
				if(!fn_empty(data.result.RECEIVER_P)){
					$('#RECEIVER_T').val(data.result.RECEIVER_P);
				}
			}else if($('#MAIL_CD').val() == 'AP'){ /*승인 전송 시 다음승인자 가져오기*/
				if(!fn_empty(data.result.RECEIVER_APPR)){
					$('#RECEIVER_T').val(data.result.RECEIVER_APPR);
				}
				if(type == 'ENTRY'){ /*처음 메일 전송 시 cc에 KAM, BACK OFFICE, Sales Planning 추가*/
					if(fn_empty(data.result.CARBON_COPY)){
						$('#CARBON_COPY_T').val(data.result.AP_CARBON_COPY);				
					}else{
						$('#CARBON_COPY_T').val(data.result.CARBON_COPY + ';' + data.result.AP_CARBON_COPY);		
					}
					if(fn_empty(data.result.RECEIVER_APPR)){
						var args = '<s:message code='quotation.countryheader'/>';
						alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
					}
				}else{
					$('#CARBON_COPY_T').val("");
				}
			}else if($('#MAIL_CD').val() == 'AA'){
				$('#RECEIVER_T').val(data.result.RECEIVER + ';' + data.result.AP_CARBON_COPY);
			}else{
				if(!fn_empty(data.result.RECEIVER)){  /*그외에는 mail management에 있는 값 가져오기*/
					$('#RECEIVER_T').val(data.result.RECEIVER);
				}
			}
		}else{ 
			$('#RECEIVER_T').val(data.result.RECEIVER);
			$("#Send").hide();
		}
				
		//if ($('#MAIL_CD').val() == 'QT' || $('#MAIL_CD').val() == 'SO') { /*Quotation 견적, Credit Block Release 요청 시 로그인한 사람의 Mail 주소로*/
		//	$('#SENDER_T').text('${loginVO.email}');
		//}		
	});
		$('#ATTACH_FILE_YN').text();
}

function getNow(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	var hh = today.getHours();
	var mi = today.getMinutes();
	var ss = today.getSeconds();


	if(dd < 10) {
		dd='0'+dd;
	}
	
	if(mm < 10) {
		mm='0'+mm;
	}
	
	if(hh < 10) {
		hh='0'+hh;
	}
	
	if(mi < 10) {
		mi='0'+mi;
	}
	
	if(ss < 10) {
		ss='0'+ss;
	}
	
	
	
	return dd + '.' + mm + '.'+yyyy + ' '+ hh + ':' + mi + ':' + ss;
}
</script>