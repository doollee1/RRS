<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="top_button_h_margin"></div>
<div id="ctu_no_resize">
	<form id="frmSearch" action="#">
		<input type="hidden" name="branch" id="branch" />
		<input type="hidden" name="P_BAS_YY" id="P_BAS_YY" />
		<input type="hidden" name="BAS_YY_PASTE" id="BAS_YY_PASTE" />
		<input type="hidden" name="C_SAVE" id="C_SAVE" />
	</form>
</div>

<div id="productCopyPopUp">
	<!--- 버튼 ---->
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

/* 초기 로드 */
$(function(){
	/* 입력값 없을 경우 등록 안되게 */
	$("#ST_DT1_Period").keyup(function(){
		if($("#ST_DT1_Period").val() != ""){
			$("#cSave").attr("disabled", false);
		} else {
			$("#cSave").attr("disabled", true);
		}
	});
	
	/* 저장 버튼 */
	$("#cSave").click(function(e){
		saveProductCopy();
	});
	
	/* 닫기 버튼 */
	$("#cCancel").click(function(e){
		$('#productCopyPopUp').dialog('close');
	});
	
	/* 복사년도 변경 시 */
	$("#ST_DT1_Normal").on("change", function(e){
		$("#BAS_YY_PASTE").val(parseInt($("#ST_DT1_Normal").val()) + 1);
		$('#noticeCopy'  ).text("선택한 복사년도가 " + $("#BAS_YY_PASTE").val() + "년도 에 복사 됩니다.");
	})
	$("#ST_DT1_Period").on("keyup", function(e){
		if($("#ST_DT1_Period").val().length == 4){
			$("#BAS_YY_PASTE").val(parseInt($("#ST_DT1_Period").val()) + 1);
			$('#noticeCopy'  ).text("입력한 복사년도가 " + $("#BAS_YY_PASTE").val() + "년도 에 복사 됩니다.");
		} else { 
			$('#noticeCopy'  ).text("");
		}
	})
	
	/******************************************** 
	 * @Subject : 팝업 창 기본 설정
	 * @Content : 화면 비율 및 버튼 이벤트
	 * @See     : periodPopUp()
	 * @Since   : 2024.07.11
	 * @Author  : 
	 ********************************************/
	$('#productCopyPopUp').dialog({
		title   : '<s:message code="product.copy_product"/>',
		autoOpen: false,
		width   : 400,
		height  : 115,
		modal   : true,
		open: function() {
			if($('#ST_DT1_Normal').val() == null){
				alert("기준년도 등록을 먼저 해주세요.");
				popupClose($(this).attr('id'));
				periodPopUp();
			}
			$('#branch').val($(this).data("branch"));
			if($(this).data("branch" ) == "period"){
				$("#ST_DT1_Normal"   ).val(0).hide();
				$("#ST_DT1_Period"   ).show();
				$("#cSave"           ).attr("disabled", true);
				$("#P_BAS_YY"        ).val($(this).data("P_BAS_YY"));
				$('#productCopyPopUp').dialog({title : '<s:message code="product.copy_basyy"/>'});
			} else {
				$("#BAS_YY_PASTE").val(parseInt($("#ST_DT1_Normal").val()) + 1);
				$('#noticeCopy'  ).text("선택한 복사년도가 " + $("#BAS_YY_PASTE").val() + "년도 에 복사 됩니다.");
			}
			$("#C_SAVE").val("");
		},
		close: function() {
			/* 필수로 들어가야함 */
			if($("#C_SAVE").val() == "Y"){
				p_rtnData = {"BAS_YY" : $("#BAS_YY_PASTE").val()};
			} else {
				p_rtnData = {"BAS_YY" : ""};
			}
			popupClose($(this).attr('id'));
		}
	});
});

/******************************************** 
 * @Subject : 등록 버튼 클릭
 * @Content : 복사 가능한지 체크 후 데이터 복사
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function saveProductCopy(){
	if($("#ST_DT1_Normal").val() == $("#ST_DT1_Normal option:eq(0)").val()){
		alert("기준년도에 (" + $("#BAS_YY_PASTE").val() + ")년도를 먼저 등록해주세요.");
	} else {
		if($("#ST_DT1_Period").val() > $("#P_BAS_YY").val()){
			alert($("#ST_DT1_Period").val() + "년도 복사 데이터가 없습니다.")
			return;
		}
		var formData  = formIdAllToMap('frmProductCopy');
		var formData2 = formIdAllToMap('frmSearch');
		var param = { "param" : 
						{"BAS_YY_COPY"  : (formData.ST_DT1_Period != "") ? formData.ST_DT1_Period : formData.ST_DT1_Normal
						, "BAS_YY_PASTE" : formData2.BAS_YY_PASTE
						, "branch"       : formData2.branch
						}
					}
		var url = "/product/saveCopyInfo.do"
		
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.SAVE == 'N'){
					alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					$("#C_SAVE"          ).val("Y");
					$('#productCopyPopUp').dialog('close');
				}
			});
		}
	}
}

/******************************************** 
 * @Subject : 기준년도 등록 팝업 Open
 * @Content : 기준년도 등록 팝업 Open
 * @Since   : 2024.07.11
 * @Author  : 
 ********************************************/
function periodPopUp(param){
	var url = "/popup/ProductPeriodPopUp.do";
	var pid = "productPeriodPopUp";    //팝업 페이지의 최상위 div ID
	
	popupOpen(url, pid, param, function(data){
		cSearch();
	});
}
</script>