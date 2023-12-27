<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="BAS_YY_COPY" id="BAS_YY_COPY" />
		<input type="hidden" name="branch" id="branch" />
	</form>
</div>

<div id="productCopyPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divBtn">
			<button class='btn btn-default ' id='cSave' type='button' onclick=''>등록</button>
			<button class='btn btn-default ' id='cCancel' type='button' onclick=''>닫기</button>
		</div>
	</div>
	
	<!---------->
	<form id="frmProductCopy" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<colgroup>
					<col width="100px" />
			        <col width="200px" />
			    </colgroup>
				<tr>
					<th style="text-align:center;"><s:message code="product.copyyear"/></th>
					<td>&nbsp;
						<select id="ST_DT1_Normal" name="ST_DT1_Normal" class="cmc_combo" style="width:260px;">
							<c:forEach var="i" items="${basyy}">
								<option value="${i.BAS_YY}">${i.BAS_YY}</option>
							</c:forEach>
						</select>
						<input type="text" name="ST_DT1_Period" id="ST_DT1_Period" style="display:none; width:230px;" >
					</td>
				</tr>
			</table>
		</div> 
	</form>
	<p id="noticeCopy" style="text-align:right; font-size: 10px; font-weight: bold"></p>
</div>
<script type="text/javascript">

//초기 로드
$(function(){
	
	// 입력값 없을 경우 등록 안되게
	$("#ST_DT1_Period").keyup(function(){
		if($("#ST_DT1_Period").val() != ""){
			$("#cSave").attr("disabled", false);
		} else {
			$("#cSave").attr("disabled", true);
		}
	});
	
	// 저장 버튼
	$("#cSave").click(function(e){
		saveProductCopy();
	});
	
	// 닫기 버튼
	$("#cCancel").click(function(e){
		$('#productCopyPopUp').dialog('close')
	});
	
	$('#productCopyPopUp').dialog({
		title: '<s:message code="product.copy"/>',
		autoOpen: false,
		width: 400,
		height: 115,
		modal: true,
		open: function() {
			$('#BAS_YY_COPY').val($(this).data("BAS_YY"));
			$('#noticeCopy').text("대상년도(" + $(this).data("BAS_YY") + ")가 선택한 복사년도에 복사 됩니다.");
			$('#branch').val($(this).data("branch"));
// 			$("#ST_DT1_Normal").val($(this).data("ST_DT1"));
			if($(this).data("branch") == "period"){
				$("#ST_DT1_Normal").hide();
				$("#ST_DT1_Period").show();
				$("#cSave").attr("disabled", true);
			}
		},
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		}
	});
});

function saveProductCopy(){
	var formData = formIdAllToMap('frmProductCopy');
	var formData2 = formIdAllToMap('frmSearch');
	var param = { "param" : 
					{"BAS_YY_COPY"		: formData2.BAS_YY_COPY
					,"BAS_YY_PASTE" 	: (formData.ST_DT1_Period != "") ? formData.ST_DT1_Period : formData.ST_DT1_Normal
					,"branch"			: formData2.branch
					}
				}
	var url = "/common/saveCopyInfo.do"
	
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if(data.SAVE == 'N'){
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			}else{
				alert("<s:message code='info.save'/>");
				popupClose($('#productCopyPopUp').data('pid'));	
			}
		});
	}
}
</script>