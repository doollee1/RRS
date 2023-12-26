<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : NoticePopup
 * @Description : 메인 공지사항 팝업
 */
%>
<div id="noticePopup" style="overflow-y:auto;">
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
			<tbody></tbody>
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
			<tbody></tbody>
		</table>
	</div>
	</form>	
	<div id="CONTENTS2" style="padding:5px;"></div>
	<form id="answerInsert">

				    <h3>답변하기</h3>
			
				        <textarea id="ANSWER" name="REMARK" rows="5" style="width: 100%"></textarea>

	</form>
</div>


<script type="text/javascript">
$(function() {
	var gv_seq;
	$('#noticePopup').dialog({
		title :'<s:message code='meetSanding.Regi'/>',
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
			gv_seq		= $(this).data("QNA_SEQ");
			console.log(QNA_SEQ);
			fn_init();
			
			var url="/common/QnaViewDetail.do";
			var param={"QNA_SEQ":QNA_SEQ};
			
			fn_ajax(url, true, param, function(data, xhr){
				console.log(data.result);
				var qnaInfo=data.result;
				
				
				if(!fn_empty(data.answer)){
					var answerInfo=data.answer;
					fn_dataBind('frmNoticeA', answerInfo[0]);
					$('#CONTENTS2').html(answerInfo[0].CONTENT);
					$('#answerInsert').hide();
				}else{
			
					$('#frmNoticeA').hide();
				}
				
				console.log(qnaInfo[0].CONTENT);

				
				fn_dataBind('frmNoticeP', qnaInfo[0]);
				
				$('#CONTENTS').html(qnaInfo[0].CONTENT);
			});
		}
	});

	function fn_dataSet(data){
    	$.each(data, function(key , val){
    		$('[name='+ key +']').val (val);
	    });
    	
    	//미팅샌딩 셋팅
    	if(!fn_empty(data.PICK_GBN)){
	    	if(data.PICK_GBN == "01"){
	    		$("#PICK_GBN"     ).attr("disabled", false);
	    		$("#insertPickGbn").text("등록");
	    		$("#PER_NUM_CNT"  ).val("0");
	    		$("#PER_NUM_CNT"  ).attr("readonly", false);
	    	}else{
	    		$("#PICK_GBN"     ).attr("disabled", true);
	    		$("#insertPickGbn").text("상세");
	       		$("#PER_NUM_CNT"  ).val(data.PER_NUM);
	    		$("#PER_NUM_CNT"  ).attr("readonly", true);
	    	}
		}
    	
        //LATE 체크아웃 셋팅
    	if(!fn_empty(data.LATE_CHECK_OUT)){
    		$('[name=LATE_CHECK_OUT][value='+data.LATE_CHECK_OUT+']').prop("checked", true);
    	}
    
	}
	
	function savePickInfo(){
		var formData = formIdAllToMap('answerInsert');
		console.log(formData);
		var param = {};
		
		param.QNA_SEQ=gv_seq;
		param.CONTENT=formData.REMARK;
		
		console.log(param.CONTENT)

		if(confirm("<s:message code='confirm.save'/>")){
			var url = '/common/qnaAnswerInsert.do';
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					popupClose($('#noticePopup').data('pid'));
				}
			});
		}
	}
})
</script>
