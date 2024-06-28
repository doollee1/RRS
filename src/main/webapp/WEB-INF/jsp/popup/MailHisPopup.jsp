<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : MailHisPopup
 */
%>
<style>
.cc_icon{background: url("/images/cbtn_copy.png") 4px 3px no-repeat; background-size:16px auto; padding-left:23px;}
</style>
<div id="MailHisPopup">
	
	<form id="frmMail" action="#">
	
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">

		<input type="hidden" name="MAIL_CD" id="MAIL_CD" />
		<input type="hidden" name="MAIL_LANG" id="MAIL_LANG" />
		<input type="hidden" name="BTN_YN" id="BTN_YN" />	
		
		<input type="hidden" name="BODY_CONTENTS" id="BODY_CONTENTS" />
		<input type="hidden" name="BODY_TITLE" id="BODY_TITLE" />
		<input type="hidden" name="MAIL_TYPE" id="MAIL_TYPE" />
		<input type="hidden" name="MAIL_TITLE" id="MAIL_TITLE" />
		<input type="hidden" name="SENDER" id="SENDER" />
		<input type="hidden" name="RECEIVER" id="RECEIVER" />
		<input type="hidden" name="CARBON_COPY" id="CARBON_COPY" />	

		<table width="100%">
	      <tbody>
	      <tr>
	          <td style="border-bottom:1px solid #ddd; padding:10px 0px 10px 0px;">
	          		<i class="fa fa-envelope-o" style="float:left; margin:0px 10px 0px 15px;"></i><p name="MAIL_TITLE_T" id="MAIL_TITLE_T" style="font-weight:700;"></p>
				</td>
			</tr>
			<tr>
				<td style="padding:10px 0px 10px 15px;">		
					<p style="float:left;margin-right:5px;font-weight:700;">FROM :</p><p name="SENDER_T" id="SENDER_T"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">TO :</p><p name="RECEIVER_T" id="RECEIVER_T"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">CC :</p><p name="CARBON_COPY_T" id="CARBON_COPY_T"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">Attach File Y/N  :</p><p name="ATTACH_FILE_YN" id="ATTACH_FILE_YN"></p><br>
					<p style="float:left;margin-right:5px;font-weight:700;">Send Date :</p><p name=SEND_DATE id="SEND_DATE"></p><br>
				</td>	          
	        </tr>
	        <tr>
	          <td  style="padding-top:15px; border-top:1px solid #ddd;">
	          		<p name="BODY_TITLE_T" id="BODY_TITLE_T" style="float:left; padding-left:15px;"></p>
	          		<p style="float:left; margin-right:5px; margin-left:-1px;"></p>
	          		<p name="BODY_TITLE_TYPE_T" id="BODY_TITLE_TYPE_T"></p>
					<br>
					<textarea name="BODY_CONTENTS_T" id="BODY_CONTENTS_T" style="margin:0px 15px 0px 15px;line-height:2;width:95%;height:250px;border:1px solid #fff;overflow-y:auto;" readonly="readonly"></textarea>
				</td>	
			</tr>       
	       </tbody>
	      </table>
	</div>
	
	</form>
		
</div>

<script type="text/javascript">
$(function() {
	$('#MailHisPopup').dialog({
		title: '<s:message code='mail.grd.mailcts'/>',
		autoOpen: false,
		height: 550,
		width: 800,
		modal: true,
		buttons: {
			'Close': {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			$('#MAIL_TYPE').text($(this).data("MAIL_CD"));
			$('#LANG').text($(this).data("LANG"));
			$('#SENDER_T').text($(this).data("MAIL_FROM"));
			$('#RECEIVER_T').text($(this).data("MAIL_TO"));
			$('#CARBON_COPY_T').text($(this).data("MAIL_CC"));
			$('#MAIL_TITLE_T').text($(this).data("MAIL_TITLE"));
			$('#BODY_CONTENTS_T').text($(this).data("MAIL_CONTENTS"));
			$('#ATTACH_FILE_YN').text($(this).data("ATTACH_FILE_YN"));
			$('#SEND_DATE').text($(this).data("SEND_DATE"));
		},		
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

</script>