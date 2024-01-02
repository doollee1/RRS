<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : chgStatusPopup
 */
%>
<style>
.pbtn_default {margin: 0 3px -1px 5px;padding: 3px 10px 3px 10px;border: 1px solid #a9cbeb !important;background: #bdd6ee !important;color: #2269b1;}
</style>
<div id="p_searchIdPopup">
	<div id="pop_ct_form_wrap">
		<table class="pop_tblForm">
			<colgroup>
				<col width="20%" />
		        <col width="30%" />
		        <col width="20%" />
		        <col width="30%" />
		    </colgroup>
			<tr>
			    <th>멤버구분</th>
			    <td>
				    <select id="POP_MEM_GBN" name="POP_MEM_GBN" class="cmc_combo" style="width:62%;">
					    <option value="">--<s:message code='system.select'/>--</option>
					    <option value="01">멤버</option>
					    <option value="02">일반</option>
					    <option value="03">교민</option>
					</select>
				</td>
				<th>아이디</th>
			    <td>
				    <select id="SEL_USER_ID" name="SEL_USER_ID" class="cmc_combo" style="width:62%;">
					</select>
			        <!-- <input type="text" id="INP_USER_ID" name="INP_USER_ID" value="" style="display: none;"> -->
				</td>
			</tr>
		</table>
	</div>
</div>

<script type="text/javascript">
$(function() {
	var day = new Date();
	var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
	
	$('#p_searchIdPopup').dialog({
		title :'<s:message code='reservation.searchId'/>',
		autoOpen : false,
		height: 'auto',
		width: 1076.4,
		modal : true,
		buttons : {
			'<s:message code='reservation.chgState'/>' : {
				text: '<s:message code='button.save'/>',
				id : 'save',
				click: function() {
					saveSetId();
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
			//fn_init($(this).data());
			cSearch();
		}
	});
	
	
	function cSearch(receivcedData){
		var url = "/reserve/selectSearchId.do";
		var param = {
				    };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("ajax 통신 error!");
			}else{
				fn_dataSet(data.result);
				console.log(data.result);
			}
		});
	}
	
	function fn_dataSet(data){
		var vhtml;
		vhtml = '<option value="00" >--<s:message code="system.select"/>--</option>';
		if(!fn_empty(data)){
			console.log(data);
			$.each(data , function( i , v){
				vhtml += '<option value = '+v.USER_ID+' mem_gbn = '+v.MEM_GBN+' eng_name = '+v.ENG_NAME+' han_name = '+v.HAN_NAME+' tel_no = '+v.TEL_NO+'>'+v.USER_ID+'</option>';
			});
		}
		$("#SEL_USER_ID").append(vhtml);
	}
	
	function saveSetId(){
		if(!isValidation())return;
		var url = "/reserve/insertReserve.do";
		var param = {"REQ_DT"      : today
				   , "USER_ID"     : $("#SEL_USER_ID").val()
				   , "MEM_GBN"     : $("#SEL_USER_ID option:selected").attr("mem_gbn")
				   , "ENG_NAME"    : $("#SEL_USER_ID option:selected").attr("eng_name")
				   , "HAN_NAME"    : $("#SEL_USER_ID option:selected").attr("han_name")
				   , "TEL_NO"      : $("#SEL_USER_ID option:selected").attr("tel_no")
				    };
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, true, param, function(data, xhr){
				if(data.result.resultCd != '0000'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					p_rtnData = {"REQ_DT"  : param.REQ_DT
							   , "USER_ID" : param.USER_ID
							   , "SEQ"     : data.result.SEQ };
					popupClose($('#p_searchIdPopup').data('pid'));
				}	
			});
		}
	}
	
	function isValidation(){
		var mem_gbn = $("#POP_MEM_GBN").val();
		if(fn_empty(mem_gbn)){
			alert("멤버구분을 선택해주세요.");
			return false;
		}
		
		var selUsrid = $("#SEL_USER_ID").val();
		if(mem_gbn == "01" || mem_gbn == "02"){
			if(fn_empty(selUsrid)){
				alert("아이디를 선택해주세요.");
				return false;
			}
		}
		
		return true;
	}
	
	$("#POP_MEM_GBN").on("change", function(){
		var val = $(this).val();
		if(!fn_empty(val)){
			$('#SEL_USER_ID option[mem_gbn='+ val +']:eq(0)').prop("selected" , true);
			$('#SEL_USER_ID option').not('[mem_gbn='+ val +']').hide();
			
		}else{
			$('#SEL_USER_ID option').hide();
			$('#SEL_USER_ID option[value=00]').show();
			$('#SEL_USER_ID').val('00');
			$("#SEL_USER_ID").show();
		}
	});
});

</script>