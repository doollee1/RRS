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
						    <option value="">--<s:message code='system.select'/>--</option>
						    <%-- <option value="0" >고객현장 지불시</option>
						    <c:forEach var="i" items="${prod_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach> --%>
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
						<input type="text" class="cmc_txt" id="CAR_NUM1" value="0"  name="CAR_NUM1"/>대
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
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${prod_seq}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
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
						<input type="text" class="cmc_txt" id="CAR_NUM2" value="0"  name="CAR_NUM2"/>대
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
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			fn_init($(this).data());
		}
	});
	
	/* $("#PRD_CNT").change(function(){
		if($(this).val() == '2'){
			$(".doubleCnt").show();
		}else{
			$(".doubleCnt").hide();
		}
	}); */
	
	$("#PICK_GBN_1").change(function(){
		var prod_Gbn = [];
		<c:forEach var="i" items="${prod_gbn}">
		    prod_Gbn.push("${i}")
		</c:forEach>
		/* var selector = $("#frmPickupFrm").find("input , select").not($(this));
		$.each(selector , function(i , v){
			console.log(i+ " " + v)
            if($(v).prop("tagName") == "SELECT"){
            	$(v).find("option:first").attr("selected", true);
            }else{
            	$(v).val("0");
            }
		}); */
		var option;
		if($(this).val() == "01"){ // 미신청
			//fn_readonly(true);
			$(".doubleCnt").hide();
		}else if($(this).val() == "02"){  // 스나이공항
			$("#PROD_SEQ1").empty();
			option = "<option value='0'>고객현장 지불시</option>";
			//fn_readonly(false);
		    //$("#PROD_SEQ1").val("18").attr("disabled", true);
		    //$("#PROD_SEQ2").val("18").attr("disabled", true);
		}else{ // 싱가폴공항
			$("#PROD_SEQ1").empty();
			option = prod_Gbn.map(function ( v , i , arr){
				console.log(JSON.stringify(v));

				return  '<option value='+v.CODE+'>'+v.CODE_NM+'</option>';
			})
			//fn_readonly(false);
			
		    //$("#PROD_SEQ1").val("19").attr("disabled", true);
		    //$("#PROD_SEQ2").val("19").attr("disabled", true);
		}
        $("#PROD_SEQ1").append(option);
		$("#PROD_SEQ1 option:eq(0)").prop("selected" , true);
	});
	
	/* $("#PER_NUM1 , #CAR_NUM1").on("keyup , change" , function(){
		var pfee1;
		var per_num1 = $("#PER_NUM1").val();
		var car_num1 = $("#CAR_NUM1").val();
		if($("#PROD_SEQ1").val() == "18"){ // 스나이공항 미팅샌딩비용	    	
	        pfee1 = per_num1 * 20000; 
		}else if($("#PROD_SEQ1").val() == "19"){ // 싱가폴공항 미팅샌딩비용
			if(per_num1 <= 2){
				pfee1 = per_num1 * 100000; 
			}else if(per_num1 == 3){
				pfee1 = per_num1 * 80000; 
			}else if(per_num1 == 4 || per_num1 == 5){
				pfee1 = per_num1 * 70000; 
			}else if(per_num1 == 6){
				pfee1 = per_num1 * 80000; 
			}else if(per_num1 == 7){ 
				pfee1 = (4 * 70000) + (3 * 80000);
			}else if(per_num1 >= 7){ 
				pfee1 = per_num1 * 70000;  
			}
		}else { //입력x
			pfee1 = 0;
		}
		$("#USE_AMT1").val(pfee1);
	});
	
	$("#PER_NUM2 , #CAR_NUM2").on("keyup , change" , function(){
		var pfee2;
		var per_num2 = $("#PER_NUM2").val();
		var car_num2 = $("#CAR_NUM2").val();
		if($("#PROD_SEQ2").val() == "18"){ // 스나이공항 미팅샌딩비용	    	
			pfee2 = per_num2 * 20000; 
		}else if($("#PROD_SEQ2").val() == "19"){ // 싱가폴공항 미팅샌딩비용
			if(per_num2 <= 2){
				pfee2 = per_num2 * 100000; 
			}else if(per_num2 == 3){
				pfee2 = per_num2 * 80000; 
			}else if(per_num2 == 4 || per_num2 == 5){
				pfee2 = per_num2 * 70000; 
			}else if(per_num2 == 6){
				pfee2 = per_num2 * 80000; 
			}else if(per_num2 == 7){ 
				pfee2 = (4 * 70000) + (3 * 80000);
			}else if(per_num2 >= 7){ 
				pfee2 = per_num2 * 70000;  
			}
		}else { //입력x
			pfee2 = 0;
		}
		$("#USE_AMT2").val(pfee2);
	}); */
	
	function fn_readonly (temp){
		$("#PRD_CNT"  ).attr("disabled" , temp);
		$("#PROD_SEQ1").attr("disabled" , temp);
		$("#PER_NUM1" ).attr("readonly" , temp);
		$("#CAR_NUM1" ).attr("readonly" , temp);
		$("#PROD_SEQ2").attr("readonly" , temp);
		$("#PER_NUM2" ).attr("readonly" , temp);
		$("#CAR_NUM2" ).attr("readonly" , temp);
	}
	
	function fn_init(data) {
		$("#PICK_GBN_1").val(data.PICK_GBN);
		//fn_readonly(true);
		//$(".doubleCnt").hide();
	}
	
	/* function savePickInfo(){
		var formData = formIdAllToMap('frmPickupFrm');
		var param = {"param" : formData};
		console.log(formData);
		
		if(confirm("<s:message code='confirm.save'/>")){
			parent.$("#PICK_GBN_1").val(formData.REGION);
			parent.$("#PICK_GBN_CNT").val(parseInt(formData.PER_NUM1) + parseInt(formData.PER_NUM2));
			console.log(parseInt(formData.PER_NUM1) + parseInt(formData.PER_NUM2));
			console.log(formData.PROD_SEQ1);
			$('#p_pickUpGbnPopup').dialog("close");
		}
	} */
});


</script>