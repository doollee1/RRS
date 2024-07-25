<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : QnaView
 * @Description : Qna 팝업
 */
%>
<div id="qnaPopup" style="overflow-y:auto;">
	<form id="frmNoticeP" action="#">
	<div id="pop_ct_form_wrap">
		<table class="pop_tblForm">
			<caption></caption>
			<colgroup>
				<col width="130px" />
				<col />
			</colgroup>
			<tr>
				<th><s:message code='notice.title'/></th>
				<td colspan="3">
					<input type="text" name="TITLE" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td colspan="3">
					<input type="text" name="REG_DT" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>등록자</th>
				<td colspan="3">
					<input type="text" name="REG_ID" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
		</table>
	</div>
	</form>

	<div class="emptyH10"></div>
	<div id="CONTENTS" style="padding:5px;"></div>
	<form id="frmNoticeA" action="#">
	<div id="pop_ct_form_wrap">
		<table class="pop_tblForm">
			<caption></caption>
			<colgroup>
				<col width="130px" />
				<col />
			</colgroup>
			<tr>
				<th>답변일</th>
				<td colspan="3">
					<input type="text" name="REG_DT" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>등록자</th>
				<td colspan="3">
					<input type="text" name="REG_ID" class="cmc_txt disabled" style="width:250px;" disabled=""  readonly="readonly" />
				</td>
			</tr>
		</table>
	</div>
	</form>

	<div id="CONTENTS2" style="padding:5px;"></div>
	<form id="answerInsert">
		<h5 style="color:#ff7f00; margin: 0px">※ 답변하기</h5>
		<textarea id="ANSWER" name="REMARK" rows="5" style="width: 100%" maxlength="2000"></textarea>
	</form>
</div>

<script type="text/javascript">
/********************************************
 * @Subject : 화면 OPEN 시 최초 실행 함수
 * @Content : 팝업창 설정
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
$(function() {
	var gv_seq;
	$('#qnaPopup').dialog({
		title :'QNA',
		autoOpen : false,
		//height: 400,
		width: 940,
		modal : true,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					savePickInfo();
				}
			},
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close");
				}
			},
		},
		close : function() {
			p_rtnData = [];
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function(a) {
			QNA_SEQ    = $(this).data("QNA_SEQ");
			gv_seq      = $(this).data("QNA_SEQ");
			
			var url="/common/QnaViewDetail.do";
			var param={"QNA_SEQ":QNA_SEQ};

			fn_ajax(url, true, param, function(data, xhr){
				var qnaInfo = data.result;

				if(!fn_empty(data.answer)){
					var answerInfo = data.answer;
					fn_dataBind('frmNoticeA', answerInfo[0]);
					$('#CONTENTS2').html(answerInfo[0].CONTENT);
					$('#answerInsert').hide();
					$('#save').hide();
				}else{
					$('#frmNoticeA').hide();
				}

				fn_dataBind('frmNoticeP', qnaInfo[0]);
				$('#CONTENTS').html(qnaInfo[0].CONTENT);
			});
		}
	});

	/* 저장 버튼을 누르면 실행되는 함수 */
	function savePickInfo(){
		var str = document.getElementById("ANSWER").value;
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$('#ANSWER').val(str);

		var formData = formIdAllToMap('answerInsert');
		var param = {};

		param.QNA_SEQ=gv_seq;
		param.CONTENT=formData.REMARK;

		if(confirm("<s:message code='confirm.save'/>")){
			var url = '/common/qnaAnswerInsert.do';
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>");
				}else{
					alert("<s:message code='info.save'/>");
					popupClose($('#qnaPopup').data('pid'));
				}
			});
		}
	}
})

</script>
