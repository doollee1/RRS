<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : ReserveRegiPopup
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
						<input type="hidden" id="HD_PROD_SEQ" name="HD_PROD_SEQ">
					</td>
					<th><s:message code='meetSanding.prdCnt'/></th>
					<td>
					    <select id="PRD_CNT" name="PRD_CNT" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <option value="1">1</option>
						    <option value="2">2</option>
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
						<input type="text" class="cmc_txt" id="PER_NUM1" value="0" name="PER_NUM1"/>명
					</td>
					<th><s:message code='meetSanding.carCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CAR_NUM1" value="1"  name="CAR_NUM1"/>대
					</td>
				</tr>
				<tr>
				    <th><s:message code='meetSanding.fee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="USE_AMT1" value="0" name="USE_AMT1" style="width:51.5%;" readonly/>원
					</td>	
					<th><s:message code='meetSanding.addFee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="ADD_AMT1" value="0" name="ADD_AMT1" style="width:51.5%;"	/>원
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
						<input type="text" class="cmc_txt" id="PER_NUM2" value="0"  name="PER_NUM2"/>명
					</td>
					<th><s:message code='meetSanding.carCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CAR_NUM2" value="1"  name="CAR_NUM2"/>대
					</td>
				</tr>
				<tr class="doubleCnt">
				    <th><s:message code='meetSanding.fee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="USE_AMT2" value="0" name="USE_AMT2" style="width:51.5%;" readonly/>원
					</td>	
					<th><s:message code='meetSanding.addFee'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="ADD_AMT2" value="0" name="ADD_AMT2" style="width:51.5%;"/>원
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
			fn_init($(this).data());
		}
	});
	
	$("#PRD_CNT").change(function(){
		if($(this).val() == '2'){
			$(".doubleCnt").show();
		}else{
			$(".doubleCnt").hide();
		}
	});
	
	$("#PICK_GBN_1").change(function(){
	    var thisVal = $(this).val();
	    selec_init(thisVal);
		if(thisVal == "01"){ // 미신청
			fn_readonly(true);
			$(".doubleCnt").hide();
			$("#CAR_NUM1").val("0");
		}else{ // 공항선택
			fn_readonly(false);
			$("#CAR_NUM1").val("1");
		}
		$('#PROD_SEQ1 option[data='+thisVal+']:eq(0)').prop("selected" , true)
		$('#PROD_SEQ1 option[data='+thisVal+']').show();
		$('#PROD_SEQ1 option').not('[data='+thisVal+']').hide();
		
		$('#PROD_SEQ2 option[data='+thisVal+']:eq(0)').prop("selected" , true)
		$('#PROD_SEQ2 option[data='+thisVal+']').show();
		$('#PROD_SEQ2 option').not('[data='+thisVal+']').hide();
		
	});
	
    $("#PER_NUM1").on("keyup , change" , function(){
		var pfee1;
		var prod_seq1 = $("#PROD_SEQ1").val();
		var per_num1 = $("#PER_NUM1").val();   //인원수
		var com_amt1 = parseInt($("#PROD_SEQ1 option:selected").attr("com_amt"));
		if(!fn_empty(prod_seq1)){
			pfee1 = per_num1 * com_amt1;
		}else{
			pfee1 = 0;
		}
		$("#USE_AMT1").val(pfee1);
	});
	
	$("#PER_NUM2").on("keyup , change" , function(){
		var pfee2;
		var prod_seq2 = $("#PROD_SEQ2").val();
		var per_num2  = $("#PER_NUM2").val();
		var com_amt2 = parseInt($("#PROD_SEQ2 option:selected").attr("com_amt"));
		
		if(!fn_empty(prod_seq2)){
			pfee2 = per_num2 * com_amt2;
		}else{
			pfee2 = 0;
		}
		$("#USE_AMT2").val(pfee2);
	});
	
	$("#PROD_SEQ1").on("change" , function(){
		var prd_val = $(this).val();
		var vfee;
		var v_com_amt1 = parseInt($("#PROD_SEQ1 option:selected").attr("com_amt"));
		
		if(!fn_empty(prd_val)){
			vfee = $("#PER_NUM1").val() * v_com_amt1;
		}else{
			vfee = 0;
		}
		$("#USE_AMT1").val(vfee);
		$("#PROD_SEQ2").val(prd_val);
	});
	
	$("#PROD_SEQ2").on("change" , function(){
		var prd_val = $(this).val();
		var vfee2;
		var v_com_amt2 = parseInt($("#PROD_SEQ2 option:selected").attr("com_amt"));
		if(!fn_empty(prd_val)){
			vfee2 = $("#PER_NUM2").val() * v_com_amt2;
		}else{
			vfee2 = 0;
		}
		$("#USE_AMT2").val(vfee2);
	});
	
	function fn_readonly (temp){
		$("#PRD_CNT"  ).attr("disabled" , temp);
		$("#PROD_SEQ1").attr("disabled" , temp);
		$("#PROD_SEQ2").attr("disabled" , true);
		$("#PER_NUM1" ).attr("readonly" , temp);
		$("#CAR_NUM1" ).attr("readonly" , true);
		$("#PROD_SEQ2").attr("readonly" , temp);
		$("#PER_NUM2" ).attr("readonly" , temp);
		$("#CAR_NUM2" ).attr("readonly" , true);
		$("#ADD_AMT1" ).attr("readonly" , temp);
		$("#ADD_AMT2" ).attr("readonly" , temp);
	}
	
	function fn_init(recevicedData) {
		var now  = new Date();	// 현재 날짜 및 시간
		var year = now.getFullYear();	
		var url = "/reserve/selectPrdInfo.do";
		var param = {"BAS_YY"     : year // 연도
		           , "SSN_GBN"    : "1"  //시즌구분
		           , "BAS_YY_SEQ" : 1    //기간년도순번
		           };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("ajax 통신 error!");
			}else{
				var vhtml;
				vhtml += '<option value="" data = "01" >--<s:message code="system.select"/>--</option>'
				$.each(data.result , function ( i , v){
					if(v.HDNG_GBN == "22") {
						vhtml += '<option value = '+v.PROD_COND+' data="02" prod_seq = '+v.PROD_SEQ+' com_amt = '+v.COM_AMT+'>'+v.COM_CNTN+'</option>';
					}else{
						vhtml += '<option value = '+v.PROD_COND+' data="03" prod_seq = '+v.PROD_SEQ+' com_amt = '+v.COM_AMT+'>'+v.COM_CNTN+'</option>';
					}
				});
				$("#PROD_SEQ1").append(vhtml);
				$("#PROD_SEQ2").append(vhtml);
			}
			gv_req_dt = recevicedData.REQ_DT;
			gv_seq    = recevicedData.SEQ;
			if(!fn_empty(recevicedData.PICK_GBN))     $("#PICK_GBN_1" ).val(recevicedData.PICK_GBN).trigger("change");
			if(!fn_empty(recevicedData.PER_NUM))      $("#PER_NUM1"   ).val(recevicedData.PER_NUM).trigger("change");
			if(!fn_empty(recevicedData.PCK_PROD_SEQ)){
				$('#PROD_SEQ1 option[prod_seq='+recevicedData.PCK_PROD_SEQ+']').prop("selected", true); 
				$('#PROD_SEQ2 option[prod_seq='+recevicedData.PCK_PROD_SEQ+']').prop("selected", true); 
				$("#HD_PROD_SEQ").val(recevicedData.PCK_PROD_SEQ);
			}
			if(!fn_empty(recevicedData.PRC_STS)){
				if(recevicedData.PRC_STS == "05" || recevicedData.PRC_STS == "06" ||recevicedData.PRC_STS == "07"){
					$(".ui-dialog-buttonset > button#save").hide();
				}	
			}
			
		});
		$(".doubleCnt").hide();
	}
	
	function selec_init(data){ // 초기화
		$('#PROD_SEQ1 option[value='+ data +']:eq(0)').prop("checked", true);
		$("#PER_NUM1" ).val("0");
		$("#ADD_AMT1" ).val("0");
		$("#USE_AMT1" ).val("0");
		$("#PER_NUM2" ).val("0");
		$("#ADD_AMT2" ).val("0");
		$("#USE_AMT2" ).val("0");
		$(".doubleCnt").hide();
		if(data != "01") $("#PRD_CNT").val("1");
		else             $("#PRD_CNT").val("");
	}
	
	function savePickInfo(){
		var formData = formIdAllToMap('frmPickupFrm');
		var param = {};
		if(formData.PRD_CNT == "1") { //차량 1대
			param.ADD_AMT  = parseInt(formData.ADD_AMT1);
		    param.CAR_NUM  = 1;
		    param.PER_NUM  = parseInt(formData.PER_NUM1);
		    param.USE_AMT  = parseInt(formData.USE_AMT1) / parseInt(formData.PER_NUM1);
		}else { // 차량2대
			param.ADD_AMT = parseInt(formData.ADD_AMT1) + parseInt(formData.ADD_AMT2);
			param.CAR_NUM = 2;
		    param.PER_NUM = parseInt(formData.PER_NUM1) + parseInt(formData.PER_NUM2);
		    param.USE_AMT = (parseInt(formData.USE_AMT1) + parseInt(formData.USE_AMT2)) / (parseInt(formData.PER_NUM1) + parseInt(formData.PER_NUM2));
		}
		param.PROD_SEQ = parseInt($("#PROD_SEQ1 option:selected").attr("prod_seq"));
		param.REQ_DT   = gv_req_dt;
		param.REQ_SEQ  = parseInt(gv_seq);
		param.PICK_GBN = $("#PROD_SEQ1 option:selected").attr("data");
		param.HD_PROD_SEQ = parseInt($("#HD_PROD_SEQ").val());
		if(confirm("<s:message code='confirm.save'/>")){
			var url = '/reserve/pickupManager.do';
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					p_rtnData = {"PER_NUM"  : param.PER_NUM
							   , "PICK_GBN" : param.PICK_GBN};
					popupClose($('#p_pickUpGbnPopup').data('pid'));
				}
			});
		}
	}
});


</script>