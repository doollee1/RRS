<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div id="productPeriodDetailPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divBtn">
			<button class='btn btn-default ' id='cDel' type='button' onclick='' style='display:none'>삭제</button>
			<button class='btn btn-default ' id='cSave' type='button' onclick=''>저장</button>
			<button class='btn btn-default ' id='cCancel' type='button' onclick=''>닫기</button>
		</div>
	</div>
	
	<!---------->
	<form id="frmProductPeriodDetail" action="#">
		<div id="pop_ct_form_wrap">
			<input type="hidden" name="BAS_YY_UP" id="BAS_YY_UP" value="" />
			<input type="hidden" name="BAS_YY_SEQ_PD" id="BAS_YY_SEQ_PD" value="" />
			<input type="hidden" name="modify" id="modify" value="" />
			
			<table class="pop_tblForm">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
				<!---<caption></caption> --->
				<tr>
					<th style="text-align:center;"><s:message code="product.baseyear"/></th>
					<td>&nbsp;
						<input type="text" name="BAS_YY_I" id="BAS_YY_I" style="width:250px;">
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.season"/></th>
					<td>&nbsp;
						<select id="SSN_GBN_I" name="SSN_GBN_I" class="cmc_combo" style="width:260px;">
    						<option value="1" selected>시즌</option>
    						<option value="2">비시즌</option>
						</select>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.stdt1"/></th>
					<td >&nbsp;
						<input type="text" name="ST_DT1_I" id="ST_DT1_I" style="width:250px">
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.eddt1"/></th>
					<td >&nbsp;
						<input type="text" name="ED_DT1_I" id="ED_DT1_I" style="width:250px">
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.stdt2"/></th>
					<td >&nbsp;
						<input type="text" name="ST_DT2_I" id="ST_DT2_I" style="width:250px">
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.eddt2"/></th>
					<td >&nbsp;
						<input type="text" name="ED_DT2_I" id="ED_DT2_I" style="width:250px">
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.stdt3"/></th>
					<td >&nbsp;
						<input type="text" name="ST_DT3_I" id="ST_DT3_I" style="width:250px">
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.eddt3"/></th>
					<td >&nbsp;
						<input type="text" name="ED_DT3_I" id="ED_DT3_I" style="width:250px">
					</td>
				</tr>
			</table>
			<!-- ----------------- -->
		</div>
		<br>
	</form>
</div>
<script type="text/javascript">

//초기 로드
$(function(){
    // 초기화 버튼
	$("#cReset").click(function(e){
		$("#frmProductDetail").reset();
	});
	
	// 삭제 버튼
	$("#cDel").click(function(e){
		deleteProductInfo();
	});
	
	// 닫기 버튼
	$("#cCancel").click(function(e){
		$('#productPeriodDetailPopUp').dialog('close')
	});
	
	// 저장 버튼
	$("#cSave").click(function(e){
		validation();
	});
	
	// 등록, 수정 분기
	$('#productPeriodDetailPopUp').dialog({
		title: '<s:message code="product.reg_basyy"/>',
		autoOpen: false,
		width: 370,
		modal: true,
		open: function() {
			if($(this).data("modify") == true){
				$("#cDel").show();
				$("#cSave").text("수정");
				$("#modify").val("1");
				$("#BAS_YY_I").attr("readonly", true);
				$('#productPeriodDetailPopUp').dialog({title : '<s:message code="product.adj_basyy"/>'});
				
				$('#BAS_YY_I').val($(this).data("BAS_YY"));			//기준년도
				$('#BAS_YY_SEQ_PD').val($(this).data("BAS_YY_SEQ"));
				if($(this).data("SSN_GBN") == "시즌"){
					$('#SSN_GBN_I').val(1);
				} else {
					$('#SSN_GBN_I').val(2);
				}
				$('#ST_DT1_I').val($(this).data("ST_DT1").replaceAll("-",""));			//시작일1
				$('#ED_DT1_I').val($(this).data("ED_DT1").replaceAll("-",""));			//종료일1
				$('#ST_DT2_I').val($(this).data("ST_DT2").replaceAll("-",""));			//시작일2
				$('#ED_DT2_I').val($(this).data("ED_DT2").replaceAll("-",""));			//종료일2
				$('#ST_DT3_I').val($(this).data("ST_DT3").replaceAll("-",""));			//시작일3
				$('#ED_DT3_I').val($(this).data("ED_DT3").replaceAll("-",""));			//종료일3
				
				$('#BAS_YY_UP').val($(this).data("BAS_YY"));			//기준년도
			}
		},
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		}
	});
});

// 저장
function savePeriodInfo(){
	var formData = formIdAllToMap('frmProductPeriodDetail');
	var param = {"param" : 
					{"BAS_YY" 		: (formData.BAS_YY_I != "") ? formData.BAS_YY_I : formData.BAS_YY_UP
					,"BAS_YY_SEQ" 	: formData.BAS_YY_SEQ_PD
					,"SSN_GBN"		: formData.SSN_GBN_I
					,"ST_DT1" 		: formData.ST_DT1_I
					,"ED_DT1" 		: formData.ED_DT1_I
					,"ST_DT2" 		: formData.ST_DT2_I
					,"ED_DT2" 		: formData.ED_DT2_I
					,"ST_DT3" 		: formData.ST_DT3_I
					,"ED_DT3" 		: formData.ED_DT3_I
					,"modify" 		: formData.modify
					}
				}
	var url = "/product/savePeriodInfo.do"
	
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if(data.SAVE == 'N'){
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			}else{
				alert("<s:message code='info.save'/>");
				popupClose($('#productPeriodDetailPopUp').data('pid'));	
			}
		});
	}
}

//삭제
function deleteProductInfo(){
	var formData = formIdAllToMap('frmProductPeriodDetail');
	var param = {"param" : 
					{"BAS_YY" 		: formData.BAS_YY_UP
					,"BAS_YY_SEQ" 	: formData.BAS_YY_SEQ_PD
					}
				}
	var url = "/product/deletePeriodInfo.do"
	
	if(confirm("<s:message code='confirm.delete'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			alert("<s:message code='product.info.delete'/>");
			popupClose($('#productPeriodDetailPopUp').data('pid'));			
		});
	}
}

//유효성 검사
function validation(){
	var BAS_YY_I = document.getElementById("BAS_YY_I");
	var ST_DT1_I = document.getElementById("ST_DT1_I");
	var ED_DT1_I = document.getElementById("ED_DT1_I");
	
	if(BAS_YY_I.value.length == 0){
		alert("기준년도를 입력해주세요.");
		BAS_YY_I.focus();
		return false;
	}

	if(ST_DT1_I.value.length == 0){
		alert("시작일1을 입력해주세요.");
		ST_DT1_I.focus();
		return false;
	}
	
	if(ED_DT1_I.value.length == 0){
		alert("종료일1을 입력해주세요.");
		ED_DT1_I.focus();
		return false;
	}
	savePeriodInfo();
}
</script>