<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : pickUpGgnPopup
 */
%>
<style>
.pbtn_default {margin: 0 3px -1px 5px;padding: 3px 10px 3px 10px;border: 1px solid #a9cbeb !important;background: #bdd6ee !important;color: #2269b1;}
</style>
<div id="p_pickUpGbnPopup">
	<form id="frmPickupFrm" action="#">
		<div id="pop_ct_form_wrap">
			<table class="pop_tblForm">
				<colgroup>
					<col width="20%" />
			        <col width="30%" />
			        <col width="20%" />
			        <col width="30%" />
			    </colgroup>
		   		<tr>
		   	     	<th><s:message code='meetSanding.meet'/></th>
					<td class="medium_td">
						<select id="PICK_GBN_1" name="PICK_GBN_1" class="cmc_combo" style="width:62%;">
						    <c:forEach var="i" items="${region}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="hidden" id="HD_PROD_SEQ1" name="HD_PROD_SEQ1">
						<input type="hidden" id="HD_PROD_SEQ2" name="HD_PROD_SEQ2">
						<input type="hidden" id="HD_PROD_SEQ3" name="HD_PROD_SEQ3">
						<input type="hidden" id="HD_PROD_SEQ4" name="HD_PROD_SEQ4">
					</td>
					<th><s:message code='meetSanding.prdCnt'/></th>
					<td>
					    <select id="PRD_CNT" name="PRD_CNT" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='meetSanding.prdGbn'/></th>
					<td>
						<select id="PROD_SEQ1" name="PROD_SEQ1" class="cmc_combo" style="width:100%;">
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='meetSanding.personCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="PER_NUM1" value="0" style="width:51.5%;" name="PER_NUM1" maxlength="3"/>명
					</td>
					<th><s:message code='meetSanding.carCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CAR_NUM1" value="0" style="width:51.5%;" name="CAR_NUM1"/ maxlength="3">회
					</td>
				</tr>
				<tr>
				    <th><s:message code='meetSanding.fee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="USE_AMT1" value="0" name="USE_AMT1" style="width:51.5%;" readonly/>원
					</td>	
					<th><s:message code='meetSanding.addFee'/></th>
					<td>
						<input type="text" class="cmc_txt fee withComma" id="ADD_AMT1" value="0" name="ADD_AMT1" style="width:51.5%;"	maxlength="9"/>원
					</td>
				</tr>
				<tr class="doubleCnt">
				    <th><s:message code='meetSanding.prdGbn'/></th>
					<td>
					    <select id="PROD_SEQ2" name="PROD_SEQ2" class="cmc_combo" style="width:100%;">
						</select>
					</td>
				</tr>
				<tr class="doubleCnt">
				    <th><s:message code='meetSanding.personCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="PER_NUM2" value="0" style="width:51.5%;" name="PER_NUM2" maxlength="3"/>명
					</td>
					<th><s:message code='meetSanding.carCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CAR_NUM2" value="0" style="width:51.5%;" name="CAR_NUM2" maxlength="3"/>회
					</td>
				</tr>
				<tr class="doubleCnt">
				    <th><s:message code='meetSanding.fee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="USE_AMT2" value="0" name="USE_AMT2" style="width:51.5%;" readonly/>원
					</td>	
					<th><s:message code='meetSanding.addFee'/></th>
					<td>
						<input type="text" class="cmc_txt fee withComma" id="ADD_AMT2" value="0" name="ADD_AMT2" style="width:51.5%;" maxlength="9"/>원
					</td>
				</tr>
				
				
				<tr class="doubleCnt3">
				    <th><s:message code='meetSanding.prdGbn'/></th>
					<td>
					    <select id="PROD_SEQ3" name="PROD_SEQ3" class="cmc_combo" style="width:100%;">
						</select>
					</td>
				</tr>
				<tr class="doubleCnt3">
				    <th><s:message code='meetSanding.personCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="PER_NUM3" value="0" style="width:51.5%;" name="PER_NUM3" maxlength="3"/>명
					</td>
					<th><s:message code='meetSanding.carCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CAR_NUM3" value="0" style="width:51.5%;" name="CAR_NUM3" maxlength="3"/>회
					</td>
				</tr>
				<tr class="doubleCnt3">
				    <th><s:message code='meetSanding.fee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="USE_AMT3" value="0" name="USE_AMT3" style="width:51.5%;" readonly/>원
					</td>	
					<th><s:message code='meetSanding.addFee'/></th>
					<td>
						<input type="text" class="cmc_txt fee withComma" id="ADD_AMT3" value="0" name="ADD_AMT3" style="width:51.5%;" maxlength="9"/>원
					</td>
				</tr>
				
				
				<tr class="doubleCnt4">
				    <th><s:message code='meetSanding.prdGbn'/></th>
					<td>
					    <select id="PROD_SEQ4" name="PROD_SEQ4" class="cmc_combo" style="width:100%;">
						</select>
					</td>
				</tr>
				<tr class="doubleCnt4">
				    <th><s:message code='meetSanding.personCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="PER_NUM4" value="0" style="width:51.5%;" name="PER_NUM4" maxlength="3"/>명
					</td>
					<th><s:message code='meetSanding.carCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CAR_NUM4" value="0" style="width:51.5%;" name="CAR_NUM4" maxlength="3"/>회
					</td>
				</tr>
				<tr class="doubleCnt4">
				    <th><s:message code='meetSanding.fee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="USE_AMT4" value="0" name="USE_AMT4" style="width:51.5%;" readonly/>원
					</td>	
					<th><s:message code='meetSanding.addFee'/></th>
					<td>
						<input type="text" class="cmc_txt fee withComma" id="ADD_AMT4" value="0" name="ADD_AMT4" style="width:51.5%;" maxlength="9"/>원
					</td>
				</tr>
			</table>
		</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	var gv_req_dt;
	var gv_seq;
	var gv_tot_person;
	$('#p_pickUpGbnPopup').dialog({
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
		open : function() {
			mkSelect($(this).data());
			fn_init($(this).data());
		}
	});
	
	$("#PRD_CNT").change(function(){
		if($(this).val() == '2'){
			$(".doubleCnt").show();
			$(".doubleCnt3").hide();
			$(".doubleCnt4").hide();
		}else if($(this).val() == '3'){
			$(".doubleCnt").show();
			$(".doubleCnt3").show();
			$(".doubleCnt4").hide();
		}else if($(this).val() == '4'){
			$(".doubleCnt").show();
			$(".doubleCnt3").show();
			$(".doubleCnt4").show();
		}else{
			$(".doubleCnt").hide();
			$(".doubleCnt3").hide();
			$(".doubleCnt4").hide();
		}
	});
	
	$("#PICK_GBN_1").change(function(){
	    var thisVal  = $(this).val();
	    selec_init(thisVal);
		if(thisVal == "01"){ // 미신청
			fn_readonly(true);
			$(".doubleCnt").hide();
			$(".doubleCnt3").hide();
			$(".doubleCnt4").hide();
			$("#PER_NUM1").val("0");
			$("#CAR_NUM1").val("0");
			$("#USE_AMT1").val("0");
			$("#ADD_AMT1").val("0");
		}else{ // 공항선택
			fn_readonly(false);
			$("#CAR_NUM1").val("1");
			$(".doubleCnt3").hide();
			$(".doubleCnt4").hide();
			$("#PER_NUM1").val(gv_tot_person);
		}
		
		$('#PROD_SEQ1 option[data='+thisVal+']:eq(0)').prop("selected" , true);
		$('#PROD_SEQ1 option[data='+thisVal+']').show();
		$('#PROD_SEQ1 option').not('[data='+thisVal+']').hide();
		
		$('#PROD_SEQ2 option[data='+thisVal+']:eq(0)').prop("selected" , true);
		$('#PROD_SEQ2 option[data='+thisVal+']').show();
		$('#PROD_SEQ2 option').not('[data='+thisVal+']').hide();

		$('#PROD_SEQ3 option[data='+thisVal+']:eq(0)').prop("selected" , true);
		$('#PROD_SEQ3 option[data='+thisVal+']').show();
		$('#PROD_SEQ3 option').not('[data='+thisVal+']').hide();

		$('#PROD_SEQ4 option[data='+thisVal+']:eq(0)').prop("selected" , true);
		$('#PROD_SEQ4 option[data='+thisVal+']').show();
		$('#PROD_SEQ4 option').not('[data='+thisVal+']').hide();
		
		$("#USE_AMT1").val(fn_comma($('#PROD_SEQ1 option[data='+thisVal+']:eq(0)').attr("com_amt")));
		$("#USE_AMT2").val(fn_comma($('#PROD_SEQ1 option[data='+thisVal+']:eq(0)').attr("com_amt")));
		$("#USE_AMT3").val(fn_comma($('#PROD_SEQ1 option[data='+thisVal+']:eq(0)').attr("com_amt")));
		$("#USE_AMT4").val(fn_comma($('#PROD_SEQ1 option[data='+thisVal+']:eq(0)').attr("com_amt")));
	});
	
	$("#PROD_SEQ1").on("change" , function(){
		var prd_val = $(this).val();
		var vfee;
		var v_com_amt1 = parseInt($("#PROD_SEQ1 option:selected").attr("com_amt"));
		
		if(!fn_empty(prd_val)){
			vfee =  v_com_amt1;
		}else{
			vfee = 0;
		}
		$("#USE_AMT1").val(vfee);
	});
	
	$("#PROD_SEQ2").on("change" , function(){
		var prd_val = $(this).val();
		var vfee2;
		var v_com_amt2 = parseInt($("#PROD_SEQ2 option:selected").attr("com_amt"));
		if(!fn_empty(prd_val)){
			vfee2 = v_com_amt2;
		}else{
			vfee2 = 0;
		}
		console.log("PROD_SEQ2");
		$("#USE_AMT2").val(vfee2);
	});

	$("#PROD_SEQ3").on("change" , function(){
		var prd_val = $(this).val();
		var vfee3;
		var v_com_amt3 = parseInt($("#PROD_SEQ3 option:selected").attr("com_amt"));
		if(!fn_empty(prd_val)){
			vfee3 = v_com_amt3;
		}else{
			vfee3 = 0;
		}
		$("#USE_AMT3").val(vfee3);
	});

	$("#PROD_SEQ4").on("change" , function(){
		var prd_val = $(this).val();
		var vfee4;
		var v_com_amt4 = parseInt($("#PROD_SEQ4 option:selected").attr("com_amt"));
		if(!fn_empty(prd_val)){
			vfee4 = v_com_amt4;
		}else{
			vfee4 = 0;
		}
		$("#USE_AMT4").val(vfee4);
	});
	
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
	
	function fn_readonly (temp){
		$("#PRD_CNT"  ).attr("disabled" , temp);
		$("#PROD_SEQ1").attr("disabled" , temp);
		$("#PROD_SEQ2").attr("disabled" , temp);
		$("#PROD_SEQ3").attr("disabled" , temp);
		$("#PROD_SEQ4").attr("disabled" , temp);
		
		$("#PER_NUM1" ).attr("readonly" , temp);
		$("#CAR_NUM1" ).attr("readonly" , temp);
		$("#PER_NUM2" ).attr("readonly" , temp);
		$("#CAR_NUM2" ).attr("readonly" , temp);
		$("#PER_NUM3" ).attr("readonly" , temp);
		$("#CAR_NUM3" ).attr("readonly" , temp);
		$("#PER_NUM4" ).attr("readonly" , temp);
		$("#CAR_NUM4" ).attr("readonly" , temp);
		
		$("#ADD_AMT1" ).attr("readonly" , temp);
		$("#ADD_AMT2" ).attr("readonly" , temp);
		$("#ADD_AMT3" ).attr("readonly" , temp);
		$("#ADD_AMT4" ).attr("readonly" , temp);
	}
	
	function mkSelect(recevicedData){
		var url = "/reserve/selectPrdInfo.do";
		var param = {"CHK_IN_DT"     : recevicedData.CHK_IN_DT // 연도
					, "CHK_OUT_DT"     : recevicedData.CHK_OUT_DT 
					, "PICK_GBN"     : recevicedData.PICK_GBN 
		            };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("상세 조회 오류입니다. 시스템 관리자에게 문의해 주세요.");
			}else{
				var vhtml;
				vhtml = '<option value="" data = "01" dataDetail = "01" com_amt = 0>--<s:message code="system.select"/>--</option>'
				$.each(data.result , function ( i , v){
					if(v.HDNG_GBN == "18") {
						vhtml += '<option value = '+v.PROD_COND+' data="02" dataDetail = '+'0'+(i+2)+' prod_seq = '+v.PROD_SEQ+' com_amt = '+v.COM_AMT+'>'+v.CODE_NM+'</option>';
					}else{
						vhtml += '<option value = '+v.PROD_COND+' data="03" dataDetail = '+'0'+(i+2)+' prod_seq = '+v.PROD_SEQ+' com_amt = '+v.COM_AMT+'>'+v.CODE_NM+'</option>';
					}
				});
				$("#PROD_SEQ1").append(vhtml);
				$("#PROD_SEQ2").append(vhtml);
				$("#PROD_SEQ3").append(vhtml);
				$("#PROD_SEQ4").append(vhtml);
			}
		});
	}
	
	function fn_init(recevicedData) {
		gv_req_dt     = recevicedData.REQ_DT;
		gv_seq        = recevicedData.SEQ;
		gv_tot_person = recevicedData.TOT_PERSON;
		gv_pick_gbn = recevicedData.PICK_GBN;
		
		selec_init("01");
		
		if(!fn_empty(recevicedData.PRC_STS)){
			if(recevicedData.PRC_STS == "08" || recevicedData.PRC_STS == "09" ||recevicedData.PRC_STS == "10"){
				$(".ui-dialog-buttonset > button#save").attr("disabled", true);
			}	
		}
		
		var url = "/reserve/selectPickupList.do";
     	var param = {"REQ_DT"     : gv_req_dt 
	               , "REQ_SEQ"    : parseInt(gv_seq)
	               , "REQ_SEQ"    : parseInt(gv_seq)
	                };
     	fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("상세 조회 오류입니다. 시스템 관리자에게 문의해 주세요.");
			}else{
				if(!fn_empty(data.result)){
					$("#PRD_CNT").val(data.result.length).trigger("change");
					for (var i = 0; i < data.result.length; i++) {
						$.each(data.result[i], function(k , v){
							if(k == "PICK_GBN"){
								if(v == "04" || v == "05"){
									$("#PICK_GBN_1").val("03");
									$('#PROD_SEQ1 option[data=03]').show();
									$('#PROD_SEQ1 option').not('[data=03]').hide();
									$('#PROD_SEQ2 option[data=03]').show();
									$('#PROD_SEQ2 option').not('[data=03]').hide();
									$('#PROD_SEQ3 option[data=03]').show();
									$('#PROD_SEQ3 option').not('[data=03]').hide();
									$('#PROD_SEQ4 option[data=03]').show();
									$('#PROD_SEQ4 option').not('[data=03]').hide();
								}else{
									$("#PICK_GBN_1").val(v);
									$('#PROD_SEQ1 option[data='+v+']').show();
									$('#PROD_SEQ1 option').not('[data='+v+']').hide();
									$('#PROD_SEQ2 option[data='+v+']').show();
									$('#PROD_SEQ2 option').not('[data='+v+']').hide();
									$('#PROD_SEQ3 option[data='+v+']').show();
									$('#PROD_SEQ3 option').not('[data='+v+']').hide();
									$('#PROD_SEQ4 option[data='+v+']').show();
									$('#PROD_SEQ4 option').not('[data='+v+']').hide();
								}
							}else if(k == "PROD_SEQ"){
								$("#PROD_SEQ" + parseInt(i+1) + ' option[prod_seq='+v+']').prop("selected", true);
								$("#HD_"+k+parseInt(i+1)).val(v); 
							}else if(k == "USE_AMT" || k == "ADD_AMT"){
								$("#"+k+parseInt(i+1)).val(fn_comma(v));
							}else{
								$("#"+k+parseInt(i+1)).val(v);
							}	
						});
					}
					$(".ui-dialog-buttonset > button#save").text("수정");
					$("#PICK_GBN_1").val(gv_pick_gbn);
				}else{
					$("#PICK_GBN_1").val("01").trigger("change");
				}
			}
		});
	}
	
	function selec_init(data){ // 초기화
		$('#PROD_SEQ1 option[value='+ data +']:eq(0)').prop("checked", true);
	
		$("#PER_NUM1" ).val("0");
		$("#CAR_NUM1" ).val("0");
		$("#ADD_AMT1" ).val("0");
		$("#USE_AMT1" ).val("0");
		
		$("#PER_NUM2" ).val("0");
		$("#CAR_NUM2" ).val("0");
		$("#ADD_AMT2" ).val("0");
		$("#USE_AMT2" ).val("0");

		$("#PER_NUM3" ).val("0");
		$("#CAR_NUM3" ).val("0");
		$("#ADD_AMT3" ).val("0");
		$("#USE_AMT3" ).val("0");

		$("#PER_NUM4" ).val("0");
		$("#CAR_NUM4" ).val("0");
		$("#ADD_AMT4" ).val("0");
		$("#USE_AMT4" ).val("0");
		
		$(".doubleCnt").hide();
		if(data != "01") $("#PRD_CNT").val("1");
		else             $("#PRD_CNT").val("");
	}
	
	function savePickInfo(){
		var formData = formIdAllToMap('frmPickupFrm');
		var array = new Array();
		for (var i = 1; i < parseInt(formData.PRD_CNT) + 1	; i++) {
			var obj = new Object();
			obj.ADD_AMT     = parseInt($("#ADD_AMT"+i).val().replaceAll(",", ""));
			obj.CAR_NUM     = parseInt($("#CAR_NUM"+i).val());
			obj.PER_NUM     = parseInt($("#PER_NUM"+i).val());
			obj.USE_AMT     = parseInt($("#USE_AMT"+i).val().replaceAll(",", ""));
			obj.PROD_SEQ    = parseInt($('#PROD_SEQ'+i+' option:selected').attr("prod_seq"))
			obj.PICK_GBN    = $('#PROD_SEQ'+i+' option:selected').attr("data");
			obj.HD_PROD_SEQ = parseInt($('#HD_PROD_SEQ'+i).val());
			array.push(obj);
		}
		
		if(!validation(array)) return;
		var param = {"detail"   : array
				   , "REQ_SEQ"  : parseInt(gv_seq)
				   , "REQ_DT"   : gv_req_dt
				   , "PICK_GBN" : $("#PICK_GBN_1").val()
				   , "PER_NUM"   : parseInt($("#PER_NUM1").val()) + parseInt($("#PER_NUM2").val()) + parseInt($("#PER_NUM3").val()) + parseInt($("#PER_NUM4").val())
				   };
		if(confirm("<s:message code='confirm.save'/>")){
			var url = '/reserve/pickupManager.do';
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					p_rtnData = {"PER_NUM"  : parseInt($("#PER_NUM1").val()) + parseInt($("#PER_NUM2").val()) + parseInt($("#PER_NUM3").val()) + parseInt($("#PER_NUM4").val())
							   , "PICK_GBN" : param.PICK_GBN};
					popupClose($('#p_pickUpGbnPopup').data('pid'));
				}
			});
		}
	}
	
	function validation(data){
		var prd_cnt = $("#PRD_CNT").val();
		if(!fn_empty(prd_cnt)){
			for (var i = 1; i < parseInt(prd_cnt) + 1 ; i++) {
				if($("#PER_NUM"+i).val() == "0" || fn_empty($("#PER_NUM"+i).val())){
					alert("인원수를 입력해 주세요.");
			        return false;
			    }
			    
		    	if(prd_cnt == 1){
		    		if(parseInt($("#PER_NUM1").val()) > parseInt(gv_tot_person)){
				    	alert("입력하신 인원수가 총인원보다 많습니다.");
				    	return false;
				    }
		    	}else if(prd_cnt == 2){
		    		if(parseInt($("#PER_NUM1").val()) + parseInt($("#PER_NUM2").val()) > parseInt(gv_tot_person)){
				    	alert("입력하신 인원수가 총인원보다 많습니다.");
				    	return false;
				    }
		    	}else if(prd_cnt == 3){
		    		if(parseInt($("#PER_NUM1").val()) + parseInt($("#PER_NUM2").val()) + parseInt($("#PER_NUM3").val()) > parseInt(gv_tot_person)){
				    	alert("입력하신 인원수가 총인원보다 많습니다.");
				    	return false;
				    }
		    	}else if(prd_cnt == 4){
		    		if(parseInt($("#PER_NUM1").val()) + parseInt($("#PER_NUM2").val()) + parseInt($("#PER_NUM3").val()) + parseInt($("#PER_NUM4").val()) > parseInt(gv_tot_person)){
				    	alert("입력하신 인원수가 총인원보다 많습니다.");
				    	return false;
				    }
		    	}
		    	
		    	if($("#CAR_NUM"+i).val() == "0" || fn_empty($("#CAR_NUM"+i).val())){
		    		alert("이용횟수를 입력해주세요.");
			        return false;
			    }
		    	
		    	if(prd_cnt == 2){
	 		    	if(data[0].PROD_SEQ == data[1].PROD_SEQ){
						alert("같은 상품은 선택할 수 없습니다.");
						return false;
	 		    	}
				}else if(prd_cnt == 3){
	 		    	if(data[0].PROD_SEQ == data[1].PROD_SEQ || data[0].PROD_SEQ == data[2].PROD_SEQ || data[1].PROD_SEQ == data[2].PROD_SEQ){
						alert("같은 상품은 선택할 수 없습니다.");
						return false;
	 		    	}
		    	}else if(prd_cnt == 4){
		    		if(data[0].PROD_SEQ == data[1].PROD_SEQ || data[0].PROD_SEQ == data[2].PROD_SEQ || data[0].PROD_SEQ == data[3].PROD_SEQ){
						alert("같은 상품은 선택할 수 없습니다.");
						return false;
	 		    	}else if(data[1].PROD_SEQ == data[2].PROD_SEQ || data[1].PROD_SEQ == data[3].PROD_SEQ || data[2].PROD_SEQ == data[3].PROD_SEQ){
						alert("같은 상품은 선택할 수 없습니다.");
						return false;
	 		    	}
		    	}
				
			}
		}
		return true;
	}		    
});

</script>