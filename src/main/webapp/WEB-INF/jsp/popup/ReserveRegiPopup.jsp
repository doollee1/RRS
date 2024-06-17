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
.reserveListRegi_default {top: 0px;}
</style>
<div id="p_reserveListRegi" class="reserveListRegi_default">
	<form id="frmReserveInfo" action="#">
		<div id="pop_ct_form_wrap">
			<input type="hidden" name="PRC_STS"      id="PRC_STS"    value="" />
			<input type="hidden" name="EMAIL"        id="EMAIL"      value="" />  
			<input type="hidden" name="PAY_AMT"  id="PRV_PAY_AMT"      value="" />  
			<input type="hidden" name="DCT_AMT"  id="PRV_DCT_AMT"      value="" />  
			<input type="hidden" name="BAL_AMT"  id="PRV_BAL_AMT"      value="" />  
<!-- 			<input type="text" name="SEQ"  id="SEQ"      value="" />   -->
			
			<table class="pop_tblForm">
				<colgroup>
					<col width="13%" />
			        <col width="22%" />
			        <col width="12%" />
			        <col width="19%" />
			        <col width="12%" />
			        <col width="21%" />
			    </colgroup>
			    <tr class="idTest">
		   	     	<th>ID</th>
					<td class="medium_td" colspan="5">
						<input type="text" id="USER_ID" name="USER_ID" style="width:160px;" disabled/>
						<button type="button" class="pbtn_default" id="btn_search">아이디찾기</button>	
					</td>
				</tr>
				<tr>
		   	     	<th><s:message code='reservation.date'/></th>
					<td class="medium_td">
						<input type="text" id="REQ_DT" name="REQ_DT" data-type="date" style="width:100px;"/>
					</td>
				    <th><s:message code='reservation.mem_gbn'/></th>
					<td>
						<select id="MEM_GBN" name="MEM_GBN" class="cmc_combo" style="width:100px;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${mgn_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th><s:message code='reservation.agency'/></th>
					<td>
					    <select id="AGN_GB" name="AGN_GB" class="cmc_combo" style="width:70px;">
						    <option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" items="${agency_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					    <select id="AGN_CD" name="AGN_CD" class="cmc_combo" style="width:90px;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${agency}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.Kname'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_HAN_NM" name="REQ_HAN_NM" style="width:160px;" />
					</td>
					<th><s:message code='reservation.Ename'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_ENG_NM" name="REQ_ENG_NM" style="width:160px;"/>
					</td>
					<th><s:message code='reservation.tel'/></th>
					<td>
						<input type="text" class="cmc_txt" id="REQ_TEL_NO" name="REQ_TEL_NO" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"  maxlength="13"  placeholder="예) 010-1234-5678" style="width:160px;"/>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.arrFlight'/></th>
					<td>
						<select id="FLIGHT_IN" name="FLIGHT_IN" class="cmc_combo" style="width:95px;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${flight_in}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<select id="FLIGHT_IN_HH" name="FLIGHT_IN_HH" class="cmc_combo" style="width:70px;">
						    <option value="">-<s:message code='system.select'/>-</option>
								<option value="00">00</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
						</select>
					</td>
				    <th><s:message code='reservation.depFlight'/></th>
					<td>
					    <select id="FLIGHT_OUT" name="FLIGHT_OUT" class="cmc_combo" style="width:95px;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${flight_out}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<select id="FLIGHT_OUT_HH" name="FLIGHT_OUT_HH" class="cmc_combo" style="width:70px;">
						    <option value="">-<s:message code='system.select'/>-</option>
								<option value="00">00</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
						</select>
					</td>
				</tr>	
				<tr>
				    <th><s:message code='reservation.totalCnt'/></th>
					<td>
						<input type="text" class="cmc_txt withComma" id="TOT_PERSON" name="TOT_PERSON" value="0" maxlength="3" style="width:30px; text-align: right;" />명
					</td>
				    <th><s:message code='reservation.personalDetail'/></th>
				    <td colspan="5">
					    <div style="display:inline-flex;">
<%-- 						    <s:message code='reservation.roundY'/> --%>&nbsp;&nbsp;멤버
						    <input type="text" id="M_PERSON" name="M_PERSON" style="width:30px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="M_PERSON_HIDDEN" name="M_PERSON_HIDDEN">
<%-- 						    <s:message code='reservation.roundY'/> --%>일반
						    <input type="text" id="G_PERSON" name="G_PERSON" style="width:30px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="G_PERSON_HIDDEN" name="G_PERSON_HIDDEN">
						    <s:message code='reservation.roundN'/>
						    <input type="text" id="N_PERSON" name="N_PERSON" style="width:30px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="N_PERSON_HIDDEN" name="N_PERSON_HIDDEN">
						    <s:message code='reservation.infant'/>
						    <input type="text" id="K_PERSON" name="K_PERSON" style="width:30px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="K_PERSON_HIDDEN" name="K_PERSON_HIDDEN">
						    영유아
						    <input type="text" id="I_PERSON" name="I_PERSON" style="width:30px; text-align: right;" value="0" maxlength="3" class="withComma"/>명
						    <input type="hidden" id="I_PERSON_HIDDEN" name="I_PERSON_HIDDEN">
						</div>
					</td>
		       </tr>
				<tr>
				    <th><s:message code='reservation.product_gbn'/></th>
					<td colspan="5">
						<select id="HDNG_GBN" name="HDNG_GBN" class="cmc_combo" style="width:45%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${hdng_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<select id="ADD_HDNG_GBN" name="ADD_HDNG_GBN" class="cmc_combo" style="width:45%;">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${hdng_gbn_g}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>	
				<tr>
				    <th><s:message code='reservation.checkInDt'/></th>
					<td>
						<input type="text" class="cmc_txt" id="CHK_IN_DT"     name="CHK_IN_DT" data-type="date" style="width:100px;"/>
						<input type="text" class="cmc_txt" id="PRV_CHK_IN_DT" name="CHK_IN_DT" data-type="date" style="width:100px; display: none;"/>
					</td>
					<th><s:message code='reservation.checkOutDt'/></th>
					<td colspan="3">
						<input type="text" class="cmc_txt" id="CHK_OUT_DT"     name="CHK_OUT_DT" data-type="date" style="width:100px;"/>
						<input type="text" class="cmc_txt" id="PRV_CHK_OUT_DT" name="CHK_OUT_DT" data-type="date" style="width:100px; display: none;"/>
					</td>
				</tr>	
				<tr>
				    <th>early체크인</th>
					<td>
						<input type="radio"  id="LATE_CHECK_IN" name="LATE_CHECK_IN" value="1">11시이후 15시이전
						<input type="radio"  id="LATE_CHECK_IN" name="LATE_CHECK_IN" value="3">부
				    </td>
				    <th><s:message code='reservation.lateCheckout'/></th>
					<td colspan="3">
						<input type="radio"  id="LATE_CHECK_OUT" name="LATE_CHECK_OUT" value="1">6시까지 
						<input type="radio"  id="LATE_CHECK_OUT" name="LATE_CHECK_OUT" value="2">6시이후 
						<input type="radio"  id="LATE_CHECK_OUT" name="LATE_CHECK_OUT" value="3">부
				    </td>
				</tr>		
				<tr>
				    <th><s:message code='reservation.meetSanding'/></th>
				    <td>
						<select id="PICK_GBN" name="PICK_GBN" class="cmc_combo" style="width:70px;" disabled>
						    <c:forEach var="i" items="${region}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>&nbsp;
						<input type="text" id="PER_NUM_CNT" name="PER_NUM_CNT" style="width:30px; text-align: right;" value="0" disabled>명
						<input type="hidden" id="PCK_PROD_SEQ" name="PCK_PROD_SEQ">
						<button type="button" class="pbtn_default openPop" id="insertPickGbn">등록</button>
					</td>
				    <th><s:message code='reservation.arrPickup'/></th>
				    <td>
						<select id="PICK_IN" name="PICK_IN" class="cmc_combo" style="width:100px;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${cartype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th><s:message code='reservation.depPickup'/></th>
				    <td>
						<select id="PICK_OUT" name="PICK_OUT" class="cmc_combo" style="width:100px;">
						    <option value="">--<s:message code='system.select'/>--</option>
						    <c:forEach var="i" items="${cartype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>	
				</tr>
				<tr>
				    <th>객실타입/트윈/킹</th>
					<td><!-- 				    객실타입 -->
						<select id="ROOM_TYPE" name="ROOM_TYPE" class="cmc_combo" style="width:70px;">
						    <option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" items="${roomtype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>&nbsp;
						<input type="text" id="TWIN_KING_CNT" name="TWIN_KING_CNT" style="width:30px; text-align: right";" value="0" maxlength="3" class="withComma"/>개
						<input type="hidden" id="TWIN_CNT" name="TWIN_CNT" style="width:30px; text-align: right";" value="0" maxlength="3" class="withComma"/>
						<input type="hidden" id="KING_CNT" name="KING_CNT" style="width:30px; text-align: right";" value="0" maxlength="3" class="withComma"/>
					</td>                                                           
					<th><s:message code='reservation.addSingle'/></th>
					<td>
						<input type="text" id="ROOM_ADD_IL" name="ROOM_ADD_IL"  value="0" style="width:30px; text-align: right";" maxlength="3" class="withComma"/>일 &nbsp;
						<input type="text" id="ROOM_ADD_CNT" name="ROOM_ADD_CNT"  value="0" style="width:30px; text-align: right";" maxlength="3" class="withComma"/>개 &nbsp;
					</td>
					<th><s:message code='reservation.addPremium'/></th>
					<td>
						<input type="text" id="PRIM_ADD_IL" name="PRIM_ADD_IL" value="0" style="width:30px; text-align: right"; maxlength="3" class="withComma"/>일 &nbsp;
					    <input type="text" id="PRIM_ADD_CNT" name="PRIM_ADD_CNT" value="0" style="width:30px; text-align: right"; maxlength="3" class="withComma"/>개 &nbsp;
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.invoiceDt'/></th>
				    <td>
						<input type="text" id="INV_REG_DT" name="INV_REG_DT" data-type="date" readonly="readonly" style="width:100px;"/>
					    <button type="button" class="pbtn_default openPop" id="btn_create">생성</button>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.totalPrice'/></th>
				    <td>
				        <input type="text" id="TOT_AMT" name="TOT_AMT" style="width:100px; text-align: right" value="0" class="withComma" readonly="readonly"/>원
				    </td>
					<th><s:message code='reservation.deposit'/></th>
				    <td>
				        <input type="text" id="DEP_AMT" name="DEP_AMT" style="width:100px; text-align: right" value="0" class="withComma" readonly="readonly"/>원
				    </td>
				    <th><s:message code='reservation.expdt'/></th>
				    <td>
				    <input type="text" class="cmc_txt" id="EXP_DT" name="EXP_DT" data-type="date" readonly="readonly" style="width:100px;"/>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.balancePrice'/></th>
				    <td>
				        <div style="display:inline-flex;" >
					        <input type="text" id="BAL_AMT" name="BAL_AMT" style="width:100px; text-align: right" value="0" class="withComma" readonly="readonly"/>원
			            </div>
			        </td>
				    <th><s:message code='reservation.disctPrice'/></th>
				    <td>
				    	<input type="text" id="DCT_AMT" name="DCT_AMT" style="width:100px; text-align: right" value="0" class="withComma"/>원
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.payAmt'/></th>
				    <td>
				        <input type="text" id="PAY_AMT" name="PAY_AMT" style="width:100px; text-align: right" value="0" class="withComma"/>원
				        <button type="button" class="pbtn_default openPop" id="btn_deposit" disabled>입금완료</button>
				    </td>
				    <th><s:message code='reservation.depositDate'/></th>
				    <td>
				        <input type="text" class="cmc_txt"  id="DEP_IN_DT" name="DEP_IN_DT" data-type="date" style="width:100px;"/>
				    </td>
				     <th class="status"><s:message code='reservation.state'/></th>
				    <td class="status" colspan="3">
						<input type="text" id="PRC_STS_NM" name="PRC_STS_NM" style="width:100px;" readonly/>
					    <button type="button" class="pbtn_default" id="changeStatus">상태변경</button>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.weekChRound'/></th>
				    <td colspan="3">
				    <div style="display:inline-flex;" >
						<input type="checkbox"  name="RND_CHG_YN1" id="RND_CHG_YN1">토요일 오전
						<input type="checkbox"  name="RND_CHG_YN2" id="RND_CHG_YN2">일요일 오전
						※ 미체크시 기본은 오후임.
					</div>
					</td>
				</tr>
				<tr>
				    <th><s:message code='reservation.moreDetail'/></th>
				    <td colspan="5">
				        <textarea id="REMARK" name="REMARK" rows="4" style="width: 99%"></textarea>
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
			
			<!-- 그리드 시작 -->
			<div class="ctu_g3_wrap" style="width:100%; float:left; padding-top:10px; margin-bottom:6px; ">
				<div class="pop_grid_top_wrap">
					<div class="ct_grid_top_left" style="align:left; width:10%; float:left; margin-bottom:-6px; padding-top:1px; padding-bottom:-6px; ">
						<button type="button" class="pbtn_default" id="btn_com_add" style="align:left">동반자추가</button>
					</div>
					<div class="ct_grid_top_right" style="right; width:87%; float:left; margin-bottom:-6px; padding-top:1px; padding-bottom:-6px; ">
						<button type="button" class="btn btn-default" id="btn_List_addRow" style="align:right" ><s:message code='button.addRow'/></button>
		            	<button type="button" class="btn btn-default" id="btn_List_delRow" style="align:right" ><s:message code='button.delRow'/></button>
		            </div>
				</div>
				<div class="pop_grid_wrap">
					<table id="reserveGrid"  ></table>
					<div id="reserveGrid_pager"></div>
				</div>
			</div>
			<!-- 그리드 끝 -->
		</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	var seq;
	var req_dt;
	var vflag;

	var list_seq;
	var list_req_dt;
	var mem_gbn;
	var email;
	var chk_in_dt;
	var chk_out_dt;
	var min_date;
	var prc_sts;

	var g_SEQ;
	var g_REQ_DT;
	var g_DSEQ;
	var g_COM_GBN;
	var g_NUM_GBN;
	var g_COM_HAN_NM;
	var g_COM_ENG_NM;
	var g_COM_TEL_NO;
	var g_CHK_IN_DT;
	var g_CHK_OUT_DT;
	var g_FLIGHT_IN;
	var g_FLIGHT_IN_HH;
	var g_FLIGHT_OUT;
	var g_FLIGHT_OUT_HH;
	var g_ADD_FILE_SEQ;
	var g_HDNG_GBN;
	var g_LATE_CHECK_IN;
	var g_LATE_CHECK_OUT;
	var g_ROOM_TYPE;
	var g_CONFIRM_NO;
	var g_STATUS_V;
	
	$('#p_reserveListRegi').dialog({
		
		/* title :'<s:message code='reservation.registration'/>', */
		autoOpen : false,
		height: 890,
		width: 950,
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
		
		if($(this).val() == '04'){ // 01 멤버, 02 일반, 03 교민, 04 에이젼시
			isDisabled(true);
		}else{
			$("#AGN_GB").val("");
			$("#AGN_CD").val("");
			isDisabled(false);
		}
		
		if($(this).val() == '02'){ //02 일반회원
			$("#M_PERSON").val("0");
			$("#M_PERSON"  ).attr("disabled",true);
			$("#ADD_HDNG_GBN"  ).attr("disabled",true);
			
		}
		
// 		if($(this).val() == '03'){ //03 교민
// 			isDisabled(true);
// 		}else{
// 			isDisabled(false);
// 		}


// 		if($(this).val() != '02'){ // 01,03
// 			if($(this).val() == '03'){ // 03
// 				isDisabled(true);
// 			}else{ //01
// 				isDisabled(false);
// 			}
// 			$("#AGN_CD").attr("disabled", true);
// 		}else if($(this).val() == '03'){
// 			isDisabled(true);
// 			$("#AGN_CD").attr("disabled", false);
// 		}else{
// 			isDisabled(false);
// 		}
	});
	 
	$('#AGN_GB').change(function() {
		if($(this).val() == '1'){ // 1 총판, 2 일반
			$("#AGN_CD").attr("disabled", false);
		}else{
			$("#AGN_CD").val("");
			$("#AGN_CD").attr("disabled", true);
		}
	});
	
	$('#ROOM_TYPE').change(function() {
		if($(this).val() == '01'){ // 01:트윈, 02:킹
			$("#KING_CNT").val("0");
		}else{
			$("#TWIN_CNT").val("0");
		}
		fn_roomTypeCnt();
	});

	$("#TWIN_KING_CNT").on("change , keyup", function(){
		if($("#ROOM_TYPE").val() == '01'){ // 01:트윈, 02:킹
			$("#KING_CNT").val("0");
			$("#TWIN_CNT").val($(this).val());
		}else{
			$("#TWIN_CNT").val("0");
			$("#KING_CNT").val($(this).val());
		}
	});
	
	$('#M_PERSON, #G_PERSON, #N_PERSON, #K_PERSON, #I_PERSON').on("keyup" , function(){
		$('#TOT_PERSON').val(parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()) + parseInt($('#N_PERSON').val()) + parseInt($('#K_PERSON').val()) + parseInt($('#I_PERSON').val()));
		
		if($("#MEM_GBN").val() == '01'){ //01 멤버 02 일반회원
			var g_person = parseInt($("#G_PERSON").val().replaceAll("," , ""));
			if(g_person == 0){
				$("#ADD_HDNG_GBN").attr("disabled", true);
				$("#ADD_HDNG_GBN").val("");
			}else{
				$("#ADD_HDNG_GBN").attr("disabled", false);
			}
		}
		fn_roomTypeCnt();
	});
	
	function fn_roomTypeCnt(){
		var roomTypeCnt = 0;
		roomTypeCnt = parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()) + parseInt($('#N_PERSON').val());
		if(roomTypeCnt > 0){
			roomTypeCnt = Math.ceil(roomTypeCnt/2);
			
			$("#TWIN_KING_CNT").val(roomTypeCnt);
			if($("#ROOM_TYPE").val() == '01'){ //01 트윈
				$("#TWIN_CNT").val(roomTypeCnt);
				$("#KING_CNT").val("0");
			}else if($("#ROOM_TYPE").val() == '02'){ //02 킹
				$("#TWIN_CNT").val("0");
				$("#KING_CNT").val(roomTypeCnt);
			}else{
				
			}
		}
	}
	
	function fn_init(receivedData){
		var day = new Date();
		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
		$('#REQ_DT').val($.datepicker.formatDate('yy.mm.dd', new Date())).attr("readonly" , true);
		seq    = receivedData.SEQ;
		req_dt = receivedData.REQ_DT;
// 		alert("seq : " + seq);
// 		alert("req_dt : " + req_dt);
		$("input:radio[name='LATE_CHECK_IN'][value='3']").prop("checked", true);
		$("input:radio[name='LATE_CHECK_OUT'][value='3']").prop("checked", true);
		$("#TWIN_CNT").val("0");
		$("#KING_CNT").val("0");
		
		if(fn_empty(seq || req_dt)){ //신규
		    $(".ui-dialog-title").text('<s:message code='reservation.registration'/>');
		    $("#CHK_IN_DT"      ).val(Util.converter.dateFormat1(today));
		    $("#CHK_OUT_DT"     ).val(Util.converter.dateFormat1(today));
		    $(".image"          ).hide();
		    $(".status"         ).hide();
		    vflag = "new";
		    $("#TOT_AMT , #PAY_AMT , #DCT_AMT , #BAL_AMT , #DEP_IN_DT , #DEP_AMT , #EXP_DT , #INV_REG_DT").attr("disabled", true);
		}else{ // 상세
			//예약 현황의 상세보기로 넘어왔다면 필요없는 부분 disabled 하기
			if(receivedData.DETAIL == 'Y'){
				//미팅샌딩 상세버튼 /상태 변경 버튼 / 인보이스 발행일자 생성 버튼 / 입금완료 버튼 / 행추가,행삭제 버튼 / 저장 버튼
				$("#btn_search, #insertPickGbn, #btn_create, #btn_deposit, #changeStatus, #btn_com_add, #btn_List_addRow, #btn_List_delRow, #save").attr("disabled", true);
			}
		
		    $("#USER_ID , #MEM_GBN").attr("disabled", true);
		    $(".ui-dialog-title").text('<s:message code='reservation.detail'/>');
		    $("#btn_search").hide();
		    initSelect();
		    vflag = "detail";
		}
		
		$('#DEP_IN_DT, #INV_REG_DT').datepicker({
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
		
		// $("#btn_create").hide(); // 인보이스 발행일자 생성 버튼
		createGrid();

  		cSearch();
		$("#reserveGrid_pager_left").hide();
		

		$("#TOT_PERSON"     ).attr("disabled",true);
		$("#AGN_GB").val("");
		$("#AGN_CD").val("");
		$("#ADD_HDNG_GBN").val("");
		
		if($("#MEM_GBN").val() == '02'){ //02 일반회원
			$("#M_PERSON").val("0");
			$("#M_PERSON"  ).attr("disabled",true);
			$("#ADD_HDNG_GBN"  ).attr("disabled",true);
		}
		
		loadingEnd();
		
	}

	function fn_dataSet(data){
    	$.each(data, function(key , val){
    		if(key == "TOT_PERSON"  || key == "R_PERSON"    || key == "N_PERSON"    || key == "K_PERSON"    || key == "ADD_R_S_PER" ||
        	   key == "ADD_R_S_DAY" || key == "ADD_R_S_CNT" || key == "ADD_R_S_CNT" || key == "ADD_R_P_PER" || key == "ADD_R_P_DAY" || 
        	   key == "ADD_R_P_CNT" || key == "TWIN_CNT"      || key == "KING_CNT"      || key == "CNT_P1"      || key == "CNT_P2"      ||
        	   key == "TOT_AMT"     || key == "DCT_AMT"     || key == "BAL_AMT"     || key == "DEP_AMT"     || key == "PAY_AMT"     ||
        	   key == "ROOM_ADD_CNT"     || key == "ROOM_ADD_CNT"     || key == "PRIM_ADD_IL"     || key == "PRIM_ADD_CNT"     ||
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
    		}else if(key == "LATE_CHECK_IN" || key == "LATE_CHECK_OUT"){
    			// radio 
    		}else{
    			$('[name='+ key +']').val(val);
    		}

    		if(key == "TWIN_CNT"){
    			var room_cnt = parseInt(val);
    			if(room_cnt > 0){
    				$("#TWIN_KING_CNT").val(val);
    			}
    		}

    		if(key == "KING_CNT"){
    			var room_cnt2 = parseInt(val);
    			if(room_cnt2 > 0){
    				$("#TWIN_KING_CNT").val(val);
    			}
    		}

    		if(key == "M_PERSON" || key == "G_PERSON" || key == "N_PERSON" || key == "K_PERSON" || key == "I_PERSON"){
    			$('[name='+ key +'_HIDDEN]').val(val);
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

        //LATE_CHECK_IN
    	if(!fn_empty(data.LATE_CHECK_IN)){
    		$("input:radio[name='LATE_CHECK_IN'][value='" + data.LATE_CHECK_IN + "']").prop("checked", true);
    	}
        
        //LATE 체크아웃 셋팅
    	if(!fn_empty(data.LATE_CHECK_OUT)){
    		$("input:radio[name='LATE_CHECK_OUT'][value='" + data.LATE_CHECK_OUT + "']").prop("checked", true);
    	}
        
    	//멤버구분 disabled 셋팅
    	if(!fn_empty(data.MEM_GBN)){
    		//if(data.MEM_GBN == "03" || (data.MEM_GBN == "02" && !fn_empty($("#AGN_CD").val()))){
    		if(data.MEM_GBN == "03" || data.MEM_GBN == "04" ){
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
// 				fn_imageSet(data.image);
			}
		});
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
	    $("[name='LATE_CHECK_IN']").attr("disabled",temp);
	    $("[name='LATE_CHECK_OUT']").attr("disabled",temp);
	    $("#ROOM_TYPE"  ).attr("disabled",temp);
	    $("#FLIGHT_IN"  ).attr("disabled",temp);
	    $("#FLIGHT_IN_HH" ).attr("disabled",temp);
	    $("#FLIGHT_OUT"  ).attr("disabled",temp);
	    $("#FLIGHT_OUT_HH" ).attr("disabled",temp);
	    $("#ROOM_ADD_IL"     ).attr("disabled",temp);
	    $("#ROOM_ADD_CNT"     ).attr("disabled",temp);
	    $("#PRIM_ADD_IL"     ).attr("disabled",temp);
	    $("#PRIM_ADD_CNT"     ).attr("disabled",temp);
	    $("#DEP_IN_DT"  ).attr("disabled",temp);
	    
	    if($("#MEM_GBN").val() == "01"){
			$("#HDNG_GBN").val("28");
	    	$("#HDNG_GBN"     ).attr("disabled",true);
	    	
	    	if($("#G_PERSON").val() != "0"){
	    		$("#ADD_HDNG_GBN"     ).attr("disabled",false);
	    	}else{
	    		$("#ADD_HDNG_GBN"     ).attr("disabled",true);
	    	}
	    	$("#AGN_GB"     ).attr("disabled",true);
	    	$("#AGN_CD"     ).attr("disabled",true);
	    }else if($("#MEM_GBN").val() == "02"){
	    	$("#M_PERSON"     ).attr("disabled",true);
	    	$("#ADD_HDNG_GBN"     ).attr("disabled",true);
// 	    	if($("#G_PERSON").val() != "0"){
// 	    		$("#ADD_HDNG_GBN"     ).attr("disabled",false);
// 	    	}else{
// 	    		$("#ADD_HDNG_GBN"     ).attr("disabled",true);
// 	    	}
	    	$("#AGN_GB"     ).attr("disabled",true);
	    	$("#AGN_CD"     ).attr("disabled",true);
	    }else if($("#MEM_GBN").val() == "04" || $("#MEM_GBN").val() == "03"){
	    	$("#M_PERSON"     ).attr("disabled",true);
	    	$("#ADD_HDNG_GBN"     ).attr("disabled",true);
	    	$("#AGN_GB"     ).attr("disabled",false);
	    	$("#AGN_CD"     ).attr("disabled",false);
	    }else{
	    	$("#M_PERSON"     ).attr("disabled",false);
	    	$("#ADD_HDNG_GBN"     ).attr("disabled",false);
	    	$("#AGN_GB"     ).attr("disabled",true);
	    	$("#AGN_CD"     ).attr("disabled",true);
	    }
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
				    , "AGN_GB"          : $("#AGN_GB").val()
				    , "AGN_CD"          : $("#AGN_CD").val()
				    , "CHK_IN_DT"       : $("#CHK_IN_DT").val().replaceAll(".","")
				    , "CHK_OUT_DT"      : $("#CHK_OUT_DT").val().replaceAll(".","")
				    , "ROOM_TYPE"       : $("#ROOM_TYPE").val()
				    , "FLIGHT_IN"       : $("#FLIGHT_IN").val()
				    , "FLIGHT_IN_HH"    : $("#FLIGHT_IN_HH").val()
				    , "FLIGHT_OUT"      : $("#FLIGHT_OUT").val()
				    , "FLIGHT_OUT_HH"   : $("#FLIGHT_OUT_HH").val()
				    , "TOT_PERSON"      : parseInt($("#TOT_PERSON").val().replaceAll("," , ""))
				    , "M_PERSON"        : parseInt($("#M_PERSON").val().replaceAll("," , ""))
				    , "G_PERSON"        : parseInt($("#G_PERSON").val().replaceAll("," , ""))
				    , "N_PERSON"        : parseInt($("#N_PERSON").val().replaceAll("," , ""))
				    , "K_PERSON"        : parseInt($("#K_PERSON").val().replaceAll("," , ""))
				    , "I_PERSON"        : parseInt($("#I_PERSON").val().replaceAll("," , ""))
				    , "HDNG_GBN"        : $("#HDNG_GBN").val()
				    , "ADD_HDNG_GBN"    : $("#ADD_HDNG_GBN").val()
				    , "PICK_GBN"        : $("#PICK_GBN").val()
				    
				    , "TWIN_CNT"          : parseInt($("#TWIN_CNT").val().replaceAll("," , ""))
				    , "KING_CNT"          : parseInt($("#KING_CNT").val().replaceAll("," , ""))
				    , "ROOM_ADD_IL"       : parseInt($("#ROOM_ADD_IL").val().replaceAll("," , ""))
				    , "ROOM_ADD_CNT"      : parseInt($("#ROOM_ADD_CNT").val().replaceAll("," , ""))
				    , "PRIM_ADD_IL"       : parseInt($("#PRIM_ADD_IL").val().replaceAll("," , ""))
				    , "PRIM_ADD_CNT"      : parseInt($("#PRIM_ADD_CNT").val().replaceAll("," , ""))
				    , "PICK_IN"         : $("#PICK_IN").val()
				    , "PICK_OUT"        : $("#PICK_OUT").val()
				    , "LATE_CHECK_IN"  : $("[name='LATE_CHECK_IN']:checked").val()
				    , "LATE_CHECK_OUT"  : $("[name='LATE_CHECK_OUT']:checked").val()
				    , "REMARK"          : $("#REMARK").val()
				    , "INV_REG_DT"      : $("#INV_REG_DT").val().replaceAll(".", "")
// 				    , "CONFIRM_NO"      : $("#CONFIRM_NO").val()
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
		
		

		btGrid.gridSaveRow('reserveGrid');
		var gridData  = $("#reserveGrid").getRowData();
		var ids = $("#reserveGrid").jqGrid("getDataIDs");
		var gridDataChk = [];
		var cnt = 0;
		var errChk=0;
		
		for(var i = 0; i < ids.length; i++){
			gridDataChk.push($("#reserveGrid").getRowData(ids[i]));
		}
		
		var param = {"reserveInfo"   : obj
				   , "detail"        : gridDataChk
				   , "V_FLAG"        : vflag};
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
					popupClose($('#p_reserveListRegi').data('pid'));
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
		
		if(chk_in_dt == chk_out_dt){
			alert("체크인 날짜와 체크아웃 날짜가 같습니다.")
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
			
// 			var flight_in = $("#FLIGHT_IN").val(); 
// 			if(fn_empty(flight_in)){
// 				alert("도착항공기편을 선택해주세요.");
// 				return false;
// 			}
			
// 			var flight_out = $("#FLIGHT_OUT").val(); 
// 			if(fn_empty(flight_out)){
// 				alert("출발항공기편을 선택해주세요.");
// 				return false;
// 			}
		}
		var hdng_gbn = $("#HDNG_GBN").val();
		if(fn_empty(hdng_gbn)){
			alert("상품을 선택해주세요.");
			return false;
		}
		
		var g_person_v = parseInt($("#G_PERSON").val().replaceAll("," , ""));
		var add_hdng_gbn = $("#ADD_HDNG_GBN").val();
		if(mem_gbn == "01" && g_person_v > 0 && fn_empty(add_hdng_gbn)){ //멤버회원 이면서 일반 동반자가 있을 떄  일반동반자의 상품확인
			alert("일반 동반자의 상품을 선택해주세요.");
			return false;
		}
		
		if(mem_gbn != "01"){ //일반이거나, 교민이면
			if(hdng_gbn == "28"){
				alert("해당상품은 멤버전용 상품입니다.");
				return false;
			}
			if(add_hdng_gbn == "28"){
				alert("해당상품은 멤버전용 상품입니다.");
				return false;
			}
		}else{ // 멤버
			if(hdng_gbn == "01" || hdng_gbn == "02" || hdng_gbn == "03" || hdng_gbn == "04" || hdng_gbn == "05" || hdng_gbn == "06" || hdng_gbn == "07" ){
				alert("해당상품은 일반전용 상품입니다.");
				return false;
			}
		}
		
		var tot_person = parseInt($("#TOT_PERSON").val().replaceAll("," , ""));
		if(tot_person == 0){
			alert("총인원을 입력해주세요.");
			return false;
		}
		
// 		var confirm_no = $("#CONFIRM_NO").val();
		var prc_sts    = $("#PRC_STS").val();
		if(mem_gbn == "01" || mem_gbn == "02"){
			if(!fn_empty(prc_sts) && prc_sts == "06"){
// 				if(fn_empty(confirm_no)){
// 					alert("리조트컨펌번호를 입력해주세요.");
// 					return false;
// 				}
			}
		}
		
		var m_person = parseInt($("#M_PERSON").val().replaceAll("," , ""));
		var g_person = parseInt($("#G_PERSON").val().replaceAll("," , ""));
		var n_person = parseInt($("#N_PERSON").val().replaceAll("," , ""));
		var k_person = parseInt($("#K_PERSON").val().replaceAll("," , ""));
		var i_person = parseInt($("#I_PERSON").val().replaceAll("," , ""));
		if(m_person == 0 && g_person == 0 && n_person == 0 && k_person == 0 && i_person == 0){
			alert("인원내역을 입력해주세요.");
			return false;
		}
		
		if(tot_person != m_person + g_person + n_person + k_person + i_person){
			alert("총인원과 인원내역이 다릅니다.");
			return false;
		}
        
		if(mem_gbn == "01" || (mem_gbn == "02" && fn_empty(agn_cd))){
			
			var late_check_in = $("[name='LATE_CHECK_IN']:checked").val();
			if(fn_empty(late_check_in)){
				alert("late checkin 을 선택해주세요.");
				return false;
			}
			var late_check_out = $("[name='LATE_CHECK_OUT']:checked").val();
			if(fn_empty(late_check_out)){
				alert("late checkout 을 선택해주세요.");
				return false;
			}
			
			var twin_cnt = parseInt($("#TWIN_CNT").val().replaceAll("," , ""));
			var king_cnt = parseInt($("#KING_CNT").val().replaceAll("," , ""));
			if(twin_cnt == 0 && king_cnt == 0){
			    alert("트윈/킹 룸 개수를 입력해주세요.");
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
	
	$("#PAY_AMT").on("keyup", function(){
		var dct_amt = parseFloat(fn_uncomma($("#DCT_AMT").val()));
		var tot_amt = parseFloat(fn_uncomma($("#TOT_AMT").val()));
		var pay_amt = parseFloat(fn_uncomma($(this).val()));
		var bal_amt;
		
		if (dct_amt > 0){
			bal_amt = tot_amt - dct_amt - pay_amt;    //잔금 = 총금액 - 할인금액 - 입금금액
		}else{
			bal_amt = tot_amt - pay_amt;    //잔금 = 총금액 - 할인금액
		}
		
		$("#BAL_AMT").val(fn_comma(bal_amt));
	});
	
	$("#DCT_AMT").on("keyup", function(){
		var prv_dct_amt = $("#PRV_DCT_AMT").val();
		var prv_bal_amt = $("#PRV_BAL_AMT").val();
		var dct_amt = parseFloat(fn_uncomma($(this).val()));
		var tot_amt = parseFloat(fn_uncomma($("#TOT_AMT").val()));
		var dep_amt = parseFloat(fn_uncomma($("#DEP_AMT").val()));
		var pay_amt = parseFloat(fn_uncomma($("#PAY_AMT").val()));
		var bal_amt;
		
		if (pay_amt > 0){
			bal_amt = tot_amt - dct_amt - pay_amt;    //잔금 = 총금액 - 할인금액 - 입금금액
		}else{
			bal_amt = tot_amt - dct_amt;    //잔금 = 총금액 - 할인금액
		}
		
		if(dct_amt > tot_amt){
			$(this      ).val(prv_dct_amt);
			$("#BAL_AMT").val(prv_bal_amt);
			alert("tot_amt :" + tot_amt);
			alert("dct_amt :" + dct_amt);
			alert("금액을 확인해주세요.");
			return false;
		}
		
		$("#BAL_AMT").val(fn_comma(bal_amt));
	});
	
	
	//인보이스 생성
	$("#btn_create").click(function() {
		
		console.log("====== 인보이스 생성버튼 클릭 ======")
		
		//예약상세 여부 확인
		console.log("====== 예약상세여부 확인 ======")
		var url3 = "/reserve/selectReserveDetlYn.do";
		var param3 = {
			"SEQ" : seq, 	
			"REQ_DT" : req_dt
		};
		
		var isReserveDetlYn = "";
		fn_ajax(url3, false, param3, function(data, xhr) {
			
			isReserveDetlYn = data.result;
			console.log("=== 예약상세여부 : "+isReserveDetlYn);									
		});
		
		
		if(isReserveDetlYn != "Y"){  //예약상세여부가 'Y'가 아닐시
					
			alert("동반자 정보가 없습니다.");
			return false;
		}
		
	
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
				alert("체크인, 체크아웃 날짜확인후 저장버튼을 클릭해주세요.");
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
			        , "CHK_OUT_DT"    : $("#CHK_OUT_DT"   ).val().replaceAll(".","")
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

	$("#changeStatus").on("click" , function(){
		changeStatus();
	});
	
	$("#btn_search").on("click", function(){
		var url = "/reserve/searchId.do";
	    var pid = "p_searchIdPopup";
	    var param = {};
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				$("#USER_ID").val(data.USER_ID);
				$("#MEM_GBN").val(data.MEM_GBN);
				$("#REQ_HAN_NM").val(data.REQ_HAN_NM);
				$("#REQ_ENG_NM").val(data.REQ_ENG_NM);
				$("#REQ_TEL_NO").val(data.REQ_TEL_NO);

				saveSetId();

			}
		});
	});
	


	function isValidationSetId(){
		var mem_gbn = $("#MEM_GBN").val();
		if(fn_empty(mem_gbn)){
			alert("멤버구분을 선택해주세요.");
			return false;
		}
		
		var selUsrid = $("#USER_ID").val();
// 		if(mem_gbn == "01" || mem_gbn == "02"){
			if(fn_empty(selUsrid)){
				alert("아이디를 선택해주세요.");
				return false;
			}
// 		}
		
		return true;
	}
	
	function saveSetId(){
		if(!isValidationSetId())return;
		var day = new Date();
		var today1 = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
		var url = "/reserve/insertReserve.do";
		var param2= {};
		var param = {"REQ_DT"      : today1
				   , "USER_ID"     : $("#USER_ID").val()
				   , "MEM_GBN"     : $("#MEM_GBN").val()
				   , "ENG_NAME"    : $("#REQ_HAN_NM").val()
				   , "HAN_NAME"    : $("#REQ_ENG_NM").val()
				   , "TEL_NO"      : $("#REQ_TEL_NO").val()
				    };
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, true, param, function(data, xhr){
				if(data.result.resultCd != '0000'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					$("#REQ_DT").val(today1);
					$("#USER_ID").val(param.USER_ID);
					$("#SEQ").val(data.result.SEQ);
					
					var param2 = {"REQ_DT"      : data.REQ_DT
					   			, "SEQ"     : data.result.SEQ
					    };
					fn_init(param2);
					
// 					p_rtnData = {
// 							"USER_ID"    : gridData["USER_ID"],
// 							"MEM_GBN"    : gridData["MEM_GBN"],
// 							"REQ_HAN_NM" : gridData["HAN_NAME"],
// 							"REQ_ENG_NM" : gridData["ENG_NAME"],
// 							"REQ_TEL_NO" : gridData["TEL_NO"],
				}	
			});
		}
	}
	
	
	$("#btn_deposit").on("click", function(){
		if(!isValidation())return;
// 		var confirm_no = $("#CONFIRM_NO").val();
		var mem_gbn = $("#MEM_GBN").val();
		var agn_cd = $("#AGN_CD").val();
// 		if((mem_gbn == "02" && fn_empty(agn_cd)) || mem_gbn == "01"){ // 일반고객이거나, 멤버고객
// 		    if(fn_empty(confirm_no)){
// 		    	alert("리조트 컨펌번호를 입력해주세요.");
// 		    	return false;
// 		    }
// 		}

		var pay_amt = parseInt($("#PAY_AMT").val().replaceAll(",", ""));
		var tot_amt = parseInt($("#TOT_AMT").val().replaceAll(",", ""));
		var dep_amt = parseInt($("#DEP_AMT").val().replaceAll(",", ""));
		var val_amt = parseInt($("#BAL_AMT").val().replaceAll(",", ""));
		var dct_amt = parseInt($("#DCT_AMT").val().replaceAll(",", ""));
		
		console.log("pay_amt(입금금액) : "+pay_amt);
		console.log("tot_amt(총금액)  : "+tot_amt);
		console.log("dep_amt(예약금액) : "+dep_amt);
		console.log("val_amt(잔금액)  : "+val_amt);
		console.log("dct_amt(할인금액) : "+dct_amt);
		
		if(pay_amt == 0 || pay_amt == ""){
			alert("입금금액을 입력하세요.");
			$("#PAY_AMT").val("0");
			return false;
		}
		if(tot_amt == 0 || dep_amt == 0 || val_amt == 0 || pay_amt == ""){
			return false;
		}
		var url = "/reserve/deposit.do";
	    var param = { "REQ_SEQ"          : parseInt(seq)
			        , "REQ_DT"       : req_dt
			        , "PAY_AMT"      : pay_amt
			        , "MEM_GBN"      : $("#MEM_GBN").val()
			        , "R_PERSON"     : String(parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()))
			        , "booleanIn"    : String(parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()))
			        , "booleanOut"   : String(parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()))
			        , "CHK_IN_DT"    : $("#CHK_IN_DT").val().replaceAll(".", "")
			        , "CHK_OUT_DT"   : $("#CHK_OUT_DT").val().replaceAll(".", "")
 			        , "CONFIRM_NO"   : ""
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
	
	
	
	
	

	function cSearch(currentPage){
		var url = "/reserve/reserveSelectAddList.do";
		var formData = formIdAllToMap('frmSearch');
		var reserve_sum_tot = 0;
		var param = {"SEQ"     : seq
				   , "REQ_DT"  : req_dt
				   };
		
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.result , function(i , val){
				//val.TOT_AMT = parseInt(val.TOT_AMT).toLocaleString();
				//val.PER_AMT = parseInt(val.PER_AMT).toLocaleString();
				val.STATUS_V = "R";
				reserve_sum_tot += val.TOT_AMT;
			});
			reloadGrid("reserveGrid", data.result);
			var colModel = $("#reserveGrid").jqGrid('getGridParam', 'colModel'); 
			for(var i =0; i < data.result.length; i++){
				jQuery("#reserveGrid").setCell(i+1);
				$("#btn_com_add"     ).attr("disabled", true);
				
			}
			btGrid.gridResizing('reserveGrid');
		    $("#reserveGrid_pager_right").append('<div dir="ltr" id="reserve_sumtot_amt" style="text-align:right">Total Price: '+fn_comma(reserve_sum_tot)+'</div>');
		   
			$("#reserveGrid_pager_left").hide();

			$('#reserveGrid').bind('jqGridSelectRow', function(e, rowid, status) {
				grid1_onCilckRow(e, rowid, status);
			});
		    
	    });
		
		$('#POP_EXP_DT').datepicker({
	        dateFormat : 'yy.mm.dd',
		    showOn : 'both'
		 }).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		     function(e) {
		 });
		
		loadingEnd();
	}
	
	

	function gridColspan(){
		var newWidth1 = $("#jqgh_reserveGrid_USE_DAY").width() + $("#jqgh_reserveGrid_UNIT_DAY").width();
		$('#reserveGrid').jqGrid("setLabel", "USE_DAY", "사용 일/횟수", "", {
		    style: "width: " + newWidth1,
		    colspan: "2"
		});
		$('#reserveGrid').jqGrid("setLabel", "UNIT_DAY", "", "", {style: "display: none"});
		
		var newWidth2 = $("#jqgh_reserveGrid_USE_NUM").width() + $("#jqgh_reserveGrid_UNIT_NUM").width();
		$('#reserveGrid').jqGrid("setLabel",	 "USE_NUM", "사용 명/갯수", "", {
		    style: "width: " + newWidth2,
		    colspan: "2"
		});
		$('#reserveGrid').jqGrid("setLabel", "UNIT_NUM", "", "", {style: "display: none"});
		
		btGrid.gridResizing('grid1');
	}
	
	function createGrid(){
		var url = "/reserve/reserveSelectAddList.do";
		var formData = formIdAllToMap('frmSearch');
		var param = {"MEM_GBN" : mem_gbn
				   };
		var obj = new Object();
		obj +=":;";
		
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.selectList , function(i , v){
				if (!v.CODE) {
					return;
				}
				obj += v.CODE + ':'+ v.CODE_NM + ';';
			});
			obj = obj.substr(0, obj.length-1);
			
			$("#reserveGrid").setColProp('ITEM_CD', {  formatter : "select", editoptions: { value:obj}});
	    });
		
		var colName = [
						  '<s:message code="reservation.seq"/>'
						, '예약일자'
						, '순번'
						, '동반자구분'
						, '인원구분'
						, '한글명'
						, '영문명'
						, '전화번호'
						, '체크인일자'
						, '체크아웃일자'
						, '도착항기편'
						, '도착시간'
						, '출발항기편'
						, '출발시간'
						, '항공이미지'
						, '패키지상품'
						, 'early체크인'
						, 'Late체크아웃'
						, '객실타입'
						, '리조트confirm번호'
						, 'STATUS_V'
					];

		var colModel = [
						  { name: 'REQ_DT',      width : 24 , align: 'center' , hidden:true, editoptions:{readonly: true}}
						, { name: 'SEQ',      width : 24 , align: 'center' , hidden:true, editoptions:{readonly: true}}
						, { name: 'DSEQ',      width : 24 , align: 'center' , editable:true, editoptions:{readonly: true}}
						, { name: 'COM_GBN',  width : 80, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${COM_GBN}'}}
						
						, { name: 'NUM_GBN',  width : 80, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${NUM_GBN}'}}
						, { name: 'COM_HAN_NM',  width : 120, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'COM_ENG_NM',  width : 120, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'COM_TEL_NO',  width : 120, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'CHK_IN_DT',  width : 84, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'CHK_OUT_DT',  width : 84, align: 'left' , editable:true, editoptions:{maxlength:100}}
						
						, { name: 'FLIGHT_IN',  width : 80, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_IN}'}}
						, { name: 'FLIGHT_IN_HH',  width : 74, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_IN_HH}'}}
						, { name: 'FLIGHT_OUT',  width : 80, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_OUT}'}}
						, { name: 'FLIGHT_OUT_HH',  width : 74, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_OUT_HH}'}}
// 						, { name: 'ADD_FILE_SEQ',  width : 120, align: 'left' , editable:true, edittype:"button" , formatter : "button" , editoptions:{value:'이미지보기'}}
						, { name: 'ADD_FILE_SEQ',  width : 84, align: 'center' , editable:true, edittype:"button", }
						, { name: 'HDNG_GBN',  width : 120, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${list_hdng_gbn_g}'}}
						, { name: 'LATE_CHECK_IN',  width : 80, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${LATE_CHECK_IN}'}}
						, { name: 'LATE_CHECK_OUT',  width : 80, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${LATE_CHECK_OUT}'}}
						
						, { name: 'ROOM_TYPE',  width : 120, align: 'left' , editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${ROOM_TYPE}'}}
						, { name: 'CONFIRM_NO',  width : 120, align: 'left' , editable:true, editoptions:{maxlength:100}}
						, { name: 'STATUS_V',  width : 100, align: 'center',  editable:true ,editoptions:{readonly: true}}
						
					];
		
		var gSetting = {
		        pgflg:false,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : false,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: false,
				autowidth: true,
				queryPagingGrid:false, // 쿼리 페이징 처리 여부
				height : 147
		};
		
		// 그리드 생성 및 초기화
		btGrid.createGrid('reserveGrid', colName, colModel, gSetting);
		
		$('#reserveGrid').jqGrid('setGroupHeaders', {
			useColSpanStyle: true, 
			groupHeaders:[
				{startColumnName: 'USE_DAY', numberOfColumns: 4, titleText: '사용'},
				]
		});
	}
	

	function delProgram(){
		var ids = $("#reserveGrid").jqGrid("getDataIDs"); // 해당 그리드의 전체 로우의 아이디 조회
		for(var i = 0; i < ids.length; i++){
			btGrid.gridDelRow("reserveGrid", ids[i]);  // 해당 id의 로우 삭제
		}
	}

	// 동반자추가
	$("#btn_com_add").on("click" , function(){
		delProgram();
		btGrid.gridSaveRow('reserveGrid');
		var rowId = $('#reserveGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#reserveGrid").getRowData(rowId);
		var data;
		
		var tot_person = parseInt($("#TOT_PERSON").val().replaceAll("," , ""));
		var j_m = parseInt($("#M_PERSON").val().replaceAll("," , ""));		//멤버
		var j_g = parseInt($("#G_PERSON").val().replaceAll("," , ""));		//일반
		var j_n = parseInt($("#N_PERSON").val().replaceAll("," , ""));		//비라운딩
		var j_k = parseInt($("#K_PERSON").val().replaceAll("," , ""));		//소아
		var j_i = parseInt($("#I_PERSON").val().replaceAll("," , ""));		//영유아
		
		for(var i = 0 ; i < tot_person ; i ++ ){
			
			if (i == 0 && $("#MEM_GBN").val() != '04') {		// 04 에이전시는 예약자가 동반자 아님
				g_COM_GBN = "1";			//동반자구분 1:예약자
			}else{
				g_COM_GBN = "2";			//동반자구분 2:동반자
			}
			
			if(j_m > 0){ // 01 멤버, 02 일반, 03 비라운딩, 04 소아, 05 영유아
				g_NUM_GBN = "01";
				j_m = j_m - 1;
				g_HDNG_GBN = $("#HDNG_GBN").val();
			}else if(j_g > 0){
				g_NUM_GBN = "02";
				j_g = j_g - 1;
				if($("#MEM_GBN").val() == '01'){
					g_HDNG_GBN = $("#ADD_HDNG_GBN").val();
				}else{
					g_HDNG_GBN = $("#HDNG_GBN").val();
				}
			}else if(j_n > 0){
				g_NUM_GBN = "03";
				j_n = j_n - 1;
				g_HDNG_GBN = "30";
			}else if(j_k > 0){
				g_NUM_GBN = "04";
				j_k = j_k - 1;
				g_HDNG_GBN = "30";
			}else if(j_i > 0){
				g_NUM_GBN = "05";
				j_i = j_i - 1;
				g_HDNG_GBN = "";
			}
// 			g_SEQ = $("#HDNG_GBN").val();
// 			g_SEQ = $("#HDNG_GBN").val();
// 			var g_SEQ;
// 			var g_REQ_DT;
			g_DSEQ = i;
			if (i == 0){
				g_COM_HAN_NM = $("#REQ_HAN_NM").val();
				g_COM_ENG_NM = $("#REQ_ENG_NM").val();
				g_COM_TEL_NO = $("#REQ_TEL_NO").val();
			}
			g_CHK_IN_DT = $("#CHK_IN_DT").val();
			g_CHK_OUT_DT = $("#CHK_OUT_DT").val();
			g_FLIGHT_IN = $("#FLIGHT_IN").val();
			g_FLIGHT_IN_HH = $("#FLIGHT_IN_HH").val();
			g_FLIGHT_OUT = $("#FLIGHT_OUT").val();
			g_FLIGHT_OUT_HH = $("#FLIGHT_OUT_HH").val();
			g_ADD_FILE_SEQ = $("#ADD_FILE_SEQ").val();
			g_LATE_CHECK_IN = $("[name='LATE_CHECK_IN']:checked").val();
			g_LATE_CHECK_OUT = $("[name='LATE_CHECK_OUT']:checked").val();
			g_ROOM_TYPE = $("#ROOM_TYPE").val();
			g_CONFIRM_NO = $("#CONFIRM_NO").val();
			g_STATUS_V = "I";
			
			data = {"DSEQ" : g_DSEQ , "SEQ" : g_DSEQ + 1  , "COM_GBN" : g_COM_GBN , "NUM_GBN" : g_NUM_GBN , "COM_HAN_NM" : g_COM_HAN_NM , "COM_ENG_NM" : g_COM_ENG_NM , "COM_TEL_NO" : g_COM_TEL_NO , "CHK_IN_DT" : g_CHK_IN_DT , "CHK_OUT_DT" : g_CHK_OUT_DT , "FLIGHT_IN" : g_FLIGHT_IN , "FLIGHT_IN_HH" : g_FLIGHT_IN_HH , "FLIGHT_OUT" : g_FLIGHT_OUT , "FLIGHT_OUT_HH" : g_FLIGHT_OUT_HH , "ADD_FILE_SEQ" : g_ADD_FILE_SEQ , "HDNG_GBN" : g_HDNG_GBN , "LATE_CHECK_IN" : g_LATE_CHECK_IN , "LATE_CHECK_OUT" : g_LATE_CHECK_OUT , "ROOM_TYPE" : g_ROOM_TYPE , "CONFIRM_NO" : g_CONFIRM_NO , "STATUS_V" : g_STATUS_V};
			btGrid.gridAddRow("reserveGrid", "last", data);
			
			g_DSEQ = "";
			g_COM_GBN = "";
			g_NUM_GBN = "";
			g_COM_HAN_NM = "";
			g_COM_ENG_NM = "";
			g_COM_TEL_NO = "";
			g_CHK_IN_DT = "";
			g_CHK_OUT_DT = "";
			g_FLIGHT_IN = "";
			g_FLIGHT_IN_HH = "";
			g_FLIGHT_OUT = "";
			g_FLIGHT_OUT_HH = "";
			g_ADD_FILE_SEQ = "";
			g_HDNG_GBN = "";
			g_LATE_CHECK_IN = "";
			g_LATE_CHECK_OUT = "";
			g_ROOM_TYPE = "";
			g_CONFIRM_NO = "";
			g_STATUS_V = "";
			
		}
	});
	
	$("#btn_List_addRow").on("click" , function(){
		btGrid.gridSaveRow('reserveGrid');
		var rowId = $('#reserveGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#reserveGrid").getRowData(rowId);
		var data = {"DSEQ" : seq, "SEQ" : seq, "STATUS_V" : "I"};
		btGrid.gridAddRow("reserveGrid", "last", data);
	});
	
	$("#btn_List_delRow").on("click" , function(){
		var rowId =$("#reserveGrid").jqGrid('getGridParam','selrow');
		var args = "";
		if (rowId == null) {
			args = '<s:message code='title.row'/>';
    		alert("<s:message code='errors.selectdel' arguments='" + args + "' javaScriptEscape='false'/>");
    		return;
		}else{
			var grdData = $("#reserveGrid").jqGrid("getCell", rowId, "STATUS_V");
			
			if(grdData != 'I'){
				alert("<s:message code='errors.statusR' javaScriptEscape='false'/>"); 
				return;
	    	} else {
	    			$("#reserveGrid").jqGrid("delRowData",rowId);
	    	}
		}
	});
	

	function reserveSelectAirlineImg(fileseq){
		var url = "/reserve/arrImg.do";
	    var pid = "p_arrImgPopup";
	    var addfileseq = fileseq;
	    var param = { "REQ_DT"          : req_dt
			        , "SEQ"             : seq
			        , "ADD_FILE_SEQ"    : addfileseq
	                };
	    
		popupOpen(url, pid, param, function(data) {
			reserveSelectAirlineImg2(addfileseq);
		});
		
// 		jqg30_ADD_FILE_SEQ
	}

	function reserveSelectAirlineImg2(fileseq){
		var url = "/reserve/reserveSelectAirlineImg.do";
	    var addfileseq = fileseq;
	    var param = { "REQ_DT"          : req_dt
			        , "SEQ"             : seq
			        , "ADD_FILE_SEQ"    : addfileseq
	                };
	    
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("ajax 통신 error!");
			}else{
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
	

	// 조회내역 그리드 클릭 이벤트
	function grid1_onCilckRow(e, rowid, status){
		if(!fn_empty(rowid)){ // 선택 그리드 순번
			var addFileSeq = "";
			addFileSeq = $('#reserveGrid').jqGrid('getRowData',rowid).ADD_FILE_SEQ;
			var fileSeqArr = ($('#reserveGrid').jqGrid('getRowData',rowid).ADD_FILE_SEQ).split(" ");
			
			for(var i=0; i<fileSeqArr.length; i++) {
				var addFileSeq2 = fileSeqArr[i].split("value=");
				if(!fn_empty(addFileSeq2[1])){
					var addFileSeq3 = addFileSeq2[1].replaceAll('"' , '');
					reserveSelectAirlineImg(addFileSeq3);
				}
			}	
		}
	}
	
	
	$("#reserveGrid").bind("change , keyup" , function(){
		var changeRowId  = $('#reserveGrid').jqGrid('getGridParam', 'selrow');
		var rowCnt       = $('#reserveGrid').getGridParam('reccount');
		var ids          = $('#reserveGrid').jqGrid('getDataIDs');
		var full_tot_amt = 0;
		
		if($('#reserveGrid').jqGrid('getRowData', changeRowId).STATUS_V != "I"){
			$("#reserveGrid").jqGrid('setCell',changeRowId , 'STATUS_V', 'U');
		}
// 		alert($("#"+changeRowId+"_NUM_GBN_HIDDEN").val());
		
// 		if($("#"+changeRowId+"_NUM_GBN").val() == "01"){
//  			if($("#MEM_GBN").val() == '02'){
//  				alert("일반회원 예약등록 시 멤버 동반자 선택 안됩니다.11");
// 				return false;
//  			}
// 		}
		
		if($('#reserveGrid').jqGrid('getRowData', changeRowId).NUM_GBN != "00"){
			
			var m_person_g = 0;
			var g_person_g = 0;
			var n_person_g = 0;
			var k_person_g = 0;
			var i_person_g = 0;
			
	 		for(var i = 0 ; i < ids.length ; i ++ ){
				if($(this).jqGrid('getCell', ids[i] ,'NUM_GBN') == "01"){
					m_person_g = m_person_g + 1;
				}else if($(this).jqGrid('getCell', ids[i] ,'NUM_GBN') == "02"){
					g_person_g = g_person_g + 1;
				}else if($(this).jqGrid('getCell', ids[i] ,'NUM_GBN') == "03"){
					n_person_g = n_person_g + 1;
				}else if($(this).jqGrid('getCell', ids[i] ,'NUM_GBN') == "04"){
					k_person_g = k_person_g + 1;
				}else if($(this).jqGrid('getCell', ids[i] ,'NUM_GBN') == "05"){
					i_person_g = i_person_g + 1;
				}
			}

	 		if($("#"+changeRowId+"_NUM_GBN").val() == "01"){
	 			if($("#MEM_GBN").val() == '02'){
// 	 				$("#"+changeRowId+"_NUM_GBN").val() == $("#"+changeRowId+"_NUM_GBN_HIDDEN").val();
	 				alert("일반회원 예약등록 시 멤버 동반자 선택 안됩니다.");
					return false;
	 			}else{
		 			m_person_g = m_person_g + 1;
		 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', '28');
	 			}
	 			
	 		}else if($("#"+changeRowId+"_NUM_GBN").val() == "02"){
	 			g_person_g = g_person_g + 1
	 			if($("#MEM_GBN").val() == '01'){  //$("#ADD_HDNG_GBN").val()   $("#HDNG_GBN").val()
	 				$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', $("#ADD_HDNG_GBN").val());
	 			}else{
	 				$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', $("#HDNG_GBN").val());
	 			}
	 			
	 		}else if($("#"+changeRowId+"_NUM_GBN").val() == "03"){
	 			n_person_g = n_person_g + 1
	 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', '30');
	 		}else if($("#"+changeRowId+"_NUM_GBN").val() == "04"){
	 			k_person_g = k_person_g + 1
	 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', '30');
	 		}else if($("#"+changeRowId+"_NUM_GBN").val() == "05"){
	 			i_person_g = i_person_g + 1
	 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', "00");
	 		}
 			
			$('#M_PERSON').val(m_person_g);
			$('#G_PERSON').val(g_person_g);
			$('#N_PERSON').val(n_person_g);
			$('#K_PERSON').val(k_person_g);
			$('#I_PERSON').val(i_person_g);
			$('#I_PERSON').val(i_person_g);
			$('#TOT_PERSON').val(parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()) + parseInt($('#N_PERSON').val()) + parseInt($('#K_PERSON').val()) + parseInt($('#I_PERSON').val()));
			
		}
	});
	
});


</script>