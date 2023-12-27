<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div id="productDetailPopUp">
	<!--- 검색버튼 ---->
	<div id="divBtns">
		<div id="divBtn">
			<button class='btn btn-default ' id='cReset' type='button' onclick=''>초기화</button>
			<button class='btn btn-default ' id='cDel' type='button' onclick='' style='display:none'>삭제</button>
			<button class='btn btn-default ' id='cSave' type='button' onclick=''>저장</button>
			<button class='btn btn-default ' id='cCancel' type='button' onclick=''>닫기</button>
		</div>
	</div>
	
	<!---------->
	<form id="frmProductDetail" action="#">
		<div id="pop_ct_form_wrap">
			<input type="hidden" name="BAS_YY_UP" id="BAS_YY_UP" value="" />
			<input type="hidden" name="BAS_YY_SEQ_UP" id="BAS_YY_SEQ_UP" value="" />
			<input type="hidden" name="PROD_SEQ_UP" id="PROD_SEQ_UP" value="" />
			<input type="hidden" name="modify" id="modify" value="" />
			
			<table class="pop_tblForm">
			<colgroup>
				<col width="15%">
				<col width="30%">
				<col width="15%">
				<col width="30%">
			</colgroup>
				<!---<caption></caption> --->
				<tr>
					<th style="text-align:center;"><s:message code="product.baseyear"/></th>
					<td>&nbsp;
						<select id="BAS_YY_IN" name="BAS_YY_IN" class="cmc_combo" style="width:238px;">
							<c:forEach var="i" items="${basyy}">
								<option value="${i.BAS_YY}">${i.BAS_YY}</option>
							</c:forEach>
						</select>
						<input type="text" name="BAS_YY_IN_mod" id="BAS_YY_IN_mod" style="display:none; width:230px;" readonly >
					</td>
					<th style="text-align:center;"><s:message code="product.season"/></th>
					<td>&nbsp;
						<select id="SSN_GBN" name="SSN_GBN" class="cmc_combo" style="width:238px;">
    						<option value="1" selected>시즌</option>
    						<option value="2">비시즌</option>
						</select>
						<input type="text" name="SSN_GBN_mod" id="SSN_GBN_mod" style="display:none; width:230px;" readonly >
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.item"/></th>
					<td colspan=3>&nbsp;
						<select id="HDNG_GBN" name="HDNG_GBN" class="cmc_combo" style="width:604px;">
							<c:forEach var="i" items="${hdng}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="text" name="HDNG_GBN_mod" id="HDNG_GBN_mod" style="display:none; width:595px;" readonly >
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.condition"/></th>
					<td colspan=3>&nbsp;
						<select id="PROD_COND" name="PROD_COND" class="cmc_combo" style="width:604px;">
							<c:forEach var="i" items="${cond}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.seldt"/></th>
					<td colspan=3>&nbsp;
						<input type="text" name="seldt_P" id="seldt_P" style="width:235px;" readonly>
						<input type="hidden" name="seldt_I" id="seldt_I">
						<button class='btn btn-default' type="button" name="seldt" id="seldt" style="width:50px;">선택</button>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.amount"/></th>
					<td colspan=3>&nbsp;
						일반 <input type="text" name="COM_AMT" id="COM_AMT" style="width:170px; text-align:right">&nbsp;원 &emsp;&emsp;&emsp;
						에이전시 <input type="text" name="AGN_AMT" id="AGN_AMT" style="width:170px; text-align:right">&nbsp;원
					</td>
				</tr>
				<tr>
					<th style="text-align:center;">일반<s:message code="product.etc"/></th>
					<td colspan=3>&nbsp;
						기준인원 <input type="text" name="COM_BAS_PER" id="COM_BAS_PER" style="width:50px; text-align:right">&nbsp;명 &emsp;&emsp;&emsp;
						기준일 <input type="text" name="COM_BAS_DAY" id="COM_BAS_DAY" style="width:50px; text-align:right">&nbsp;일 &emsp;&emsp;&emsp;&emsp;
						<input type="text" name="COM_CNTN" id="COM_CNTN" style="width:251px" readonly>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;">에이전시<s:message code="product.etc"/></th>
					<td colspan=3>&nbsp;
						기준인원 <input type="text" name="AGN_BAS_PER" id="AGN_BAS_PER" style="width:50px; text-align:right">&nbsp;명 &emsp;&emsp;&emsp;
						기준일 <input type="text" name="AGN_BAS_DAY" id="AGN_BAS_DAY" style="width:50px; text-align:right">&nbsp;일 &emsp;&emsp;&emsp;&emsp;
						<input type="text" name="AGN_CNTN" id="AGN_CNTN" style="width:251px" readonly>
					</td>
				</tr>
			</table>
			<!-- ----------------- -->
		</div>
		<br>
	</form>
</div>

<script type="text/javascript">

$(function(){
    // 초기화 버튼
	$("#cReset").click(function(e){
		$("#frmProductDetail").reset();
	});
	
	// 삭제 버튼
	$("#cDel").click(function(e){
		deleteProductInfo()
	});
	
	// 닫기 버튼
	$("#cCancel").click(function(e){
		$('#productDetailPopUp').dialog('close')
	});
	
	// 저장 버튼
	$("#cSave").click(function(e){
		saveProductInfo()
	});
	
	// 기간선택 버튼
	$("#seldt").click(function(e){
		openSeldtPopUp();
	})
	
	// 등록, 수정 분기
	$('#productDetailPopUp').dialog({
		title: '<s:message code="product.regist"/>',
		autoOpen: false,
		width: 750,
		modal: true,
		open: function() {
			if($(this).data("modify") == true){
				$("#cReset").hide();
				$("#cDel").show();
				$("#cSave").text("수정");
				$("#modify").val("1");
				
				$('#BAS_YY_IN_mod').val($(this).data("BAS_YY"));			//기준년도 (수정)
				$('#SSN_GBN_mod').val($(this).data("SSN_GBN"));			//시즌구분 (수정)
				$('#HDNG_GBN_mod').val($(this).data("HDNG_GBN"));		//항목구분 (수정)
				$("#PROD_COND").val($(this).data("PROD_COND2"));			//조건
				
				$("#seldt_P").val($(this).data("ST_DT1") + " ~ " + $(this).data("ED_DT1"));
				$("#seldt_I").val($(this).data("BAS_YY_SEQ"));
				
				$("#COM_AMT").val($(this).data("COM_AMT"));				//일반 금액
				$("#AGN_AMT").val($(this).data("AGN_AMT"));				//에이전시 금액
				
				$("#COM_BAS_PER").val($(this).data("COM_BAS_PER"));		//일반 기준인원수
				$("#COM_BAS_DAY").val($(this).data("COM_BAS_DAY"));		//일반 기준일수
				$("#COM_CNTN").val($(this).data("COM_CNTN"));			//일반 기타내용
				
				$("#AGN_BAS_PER").val($(this).data("AGN_BAS_PER"));		//에이전시 기준인원수
				$("#AGN_BAS_DAY").val($(this).data("AGN_BAS_DAY"));		//에이전시 기준일수
				$("#AGN_CNTN").val($(this).data("AGN_CNTN"));			//에이전시 기타내용
				
				$('#BAS_YY_UP').val($(this).data("BAS_YY"));				//기준년도
				$('#BAS_YY_SEQ_UP').val($(this).data("BAS_YY_SEQ"));		//기준년도 순번
				$('#PROD_SEQ_UP').val($(this).data("PROD_SEQ"));			//상품순번
				
				$('#BAS_YY_IN').hide();
				$('#BAS_YY_IN_mod').show();
				$('#SSN_GBN').hide();
				$('#SSN_GBN_mod').show();
				$('#HDNG_GBN').hide();
				$('#HDNG_GBN_mod').show();
			};

		},
		close: function() {
			/* 필수로 들어가야함 */
			popupClose($(this).attr('id'));
		}
	});
});

// 저장
function saveProductInfo(){
	var formData = formIdAllToMap('frmProductDetail');
	var param = {"param" : 
					{"SSN_GBN":(formData.SSN_GBN != "") ? formData.SSN_GBN : formData.SSN_GBN_mod
					,"HDNG_GBN":(formData.HDNG_GBN != "") ? formData.HDNG_GBN : formData.HDNG_GBN_mod
					,"PROD_COND" : formData.PROD_COND
					,"COM_AMT" : formData.COM_AMT
					,"AGN_AMT" : formData.AGN_AMT
					,"COM_BAS_PER" : formData.COM_BAS_PER
					,"COM_BAS_DAY" : formData.COM_BAS_DAY
					,"COM_CNTN" : formData.COM_CNTN
					,"AGN_BAS_PER" : formData.AGN_BAS_PER
					,"AGN_BAS_DAY" : formData.AGN_BAS_DAY
					,"AGN_CNTN" : formData.AGN_CNTN
					,"BAS_YY" : (formData.BAS_YY_UP != "") ? formData.BAS_YY_UP : formData.BAS_YY_IN
					,"BAS_YY_SEQ" : (formData.BAS_YY_SEQ_UP != "") ? formData.BAS_YY_SEQ_UP : formData.seldt_I
					,"PROD_SEQ" : formData.PROD_SEQ_UP
					,"modify" : formData.modify
					}
				}
	var url = "/common/saveProductInfo.do"
	
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if(data.SAVE == 'N'){
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			}else{
				alert("<s:message code='info.save'/>");
				popupClose($('#productDetailPopUp').data('pid'));			
			}
		});
	}
}

// 삭제
function deleteProductInfo(){
	var formData = formIdAllToMap('frmProductDetail');
	var param = {"param" : 
					{"BAS_YY" : formData.BAS_YY_UP
					,"BAS_YY_SEQ" : formData.BAS_YY_SEQ_UP
					,"PROD_SEQ" : formData.PROD_SEQ_UP
					}
				}
	var url = "/common/deleteProductInfo.do"
	
	if(confirm("<s:message code='confirm.delete'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			alert("<s:message code='product.info.delete'/>");
			popupClose($('#productDetailPopUp').data('pid'));			
		});
	}
}

// 기간선택 팝업 열기
function openSeldtPopUp(){
	var url = "/popup/ProductSelectPeriodPopUp.do";
	var pid = "productSelectPeriodPopUp";	//팝업 페이지의 최상위 div ID
	var formData = formIdAllToMap('frmProductDetail');
	var param = { 
			"BAS_YY" : (formData.BAS_YY_UP != "") ? formData.BAS_YY_UP : formData.BAS_YY_IN,
			"SSN_GBN" : formData.SSN_GBN
	}
	popupOpen(url, pid, param, function(data){
		
	});
}

</script>