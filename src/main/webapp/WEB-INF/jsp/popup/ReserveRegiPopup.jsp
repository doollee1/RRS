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
			<input type="hidden" name="PRC_STS"      id="PRC_STS"    value="" />
			<input type="hidden" name="EMAIL"        id="EMAIL"      value="" />  
			<input type="hidden" name="PAY_AMT"  id="PRV_PAY_AMT"      value="" />  
			<input type="hidden" name="DCT_AMT"  id="PRV_DCT_AMT"      value="" />  
			<input type="hidden" name="BAL_AMT"  id="PRV_BAL_AMT"      value="" />  
			
			<table class="pop_tblForm">
				<colgroup>
					<col width="20%" />
			        <col width="30%" />
			        <col width="20%" />
			        <col width="30%" />
			    </colgroup>
			    <tr class="idTest">
		   	     	<th>ID</th>
					<td class="medium_td">
						<input type="text" id="USER_ID" name="USER_ID" disabled/>
						<button type="button" class="pbtn_default" id="btn_search">아이디찾기</button>	
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
						<input type="text" class="cmc_txt" id="CHK_IN_DT"     name="CHK_IN_DT" data-type="date" style="width:51.5%;"/>
						<input type="text" class="cmc_txt" id="PRV_CHK_IN_DT" name="CHK_IN_DT" data-type="date" style="width:51.5%; display: none;"/>
					</td>
					<th><s:message code='reservation.checkOutDt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CHK_OUT_DT"     name="CHK_OUT_DT" data-type="date" style="width:51.5%;"/>
						<input type="text" class="cmc_txt" id="PRV_CHK_OUT_DT" name="CHK_OUT_DT" data-type="date" style="width:51.5%; display: none;"/>
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
				    <th><s:message code='reservation.arrFlight'/></th>
					<td>
						<select id="FLIGHT_IN" name="FLIGHT_IN" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${flight_in}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				    <th><s:message code='reservation.depFlight'/></th>
					<td>
					    <select id="FLIGHT_OUT" name="FLIGHT_OUT" class="cmc_combo" style="width:62%;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${flight_out}">
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
						<input type="text" class="cmc_txt withComma" id="TOT_PERSON" name="TOT_PERSON" value="0" style="width:60px; text-align: right;" maxlength="5" />명
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
						    <input type="text" id="R_PERSON" name="R_PERSON" style="width:60px; text-align: right;" value="0" maxlength="5" class="withComma"/>명
						    <s:message code='reservation.roundN'/>
						    <input type="text" id="N_PERSON" name="N_PERSON" style="width:60px; text-align: right;" value="0" maxlength="5" class="withComma"/>명
						    <s:message code='reservation.infant'/>
						    <input type="text" id="K_PERSON" name="K_PERSON" style="width:60px; text-align: right;" value="0" maxlength="5" class="withComma"/>명
						</div>
					</td>
				</tr>	
				<tr>
				    <th><s:message code='reservation.meetSanding'/></th>
				    <td>
						<select id="PICK_GBN" name="PICK_GBN" class="cmc_combo" style="width:100px;" disabled>
						    <c:forEach var="i" items="${region}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="text" id="PER_NUM_CNT" name="PER_NUM_CNT" style="width:60px; text-align: right;" value="0" disabled>명
						<input type="hidden" id="PCK_PROD_SEQ" name="PCK_PROD_SEQ">
						<button type="button" class="pbtn_default openPop" id="insertPickGbn">등록</button>
					</td>
				    <th><s:message code='reservation.lateCheckout'/></th>
					<td>
						<input type="radio"  name="LATE_CHECK_OUT" value="1">6시까지 
						<input type="radio"  name="LATE_CHECK_OUT" value="2">6시이후 
						<input type="radio"  name="LATE_CHECK_OUT" value="3">부
				    </td>
				</tr>
				<tr>
					<th><s:message code='reservation.addSingle'/></th>
					<td>
						<input type="text" id="ADD_R_S_PER" name="ADD_R_S_PER"  value="0" style="width:60px; text-align: right";" maxlength="3" class="withComma"/>명
						<input type="text" id="ADD_R_S_DAY" name="ADD_R_S_DAY"  value="0" style="width:60px; text-align: right";" maxlength="3" class="withComma"/>일
						<input type="text" id="ADD_R_S_CNT" name="ADD_R_S_CNT"  value="0" style="width:60px; text-align: right";" maxlength="3" class="withComma"/>개
					</td>
					<th><s:message code='reservation.addPremium'/></th>
					<td>
						<input type="text" id="ADD_R_P_PER" name="ADD_R_P_PER" value="0" style="width:60px; text-align: right"; maxlength="3" class="withComma"/>명
					    <input type="text" id="ADD_R_P_DAY" name="ADD_R_P_DAY" value="0" style="width:60px; text-align: right"; maxlength="3" class="withComma"/>일
					    <input type="text" id="ADD_R_P_CNT" name="ADD_R_P_CNT" value="0" style="width:60px; text-align: right"; maxlength="3" class="withComma"/>개
					</td>
				</tr>
				<tr>
				    <th>트윈/더블</th>
					<td>
						<input type="text" id="CNT_D1" name="CNT_D1" style="width:60px; text-align: right";" value="0" maxlength="3" class="withComma"/>개
						<input type="text" id="CNT_D2" name="CNT_D2" style="width:60px; text-align: right";" value="0" maxlength="3" class="withComma"/>개
					</td>                                                               
					<th>프리미엄 트윈/더블</th>
					<td>
						<input type="text" id="CNT_P1" name="CNT_P1" style="width:60px; text-align: right";" value="0" maxlength="3" class="withComma"/>개
					    <input type="text" id="CNT_P2" name="CNT_P2" style="width:60px; text-align: right";" value="0" maxlength="3" class="withComma"/>개
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
						<input type="text" id="INV_REG_DT" name="INV_REG_DT" data-type="date" readonly="readonly"/>
					    <button type="button" class="pbtn_default openPop" id="btn_create">생성</button>
				    </td>
				     <th class="status"><s:message code='reservation.state'/></th>
				    <td class="status">
						<input type="text" id="PRC_STS_NM" name="PRC_STS_NM" readonly/>
					    <button type="button" class="pbtn_default" id="changeStatus">상태변경</button>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.totalPrice'/></th>
				    <td>
				        <input type="text" id="TOT_AMT" name="TOT_AMT" style="text-align: right" value="0" class="withComma" readonly="readonly"/>원
				    </td>
					<th><s:message code='reservation.deposit'/></th>
				    <td>
				        <input type="text" id="DEP_AMT" name="DEP_AMT" style="text-align: right" value="0" class="withComma" readonly="readonly"/>원
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.disctPrice'/></th>
				    <td>
				    	<input type="text" id="DCT_AMT" name="DCT_AMT" style="text-align: right" value="0" class="withComma"/>원
				    </td>
				    <th><s:message code='reservation.balancePrice'/></th>
				    <td>
				        <div style="display:inline-flex;" >
					        <input type="text" id="BAL_AMT" name="BAL_AMT" style="text-align: right" value="0" class="withComma" readonly="readonly"/>원
			            </div>
			        </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.depositDate'/></th>
				    <td>
				        <input type="text" class="cmc_txt"  id="DEP_IN_DT" name="DEP_IN_DT" data-type="date"/>
				    </td>
				    <th><s:message code='reservation.payAmt'/></th>
				    <td>
				        <input type="text" id="PAY_AMT" name="PAY_AMT" style="text-align: right" value="0" class="withComma"/>원
				        <button type="button" class="pbtn_default openPop" id="btn_deposit" disabled>입금완료</button>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.expdt'/></th>
				    <td>
				    <input type="text" class="cmc_txt" id="EXP_DT" name="EXP_DT" data-type="date" readonly="readonly"/>
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
				<tr style="display: none;">
					<td>
						<c:forEach var="i" items="${late_flight}" varStatus="status">
						    <input type="text" value= "${i.CODE}" name="LATE_FLIGHT" seq = ${status.index }></input>
						</c:forEach>
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
		
		/* title :'<s:message code='reservation.registration'/>', */
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
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function(a) {
			fn_init($(this).data());
		}
	});
    
	$('#MEM_GBN').change(function() {
		if($(this).val() != '02'){ // 01,03
			if($(this).val() == '03'){ // 03
				isDisabled(true);
			}else{ //01
				isDisabled(false);
			}
			$("#AGN_CD").attr("disabled", true);
		}else if($(this).val() == '03'){
			isDisabled(true);
			$("#AGN_CD").attr("disabled", false);
		}else{
			isDisabled(false);
		}
	});
	
	$('#AGN_CD').change(function() {
		if(!fn_empty($(this).val())){
			isDisabled(true);
		}else{
			isDisabled(false);
		}
	});
	
	function fn_init(receivedData){
		var day = new Date();
		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
		$('#REQ_DT').val($.datepicker.formatDate('yy.mm.dd', new Date())).attr("readonly" , true);
		seq    = receivedData.SEQ;
		req_dt = receivedData.REQ_DT;
		if(fn_empty(seq || req_dt)){ //신규
		    $(".ui-dialog-title").text('<s:message code='reservation.registration'/>');
		    $("#CHK_IN_DT"      ).val(Util.converter.dateFormat1(today));
		    $("#CHK_OUT_DT"     ).val(Util.converter.dateFormat1(today));
		    $(".image"          ).hide();
		    $(".status"         ).hide();
		    vflag = "new";
		    $("#TOT_AMT , #PAY_AMT , #DCT_AMT , #BAL_AMT , #DEP_IN_DT , #DEP_AMT , #EXP_DT , #INV_REG_DT").attr("disabled", true);
		}else{ // 상세
		    $("#USER_ID , #MEM_GBN").attr("disabled", true);
		    $(".ui-dialog-title").text('<s:message code='reservation.detail'/>');
		    $("#btn_search").hide();
		    initSelect();
		    vflag = "detail";
		}
		
		$('#DEP_IN_DT, #INV_REG_DT , #EXP_DT').datepicker({
		    dateFormat : 'yy.mm.dd',
		    showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		    function(e) {
		});
		
		$('#CHK_OUT_DT, #CHK_IN_DT').datepicker({
		    dateFormat : 'yy.mm.dd',
		    showOn  : 'both',
		    minDate : 0,
		    maxDate : '+1y'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		    function(e) {
		});
	
	}
	
	
	
	function fn_dataSet(data){
    	$.each(data, function(key , val){
    		if(key == "TOT_PERSON"  || key == "R_PERSON"    || key == "N_PERSON"    || key == "K_PERSON"    || key == "ADD_R_S_PER" ||
        	   key == "ADD_R_S_DAY" || key == "ADD_R_S_CNT" || key == "ADD_R_S_CNT" || key == "ADD_R_P_PER" || key == "ADD_R_P_DAY" || 
        	   key == "ADD_R_P_CNT" || key == "CNT_D1"      || key == "CNT_D2"      || key == "CNT_P1"      || key == "CNT_P2"      ||
        	   key == "TOT_AMT"     || key == "DCT_AMT"     || key == "BAL_AMT"     || key == "DEP_AMT"     || key == "PAY_AMT"     ||
        	   key == "PRV_DCT_AMT" || key == "PRV_BAL_AMT" || key == "PRV_PAY_AMT"){
    			$('[name='+ key +']').val (fn_comma(val));
    		}else if(key == "REQ_TEL_NO"){
	    		$('[name='+ key +']').val (formatPhoneNumber(val));
    		}else if(key == "RND_CHG_YN1" || key == "RND_CHG_YN2"){
    			if(val == "Y") $('[name='+ key +']').prop("checked", true);
    			else           $('[name='+ key +']').prop("checked", false);
    		}else if(key == "CHK_IN_DT" || key == "CHK_OUT_DT" || key == "REQ_DT" || key == "DEP_IN_DT" || key == "EXP_DT" || key == "INV_REG_DT"){
    			if(!fn_empty(val)){
	    			$('[name='+ key +']').val(Util.converter.dateFormat1(val));
    			}else{
    				$('[name='+ key +']').val("");
    			}
    		}else if(key == "LATE_CHECK_OUT"){
    			// radio 
    		}else{
    			$('[name='+ key +']').val(val);
    		}
	    });
    	
    	//미팅샌딩 셋팅
    	if(!fn_empty(data.PICK_GBN)){
	    	if(data.PICK_GBN == "01"){
	    		$("#PICK_GBN"     ).attr("disabled", true);
	    		$("#insertPickGbn").text("등록");
	    		$("#PER_NUM_CNT"  ).val("0");
	    		$("#PER_NUM_CNT"  ).attr("readonly", true);
	    	}else{
	    		$("#PICK_GBN"     ).attr("disabled", true);
	    		$("#insertPickGbn").text("상세");
	       		$("#PER_NUM_CNT"  ).val(data.PER_NUM);
	    		$("#PER_NUM_CNT"  ).attr("readonly", true);
	    	}
		}
    	
        //LATE 체크아웃 셋팅
    	if(!fn_empty(data.LATE_CHECK_OUT)){
    		$("input:radio[name='LATE_CHECK_OUT'][value='" + data.LATE_CHECK_OUT + "']").prop("checked", true);
    	}
        
    	//멤버구분 disabled 셋팅
    	if(!fn_empty(data.MEM_GBN)){
    		if(data.MEM_GBN == "03" || (data.MEM_GBN == "02" && !fn_empty($("#AGN_CD").val()))){
    			isDisabled(true);
    			if(data.MEM_GBN == "03"){
    				$("#TOT_AMT").attr("disabled", false).attr("readonly", false);
    				$("#DCT_AMT").attr("disabled", true);
    				$("#PAY_AMT").attr("disabled", true);
    			}
    		}else{
    			isDisabled(false);
    		}
    	}
    	
    	//상태표시
     	if(!fn_empty(data.PRC_STS)){
     		if(data.PRC_STS == "05"){
     			$("#btn_deposit").attr("disabled", false);
     		}else if(data.PRC_STS == "06" || data.PRC_STS == "08" || data.PRC_STS == "09" || data.PRC_STS == "96"){
     			$("#frmReserveInfo").find("input,select,radio,textarea").attr("disabled" , true);
     		}else if(data.PRC_STS == "07" ){
     			$("#frmReserveInfo").find("input,select,radio,textarea").attr("disabled" , true);
     		}
     	}
    	// 날짜세팅
     	if(fn_empty(data.CHK_IN_DT) && fn_empty(data.CHK_OUT_DT)){
     		var day = new Date();
    		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
    		$("#CHK_IN_DT"      ).val(Util.converter.dateFormat1(today));
    		$("#CHK_OUT_DT"     ).val(Util.converter.dateFormat1(today));
     	}
    	
        // 날짜세팅
     	if(fn_empty(data.DEP_IN_DT)){
     		$("#DEP_IN_DT").val("");
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
				fn_dataSet(data.result);
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
	
	// 천단위 콤마 (소수점포함)
	function numberWithCommas(num) {
	    var parts = num.toString().split(".");	
	    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
	}
	
	function changeStatus(){
		var url = "/reserve/chgStatusPopup.do";
	    var pid = "p_changeStatusPopup";
	    var param = {"SEQ"        : seq
		           , "REQ_DT"     : req_dt
		           , "PRC_STS"    : parseInt($("#PRC_STS").val())
		           , "PRC_STS_NM" : $("#PRC_STS_NM").val()
		           , "MEM_GBN"    : $("#MEM_GBN").val()
 		           };
		popupOpen(url, pid, param, function(data) {
			initSelect();
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
	    $("#DEP_IN_DT"  ).attr("disabled",temp);
	    if($("#MEM_GBN").val() == "03") $("#AGN_CD"     ).attr("disabled",temp);
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
		var obj   = { "USER_ID"         : $("#USER_ID").val()
				    , "REQ_DT"          : $("#REQ_DT").val().replaceAll(".","")
				    , "SEQ"             : seq
				    , "REQ_HAN_NM"      : $("#REQ_HAN_NM").val()
				    , "REQ_ENG_NM"      : $("#REQ_ENG_NM").val()
				    , "REQ_TEL_NO"      : $("#REQ_TEL_NO").val().replaceAll("-","")
				    , "MEM_GBN"         : $("#MEM_GBN").val()
				    , "AGN_CD"          : $("#AGN_CD").val()
				    , "CHK_IN_DT"       : $("#CHK_IN_DT").val().replaceAll(".","")
				    , "CHK_OUT_DT"      : $("#CHK_OUT_DT").val().replaceAll(".","")
				    , "PRV_CHK_IN_DT"   : $("#PRV_CHK_IN_DT").val().replaceAll(".","")
				    , "PRV_CHK_OUT_DT"  : $("#PRV_CHK_OUT_DT").val().replaceAll(".","")
				    , "ROOM_TYPE"       : $("#ROOM_TYPE").val()
				    , "FLIGHT_IN"       : $("#FLIGHT_IN").val()
				    , "FLIGHT_OUT"      : $("#FLIGHT_OUT").val()
				    , "TOT_PERSON"      : parseInt($("#TOT_PERSON").val().replaceAll("," , ""))
				    , "R_PERSON"        : parseInt($("#R_PERSON").val().replaceAll("," , ""))
				    , "N_PERSON"        : parseInt($("#N_PERSON").val().replaceAll("," , ""))
				    , "K_PERSON"        : parseInt($("#K_PERSON").val().replaceAll("," , ""))
				    , "PROD_CD"         : $("#PROD_CD").val()
				    , "PICK_GBN"        : $("#PICK_GBN").val()
				    , "ADD_R_S_PER"     : parseInt($("#ADD_R_S_PER").val().replaceAll("," , ""))
				    , "ADD_R_S_DAY"     : parseInt($("#ADD_R_S_DAY").val().replaceAll("," , ""))
				    , "ADD_R_S_CNT"     : parseInt($("#ADD_R_S_CNT").val().replaceAll("," , ""))
				    , "ADD_R_P_PER"     : parseInt($("#ADD_R_P_PER").val().replaceAll("," , ""))
				    , "ADD_R_P_DAY"     : parseInt($("#ADD_R_P_DAY").val().replaceAll("," , ""))
				    , "ADD_R_P_CNT"     : parseInt($("#ADD_R_P_CNT").val().replaceAll("," , ""))
				    , "CNT_D1"          : parseInt($("#CNT_D1").val().replaceAll("," , ""))
				    , "CNT_D2"          : parseInt($("#CNT_D2").val().replaceAll("," , ""))
				    , "CNT_P1"          : parseInt($("#CNT_P1").val().replaceAll("," , ""))
				    , "CNT_P2"          : parseInt($("#CNT_P2").val().replaceAll("," , ""))
				    , "PICK_IN"         : $("#PICK_IN").val()
				    , "PICK_OUT"        : $("#PICK_OUT").val()
				    , "LATE_CHECK_OUT"  : $("[name='LATE_CHECK_OUT']:checked").val()
				    , "REMARK"          : $("#REMARK").val()
				    , "INV_REG_DT"      : $("#INV_REG_DT").val().replaceAll(".", "")
				    , "CONFIRM_NO"      : $("#CONFIRM_NO").val()
				    , "RND_CHG_YN1"     : $("#RND_CHG_YN1").is(":checked") == true ? "Y" : "N"
				    , "RND_CHG_YN2"     : $("#RND_CHG_YN2").is(":checked") == true ? "Y" : "N"
				    , "TOT_AMT"         : parseInt($("#TOT_AMT"  ).val().replaceAll("," , ""))
				    , "PAY_AMT"         : parseInt($("#PAY_AMT"  ).val().replaceAll("," , ""))
				    , "DCT_AMT"         : parseInt($("#DCT_AMT"  ).val().replaceAll("," , ""))
				    , "BAL_AMT"         : parseInt($("#BAL_AMT"  ).val().replaceAll("," , ""))
				    , "DEP_IN_DT"       : $("#DEP_IN_DT").val().replaceAll(".", "")
				    , "DEP_AMT"         : $("#DEP_AMT"  ).val().replaceAll("," , "")
				    , "EXP_DT"          : $("#EXP_DT"   ).val().replaceAll(".", "")
		}
		var param = {"reserveInfo"   : obj
				   , "V_FLAG" : vflag};
		// 상품이 있는지 선조회
		var prodYn = false;
		var url2 = '/reserve/selectProdSeq.do';
		fn_ajax(url2, false, param, function(data, xhr){
			if(!fn_empty(data.result)){
				prodYn = true;
			}else{
				alert("상품이없습니다. 관리자페이지에서 등록후 이용해주세요.");
				return false;
			}
		});
		
		if(!prodYn)     return false;
		
		var chk_in_dt      = $("#CHK_IN_DT").val().replaceAll(".","");
		var prv_chk_in_dt  = $("#PRV_CHK_IN_DT").val().replaceAll(".","");
		var chk_out_dt     = $("#CHK_OUT_DT").val().replaceAll(".","");
		var prv_chk_out_dt = $("#PRV_CHK_OUT_DT").val().replaceAll(".","");
		var chgCheckIn     = true;
		if((!fn_empty(prv_chk_in_dt) && chk_in_dt != prv_chk_in_dt) || (!fn_empty(prv_chk_out_dt)  && chk_out_dt != prv_chk_out_dt)){
			if(confirm("체크인, 체크아웃날짜가 변경되면 상품이 바뀌므로 예약정보가 초기화됩니다. 그래도 변경하시겠습니까?")){
				var url3 = '/reserve/deleteEtcAll.do';
				fn_ajax(url3, false, param, function(data, xhr){
				    if(data.result.resultCd == "0000"){
				    	initSelect();
				    }
				});
			}
			chgCheckIn = false;
		}
		
		if(!chgCheckIn) return false;
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
	
	function lateYn(){
		var flight_in  = $("#FLIGHT_IN").val();
		var flight_out = $("#FLIGHT_OUT").val();
		var booleanIn  = false;
		var booleanOut = false;
		
		for(var i =0; i < parseInt($("[name='LATE_FLIGHT']").length); i++){
			if( flight_in == $('[name=LATE_FLIGHT][seq = '+i+']').val()){
				booleanIn = true;
			}
			
			if( flight_out == $('[name=LATE_FLIGHT][seq = '+i+']').val()){
				booleanOut = true;
			}
		}
		var obj = {
		    "booleanIn" : booleanIn 
		  , "booleanOut": booleanOut
		}
		return obj;
	}
	
	
	function isValidation(){ 
		if(vflag == "new"){
			var usrId = $("#USER_ID").val();
			if(fn_empty(usrId)){
				alert("ID찾기 팝업에서 ID를 입력해주세요.");
				return false;
			}
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
		
		if(chk_in_dt > chk_out_dt){
			alert("체크아웃 날짜보다 체크인 날짜가 큽니다.")
			return false;
		}
		var agn_cd = $("#AGN_CD").val();
		if(mem_gbn == "01" || (mem_gbn == "02" && fn_empty(agn_cd))){
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
		
		if(mem_gbn != "01"){ //일반이거나, 교민이면
			if(prod_cd == "28"){
				alert("해당상품은 멤버전용 상품입니다.");
				return false;
			}
		}else{ // 멤버
			if(prod_cd == "01" || prod_cd == "02" || prod_cd == "03" || prod_cd == "04" || prod_cd == "05" || prod_cd == "06" || prod_cd == "07" ){
				alert("해당상품은 일반전용 상품입니다.");
				return false;
			}
		}
		
		var tot_person = parseInt($("#TOT_PERSON").val().replaceAll("," , ""));
		if(tot_person == 0){
			alert("총인원을 입력해주세요.");
			return false;
		}
		
		var confirm_no = $("#CONFIRM_NO").val();
		var prc_sts    = $("#PRC_STS").val();
		if(mem_gbn == "01" || mem_gbn == "02"){
			if(!fn_empty(prc_sts) && prc_sts == "06"){
				if(fn_empty(confirm_no)){
					alert("리조트컨펌번호를 입력해주세요.");
					return false;
				}
			}
		}
		var r_person = parseInt($("#R_PERSON").val().replaceAll("," , ""));
		var n_person = parseInt($("#N_PERSON").val().replaceAll("," , ""));
		var k_person = parseInt($("#K_PERSON").val().replaceAll("," , ""));
		if(r_person == 0 && n_person == 0 && k_person == 0){
			alert("인원내역을 입력해주세요.");
			return false;
		}
		
		if(tot_person != r_person + n_person + k_person){
			alert("총인원과 인원내역이 다릅니다.");
			return false;
		}
        
		if(mem_gbn == "01" || (mem_gbn == "02" && fn_empty(agn_cd))){
			
			var late_check_out = $("[name='LATE_CHECK_OUT']:checked").val();
			if(fn_empty(late_check_out)){
				alert("late checkout 을 선택해주세요.");
				return false;
			}
			
			var cnt_d1 = parseInt($("#CNT_D1").val().replaceAll("," , ""));
			var cnt_d2 = parseInt($("#CNT_D2").val().replaceAll("," , ""));
			var cnt_p1 = parseInt($("#CNT_P1").val().replaceAll("," , ""));
			var cnt_p2 = parseInt($("#CNT_P2").val().replaceAll("," , ""));
			
			if(cnt_d1 == 0 && cnt_d2 == 0 && cnt_p1 == 0 && cnt_p2 == 0){
			    alert("트윈/더블룸 개수를 입력해주세요.");
			    return false;
			}
		}
		var pick_gbn = $("#PICK_GBN").val();
		if(pick_gbn != "01"){
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
		}
		
		var tot_amt = parseInt($("#TOT_AMT").val().replaceAll(",",""));
		if(mem_gbn == "03" && prc_sts == "11"){
			if(tot_amt == 0){
				alert("총금액을 입력해주세요.");
				return false;
			}
		}
		
		return true;
	}
	
	$('#REQ_TEL_NO').keyup(function (event) {
	    event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenTel(_val);
	});
	
	$(".withComma").on("keyup" , function(){
		var tmpValue = $(this).val().replace(/[^0-9,]/g,'');
		tmpValue = tmpValue.replace(/[,]/g,'');
		// 천단위 콤마 처리 후 값 강제변경
	    $(this).val(numberWithCommas(tmpValue));
	});
	
	$("#DCT_AMT").on("keyup", function(){
		var prv_dct_amt = $("#PRV_DCT_AMT").val();
		var prv_bal_amt = $("#PRV_BAL_AMT").val();
		var dct_amt = fn_uncomma($(this).val());
		var tot_amt = fn_uncomma($("#TOT_AMT").val());
		var dep_amt = fn_uncomma($("#DEP_AMT").val());
		var bal_amt;
		
		bal_amt = tot_amt - dct_amt - dep_amt;
		if(dct_amt > tot_amt){
			$(this      ).val(prv_dct_amt);
			$("#BAL_AMT").val(prv_bal_amt);
			alert("금액을 확인해주세요.");
			return false;
		}
		$("#BAL_AMT").val(fn_comma(bal_amt));
	});
	
	$("#btn_create").click(function() {
		var url = "/reserve/InvoicePopup.do";
		var pid = "p_invoicePopup";
		var param = {
			"SEQ"        : seq,
			"REQ_DT"     : req_dt,
			"MEM_GBN"    : $("#MEM_GBN option:selected").val(),
			"EMAIL"      : $("#EMAIL").val(),
			"CHK_IN_DT"  : $("#CHK_IN_DT").val().replaceAll(".", ""),
			"CHK_OUT_DT" : $("#CHK_OUT_DT").val().replaceAll(".", ""),
			"TOT_PERSON" : $("#TOT_PERSON").val(),
			"TOT_DAY"    : "",
			"INV_REG_DT" : $("#INV_REG_DT").val(),
			"PRC_STS"    : $("#PRC_STS").val(),
			"DEP_AMT"    : parseInt($("#DEP_AMT").val().replaceAll(",", "")),
			"EXP_DT"     : $("#EXP_DT").val().replaceAll(".", "")
		};
		if (fn_empty(param.MEM_GBN) || param.MEM_GBN == "03") {
			alert("교민은 인보이스생성을 할수 없습니다.");
			return false;
		}
		var url2 = "/reserve/selectDayDiffChk.do";
		var param2 = {
			"SEQ" : seq, 	
			"REQ_DT" : req_dt,
			"CHK_IN_DT" : $("#CHK_IN_DT").val().replaceAll(".", ""),
			"CHK_OUT_DT" : $("#CHK_OUT_DT").val().replaceAll(".", "")
		};
		var errChk = 0;
		fn_ajax(url2, false, param2, function(data, xhr) {
			if (data.result.resultCd == "0000") {
				param.TOT_DAY = data.result.TOT_DAY
			} else if (data.result.resultCd == "1001") {
				alert("기준년도관리 및 상품관리를 확인해주세요 \n체크인: " + $("#CHK_IN_DT").val()
						+ "\n체크아웃: "+$("#CHK_OUT_DT").val());
				errChk++;
				return false;
			} else  {
				alert("날짜입력오류");
				errChk++;
				return false;
			}
		});
		
		if (errChk > 0) return false;
		
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
			        , "PRC_STS"      : $("#PRC_STS"     ).val()
			        , "TOT_PERSON"   : $("#TOT_PERSON"  ).val().replaceAll("," , "")
			        , "CHK_IN_DT"    : $("#CHK_IN_DT"   ).val().replaceAll(".","")
	                };
	    if(fn_empty(seq) || fn_empty(req_dt)) {
	    	alert("미팅샌딩등록은 상세화면에서 가능합니다.");
	    	return false;
	    }
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				$("#PER_NUM_CNT").val(data.PER_NUM);
				$("#PICK_GBN"   ).val(data.PICK_GBN);
				
				if(data.PICK_GBN == "01"){
					$("#PICK_GBN"     ).attr("disabled", true);
					$("#PER_NUM_CNT"  ).attr("readonly", true);
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
			initSelect();
		});
	});	

	$("#changeStatus").on("click" , function(){
		changeStatus();
	});
	
	$("#btn_search").on("click", function(){
		var url = "/reserve/searchId.do";
	    var pid = "p_searchIdPopup";
	    var param = {};
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				param = {"REQ_DT" : data.REQ_DT
					   , "SEQ"    : data.SEQ
					   };
				fn_init(param);
			}
		});
	});
	
	$("#btn_deposit").on("click", function(){
		if(!isValidation())return;
		var confirm_no = $("#CONFIRM_NO").val();
		var mem_gbn = $("#MEM_GBN").val();
		var agn_cd = $("#AGN_CD").val();
		if((mem_gbn == "02" && fn_empty(agn_cd)) || mem_gbn == "01"){ // 일반고객이거나, 멤버고객
		    if(fn_empty(confirm_no)){
		    	alert("리조트 컨펌번호를 입력해주세요.");
		    	return false;
		    }
		}
		
		var pay_amt = parseInt($("#PAY_AMT").val().replaceAll(",", ""));
		var tot_amt = parseInt($("#TOT_AMT").val().replaceAll(",", ""));
		var dep_amt = parseInt($("#DEP_AMT").val().replaceAll(",", ""));
		var val_amt = parseInt($("#BAL_AMT").val().replaceAll(",", ""));
		var dct_amt = parseInt($("#DCT_AMT").val().replaceAll(",", ""));
		console.log(pay_amt);
		if(pay_amt == 0 || pay_amt == ""){
			alert("입금금액을 입력하세요.");
			return false;
		}
		
		if(tot_amt == 0 || dep_amt == 0 || val_amt == 0 || pay_amt == ""){
			return false;
		}
		
		var url = "/reserve/deposit.do";
	    var param = { "REQ_SEQ"      : parseInt(seq)
			        , "REQ_DT"       : req_dt
			        , "PAY_AMT"      : pay_amt
			        , "MEM_GBN"      : $("#MEM_GBN").val()
			        , "R_PERSON"     : $("#R_PERSON").val()
			        , "booleanIn"    : lateYn().booleanIn  == true ? "IN" : $("#R_PERSON").val()
			        , "booleanOut"   : lateYn().booleanOut == true ? "OUT": $("#R_PERSON").val()
			        , "CHK_IN_DT"    : $("#CHK_IN_DT").val().replaceAll(".", "")
			        , "CHK_OUT_DT"   : $("#CHK_OUT_DT").val().replaceAll(".", "")
			        , "CONFIRM_NO"   : confirm_no
			        , "DCT_AMT"      : dct_amt
			        , "PICK_IN"      : $("#PICK_IN").val()
			        , "PICK_OUT"     : $("#PICK_OUT").val()
 	                };
	    if(confirm("<s:message code='confirm.deposit'/>")){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.result.resultCd == "0000"){
					alert("입금처리 완료되었습니다.");
					initSelect();
					//$("#DEP_AMT").val(fn_comma(param.PAY_AMT));
				}else{
					alert("error!");
				}
			});
		}
	});
	
});


</script>