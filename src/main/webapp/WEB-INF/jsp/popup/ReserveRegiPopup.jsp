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
	<form id="frmReserveInfo" action="#">
		<div id="pop_ct_form_wrap">
			<input type="hidden" name="PRC_STS"    id="PRC_STS"    value="" />
			<input type="hidden" name="PRC_STS_NM" id="PRC_STS_NM" value="" />
			<input type="hidden" name="EMAIL"      id="EMAIL"      value="" />
			<table class="pop_tblForm">
				<colgroup>
					<col width="20%" />
			        <col width="30%" />
			        <col width="20%" />
			        <col width="30%" />
			    </colgroup>
			    <tr class="idTest">
		   	     	<th>usrId</th>
					<td class="medium_td">
						<input type="text" id="usrId" name="usrId"/>
					</td>
				</tr>
		   		<tr>
		   	     	<th><s:message code='reservation.date'/></th>
					<td class="medium_td">
						<input type="text" id="REQ_DT" name="REQ_DT" data-type="date"/>
					</td>
					<th><s:message code='reservation.tel'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_TEL_NO" name="REQ_TEL_NO" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"  maxlength="13"  placeholder="예) 010-1234-5678"/>
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
					<th><s:message code='reservation.agency'/></th>
					<td>
					    <select id="AGN_CD" name="AGN_CD" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${agency}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.checkInDt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CHK_IN_DT" name="CHK_IN_DT" data-type="date" style="width:51.5%;"/>
					</td>
					<th><s:message code='reservation.checkOutDt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CHK_OUT_DT" name="CHK_OUT_DT" data-type="date" style="width:51.5%;"/>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.roomType'/></th>
					<td>
						<select id="ROOM_TYPE" name="ROOM_TYPE" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${roomtype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th class="image"><s:message code='reservation.arrImg'/></th>
					<td class="image">
						<button type="button" class="pbtn_default" id="ARR_IMG">이미지보기</button>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.depFlight'/></th>
					<td>
					    <select id="FLIGHT_OUT" name="FLIGHT_OUT" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${flight_out}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				    <th><s:message code='reservation.arrFlight'/></th>
					<td>
						<select id="FLIGHT_IN" name="FLIGHT_IN" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${flight_in}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
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
						<input type="text" class="cmc_txt" id="TOT_PERSON" name="TOT_PERSON" value="0"/>명
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
						    <input type="text" id="R_PERSON" name="R_PERSON" style="width:70px;" value="0"/>명
						    <s:message code='reservation.roundN'/>
						    <input type="text" id="N_PERSON" name="N_PERSON" style="width:70px;" value="0"/>명
						    <s:message code='reservation.infant'/>
						    <input type="text" id="K_PERSON" name="K_PERSON" style="width:70px;" value="0"/>명
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
						<input type="text" id="PER_NUM_CNT" name="PER_NUM_CNT" style="width:70px;" value="0">명
						<input type="hidden" id="PCK_PROD_SEQ" name="PCK_PROD_SEQ">
						<button type="button" class="pbtn_default" id="insertPickGbn">등록</button>
					</td>
				    <th><s:message code='reservation.lateCheckout'/></th>
					<td>
						<input type="radio"  name="LATE_CHECK_OUT" value="1">여
						<input type="radio"  name="LATE_CHECK_OUT" value="2">부
					</td>
				</tr>
				<tr>
					<th><s:message code='reservation.addSingle'/></th>
					<td>
						<input type="text" id="ADD_R_S_PER" name="ADD_R_S_PER" style="width:60px;" value="0"/>명
						<input type="text" id="ADD_R_S_DAY" name="ADD_R_S_DAY" style="width:60px;" value="0"/>일
						<input type="text" id="ADD_R_S_CNT" name="ADD_R_S_CNT" style="width:60px;" value="0"/>개
					</td>
					<th><s:message code='reservation.addPremium'/></th>
					<td>
						<input type="text" id="ADD_R_P_PER" name="ADD_R_P_PER" style="width:60px;" value="0"/>명
					    <input type="text" id="ADD_R_P_DAY" name="ADD_R_P_DAY" style="width:60px;" value="0"/>일
					    <input type="text" id="ADD_R_P_CNT" name="ADD_R_P_CNT" style="width:60px;" value="0"/>개
					</td>
				</tr>
				<tr>
				    <th>트윈/더블</th>
					<td>
						<input type="text" id="CNT_D1" name="CNT_D1" style="width:80px;" value="0"/>개
						<input type="text" id="CNT_D2" name="CNT_D2" style="width:80px;" value="0"/>개
					</td>
					<th>프리미엄 트윈/더블</th>
					<td>
						<input type="text" id="CNT_P1" name="CNT_P1" style="width:80px;" value="0"/>개
					    <input type="text" id="CNT_P2" name="CNT_P2" style="width:80px;" value="0"/>개
					</td>
				</tr>	
				<tr>
				    <th><s:message code='reservation.arrPickup'/></th>
				    <td>
						<select id="PICK_IN" name="PICK_IN" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${cartype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th><s:message code='reservation.depPickup'/></th>
				    <td>
						<select id="PICK_OUT" name="PICK_OUT" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${cartype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.invoiceDt'/></th>
				    <td>
						<input type="text" id="INV_REG_DT" name="INV_REG_DT" data-type="date"/>
					    <button type="button" class="pbtn_default" id="btn_create">생성</button>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.totalPrice'/></th>
				    <td>
				        <input type="text" id="TOT_AMT" name="TOT_AMT" style="text-align: right" value="0"/>원
				    </td>
					<th><s:message code='reservation.payAmt'/></th>
				    <td>
				        <input type="text" id="PAY_AMT" name="PAY_AMT" style="text-align: right" value="0"/>원
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.disctPrice'/></th>
				    <td>
				    	<input type="text" id="DCT_AMT" name="DCT_AMT" style="text-align: right" value="0"/>원
				    </td>
				    <th><s:message code='reservation.balancePrice'/></th>
				    <td>
				        <div style="display:inline-flex;" >
					        <input type="text" id="BAL_AMT" name="BAL_AMT" style="text-align: right" value="0"/>원
				            <button type="button"  class="pbtn_default">입금완료</button>
			            </div>
			        </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.depositDate'/></th>
				    <td>
				    <input type="text" id="DEP_IN_DT" name="DEP_IN_DT"/>
				    </td>
				    <th><s:message code='reservation.deposit'/></th>
				    <td>
				    <input type="text" id="DEP_AMT" name="DEP_AMT" style="text-align: right" value="0"/>원
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.balindt'/></th>
				    <td>
				    <input type="text" id="BAL_IN_DT" name="BAL_IN_DT"/>
				    </td>
				    <th><s:message code='reservation.expdt'/></th>
				    <td>
				    <input type="text" id="EXP_DT" name="EXP_DT" style="text-align: right" value="0"/>원
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
						<input type="checkbox"  name="RND_CHG_YN1" id="RND_CHG_YN1">토요일 오전
						<input type="checkbox"  name="RND_CHG_YN2" id="RND_CHG_YN2">일요일 오전
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
	var vflag;
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
					saveReserveInfo();
				}
			},
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close");
				}
			},
			'<s:message code='reservation.chgState'/>' : {
				text: '<s:message code='reservation.chgState'/>',
				id : 'changeStatus',
				click: function() {
					changeStatus();
				}
			},
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function(a) {
			fn_init($(this).data());
			
		    if(fn_empty(seq || req_dt)){ //신규
		    	$(".image").hide();
		        $("#changeStatus").hide();
		        vflag = "new";
		    }else{ // 상세
		    	initSelect();
		        $(".idTest").hide();
		        vflag = "detail";
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
    
	$('#MEM_GBN').change(function() {
		if($(this).val() == '03' || $(this).val() == '04'){ // 교민 03 / 에이전시 04
		    isDisabled(true);
		}else{
			isDisabled(false);
		}
	});
	
	function fn_init(receivedData){
		$('#REQ_DT').val($.datepicker.formatDate('yy.mm.dd', new Date())).attr("readonly" , true);
		seq    = receivedData.SEQ;
		req_dt = receivedData.REQ_DT;
	}
	
	
	function fn_dataSet(data){
    	$.each(data, function(key , val){
    		if(key == "TOT_PERSON"  || key == "R_PERSON"    || key == "N_PERSON"    || key == "K_PERSON"    || key == "ADD_R_S_PER" ||
        	   key == "ADD_R_S_DAY" || key == "ADD_R_S_CNT" || key == "ADD_R_S_CNT" || key == "ADD_R_P_PER" || key == "ADD_R_P_DAY" || 
        	   key == "ADD_R_P_CNT" || key == "CNT_D1"      || key == "CNT_D2"      || key == "CNT_P1"      || key == "CNT_P2"      ||
        	   key == "TOT_AMT"     || key == "DCT_AMT"     || key == "BAL_AMT"     || key == "DEP_AMT"){
    			$('[name='+ key +']').val (fn_comma(val));
    		}else if(key == "REQ_TEL_NO"){
	    		$('[name='+ key +']').val (formatPhoneNumber(val));
    		}else if(key == "RND_CHG_YN1" || key == "RND_CHG_YN2"){
    			if(val == "Y") $('[name='+ key +']').prop("checked", true);
    			else           $('[name='+ key +']').prop("checked", false);
    		}else if(key == "CHK_IN_DT" || key == "CHK_OUT_DT" || key == "REQ_DT"){
    			$('[name='+ key +']').val(Util.converter.dateFormat1(val));
    		}else{
    			$('[name='+ key +']').val(val);
    		}
	    });
    	
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
    	
        //LATE 체크아웃 셋팅
    	if(!fn_empty(data.LATE_CHECK_OUT)){
    		$('[name=LATE_CHECK_OUT][value='+data.LATE_CHECK_OUT+']').prop("checked", true);
    	}
    }
	
	function initSelect(){
		var url = "/reserve/reserveSelectDetail.do";
		var param = {"SEQ"    : seq
		           , "REQ_DT" : req_dt
		           };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("ajax 통신 error!");
			}else{
				fn_dataSet(data.result)
				fn_imageSet(data.image);
			}
		});
	}
	
	function fn_imageSet(data){
		if(!fn_empty(data)){
			$(".image").show();
		}else{
			$(".image").hide();
		}
	}
	
	function changeStatus(){
		var url = "/reserve/chgStatusPopup.do";
	    var pid = "p_changeStatusPopup";
	    var param = {"SEQ"        : seq
		           , "REQ_DT"     : req_dt
		           , "PRC_STS"    : parseInt($("#PRC_STS").val())
		           , "PRC_STS_NM" : $("#PRC_STS_NM").val()
		           };
		popupOpen(url, pid, param, function(data) {
		});
	}
	
	function formatPhoneNumber (input) {
	    var cleanInput = input.replaceAll(/[^0-9]/g, "");
	    var result = "";
	    var length = cleanInput.length;
	    if(length === 8) {
	        result = cleanInput.replace(/(\d{4})(\d{4})/, '$1-$2');
	    } else if(cleanInput.startsWith("02") && (length === 9 || length === 10)) {
	        result = cleanInput.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-$2-$3');
	    } else if(!cleanInput.startsWith("02") && (length === 10 || length === 11)) {
	        result = cleanInput.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
	    } else {
	        result = undefined;
	    }
	    return result;
	}
	
	function isDisabled(temp){
	    $("[name='LATE_CHECK_OUT']").attr("disabled",temp);
		$("#AGN_CD"     ).attr("disabled",temp);
	    $("#CHK_IN_DT"  ).attr("disabled",temp);
	    $("#CHK_OUT_DT" ).attr("disabled",temp);
	    $("#ROOM_TYPE"  ).attr("disabled",temp);
	    $("#FLIGHT_IN"  ).attr("disabled",temp);
	    $("#FLIGHT_OUT" ).attr("disabled",temp);
	    $("#ADD_R_S_PER").attr("disabled",temp);
	    $("#ADD_R_S_DAY").attr("disabled",temp);
	    $("#ADD_R_S_CNT").attr("disabled",temp);
	    $("#ADD_R_P_PER").attr("disabled",temp);
	    $("#ADD_R_P_DAY").attr("disabled",temp);
	    $("#ADD_R_P_CNT").attr("disabled",temp);
	    $("#CNT_D1"     ).attr("disabled",temp);
	    $("#CNT_D2"     ).attr("disabled",temp);
	    $("#CNT_P1"     ).attr("disabled",temp);
	    $("#CNT_P2"     ).attr("disabled",temp);
	}
	
	function autoHypenTel(str) {
	    str = str.replace(/[^0-9]/g, '');
		var tmp = '';

		if (str.substring(0, 2) == 02) {
		    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
		    if (str.length < 3) {
		        return str;
		    } else if (str.length < 6) {
		        tmp += str.substr(0, 2);
		        tmp += '-';
		        tmp += str.substr(2);
		        return tmp;
		    } else if (str.length < 10) {
		        tmp += str.substr(0, 2);
		        tmp += '-';
		        tmp += str.substr(2, 3);
		        tmp += '-';
		        tmp += str.substr(5);
		        return tmp;
		    } else {
		        tmp += str.substr(0, 2);
		        tmp += '-';
		        tmp += str.substr(2, 4);
		        tmp += '-';
		        tmp += str.substr(6, 4);
		        return tmp;
		    }
		} else {
		// 핸드폰 및 다른 지역 전화번호 일 경우
		    if (str.length < 4) {
		        return str;
		    } else if (str.length < 7) {
		        tmp += str.substr(0, 3);
		        tmp += '-';
		        tmp += str.substr(3);
		        return tmp;
		    } else if (str.length < 11) {
		        tmp += str.substr(0, 3);
		        tmp += '-';
		        tmp += str.substr(3, 3);
		        tmp += '-';
		        tmp += str.substr(6);
		        return tmp;
		    } else {
		        tmp += str.substr(0, 3);
		        tmp += '-';
		        tmp += str.substr(3, 4);
		        tmp += '-';
		        tmp += str.substr(7);
		        return tmp;
		    }
		}
		return str;
	}
	
	function saveReserveInfo(){
		if(!isValidation())return;
		var obj   = { "USER_ID"         : $("#usrId").val()
				    , "REQ_DT"          : $("#REQ_DT").val().replaceAll(".","")
				    , "REQ_HAN_NM"      : $("#REQ_HAN_NM").val()
				    , "REQ_ENG_NM"      : $("#REQ_ENG_NM").val()
				    , "REQ_TEL_NO"      : $("#REQ_TEL_NO").val().replaceAll("-","")
				    , "MEM_GBN"         : $("#MEM_GBN").val()
				    , "AGN_CD"          : $("#AGN_CD").val()
				    , "CHK_IN_DT"       : $("#CHK_IN_DT").val().replaceAll(".","")
				    , "CHK_OUT_DT"      : $("#CHK_OUT_DT").val().replaceAll(".","")
				    , "ROOM_TYPE"       : $("#ROOM_TYPE").val()
				    , "FLIGHT_IN"       : $("#FLIGHT_IN").val()
				    , "FLIGHT_OUT"      : $("#FLIGHT_OUT").val()
				    , "TOT_PERSON"      : parseInt($("#TOT_PERSON").val())
				    , "R_PERSON"        : parseInt($("#R_PERSON").val())
				    , "N_PERSON"        : parseInt($("#N_PERSON").val())
				    , "K_PERSON"        : parseInt($("#K_PERSON").val())
				    , "PROD_SEQ"        : parseInt($("#PROD_CD").val())
				    , "PICK_GBN"        : $("#PICK_GBN").val()
				    , "ADD_R_S_PER"     : parseInt($("#ADD_R_S_PER").val())
				    , "ADD_R_S_DAY"     : parseInt($("#ADD_R_S_DAY").val())
				    , "ADD_R_S_CNT"     : parseInt($("#ADD_R_S_CNT").val())
				    , "ADD_R_P_PER"     : parseInt($("#ADD_R_P_PER").val())
				    , "ADD_R_P_DAY"     : parseInt($("#ADD_R_P_DAY").val())
				    , "ADD_R_P_CNT"     : parseInt($("#ADD_R_P_CNT").val())
				    , "CNT_D1"          : parseInt($("#CNT_D1").val())
				    , "CNT_D2"          : parseInt($("#CNT_D2").val())
				    , "CNT_P1"          : parseInt($("#CNT_P1").val())
				    , "CNT_P2"          : parseInt($("#CNT_P2").val())
				    , "PICK_IN"         : $("#PICK_IN").val()
				    , "PICK_OUT"        : $("#PICK_OUT").val()
				    , "LATE_CHECK_OUT"  : $("[name='LATE_CHECK_OUT']:checked").val()
				    , "REMARK"          : $("#REMARK").val()
				    , "INV_REG_DT"      : $("#INV_REG_DT").val().replaceAll(".", "")
				    , "CONFIRM_NO"      : $("#CONFIRM_NO").val()
				    , "RND_CHG_YN1"     : $("#RND_CHG_YN1").is(":checked") == true ? "Y" : "N"
				    , "RND_CHG_YN2"     : $("#RND_CHG_YN2").is(":checked") == true ? "Y" : "N"
		}
		var param = {"reserveInfo"   : obj
				   , "V_FLAG" : vflag};
		if(confirm("<s:message code='confirm.save'/>")){
			var url = '/reserve/ReserveManager.do';
			fn_ajax(url, false, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					p_rtnData = {};
					popupClose($('#p_reserveRegi').data('pid'));
				}
			});
		}
	}
	
	
	function isValidation(){ 
		var usrId = $("#usrId").val();
		if(fn_empty(usrId)){
			alert("id를 입력해주세요.");
			return false;
		}
		
		var req_tel_no = $("#REQ_TEL_NO").val();
		if(fn_empty(req_tel_no)){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		
		var req_han_nm = $("#REQ_HAN_NM").val();
		if(fn_empty(req_han_nm)){
			alert("한글이름을 입력해주세요.");
			return false;
		}
		
		var req_eng_nm = $("#REQ_ENG_NM").val();
		if(fn_empty(req_eng_nm)){
			alert("영어이름을 입력해주세요.");
			return false;
		}
		
		var mem_gbn = $("#MEM_GBN").val();
		if(fn_empty(mem_gbn)){
			alert("회원구분을 선택해주세요.");
			return false;
		}
		
		if(mem_gbn == "01" || mem_gbn == "02"){
			
			var agn_cd = $("#AGN_CD").val(); 
			if(fn_empty(agn_cd)){
				alert("에이전시를 선택해주세요.");
				return false;
			}
			
			var chk_in_dt = $("#CHK_IN_DT").val();
			if(fn_empty(chk_in_dt)){
				alert("체크인 날짜를 선택해주세요.");
				return false;
			}
			
			var chk_out_dt = $("#CHK_OUT_DT").val();
			if(fn_empty(chk_out_dt)){
				alert("체크아웃 날짜를 선택해주세요.");
				return false;
			}
			
			var roomtype = $("#ROOM_TYPE").val();
			if(fn_empty(roomtype)){
				alert("객실타입을 선택해주세요.");
				return false;
			}
			
			var flight_in = $("#FLIGHT_IN").val(); 
			if(fn_empty(flight_in)){
				alert("도착항공기편을 선택해주세요.");
				return false;
			}
			
			var flight_out = $("#FLIGHT_OUT").val(); 
			if(fn_empty(flight_out)){
				alert("출발항공기편을 선택해주세요.");
				return false;
			}
		}
		
		var prod_cd = $("#PROD_CD").val();
		if(fn_empty(prod_cd)){
			alert("상품을 선택해주세요.");
			return false;
		}
		
		var tot_person = parseInt($("#TOT_PERSON").val());
		if(tot_person == 0){
			alert("총인원을 입력해주세요.");
			return false;
		}
		
		var confirm_no = $("#CONFIRM_NO").val();
		if(fn_empty(confirm_no)){
			alert("리조트컨펌번호를 입력해주세요.");
			return false;
		}
		
		var r_person = parseInt($("#R_PERSON").val());
		var n_person = parseInt($("#N_PERSON").val());
		var k_person = parseInt($("#K_PERSON").val());
		if(r_person == 0 && n_person == 0 && k_person == 0){
			alert("인원내역을 입력해주세요.");
			return false;
		}
		
		if(tot_person != r_person + n_person + k_person){
			alert("총인원과 인원내역이 다릅니다.");
			return false;
		}
        
		if(mem_gbn == "01" || mem_gbn == "02"){
			
			var late_check_out = $("[name='LATE_CHECK_OUT']:checked").val();
			if(fn_empty(late_check_out)){
				alert("late checkout 을 선택해주세요.");
				return false;
			}
			
			var cnt_d1 = parseInt($("#CNT_D1").val());
			var cnt_d2 = parseInt($("#CNT_D2").val());
			var cnt_p1 = parseInt($("#CNT_P1").val());
			var cnt_p2 = parseInt($("#CNT_P2").val());
			
			if(cnt_d1 == 0 && cnt_d2 == 0 && cnt_p1 == 0 && cnt_p2 == 0){
			    alert("트윈/더블룸 개수를 입력해주세요.");
			    return false;
			}
		}
		
		var pick_in = $("#PICK_IN").val();
		if(fn_empty(pick_in)){
			alert("픽업차량-도착을 선택해주세요.");
			return false;
		}
		
		var pick_out = $("#PICK_OUT").val();
		if(fn_empty(pick_out)){
			alert("픽업차량-출발을 선택해주세요.");
			return false;
		}
		
		return true;
	}
	
	$('#REQ_TEL_NO').keyup(function (event) {
		  event = event || window.event;
		  var _val = this.value.trim();
		  this.value = autoHypenTel(_val);
		});
	
	$("#btn_create").click(function(){
    	var url = "/reserve/InvoicePopup.do";
	    var pid = "p_invoicePopup";
	    var param = {"SEQ"     : seq
		           , "REQ_DT"  : req_dt
		           , "MEM_GBN" : $("#MEM_GBN option:selected").val()
		           , "EMAIL"   : $("#EMAIL").val()
		           };
	    if(fn_empty(param.MEM_GBN) || param.MEM_GBN == "03" || param.MEM_GBN == "04" ){
	    	alert("교민 및 에이전시는 인보이스생성을 할수 없습니다.");
	    	return false;
	    }
		popupOpen(url, pid, param, function(data) {
			initSelect();
		});
	});
	
	$("#insertPickGbn").click(function() {
	    var url = "/reserve/pickUpGbnPopup.do";
	    var pid = "p_pickUpGbnPopup";
	    var param = { "PICK_GBN"     : $("#PICK_GBN").val()
	    		    , "PER_NUM"      : $("#PER_NUM_CNT").val()
	    		    , "SEQ"          : seq
			        , "REQ_DT"       : req_dt
			        , "PCK_PROD_SEQ" : $("#PCK_PROD_SEQ").val()
			        , "PRC_STS"      : $("#PRC_STS").val()
	                };
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				$("#PER_NUM_CNT").val(data.PER_NUM);
				$("#PICK_GBN"   ).val(data.PICK_GBN);
				
				if(data.PICK_GBN == "01"){
					$("#PICK_GBN"     ).attr("disabled", false);
					$("#PER_NUM_CNT"  ).attr("readonly", false);
					$("#insertPickGbn").text("등록");
				}else{
					$("#PICK_GBN"     ).attr("disabled", true);
					$("#PER_NUM_CNT"  ).attr("readonly", true);
					$("#insertPickGbn").text("상세");
				}
			}
		});
	});
	
	$("#ARR_IMG").on("click" , function(){
		var url = "/reserve/arrImg.do";
	    var pid = "p_arrImgPopup";
	    var param = { "SEQ"          : seq
			        , "REQ_DT"       : req_dt
	                };
	    
		popupOpen(url, pid, param, function(data) {
			
		});
	});	
	
});


</script>