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
<div id="p_reserveRegi">
	<form id="frmUserInfo" action="#">
		<div id="pop_ct_form_wrap">
			<input type="hidden" name="ISNEW" id="ISNEW" value="1" />
			<input type="hidden" name="AUTH" id="AUTH" value="1" />
			<table class="pop_tblForm">
				<colgroup>
					<col width="20%" />
			        <col width="30%" />
			        <col width="20%" />
			        <col width="30%" />
			    </colgroup>
		   		<tr>
		   	     	<th><s:message code='reservation.date'/></th>
					<td class="medium_td">
						<input type="text" id="REQ_DT" name="REQ_DT" data-type="date"/>
					</td>
					<th><s:message code='reservation.tel'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_TEL_NO" name="REQ_TEL_NO"/>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.Kname'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_HAN_NM" name="REQ_HAN_NM"/>
					</td>
					<th><s:message code='reservation.Ename'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_ENG_NM" name="REQ_ENG_NM"/>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.mem_gbn'/></th>
					<td>
						<select id="MEM_GBN" name="MEM_GBN" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${mgn_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th class="agencyFrm"><s:message code='reservation.agency'/></th>
					<td class="agencyFrm">
					    <select id="AGN_CD" name="AGN_CD" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${agency}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr class="agencyFrm">
				    <th><s:message code='reservation.checkInDt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CHK_IN_DT" name="CHK_IN_DT" data-type="date" style="width:51.5%;"/>
					</td>
					<th><s:message code='reservation.checkOutDt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CHK_OUT_DT" name="CHK_OUT_DT" data-type="date" style="width:51.5%;"/>
					</td>
				</tr>
				<tr class="agencyFrm">
				    <th><s:message code='reservation.roomType'/></th>
					<td>
						<select id="ROOM_TYPE" name="ROOM_TYPE" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${roomtype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th><s:message code='reservation.arrImg'/></th>
					<td>
						<input type="text" class="cmc_txt" id="ARR_IMG" name="ARR_IMG" style="width:51.5%;"/>
					</td>
				</tr>
				<tr class="agencyFrm">
				    <th><s:message code='reservation.arrFlight'/></th>
					<td>
						<input type="text" class="cmc_txt" id="FLIGHT_IN" name="FLIGHT_IN"/>
					</td>
				    <th><s:message code='reservation.depFlight'/></th>
					<td>
						<input type="text" class="cmc_txt" id="FLIGHT_OUT" name="FLIGHT_OUT"/>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.product_gbn'/></th>
					<td>
						<select id="PROD_CD" name="PROD_CD" class="cmc_combo" style="width:150%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${prod_cd}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.totalCnt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="TOT_PERSON" name="TOT_PERSON"/>명
					</td>	
				    <th><s:message code='reservation.resortNum'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CONFIRM_NO" name="CONFIRM_NO"/>
					</td>
		       </tr>
		       <tr>
				    <th><s:message code='reservation.personalDetail'/></th>
				    <td colspan="5">
					    <div style="display:inline-flex;">
						    <s:message code='reservation.roundY'/>
						    <input type="text" id="reserve_personalDetail1" name="reserve_personalDetail1"/>명
						    <s:message code='reservation.roundN'/>
						    <input type="text" id="reserve_personalDetail2" name="reserve_personalDetail2"/>명
						    <s:message code='reservation.infant'/>
						    <input type="text" id="reserve_personalDetail3" name="reserve_personalDetail3"/>명
						</div>
					</td>
				</tr>	
				<tr>
				    <th><s:message code='reservation.meetSanding'/></th>
				    <td>
						<select id="PICK_GBN" name="PICK_GBN" class="cmc_combo" style="width:100px;">
						    <c:forEach var="i" items="${region}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="text" id="PER_NUM_CNT" name="PER_NUM_CNT" style="width:70px;">명
						<button type="button" class="pbtn_default" id="insertPickGbn">등록</button>
					</td>
				    <th class="agencyFrm"><s:message code='reservation.lateCheckout'/></th>
					<td class="agencyFrm">
						<input type="radio"  name="LATE_CHECK_OUT" value="1">여
						<input type="radio"  name="LATE_CHECK_OUT" value="2">부
					</td>
				</tr>
				<tr class="agencyFrm">
					<th><s:message code='reservation.addSingle'/></th>
					<td>
						<input type="text" id="ADD_R_S_PER" name="ADD_R_S_PER" style="width:70px;"/>명
						<input type="text" id="ADD_R_S_DAY" name="ADD_R_S_DAY" style="width:70px;"/>일
					</td>
					<th><s:message code='reservation.addPremium'/></th>
					<td>
						<input type="text" id="ADD_R_P_PER" name="ADD_R_P_PER" style="width:70px;"/>명
					    <input type="text" id="ADD_R_P_DAY" name="ADD_R_P_DAY" style="width:70px;"/>일
					</td>
					
				</tr>
				<tr>
				    <th><s:message code='reservation.arrPickup'/></th>
				    <td>
						<select id="PICK_IN" name="PICK_IN" class="cmc_combo" style="width:62%;">
						</select>
					</td>
					<th><s:message code='reservation.depPickup'/></th>
				    <td>
						<select id="PICK_OUT" name="PICK_OUT" class="cmc_combo" style="width:62%;">
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.invoiceDt'/></th>
				    <td>
						<input type="text" id="INV_REG_DT" name="INV_REG_DT" data-type="date"/>
					    <button type="button" class="pbtn_default" id="btn_create">생성</button>
				    </td>
				    <th><s:message code='reservation.totalPrice'/></th>
				    <td>
				        <input type="text" id="TOT_PRICE" name="TOT_PRICE"/>원
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.disctPrice'/></th>
				    <td>
				    	<input type="text" id="DISCT_PRICE" name="DISCT_PRICE"/>원
				    </td>
				    <th><s:message code='reservation.balancePrice'/></th>
				    <td>
				        <div style="display:inline-flex;" >
					        <input type="text" id="BALANCE_PRICE" name="BALANCE_PRICE"/>원
				            <button type="button"  class="pbtn_default">입금완료</button>
			            </div>
			        </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.depositDate'/></th>
				    <td>
				    <input type="text" id="DEPOSITE_DT" name="DEPOSITE_DT"/>
				    </td>
				    <th><s:message code='reservation.deposit'/></th>
				    <td>
				    <input type="text" id="DEPOSITE" name="DEPOSITE"/>원
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.moreDetail'/></th>
				    <td colspan="5">
				        <textarea id="REMARK" name="REMARK" rows="5" style="width: 100%"></textarea>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.weekChRound'/></th>
				    <td colspan="2">
				    <div style="display:inline-flex;" >
						<input type="radio"  name="RND_CHG_YN" value="Y" checked>토요일 오전
						<input type="radio"  name="RND_CHG_YN" value="N">일요일 오전
						※ 미체크시 기본은 오후임.
					</div>
					</td>
				</tr>
			</table>
		</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	var seq;
	var req_dt;
	
	$('#REQ_DT').val($.datepicker.formatDate('yy.mm.dd', new Date())).attr("readonly" , true);
	$('#MEM_GBN').change(function() {
		if($(this).val() == '04'){ // 교민 03 / 에이전시 04
		    $(".agencyFrm").hide();
		}else{
		    $(".agencyFrm").show();
		}
	});
	
	$("#insertPickGbn").click(function() {
	    var url = "/reserve/pickUpGbnPopup.do";
	    var pid = "p_pickUpGbnPopup";
	    var param = { "PICK_GBN" : $("#PICK_GBN").val()
	    		    , "PER_NUM"  : $("#PER_NUM_CNT").val()
	    		    , "SEQ"      : seq
			        , "REQ_DT"   : req_dt
	                };
	    
	    console.log(param)
		popupOpen(url, pid, param, function(data) {
		});
	});
	
    $("#btn_create").click(function(){
    	var url = "/reserve/invoicePopup.do";
	    var pid = "p_invoicePopup";
	    var param = {"SEQ"    : seq
		           , "REQ_DT" : req_dt
		           };
		popupOpen(url, pid, param, function(data) {
		});
	});
    
    function fn_dataSet(data){
    	
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
    }
	
	$('#p_reserveRegi').dialog({
		title :'<s:message code='reservation.registration'/>',
		autoOpen : false,
		//height: 400,
		width: 940,
		modal : true,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					saveUserInfo();
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
		open : function(a) {
			seq = $(this).data("SEQ");
			req_dt =  $(this).data("REQ_DT");
		    if(fn_empty(seq || req_dt)){ //신규
		    }else{ // 상세
		    	
		    	var url = "/reserve/reserveSelectDetail.do";
				var param = {"SEQ"    : seq
				           , "REQ_DT" : req_dt
				           };
				fn_ajax(url, true, param, function(data, xhr){
					if(data.MESSAGE != "OK"){
						alert("ajax 통신 error!");
					}else{
						$.each(data.result , function(key , val){
							if(key == "LATE_CHECK_OUT") $('[name='+ key +'][value='+val+']').prop("checked" , true); 
							else $('[name='+ key +']').val (val);
						});
						fn_dataSet(data.result)
					}
				});
		    	
		    	
		    }
			
		    $('#CHK_OUT_DT').datepicker({
		    	dateFormat : 'yy.mm.dd',
		    	showOn : 'both'
		    }).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		    	function(e) {
		    });
		    $('#CHK_IN_DT').datepicker({
		    	dateFormat : 'yy.mm.dd',
		    	showOn : 'both'
		    }).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		    	function(e) {
		    });
		
		}
	});
});


</script>