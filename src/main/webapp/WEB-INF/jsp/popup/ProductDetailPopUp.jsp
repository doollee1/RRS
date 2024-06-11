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
			<input type="hidden" name="P_SAVE" id="P_SAVE" />
			<input type="hidden" name="reserveStatus" id="reserveStatus" value=""/>
			
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
    						<option value="3" selected>비수기</option>
    						<option value="2">준성수기</option>
    						<option value="1">성수기</option>
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
						<input type="hidden" name="HDNG_GBN_CODE" id="HDNG_GBN_CODE" value="" />
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.condition"/></th>
					<td colspan=3>&nbsp;
						<select id="PROD_COND" name="PROD_COND" class="cmc_combo" style="width:604px;">
							<c:forEach var="i" items="${prodcond}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="text" name="PROD_COND_mod" id="PROD_COND_mod" style="display:none; width:595px;" readonly >
						<input type="hidden" name="PROD_COND2" id="PROD_COND2" value="" />
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.seldt"/></th>
					<td colspan=3>&nbsp;
						<input type="text" name="seldt_P" id="seldt_P" style="width:235px;" readonly>
						<input type="hidden" class="check" name="seldt_I" id="seldt_I">
						<button class='btn btn-default' type="button" name="seldt" id="seldt" style="width:50px;">선택</button>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;"><s:message code="product.amount"/></th>
					<td colspan=3>&nbsp;
						일반 <input type="text" class="check" name="COM_AMT" id="COM_AMT" style="width:100px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='9' >&nbsp;원 &emsp;
						일반여행사 <input type="text" class="check" name="AGN_COM_AMT" id="AGN_COM_AMT" style="width:100px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='9' >&nbsp;원&emsp;
						총판여행사 <input type="text" class="check" name="AGN_DIS_AMT" id="AGN_DIS_AMT" style="width:100px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='9' >&nbsp;원
					</td>
				</tr>
				<tr>
					<th style="text-align:center;">일반<s:message code="product.etc"/></th>
					<td colspan=3>&nbsp;
						기준인원 <input type="text" class="check" name="COM_BAS_PER" id="COM_BAS_PER" style="width:50px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='3'>&nbsp;명 &emsp;&emsp;
						기준일 <input type="text" class="check" name="COM_BAS_DAY" id="COM_BAS_DAY" style="width:50px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='3'>&nbsp;일 &emsp;&emsp;&emsp;
						내용 <input type="text" name="COM_CNTN" id="COM_CNTN" style="width:248px" maxlength='50'>
					</td>
				</tr>
				<tr>
					<th style="text-align:center;">일반여행사<br/><s:message code="product.etc"/></th>
					<td colspan=3>&nbsp;
						기준인원 <input type="text" class="check" name="AGN_COM_BAS_PER" id="AGN_COM_BAS_PER" style="width:50px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='3'>&nbsp;명 &emsp;&emsp;
						기준일 <input type="text" class="check" name="AGN_COM_BAS_DAY" id="AGN_COM_BAS_DAY" style="width:50px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='3'>&nbsp;일 &emsp;&emsp;&emsp;
						내용 <input type="text" name="AGN_COM_CNTN" id="AGN_COM_CNTN" style="width:248px" maxlength='50'>
					</td>
				</tr>
				
				
				<tr>
					<th style="text-align:center;">총판여행사<br/><s:message code="product.etc"/></th>
					<td colspan=3>&nbsp;
						기준인원 <input type="text" class="check" name="AGN_DIS_BAS_PER" id="AGN_DIS_BAS_PER" style="width:50px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='3'>&nbsp;명 &emsp;&emsp;
						기준일 <input type="text" class="check" name="AGN_DIS_BAS_DAY" id="AGN_DIS_BAS_DAY" style="width:50px; text-align:right" value="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='3'>&nbsp;일 &emsp;&emsp;&emsp;
						내용 <input type="text" name="AGN_DIS_CNTN" id="AGN_DIS_CNTN" style="width:248px" maxlength='50'>
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
		validation();
	});
	
	// 기간선택 버튼
	$("#seldt").click(function(e){
		openSeldtPopUp();
	})
	
	$("#HDNG_GBN").on("change", function(e){
 		$("#PROD_COND").find("option").remove();
		condFilter();
	})

// 	// 유효성 검사
// 	$(".check").on('change', function(){
//         var scriptTag2 = /[~^&()|<>?]/; 
//         var regExp_tel1 = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
//         var checkText = "";
//         var thisVal = $(this).val();
        
      
//         }
// 	})
	
	// 등록, 수정 분기
	$('#productDetailPopUp').dialog({
		title: '<s:message code="product.reg_product"/>',
		autoOpen: false,
		width: 755,
		modal: true,
		open: function() {
			condFilter();
			$("#P_SAVE").val("");
			if($(this).data("modify") == true){
				$("#cReset").hide();
				$("#cDel").show();
				$("#cSave").text("수정");
				$("#modify").val("1");
				$('#productDetailPopUp').dialog({title : '<s:message code="product.adj_product"/>'});
				
				$('#BAS_YY_IN_mod').val($(this).data("BAS_YY"));			//기준년도 (수정)
				$('#SSN_GBN_mod').val($(this).data("SSN_GBN"));				//시즌구분 (수정)
				$('#HDNG_GBN_mod').val($(this).data("HDNG_GBN"));			//항목구분 (수정)
				$('#HDNG_GBN_CODE').val($(this).data("HDNG_GBN_CODE"));		//항목구분 코드
				
				$("#PROD_COND").val($(this).data("PROD_COND"));				//조건
				$("#PROD_COND2").val($(this).data("PROD_COND2"));			//조건2
				$("#PROD_COND_mod").val($(this).data("PROD_COND"));			//조건(수정)
				
				$("#seldt_P").val($(this).data("ST_DT1") + " ~ " + $(this).data("ED_DT1"));
				$("#seldt_I").val($(this).data("BAS_YY_SEQ"));
				
				$("#COM_AMT").val($(this).data("COM_AMT"));				//일반 금액
				$("#AGN_COM_AMT").val($(this).data("AGN_COM_AMT"));		//일반여행사 금액
				$("#AGN_DIS_AMT").val($(this).data("AGN_DIS_AMT"));		//총판여행사 금액
				
				$("#COM_BAS_PER").val($(this).data("COM_BAS_PER"));		//일반 기준인원수
				$("#COM_BAS_DAY").val($(this).data("COM_BAS_DAY"));		//일반 기준일수
				$("#COM_CNTN").val($(this).data("COM_CNTN"));			//일반 기타내용
				
				$("#AGN_COM_BAS_PER").val($(this).data("AGN_COM_BAS_PER"));		//일반여행사 기준인원수
				$("#AGN_COM_BAS_DAY").val($(this).data("AGN_COM_BAS_DAY"));		//일반여행사 기준일수
				$("#AGN_COM_CNTN").val($(this).data("AGN_COM_CNTN"));			//일반여행사 기타내용

				$("#AGN_DIS_BAS_PER").val($(this).data("AGN_DIS_BAS_PER"));		//총판여행사 기준인원수
				$("#AGN_DIS_BAS_DAY").val($(this).data("AGN_DIS_BAS_DAY"));		//총판여행사 기준일수
				$("#AGN_DIS_CNTN").val($(this).data("AGN_DIS_CNTN"));			//총판여행사 기타내용
				
				$('#BAS_YY_UP').val($(this).data("BAS_YY"));				//기준년도
				$('#BAS_YY_SEQ_UP').val($(this).data("BAS_YY_SEQ"));		//기준년도 순번
				$('#PROD_SEQ_UP').val($(this).data("PROD_SEQ"));			//상품순번
				
				$('#BAS_YY_IN').hide();
				$('#BAS_YY_IN_mod').show();
				$('#SSN_GBN').hide();
				$('#SSN_GBN_mod').show();
				$('#HDNG_GBN').hide();
				$('#HDNG_GBN_mod').show();
				$('#PROD_COND').hide();
				$('#PROD_COND_mod').show();
				$('#PROD_COND2').show();
				$('#seldt').hide();

				var url = "/product/selectReserveStatus.do"
				var param = {"BAS_YY"      : $(this).data("BAS_YY")
						   , "BAS_YY_SEQ"  : $(this).data("BAS_YY_SEQ")
						   , "PROD_SEQ"    : $(this).data("PROD_SEQ")
						   };
				
				fn_ajax(url, false, param, function(data, xhr){
					$("#reserveStatus").val(data.result.length);
				});
				
				if($("#reserveStatus").val() > 1){
					$("#pop_ct_form_wrap").find("input, select, button").prop("disabled",true);
					$("[id$=_BAS_PER]").prop("disabled", false);
					$("[id$=_BAS_DAY]").prop("disabled", false);
					$("[id$=_CNTN]").prop("disabled", false);
					$("#cDel").prop("disabled", true);
				} else {
					
					
				}
			};
			// condFilter();
		},
		close: function() {
			/* 필수로 들어가야함 */
			if($("#P_SAVE").val() == "Y"){
				p_rtnData = {
						"BAS_YY" : ($("#BAS_YY_UP").val() != "") ? $("#BAS_YY_UP").val() : $("#BAS_YY_IN").val(),
						"SSN_GBN" : ($("#SSN_GBN").val() != "") ? $("#SSN_GBN").val() : $("#SSN_GBN_mod").val()
				};
			} else {
				p_rtnData = {
						"BAS_YY" : "",
						"SSN_GBN" : ""
				};
			}
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
					,"PROD_COND":(formData.modify == "1") ? formData.PROD_COND2 : formData.PROD_COND	
					,"COM_AMT" : (formData.COM_AMT != "") ? formData.COM_AMT : 0
					,"AGN_COM_AMT" : (formData.AGN_COM_AMT != "") ? formData.AGN_COM_AMT : 0
					,"AGN_DIS_AMT" : (formData.AGN_DIS_AMT != "") ? formData.AGN_DIS_AMT : 0
					,"COM_BAS_PER" : (formData.COM_BAS_PER != "") ? formData.COM_BAS_PER : 0
					,"COM_BAS_DAY" : (formData.COM_BAS_DAY != "") ? formData.COM_BAS_DAY : 0
					,"COM_CNTN" : formData.COM_CNTN
					,"AGN_COM_BAS_PER" : (formData.AGN_COM_BAS_PER != "") ? formData.AGN_COM_BAS_PER : 0
					,"AGN_COM_BAS_DAY" : (formData.AGN_COM_BAS_DAY != "") ? formData.AGN_COM_BAS_DAY : 0
					,"AGN_COM_CNTN" : formData.AGN_COM_CNTN
					,"AGN_DIS_BAS_PER" : (formData.AGN_DIS_BAS_PER != "") ? formData.AGN_DIS_BAS_PER : 0
					,"AGN_DIS_BAS_DAY" : (formData.AGN_DIS_BAS_DAY != "") ? formData.AGN_DIS_BAS_DAY : 0
					,"AGN_DIS_CNTN" : formData.AGN_DIS_CNTN
					,"BAS_YY" : (formData.BAS_YY_UP != "") ? formData.BAS_YY_UP : formData.BAS_YY_IN
					,"BAS_YY_SEQ" : (formData.BAS_YY_SEQ_UP != "") ? formData.BAS_YY_SEQ_UP : formData.seldt_I
					,"PROD_SEQ" : formData.PROD_SEQ_UP
					,"modify" : formData.modify
					}
				}
	var url = "/product/saveProductInfo.do"
	
	if(confirm("<s:message code='confirm.save'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			if(data.SAVE == 'N'){
				alert("<s:message code='errors.dup' javaScriptEscape='false'/>"); 
			}else{
				alert("<s:message code='info.save'/>");
				$("#P_SAVE").val("Y");
				$('#productDetailPopUp').dialog('close');
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
	var url = "/product/deleteProductInfo.do"
	
	if(confirm("<s:message code='confirm.delete'/>")){
		fn_ajax(url, false, param, function(data, xhr){
			alert("<s:message code='product.info.delete'/>");
			$("#P_SAVE").val("Y");
			$('#productDetailPopUp').dialog('close');		
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

//유효성 검사
function validation(){
	if($("#seldt_I").val() == ""){
		alert("기간선택을 해주세요.");
		$("#seldt_I").focus();
		return;
	}
	if($("#COM_AMT").val() == ""  || $("#AGN_COM_AMT").val() == "" || $("#AGN_DIS_AMT").val() == ""){
		alert("금액을 입력해 주세요.")
		$("#COM_AMT").focus();
		return;
	} else {
		if($("#COM_AMT").val() + $("#AGN_COM_AMT").val() + $("#AGN_DIS_AMT").val() == 0){
			alert("일반금액과 에이전시 금액의 합은 0이 될 수 없습니다.");
			$("#COM_AMT").focus();
			return;
		}
	}
	saveProductInfo();
}

//조건 필터링
function condFilter(){
	var url = "/popup/ProductSelectCond.do";
	
	var formData = formIdAllToMap('frmProductDetail');
 	var param = {"code" :formData.HDNG_GBN};
 	// 수정이면
 	if(formData.modify == "1"){
 		param = {"code" :formData.HDNG_GBN_CODE};
 	}

	fn_ajax(url, false, param, function(data, xhr){
		$("#PROD_COND").empty();
		for (var i = 0; i < data.cond.length; i++) {
			if(formData.modify == "1" && formData.PROD_COND2 == data.cond[i].CODE ){
				$("#PROD_COND").append("<option value="+data.cond[i].CODE+" selected>"+data.cond[i].CODE_NM+"</option>");
			}else{
				$("#PROD_COND").append("<option value="+data.cond[i].CODE+">"+data.cond[i].CODE_NM+"</option>");
			}
		}
	});
}

</script>