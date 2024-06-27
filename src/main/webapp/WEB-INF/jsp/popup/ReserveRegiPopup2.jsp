<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
/**
 * @Name : ReserveRegiPopup
 */
%>

<style>
.pbtn_default {margin: 0 3px -1px 5px;padding: 3px 10px 3px 10px;border: 1px solid #a9cbeb !important;background: #bdd6ee !important;color: #2269b1;}
.reserveListRegi_default {top: 0px;}
.pop_tblForm th {padding : 7px 0px 7px 7px;}
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
			
			<table class="pop_tblForm" >
				<colgroup>
					<col width="11%" />
			        <col width="22%" />
			        <col width="12%" />
			        <col width="23%" />
			        <col width="11%" />
			        <col width="22%" />
			    </colgroup>
			    
			    <tr class="idTest">
		   	     	<th>예약자한글명</th>
					<td class="medium_td" colspan="5">
						<input type="text" id="REQ_HAN_NM" name="REQ_HAN_NM" class="cmc_txt text-center" style="width:160px; margin: 0 5px"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning" id="btn_search" style="opacity:80%; width:115px; height:25px">회원찾기</button>
						<button type="button" class="btn btn-danger" id="btn_adduser" style="opacity:80%; width:115px; height:25px">회원가입</button>	
					</td>
				</tr>
				
				<tr>
		   	     	<th><s:message code='reservation.date'/></th> <!-- 예약일자 -->
					<td class="medium_td">
						<input type="text" id="REQ_DT" name="REQ_DT" data-type="date" class="text-center" style="width:160px; margin: 0 5px"/>
					</td>
				   
				    <th><s:message code='reservation.mem_gbn'/></th> <!-- 회원구분 -->
					<td>
						<select id="MEM_GBN" name="MEM_GBN" class="cmc_combo text-center" style="width:170px; margin: 0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" items="${mgn_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					
					<th><s:message code='reservation.agency'/></th><!-- 에이전시 -->
					<td>
					    <select id="AGN_GB" name="AGN_GB" class="cmc_combo" style="width:70px; margin: 0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" items="${agency_gbn}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					    <select id="AGN_CD" name="AGN_CD" class="cmc_combo" style="width:90px;">
						    <option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" items="${agency}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
				    <th>ID</th>
					<td>
						<input type="text" class="cmc_txt text-center" id="USER_ID" name="USER_ID" style="width:160px; margin: 0 5px" />
					</td>
					<th><s:message code='reservation.Ename'/></th><!-- 예약자영문명 -->
					<td>
						<input type="text" class="cmc_txt text-center" id="REQ_ENG_NM" name="REQ_ENG_NM" style="width:160px; margin: 0 5px"/>
					</td>
					<th><s:message code='reservation.tel'/></th><!-- 예약자전화 -->
					<td>
						<input type="text" class="cmc_txt text-center" id="REQ_TEL_NO" name="REQ_TEL_NO" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"  maxlength="13"  placeholder="예) 010-1234-5678" style="width:162px; margin: 0 5px"/>
					</td>
				</tr>
				
				<tr>
				    <th><s:message code='reservation.checkInDt'/></th>
					<td>
						<input type="text" class="cmc_txt text-center" id="CHK_IN_DT"     name="CHK_IN_DT" data-type="date" style="width:145px;"/>
						<input type="text" class="cmc_txt text-center" id="PRV_CHK_IN_DT" name="CHK_IN_DT" data-type="date" style="width:145px; display: none;"/>
					</td>
					<th><s:message code='reservation.checkOutDt'/></th>
					<td colspan="3">
						<input type="text" class="cmc_txt text-center" id="CHK_OUT_DT"     name="CHK_OUT_DT" data-type="date" style="width:145px;"/>
						<input type="text" class="cmc_txt text-center" id="PRV_CHK_OUT_DT" name="CHK_OUT_DT" data-type="date" style="width:145px; display: none;"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="opacity:70%; color: red; font-weight: bold;">※ 체크아웃 날짜를 지정해야 상품 선택이 가능합니다.</b>
					</td>
				</tr>
				
				<tr>
				    <th><s:message code='reservation.arrFlight'/></th>
					<td>
						<select id="FLIGHT_IN" name="FLIGHT_IN" class="cmc_combo text-center" style="width:90px; margin: 0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
						    <c:forEach var="i" items="${flight_in}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<select id="FLIGHT_IN_HH" name="FLIGHT_IN_HH" class="cmc_combo text-center" style="width:70px;">
							<option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" begin="0" end="23" step="1">
								<option value="<fmt:formatNumber value="${i}" minIntegerDigits="2" />">
									<fmt:formatNumber value="${i}" minIntegerDigits="2" />시
								</option>
							</c:forEach>
						</select>
					</td>
				    <th><s:message code='reservation.depFlight'/></th>
					<td colspan="3">
					    <select id="FLIGHT_OUT" name="FLIGHT_OUT" class="cmc_combo text-center" style="width:90px; margin: 0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
						    <c:forEach var="i" items="${flight_out}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<select id="FLIGHT_OUT_HH" name="FLIGHT_OUT_HH" class="cmc_combo text-center" style="width:70px;">
							<option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" begin="0" end="23" step="1">
								<option value="<fmt:formatNumber value="${i}" minIntegerDigits="2" />">
									<fmt:formatNumber value="${i}" minIntegerDigits="2" />시
								</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="opacity:70%; color: red; font-weight: bold;">※ 항공기편 시간 정보는 필수가 아닙니다.</b>
					</td>
				</tr>
				
				<tr>
				    <th>early체크인</th>
					<td>
						 <select id="LATE_CHECK_IN" name="LATE_CHECK_IN" class="cmc_combo text-center" style="width:170px; margin:0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
						    <c:forEach var="i" items="${lete_check_in}">
								<option value="${i.CODE}"<c:if test="${i.CODE eq '3'}">selected</c:if>>${i.CODE_NM}</option>
							</c:forEach>
						</select>
				    </td>
				    <th><s:message code='reservation.lateCheckout'/></th>
					<td colspan="3">
						<select id="LATE_CHECK_OUT" name="LATE_CHECK_OUT" class="cmc_combo text-center" style="width:170px; margin:0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
						    <c:forEach var="i" items="${lete_check_out}">
								<option value="${i.CODE}" <c:if test="${i.CODE eq '3'}">selected</c:if> >${i.CODE_NM}</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="opacity:70%; color: red; font-weight: bold;">※ 영유아를 제외한 2인 1실 기준 인보이스가 산정됩니다.</b>
				    </td>
				</tr>
				
				<tr>
				    <th><s:message code='reservation.arrPickup'/></th>
				    <td>
						<select id="PICK_IN" name="PICK_IN" class="cmc_combo text-center" style="width:170px; margin:0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
						    <c:forEach var="i" items="${cartype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th><s:message code='reservation.depPickup'/></th>
				    <td colspan="3">
						<select id="PICK_OUT" name="PICK_OUT" class="cmc_combo text-center" style="width:170px; margin:0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
						    <c:forEach var="i" items="${cartype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="opacity:70%; color: red; font-weight: bold;">※ 픽업차량 정보는 필수가 아닙니다.</b>
					</td>	
				</tr>

				<tr>
				    <th><s:message code='reservation.personalRound'/></th>
				    <td colspan="1">
					    <div style="display:inline-flex;">
							
							<p style="background-color: ;font-size: 12px; font-weight: bold; opacity:80%; margin:0 5px"><mark>멤버</mark></p>
						    <input type="text" id="M_PERSON" name="M_PERSON" style="width:30px; text-align: right; margin:0 -5px" value="0" maxlength="3" class="withComma"/>&nbsp;명 &nbsp;
						    <input type="hidden" id="M_PERSON_HIDDEN" name="M_PERSON_HIDDEN">
							
							<p style="font-size: 12px; font-weight: bold; opacity:80%;"><mark>&nbsp;일반</mark></p>
						    <input type="text" id="G_PERSON" name="G_PERSON" style="width:30px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="G_PERSON_HIDDEN" name="G_PERSON_HIDDEN">
						</div>
					</td>
					<th><s:message code='reservation.personalNoRound'/></th>
					<td colspan="1">
						<div style="display:inline-flex;">
							<p style="font-size: 12px; font-weight: bold; opacity:80%;"><mark>&nbsp;성인</mark></p>
						    <input type="text" id="N_PERSON" name="N_PERSON" style="width:15px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="N_PERSON_HIDDEN" name="N_PERSON_HIDDEN">
						    
						    <p style="font-size: 12px; font-weight: bold; opacity:80%;"><mark>소아</mark></p>
						    <input type="text" id="K_PERSON" name="K_PERSON" style="width:15px; text-align: right;" value="0" maxlength="3" class="withComma"/>명 &nbsp;
						    <input type="hidden" id="K_PERSON_HIDDEN" name="K_PERSON_HIDDEN">
						    
						    <p style="font-size: 12px; font-weight: bold; opacity:80%;"><mark>영유아</mark></p>
						    <input type="text" id="I_PERSON" name="I_PERSON" style="width:15px; text-align: right;" value="0" maxlength="3" class="withComma"/>명
						    <input type="hidden" id="I_PERSON_HIDDEN" name="I_PERSON_HIDDEN">
						</div>
					</td>
				    <th>총 인 원</th>
					<td>
						<input type="text" class="cmc_txt withComma" id="TOT_PERSON" name="TOT_PERSON" value="0" maxlength="3" style="width:65px; text-align: right; margin:0 5px" />명
					</td>
				</tr>
				
				<tr>
				    <th>기본상품</th>
					<td>
						<select id="HDNG_GBN" name="HDNG_GBN" class="cmc_combo text-center" style="width:190px; margin: 0 5px">
							    <option value="">--<s:message code='system.select'/>--</option>
								<c:forEach var="i" items="${hdng_gbn}">
									<option value="${i.CODE}">${i.CODE_NM}</option>
								</c:forEach>
						</select>
					</td>
					<th>추가패키지상품</th>
					<td>
						<select id="ADD_HDNG_GBN" name="ADD_HDNG_GBN" class="cmc_combo text-center" style="width:180px; margin: 0 5px">
						    <option value="">--<s:message code='system.select'/>--</option>
							<c:forEach var="i" items="${hdng_gbn_g}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
					</td>
					<th>미팅샌딩</th>
				    <td>
						<select id="PICK_GBN" name="PICK_GBN" class="cmc_combo text-center" style="width:75px; margin:0 5px" disabled>
						    <c:forEach var="i" items="${region}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>&nbsp;
						<input type="text" id="PER_NUM_CNT" name="PER_NUM_CNT" style="width:20px; text-align: right; margin:0 -10px" value="0" disabled>&nbsp;&nbsp;&nbsp;명
						<input type="hidden" id="PCK_PROD_SEQ" name="PCK_PROD_SEQ">
						<button type="button" class="btn btn-primary openPop" id="insertPickGbn" style="opacity:80%; width:60px;">등록</button>
					</td>
				</tr>
				
				<tr>
				    <th>객실타입/트윈/킹</th>
					<td>
						<select id="ROOM_TYPE" name="ROOM_TYPE" class="cmc_combo text-center" style="width:120px; margin:0 5px">
						    <option value="">-<s:message code='system.select'/>-</option>
							<c:forEach var="i" items="${roomtype}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<input type="text" id="TWIN_KING_CNT" name="TWIN_KING_CNT" style="width:50px; text-align: right" value="0" maxlength="3" class="withComma"/>&nbsp;개
						<input type="hidden" id="TWIN_CNT" name="TWIN_CNT" style="width:30px; text-align: right" value="0" maxlength="3" class="withComma"/>
						<input type="hidden" id="KING_CNT" name="KING_CNT" style="width:30px; text-align: right" value="0" maxlength="3" class="withComma"/>
					</td>
					
					<th>싱글룸추가</th>
					<td>
						<input type="text" id="ROOM_ADD_IL" name="ROOM_ADD_IL"  value="0" style="width:70px; text-align: right; margin:0 5px" maxlength="3" class="withComma"/>일 &nbsp;&nbsp;
						<input type="text" id="ROOM_ADD_CNT" name="ROOM_ADD_CNT"  value="0" style="width:60px; text-align: right; margin:0 -10px" maxlength="3" class="withComma"/>&nbsp;&nbsp;&nbsp;개 &nbsp;
					</td>
					<th>프리미엄추가</th>
					<td>
						<input type="text" id="PRIM_ADD_IL" name="PRIM_ADD_IL" value="0" style="width:70px; text-align: right; margin:0 5px" maxlength="3" class="withComma"/>일 &nbsp;&nbsp;
					    <input type="text" id="PRIM_ADD_CNT" name="PRIM_ADD_CNT" value="0" style="width:60px; text-align: right; margin:0 -10px" maxlength="3" class="withComma"/>&nbsp;&nbsp;&nbsp;개 &nbsp;
					</td>
				</tr>
				
				<tr>
				    <th><s:message code='reservation.weekChRound'/></th>
				    <td colspan="3">
				    <div style="display:inline-flex;" >
						<input type="checkbox"  name="RND_CHG_YN1" id="RND_CHG_YN1" style="margin:0 5px; cursor:Pointer">토요일 오전 &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"  name="RND_CHG_YN2" id="RND_CHG_YN2" style="cursor:Pointer">&nbsp;일요일 오전 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b style="opacity:70%; color: red; font-weight: bold;">※ 미체크시 기본은 오후로 지정됩니다.</b>
					</div>
					</td>
					
					<th><s:message code='reservation.invoiceDt'/></th>
					<td>
						<input type="text" id="INV_REG_DT" name="INV_REG_DT" data-type="date" class="text-center" readonly="readonly" style="width:80px; margin:0 5px"/>
						<button type="button" class="btn btn-primary openPop" id="btn_create" style="opacity:80%; width:70px;">생성</button>
					</td>
				</tr>
				
				<tr>
				    <th><s:message code='reservation.expdt'/></th><!-- 예약기한 -->
				    <td>
				    <input type="text" class="cmc_txt"  id="EXP_DT" name="EXP_DT" class="text-center" data-type="date" style="width:120px; margin:0 5px" readonly="readonly"/>
				    </td>
				   
				    <th><s:message code='reservation.depositDate'/></th><!-- 예약금일금일자 -->
				    <td>
				        <input type="text" class="cmc_txt"  id="DEP_IN_DT" name="DEP_IN_DT" data-type="date" class="text-center" style="width:145px; margin:0 5px" readonly="readonly"/>
				    </td>
				    
					
					<th><s:message code='reservation.deposit'/></th><!-- 요청예약금 -->
				    <td>
				        <input type="text" id="DEP_AMT" name="DEP_AMT" style="width:100px; text-align: right; margin:0 5px" value="0" class="withComma" readonly="readonly"/>원
				    </td>
				    
				</tr>
				
				<tr>
				    <th>입금예약금</th><!-- 입금예약금 -->
				    <td>
				        <input type="text" id="PAY_DEP_AMT" name="PAY_DEP_AMT" style="width:120px; text-align: right; margin:0 5px" value="0" class="withComma" readonly="readonly"/>원
				    </td>
				    
				    <th>입금관리</th>
				    <td>
				    	<button type="button" class="btn btn-success" id="btn_pay"  style="width:160px; height:25px; opacity:80%; margin: 0 20px">입금관리</button>
				    </td>
				    
				    <th>입금예약상태</th>
				    <td>
						<input type="text" id="PRC_STS_NM" name="PRC_STS_NM" style="width:100px; margin: 0 5px" readonly/>
					    <button type="button" class="btn btn-primary openPop" id="changeStatus" style="opacity:80%; width:70px;">상태변경</button>
				    </td>
				</tr>
				<tr>
				    <th><s:message code='reservation.moreDetail'/></th>
				    <td colspan="5">
				        <textarea id="REMARK" name="REMARK" rows="4" style="width:99%;  height:30px;"></textarea>
				    </td>
				</tr>
				<tr style="display: none;">
					<td>
						<c:forEach var="i" items="${late_flight}" varStatus="status">
						    <input type="text" value= "${i.CODE}" name="LATE_FLIGHT" seq = ${status.index }></input>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td style="height:20px;" colspan="5">
						<b id="advice1" style="opacity:90%; color: green; font-weight: bold;">&nbsp;※ [예약등록]에서 미팅샌딩 [<b style="color: red; font-weight: bold;">등록</b>], 
						인보이스 [<b style="color: red; font-weight: bold;">생성</b>], [<b style="color: red; font-weight: bold;">상태변경</b>], 
						[<b style="color: red; font-weight: bold;">입금관리</b>]는 <b style="color: red; font-weight: bold;">저장</b> 후 예약상세에서 진행해주세요.</b>
						
						<b id="advice2" style="opacity:90%; color: green; font-weight: bold;">&nbsp;※ [예약상세]에서  <b style="color: red; font-weight: bold;">인원내역</b> 수정 시 
						<b style="color: red; font-weight: bold;">동반자정보</b>에서 
						[<b style="color: red; font-weight: bold;">행추가</b>], 
						[<b style="color: red; font-weight: bold;">행삭제</b>]를 통하여 진행해주세요.</b>
					</td>
				</tr>
			</table>
			
			<!-- 그리드 시작 -->
			<div class="ctu_g3_wrap" style="width:100%; float:left; padding-top:10px; margin-bottom:6px; ">
				<div class="pop_grid_top_wrap">
					<div class="ct_grid_top_left" style="align:left; width:10%; float:left; margin-bottom:-6px; padding-top:1px; padding-bottom:-6px; ">
						<b style="color: #e2703a; font-weight: bold;">동반자정보</b>
					</div>
					<div class="ct_grid_top_right" style="right; width:87%; float:left; margin-bottom:-6px; padding-top:1px; padding-bottom:-6px; ">
						<button type="button" class="btn btn-default" id="btn_com_add"style="align:right">동반자 자동생성</button>
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
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 팝업 창 기본 설정
	 * @Goal    : 화면 비율 및 버튼 이벤트  
	 * @Brief   : 화면 내 비율 및  저장 및 닫기 버튼의 이벤트를 정의함  
	 * @See     : saveReserveInfo() / fn_init($(this).data())
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#p_reserveListRegi').dialog({
		autoOpen : false,
		height: 775,
		width: 1020,
		modal : true,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					$("#reserveGrid").jqGrid('setGridParam', {
						afterEditCell:function(rowid, cellname, value, iRow, iCol){
							$("#"+rowid+"_"+cellname).blur(function(){
								$("#reserveGrid").jqGrid("saveCell",iRow,iCol);
								});
							},
					});
					saveReserveInfo(); /* 저장 버튼 이벤트 */
				}
			},
			'<s:message code='button.delete'/>' :{
				text: '<s:message code='button.delete'/>',
				id : 'delete',
				click:function(){
					if(confirm("[삭제] 진행 시 영구 삭제 됩니다. 진행하시겠습니까?")){
						deleteReserveInfo();
					}
				}
			},
			'<s:message code='button.close'/>' : {
				text: '<s:message code='button.close'/>',
				click: function() {
					$(this).dialog("close"); /* 닫기 버튼 이벤트 */
				}
			},
		},
		close : function() {
			p_rtnData = {};
			popupClose($(this).attr('id')); /* 팝업닫기 */
		},
		open : function(a) {
			fn_init($(this).data()); /* 팝업열기 */
		}
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 사용자 ID 찾기 (ENTER)
	 * @Goal    : ENTER를 통한 사용자 ID를 조회 
	 * @Brief   : 조회 시 1개 이상이면 /reserve/searchId.do 팝업 호출
	 * @See     : setUserInfo.do 
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#REQ_HAN_NM").on("keyup",function(key){
		if(key.keyCode==13) {
			var url = "/reserve/setUserInfo.do";
			var param = {"S_HAN_NAME":$("#REQ_HAN_NM").val()};
			fn_ajax(url, true, param, function(data, xhr){
				setData = data.result;
				delProgram();
				if (setData.cnt < 1) {			// 입력한 사용자 검색 결과가 없을때
					alert("검색 된 사용자가 없습니다.");
					$("#USER_ID").val("");
					$("#MEM_GBN").val("");
					$("#REQ_HAN_NM").val("");
					$("#REQ_ENG_NM").val("");
					$("#REQ_TEL_NO").val("");
					$("#AGN_GB").val("");
					$("#AGN_CD").val("");
					$("#AGN_GB").attr("disabled",true);
					$("#AGN_CD").attr("disabled",true);
					$("#HDNG_GBN").val("");
					$("#HDNG_GBN").attr("disabled",true);
					$("#ADD_HDNG_GBN").val("");
					$("#ADD_HDNG_GBN").attr("disabled",true);
					$("#M_PERSON"  ).attr("disabled",false);
					$("#M_PERSON").val("0");
					$("#G_PERSON").val("0");
					$("#N_PERSON").val("0");
					$("#K_PERSON").val("0");
					$("#I_PERSON").val("0");
					$("#TOT_PERSON").val("0");
					$("#TWIN_KING_CNT").val("0");
					$("#TWIN_CNT").val("0");
					$("#KING_CNT").val("0");
					$("#DEP_IN_DT"  ).attr("disabled",true);
				} else if (setData.cnt == 1) {	// 입력한 사용자 검색 결과가 1명일때
					$("#USER_ID").val(setData.USER_ID);
					$("#MEM_GBN").val(setData.MEM_GBN);
					$("#REQ_ENG_NM").val(setData.ENG_NAME);
					$("#REQ_TEL_NO").val(setData.TEL_NO);
					$("#MEM_GBN").val(setData.MEM_GBN);
					// 01 멤버, 02 일반, 04 에이젼시
					if(setData.MEM_GBN == '01'){
						$("#AGN_GB").val("");
						$("#AGN_CD").val("");
						$("#AGN_GB").attr("disabled",true);
						$("#AGN_CD").attr("disabled",true);
						$("#HDNG_GBN").val("28");
						$("#HDNG_GBN"     ).attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON"  ).attr("disabled",false);
						$("#M_PERSON").val("1");
						$("#G_PERSON").val("0");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("1");
						$("#DEP_IN_DT"  ).attr("disabled",false);
					}else if(setData.MEM_GBN == '02'){ 
						$("#AGN_GB").val("");
						$("#AGN_CD").val("");
						$("#AGN_GB").attr("disabled",true);
						$("#AGN_CD").attr("disabled",true);
						$("#M_PERSON").attr("disabled",true);
						$("#HDNG_GBN").val("");
						$("#HDNG_GBN").attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON").val("0");
						$("#G_PERSON").val("1");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("1");
						$("#DEP_IN_DT"  ).attr("disabled",false);
					}else if(setData.MEM_GBN == '04'){ 
						$("#AGN_GB").attr("disabled",false);
						$("#AGN_CD").attr("disabled",false);
						$("#HDNG_GBN").val("");
						$("#HDNG_GBN").attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON").attr("disabled",false);
						$("#M_PERSON").val("0");
						$("#G_PERSON").val("0");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("0");
						$("#TWIN_KING_CNT").val("0");
						$("#TWIN_CNT").val("0");
						$("#KING_CNT").val("0");
						$("#DEP_IN_DT"  ).attr("disabled",false);
					}else{
						$("#AGN_GB").val("");
						$("#AGN_CD").val("");
						$("#AGN_GB").attr("disabled",true);
						$("#AGN_CD").attr("disabled",true);
						$("#HDNG_GBN").val("");
						$("#HDNG_GBN").attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON"  ).attr("disabled",false);
						$("#M_PERSON").val("0");
						$("#G_PERSON").val("0");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("0");
						$("#TWIN_KING_CNT").val("0");
						$("#TWIN_CNT").val("0");
						$("#KING_CNT").val("0");
						$("#DEP_IN_DT"  ).attr("disabled",true);
					}
					fn_roomTypeCnt();
				} else if (setData.cnt > 1) {	// 입력한 사용자 검색 결과가 2명 이상일때
					var url1 = "/reserve/searchId.do";
				    var pid = "p_searchIdPopup";
					popupOpen(url1, pid, param, function(data) {
						if(!fn_empty(data)){
							$("#USER_ID").val(data.USER_ID);
							$("#MEM_GBN").val(data.MEM_GBN);
							$("#REQ_HAN_NM").val(data.REQ_HAN_NM);
							$("#REQ_ENG_NM").val(data.REQ_ENG_NM);
							$("#REQ_TEL_NO").val(data.REQ_TEL_NO);
							
							if(data.MEM_GBN == "01"){
								$("#AGN_GB").val("");
								$("#AGN_CD").val("");
						    	$("#AGN_GB").attr("disabled",true);
						    	$("#AGN_CD").attr("disabled",true);
						    	$("#HDNG_GBN").val("28");
						    	$("#HDNG_GBN"     ).attr("disabled",true);
						    	$("#ADD_HDNG_GBN").val("");
								$("#ADD_HDNG_GBN").attr("disabled",true);
								$("#M_PERSON"  ).attr("disabled",false);
								$("#M_PERSON").val("1");
								$("#G_PERSON").val("0");
								$("#N_PERSON").val("0");
								$("#K_PERSON").val("0");
								$("#I_PERSON").val("0");
								$("#TOT_PERSON").val("1");
								$("#DEP_IN_DT"  ).attr("disabled",false);
							}else if(data.MEM_GBN == "02"){
								$("#AGN_GB").val("");
								$("#AGN_CD").val("");
						    	$("#AGN_GB").attr("disabled",true);
						    	$("#AGN_CD").attr("disabled",true);
						    	$("#HDNG_GBN").val("");
								$("#HDNG_GBN").attr("disabled",true);
								$("#ADD_HDNG_GBN").val("");
								$("#ADD_HDNG_GBN").attr("disabled",true);
								$("#M_PERSON").attr("disabled",true);
								$("#M_PERSON").val("0");
								$("#G_PERSON").val("1");
								$("#N_PERSON").val("0");
								$("#K_PERSON").val("0");
								$("#I_PERSON").val("0");
								$("#TOT_PERSON").val("1");
								$("#DEP_IN_DT"  ).attr("disabled",false);
							}else if(data.MEM_GBN == "04"){
								$("#AGN_GB").attr("disabled",false);
						    	$("#AGN_CD").attr("disabled",false);
								$("#HDNG_GBN").val("");
								$("#HDNG_GBN").attr("disabled",true);
								$("#ADD_HDNG_GBN").val("");
								$("#ADD_HDNG_GBN").attr("disabled",true);
								$("#M_PERSON").attr("disabled",false);
								$("#M_PERSON").val("0");
								$("#G_PERSON").val("0");
								$("#N_PERSON").val("0");
								$("#K_PERSON").val("0");
								$("#I_PERSON").val("0");
								$("#TOT_PERSON").val("0");
								$("#TWIN_KING_CNT").val("0");
								$("#TWIN_CNT").val("0");
								$("#KING_CNT").val("0");
								$("#DEP_IN_DT"  ).attr("disabled",false);
							}else{
								$("#AGN_GB").val("");
								$("#AGN_CD").val("");
								$("#AGN_GB").attr("disabled",true);
						    	$("#AGN_CD").attr("disabled",true);
						    	$("#HDNG_GBN").val("");
								$("#HDNG_GBN").attr("disabled",true);
								$("#ADD_HDNG_GBN").val("");
								$("#ADD_HDNG_GBN").attr("disabled",true);
								$("#M_PERSON"  ).attr("disabled",false);
								$("#M_PERSON").val("0");
								$("#G_PERSON").val("0");
								$("#N_PERSON").val("0");
								$("#K_PERSON").val("0");
								$("#I_PERSON").val("0");
								$("#TOT_PERSON").val("0");
								$("#TWIN_KING_CNT").val("0");
								$("#TWIN_CNT").val("0");
								$("#KING_CNT").val("0");
								$("#DEP_IN_DT"  ).attr("disabled",true);
							}
							fn_roomTypeCnt();
						}
					});
				}
			});
		}
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 화면 OPEN 시 최초 실행 함수
	 * @Goal    : 기본 설정 값 셋팅
	 * @Brief   : 신규 및 상세조회를 구분하여 화면 내 값 셋팅
	 * @See     : initSelect() / createGrid() / cSearch()
	 * -----------------------------------------------------*
	 *******************************************************/
	function fn_init(receivedData){
		var day = new Date();
		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
		req_dt = receivedData.REQ_DT; // 신청 일 (키값)
		seq    = receivedData.SEQ;    // 신청 순번 (키값)
        
		$('#REQ_DT').val($.datepicker.formatDate('yy.mm.dd', new Date())).attr("readonly" , true); // 예약일자 오늘 값으로 셋팅 (변경불가)
		$("#TWIN_CNT").val("0");
		$("#KING_CNT").val("0");
		$("#btn_adduser").hide();
		
		if(fn_empty(seq || req_dt)){ //신규
		    $(".ui-dialog-title").text('<s:message code='reservation.registration'/>');
		    $("#CHK_IN_DT"      ).val(Util.converter.dateFormat1(today));
		    $("#CHK_OUT_DT"     ).val(Util.converter.dateFormat1(today));
		    $(".image"          ).hide();
		    $(".status"         ).hide();
		    vflag = "new";
			// 예약금일금일자, 요청예약금, 예약기한, 인보이스날짜 (변경불가)
		    $("#DEP_IN_DT , #DEP_AMT , #EXP_DT , #INV_REG_DT").attr("disabled", true);
		    $("#HDNG_GBN"  ).attr("disabled",true);
		    $("#ADD_HDNG_GBN"  ).attr("disabled",true);
			$("#insertPickGbn").attr("disabled", true);	// [등록]
			$("#btn_create").attr("disabled", true);	// [생성]
			$("#btn_pay").attr("disabled", true);		// [입금관리]
			$("#changeStatus").attr("disabled", true);	// [상태변경]
			$("#advice1").show();
			$("#advice2").hide();
			$("#btn_adduser").show();
			$("#delete").hide();
			$("#REQ_HAN_NM").attr("disabled",false);
		}else{ // 상세
			//예약 현황의 상세보기로 넘어왔다면 필요없는 부분 disabled 하기
			if(receivedData.DETAIL == 'Y'){
				//아이디찾기 / 미팅샌딩등록 / 인보이스생성 / 상태변경 / 동반자 자동생성 / 행추가,행삭제 버튼 / 저장 버튼  :: 컨트롤 불가
				$("#btn_search, #insertPickGbn, #btn_create, #changeStatus, #btn_com_add, #btn_List_addRow, #btn_List_delRow, #save ").attr("disabled", true);
			}
		    $("#USER_ID , #MEM_GBN").attr("disabled", true); // 유저ID, 회원구분  수정불가
		    $(".ui-dialog-title").text('<s:message code='reservation.detail'/>'); // [예약상세] 타이틀 삽입
		    $("#btn_search").hide(); // 아이디 찾기 버튼 숨김
		    $("#advice1").hide();
			$("#advice2").show();
			$("#btn_adduser").hide();
			$("#REQ_HAN_NM").attr("disabled",true);
			$("#M_PERSON").attr("disabled", true);
			$("#G_PERSON").attr("disabled", true);
			$("#N_PERSON").attr("disabled", true);
			$("#K_PERSON").attr("disabled", true);
			$("#I_PERSON").attr("disabled", true);
			
		    initSelect(); /* *********** 예약 상세내역 조회 *********** */
		    vflag = "detail";
		}
		
		$('#DEP_IN_DT').datepicker({
		    dateFormat : 'yy.mm.dd',
		    showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		    function(e) {
		});
		
		$('#INV_REG_DT').datepicker({
		    dateFormat : 'yy.mm.dd',
		    showOn : 'both',
		    disabled : 'disabled'
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
		
		createGrid();
  		cSearch();
		$("#reserveGrid_pager_left").hide();
		$("#TOT_PERSON"     ).attr("disabled",true);
		$("#AGN_GB").val("");
		$("#AGN_CD").val("");
		$("#ADD_HDNG_GBN").val("");
		
		if($("#MEM_GBN").val() == '01'){
			if($("#G_PERSON").val() > 0){
				$("#ADD_HDNG_GBN"  ).attr("disabled",false);
			}else{
				$("#ADD_HDNG_GBN"  ).attr("disabled",true);
			}
		}else if($("#MEM_GBN").val() == '02'){ //02 일반회원
			$("#M_PERSON").val("0");
			$("#M_PERSON"  ).attr("disabled",true);
			$("#ADD_HDNG_GBN"  ).attr("disabled",true);
		}
		
		loadingEnd(); /*$('#wrap-loading').remove();*/
	}
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 예약상세내역 조회
	 * @Goal    : 예약관리 내 건 별 상세내역 조회
	 * @Brief   : 신청일자와 시퀀스를 통하여 관련 예약건의 상세내역을 조회
	 * @See     : reserveSelectDetail.do / fn_dataSet()
	 * -----------------------------------------------------*
	 *******************************************************/
	function initSelect(){
		var url = "/reserve/reserveSelectDetail.do";
		var param = {"SEQ"    : seq
		           , "REQ_DT" : req_dt
		           };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("상세조회 오류 입니다. 시스템 관리자에게 문의해주세요.");
			}else{
				fn_dataSet(data.result); // 예약 상세내역 셋팅
			}
		});
	}
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 예약상세내역 셋팅
	 * @Goal    : KEY:ID/NAME에 별 구분 후 값 셋팅
	 * @Brief   : 조회 된 상세 내역건을 화면 내 항목별 컴포넌트의 셋팅
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	function fn_dataSet(data){
    	$.each(data, function(key , val){
    		if( key == "M_PERSON"     || key == "G_PERSON"      || key == "N_PERSON"    || key == "K_PERSON"  || key == "I_PERSON"  || 
    			key == "TOT_PERSON"   || key == "TWIN_KING_CNT" || key == "TWIN_CNT"    || key == "KING_CNT"  || key == "DEP_AMT"   || 
    			key == "ROOM_ADD_CNT" || key == "ROOM_ADD_CNT"  || key == "PRIM_ADD_IL" || key == "PRIM_ADD_CNT") {
    			$('[name='+ key +']').val (fn_comma(val));
    		}else if(key == "REQ_TEL_NO"){ // 예약자전화
	    		$('[name='+ key +']').val (formatPhoneNumber(val));
    		}else if(key == "RND_CHG_YN1" || key == "RND_CHG_YN2"){ // 토요일/일요일 체크박스 
    			if(val == "Y") $('[name='+ key +']').prop("checked", true);
    			else           $('[name='+ key +']').prop("checked", false);
    		}else if(key == "REQ_DT" || key == "CHK_IN_DT" || key == "CHK_OUT_DT" || key == "INV_REG_DT" || key == "EXP_DT" || key == "DEP_IN_DT"){
    			if(!fn_empty(val)){
	    			$('[name='+ key +']').val(Util.converter.dateFormat1(val));
    			}else{
    				$('[name='+ key +']').val("");
    			}
    		}else{
    			$('[name='+ key +']').val(val);
    		}

    		if(key == "TWIN_CNT" || key == "KING_CNT"){
    			var room_cnt = parseInt(val);
    			if(room_cnt > 0){
    				$("#TWIN_KING_CNT").val(val);
    			}
    		}

    		if(key == "M_PERSON" || key == "G_PERSON" || key == "N_PERSON" || key == "K_PERSON" || key == "I_PERSON"){
    			$('[name='+ key +'_HIDDEN]').val(val);
    		}
    		
	    });
    	/* each END */
    	
    	// 날짜세팅
     	if(fn_empty(data.CHK_IN_DT) && fn_empty(data.CHK_OUT_DT)){
     		var day = new Date();
    		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 
    		$("#CHK_IN_DT"      ).val(Util.converter.dateFormat1(today));
    		$("#CHK_OUT_DT"     ).val(Util.converter.dateFormat1(today));
     	}
    	
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
    	
    	if(!fn_empty(data.INV_REG_DT)){
    		$("#btn_create").text("수정");
    	} else {
    		$("#btn_create").text("생성");
    	}

    	//상태표시
     	if(!fn_empty(data.PRC_STS)){
     		if(data.PRC_STS == "08" || data.PRC_STS == "09" || data.PRC_STS == "10"){
     			$("#frmReserveInfo").find("input,select,textarea").attr("disabled" , true);
     		}
     	}

     	// 01 멤버, 02 일반, 04 에이젼시
     	if(data.MEM_GBN == '01'){ 
			$("#AGN_GB").val("");
			$("#AGN_CD").val("");
			$("#HDNG_GBN").attr("disabled",true);
			$("#AGN_GB").attr("disabled",true);
			$("#AGN_CD").attr("disabled",true);
		}else if(data.MEM_GBN == '02'){ 
			$("#AGN_GB").val("");
			$("#AGN_CD").val("");
			$("#AGN_GB").attr("disabled",true);
			$("#AGN_CD").attr("disabled",true);
			$("#M_PERSON").attr("disabled",true);
			$("#ADD_HDNG_GBN").attr("disabled",true);
		}else if(data.MEM_GBN == '04'){ 
			$("#M_PERSON").attr("disabled",true);
			$("#HDNG_GBN").attr("disabled",false);
			$("#ADD_HDNG_GBN").attr("disabled",true);
			$("#AGN_GB").attr("disabled",false);
			$("#AGN_CD").attr("disabled",false);
		}
     	
     	/* 상품정보 재셋팅 */
     	if(data.MEM_GBN == '01'){
     		var setAddHdngGbn = data.ADD_HDNG_GBN
			$("#ADD_HDNG_GBN").find("option").remove();
			var url = "/reserve/packageResetList.do";
			var data = {  "CHK_IN_DT"  : data.CHK_IN_DT	
						, "CHK_OUT_DT" : data.CHK_OUT_DT
					   };
			fn_ajax(url, false, data, function(data, xhr){
				if(!fn_empty(data.result)){
					var retVal = data.result;
					$('#ADD_HDNG_GBN').empty().data('options');
					$('#ADD_HDNG_GBN').append('<option value=' + "" + '>-선택-</option>');
					for(i = 0; i < retVal.length; i++){
						if(!fn_empty(retVal[i])){
							$('#ADD_HDNG_GBN').append('<option value=' + retVal[i].CODE + '>' + retVal[i].CODE_NM + '</option>');
						}
					}
				}else{
					alert("상품이없습니다. 관리자페이지에서 등록후 이용해주세요.");
					return false;
				}
			});
			
			
			$("#ADD_HDNG_GBN").val(setAddHdngGbn);
			if(parseInt($('[name=G_PERSON]').val()) > 0){
				$("#ADD_HDNG_GBN").attr("disabled",false);
			}else{
				$("#ADD_HDNG_GBN").val("");
				$("#ADD_HDNG_GBN").attr("disabled",true);	
			}
		}else if(data.MEM_GBN != '01'){
			var setHdngGbn = data.HDNG_GBN
			$("#HDNG_GBN").find("option").remove();
			var url = "/reserve/packageResetList.do";
			var data = {  "CHK_IN_DT"  : data.CHK_IN_DT		
						, "CHK_OUT_DT" : data.CHK_OUT_DT
					   };
			
			fn_ajax(url, false, data, function(data, xhr){
				if(!fn_empty(data.result)){
					var retVal = data.result;
					$('#HDNG_GBN').empty().data('options');
					$('#HDNG_GBN').append('<option value=' + "" + '>-선택-</option>');
					
					for(i = 0; i < retVal.length; i++){
						if(!fn_empty(retVal[i])){
							$('#HDNG_GBN').append('<option value=' + retVal[i].CODE + '>' + retVal[i].CODE_NM + '</option>');
						}
					}
				}else{
					alert("상품이없습니다. 관리자페이지에서 등록후 이용해주세요.");
					return false;
				}
			});
			
			$("#HDNG_GBN").val(setHdngGbn);
			$("#ADD_HDNG_GBN").attr("disabled",true);
		}
     	
     	if($("#PRC_STS_NM").val().trim() == "입금완료"){
     		$("#btn_List_addRow").attr("disabled",true);
     		$("#btn_List_delRow").attr("disabled",true);	
     	}else{
     		$("#btn_List_addRow").attr("disabled",false);
     		$("#btn_List_delRow").attr("disabled",false);
     	}
	}

	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [회원구분] 변경 이벤트
	 * @Goal    : [회원구분] 항목 선택 및 변경 이벤트
	 * @Brief   : 선택 및 변경 시 구분에 따른 화면 내 항목 별 활성/비활성
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#MEM_GBN').change(function() {
		$("#CHK_IN_DT").val($.datepicker.formatDate('yy.mm.dd', new Date()));
		$("#CHK_OUT_DT").val($.datepicker.formatDate('yy.mm.dd', new Date()));
		if($(this).val() == '01'){ // 01 멤버, 02 일반, 04 에이젼시
	    	$("#AGN_GB").val("");
			$("#AGN_CD").val("");
	    	$("#AGN_GB").attr("disabled",true);
	    	$("#AGN_CD").attr("disabled",true);
	    	$("#HDNG_GBN").val("28");
	    	$("#HDNG_GBN"     ).attr("disabled",true);
	    	$("#ADD_HDNG_GBN").val("");
			$("#ADD_HDNG_GBN").attr("disabled",true);
			$("#M_PERSON"  ).attr("disabled",false);
			$("#M_PERSON").val("1");
			$("#G_PERSON").val("0");
			$("#N_PERSON").val("0");
			$("#K_PERSON").val("0");
			$("#I_PERSON").val("0");
			$("#TOT_PERSON").val("1");
			$("#DEP_IN_DT"  ).attr("disabled",false);
		}else if($(this).val() == '02'){ 
			$("#AGN_GB").val("");
			$("#AGN_CD").val("");
	    	$("#AGN_GB").attr("disabled",true);
	    	$("#AGN_CD").attr("disabled",true);
	    	$("#M_PERSON").attr("disabled",true);
	    	$("#HDNG_GBN").val("");
			$("#HDNG_GBN").attr("disabled",true);
			$("#ADD_HDNG_GBN").val("");
			$("#ADD_HDNG_GBN").attr("disabled",true);
			$("#M_PERSON").val("0");
			$("#G_PERSON").val("1");
			$("#N_PERSON").val("0");
			$("#K_PERSON").val("0");
			$("#I_PERSON").val("0");
			$("#TOT_PERSON").val("1");
			$("#DEP_IN_DT"  ).attr("disabled",false);
		}else if($(this).val() == '04'){ 
	    	$("#AGN_GB").attr("disabled",false);
	    	$("#AGN_CD").attr("disabled",false);
			$("#HDNG_GBN").val("");
			$("#HDNG_GBN").attr("disabled",true);
			$("#ADD_HDNG_GBN").val("");
			$("#ADD_HDNG_GBN").attr("disabled",true);
			$("#M_PERSON").attr("disabled",false);
			$("#M_PERSON").val("0");
			$("#G_PERSON").val("0");
			$("#N_PERSON").val("0");
			$("#K_PERSON").val("0");
			$("#I_PERSON").val("0");
			$("#TOT_PERSON").val("0");
			$("#TWIN_KING_CNT").val("0");
			$("#TWIN_CNT").val("0");
			$("#KING_CNT").val("0");
			$("#DEP_IN_DT"  ).attr("disabled",false);
		}else{
			$("#AGN_GB").val("");
			$("#AGN_CD").val("");
			$("#AGN_GB").attr("disabled",true);
	    	$("#AGN_CD").attr("disabled",true);
	    	$("#HDNG_GBN").val("");
			$("#HDNG_GBN").attr("disabled",true);
			$("#ADD_HDNG_GBN").val("");
			$("#ADD_HDNG_GBN").attr("disabled",true);
			$("#M_PERSON").val("0");
			$("#G_PERSON").val("0");
			$("#N_PERSON").val("0");
			$("#K_PERSON").val("0");
			$("#I_PERSON").val("0");
			$("#TOT_PERSON").val("0");
			$("#TWIN_KING_CNT").val("0");
			$("#TWIN_CNT").val("0");
			$("#KING_CNT").val("0");
			$("#DEP_IN_DT"  ).attr("disabled",true);
		}
		fn_roomTypeCnt();
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [체크 인] 항목 이벤트
	 * @Goal    : [체크 인] 항목 선택/변경 시 발생 이벤트
	 * @Brief   : 선택 및 변경 시 [체크아웃] 날짜와의 유효성 검사진행
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#CHK_IN_DT').change(function() {
		$('#ROOM_TYPE').val("");
		var chk_in_dt      = $("#CHK_IN_DT").val().replaceAll(".","");
		var chk_out_dt     = $("#CHK_OUT_DT").val().replaceAll(".","");
	});
		
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [체크아웃] 항목 이벤트
	 * @Goal    : [체크아웃] 항목 선택/변경 시 발생 이벤트
	 * @Brief   : 선택 및 변경 시 [체크 인] 날짜와의 유효성 검사진행 및 
				   상품/추가패키지에 대한 정보를 동적으로 조회 
	 * @See     : packageResetList.do
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#CHK_OUT_DT').change(function() {
		$('#ROOM_TYPE').val("");
		var chk_in_dt      = $("#CHK_IN_DT").val().replaceAll(".","");
		var chk_out_dt     = $("#CHK_OUT_DT").val().replaceAll(".","");
		
		if(chk_in_dt > chk_out_dt){
			alert("체크인 날짜가 체크아웃 날짜보다 더 큽니다.다시 확인해주세요.");
			$("#CHK_OUT_DT").val($.datepicker.formatDate('yy.mm.dd', new Date()));
			return false;
		}
		
		if($("#MEM_GBN").val() == '01'){
			$("#G_PERSON").val("0");
			$("#ADD_HDNG_GBN").find("option").remove();
			var url = "/reserve/packageResetList.do";
			
			var data = {  "CHK_IN_DT"  : chk_in_dt	
						, "CHK_OUT_DT" : chk_out_dt
					   };
			fn_ajax(url, false, data, function(data, xhr){
				if(!fn_empty(data.result)){
					var retVal = data.result;
					$('#ADD_HDNG_GBN').empty().data('options');
					$('#ADD_HDNG_GBN').append('<option value=' + "" + '>-선택-</option>');
					for(i = 0; i < retVal.length; i++){
						if(!fn_empty(retVal[i])){
							$('#ADD_HDNG_GBN').append('<option value=' + retVal[i].CODE + '>' + retVal[i].CODE_NM + '</option>');
						}
					}
				}else{
					alert("상품이없습니다. 관리자페이지에서 등록후 이용해주세요.");
					return false;
				}
			});
		}else if($("#MEM_GBN").val() != '01'){
			$("#HDNG_GBN").attr("disabled",false);
			$("#HDNG_GBN").find("option").remove();
			
			var url = "/reserve/packageResetList.do";
			
			var data = {  "CHK_IN_DT"  : chk_in_dt	
						, "CHK_OUT_DT" : chk_out_dt
					   };
			
			fn_ajax(url, false, data, function(data, xhr){
				if(!fn_empty(data.result)){
					var retVal = data.result;
					
					$('#HDNG_GBN').empty().data('options');
					$('#HDNG_GBN').append('<option value=' + "" + '>-선택-</option>');
					
					for(i = 0; i < retVal.length; i++){
						if(!fn_empty(retVal[i])){
							$('#HDNG_GBN').append('<option value=' + retVal[i].CODE + '>' + retVal[i].CODE_NM + '</option>');
						}
					}
				}else{
					alert("상품이없습니다. 관리자페이지에서 등록후 이용해주세요.");
					return false;
				}
			});
		}else if($("#MEM_GBN").val() == ""){
			alert("회원구분을 선택해주세요");
			$("#CHK_OUT_DT").val($.datepicker.formatDate('yy.mm.dd', new Date()));
		}
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [에이전시] 항목 이벤트
	 * @Goal    : [에이전시] 항목 선택/변경 시 발생 이벤트
	 * @Brief   : 선택 및 변경 시 [에이전시] AGN_CD의 초기화 및 활성/비활성 
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#AGN_GB').change(function() {
		if($(this).val() == '1'){ // 1 총판, 2 일반
			$("#AGN_CD").attr("disabled", false);
		}else{
			$("#AGN_CD").val("");
			$("#AGN_CD").attr("disabled", true);
		}
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [객실타입] 항목 이벤트
	 * @Goal    : [객실타입] 항목 선택/변경 시 발생 이벤트
	 * @Brief   : 선택 및 변경 시 [객실타입] 킹 및 트윈 갯수 초기화 및 
	  			  [숙박인원] 산정 함수 호출
	 * @See     : fn_roomTypeCnt()
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#ROOM_TYPE').change(function() {
		if($(this).val() == '01'){ // 01:트윈, 02:킹
			$("#KING_CNT").val("0");
		}else{
			$("#TWIN_CNT").val("0");
		}
		
		//객실풀 체크
		$.ajax({
			type:"post",
			url:"/reserve/noRoomChk.do",
			data:{"chk_in_dt"  : $("#CHK_IN_DT").val().replaceAll(".","")
			    , "chk_out_dt" : $("#CHK_OUT_DT").val().replaceAll(".","")
			    , "room_type"  : $('#ROOM_TYPE').val()
		       },
		       dataType:"json"
		}).done(function(data){
			if(data.result == 'SUCCESS'){
				if(data.roomChkMsg.trim() != ""){
					alert(data.roomChkMsg.trim());
					$('#ROOM_TYPE').val("");
				}
			}
			else{
				alert("룸체크 실패 (시스템 관리자에게 문의하세요.)");
			}
		});
		
		fn_roomTypeCnt();
	});
	
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [객실타입 갯 수 항목] 항목 이벤트
	 * @Goal    : [객실타입 갯 수 항목] 항목 수정 시 발생 이벤트
	 * @Brief   : [객실타입 갯 수 항목] 수정 시  킹 및 트윈 갯수 초기화
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#TWIN_KING_CNT").on("change , keyup", function(){
		if($("#ROOM_TYPE").val() == '01'){ // 01:트윈, 02:킹
			$("#KING_CNT").val("0");
			$("#TWIN_CNT").val($(this).val());
		}else{
			$("#TWIN_CNT").val("0");
			$("#KING_CNT").val($(this).val());
		}
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [인원내역] 변경 이벤트
	 * @Goal    : [인원내역] 변경 시 발생 이벤트
	 * @Brief   : [인원내역] 구분 별 수정 시 상품 활성화 상태 및 
	 			  [숙박인원] 산정 함수 호출
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#M_PERSON, #G_PERSON, #N_PERSON, #K_PERSON, #I_PERSON').on("keyup" , function(){
		const regExp = /^[0123456789-]*$/;
		
		if($(this).val() != "" && !regExp.test($(this).val())){
	    	alert("숫자로 작성해주세요.");
	    	$(this).val("0");
	    }
		
		$("#TWIN_KING_CNT").val("0");
		$("#TWIN_CNT").val("0");
		$("#KING_CNT").val("0");
		
		if($('#M_PERSON').val() == ""){
			alert("인원내역을 확인해주세요.");
			$('#M_PERSON').val("0");
		}
		if($('#G_PERSON').val() == ""){
			alert("인원내역을 확인해주세요.");
			$('#G_PERSON').val("0");
		}
		if($('#N_PERSON').val() == ""){
			alert("인원내역을 확인해주세요.");
			$('#N_PERSON').val("0");
		}
		if($('#K_PERSON').val() == ""){
			alert("인원내역을 확인해주세요.");
			$('#K_PERSON').val("0");
		}
		if($('#I_PERSON').val() == ""){
			alert("인원내역을 확인해주세요.");
			$('#I_PERSON').val("0");
		}
		
		$('#TOT_PERSON').val(parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()) + parseInt($('#N_PERSON').val()) + parseInt($('#K_PERSON').val()) + parseInt($('#I_PERSON').val()));
		
		var chk_in_dt      = $("#CHK_IN_DT").val().replaceAll(".","");
		var chk_out_dt     = $("#CHK_OUT_DT").val().replaceAll(".","");
		
		if($("#MEM_GBN").val() == '01'){ //01 멤버 02 일반회원 04에이전시
			var g_person = parseInt($("#G_PERSON").val().replaceAll("," , ""));
			if(g_person == 0){
				$("#ADD_HDNG_GBN").attr("disabled", true);
				$("#ADD_HDNG_GBN").val("");
			}else{
				if(chk_out_dt != "" && chk_in_dt != chk_out_dt){
					$("#ADD_HDNG_GBN").attr("disabled", false);
				}else{
					alert("체크아웃 날짜를 확인해주세요.");
					$("#G_PERSON").val("0");
				}
			}
		}
		fn_roomTypeCnt();
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 숙박인원 합산 함수
	 * @Goal    : 숙박인원 산정 및 유효성체크 이벤트
	 * @Brief   : 멤버,일반,비라운딩,소아 구분 별 합계로 숙박인원 산정
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	/* 숙박인원 체크 */
	function fn_roomTypeCnt(){
		var roomTypeCnt = 0;
		roomTypeCnt = parseInt($('#M_PERSON').val()) + parseInt($('#G_PERSON').val()) + parseInt($('#N_PERSON').val()) + parseInt($('#K_PERSON').val());
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

	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 천단위 콤마 (소수점포함) 함수
	 * @Goal    : 천단위 콤마 (소수점포함) 함수
	 * @Brief   : 숫자 타입인 경우 표출 시 콤마 삽입 
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	function numberWithCommas(num) {
	    var parts = num.toString().split(".");	
	    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
	}
	
	$(".withComma").on("keyup" , function(){
		var tmpValue = $(this).val().replace(/[^0-9,]/g,'');
		tmpValue = tmpValue.replace(/[,]/g,'');
		// 천단위 콤마 처리 후 값 강제변경
		$(this).val(numberWithCommas(tmpValue));
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [상태변경] 버튼 클릭 이벤트
	 * @Goal    : [상태변경] 버튼 클릭 이벤트
	 * @Brief   : 화면 내 [상태변경] 버튼 클릭 시 발생되는 이벤트
	 * @See     : changeStatus();
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#changeStatus").on("click" , function(){
		changeStatus();
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [상태변경] 팝업 호출
	 * @Goal    : [상태변경] 버튼 클릭 시 팝업 호출
	 * @Brief   : 화면 내 [상태변경] 버튼 클릭 시 표출되는 팝업 정의
	 * @See     : /reserve/chgStatusPopup.do / initSelect()
	 * -----------------------------------------------------*
	 *******************************************************/
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
			initSelect(); // 예약상세내역 조회
		});
	}
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [연락처/전화] 하이픈(-) 처리 #1
	 * @Goal    : [연락처/전화] 하이픈(-) 처리 #1
	 * @Brief   : 화면 내 연락처 입력 시 하이픈 처리하여 표출
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
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
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [연락처/전화] 하이픈(-) 처리 #2
	 * @Goal    : [연락처/전화] 하이픈(-) 처리 #2
	 * @Brief   : 화면 내 연락처 입력 시 하이픈 처리하여 표출
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
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
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [저장] 버튼 이벤트
	 * @Goal    : 화면 하단 부 [저장] 클릭 시 발생되는 이벤트
	 * @Brief   : 화면 내 모든 항목 및 동반자 그리드 정보 정의 후 저장
	 * @See     : /reserve/selectProdSeq.do
	 * -----------------------------------------------------*
	 *******************************************************/
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
				    , "PRC_STS"         : '04'
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
				    , "TWIN_CNT"        : parseInt($("#TWIN_CNT").val().replaceAll("," , ""))
				    , "KING_CNT"        : parseInt($("#KING_CNT").val().replaceAll("," , ""))
				    , "ROOM_ADD_IL"     : parseInt($("#ROOM_ADD_IL").val().replaceAll("," , ""))
				    , "ROOM_ADD_CNT"    : parseInt($("#ROOM_ADD_CNT").val().replaceAll("," , ""))
				    , "PRIM_ADD_IL"     : parseInt($("#PRIM_ADD_IL").val().replaceAll("," , ""))
				    , "PRIM_ADD_CNT"    : parseInt($("#PRIM_ADD_CNT").val().replaceAll("," , ""))
				    , "PICK_IN"         : $("#PICK_IN").val()
				    , "PICK_OUT"        : $("#PICK_OUT").val()
				    , "LATE_CHECK_IN"   : $("[name='LATE_CHECK_IN']:checked").val()
				    , "LATE_CHECK_OUT"  : $("[name='LATE_CHECK_OUT']:checked").val()
				    , "REMARK"          : $("#REMARK").val()
				    , "INV_REG_DT"      : $("#INV_REG_DT").val().replaceAll(".", "")
				    , "RND_CHG_YN1"     : $("#RND_CHG_YN1").is(":checked") == true ? "Y" : "N"
				    , "RND_CHG_YN2"     : $("#RND_CHG_YN2").is(":checked") == true ? "Y" : "N"
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
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [삭제] 버튼 이벤트
	 * @Goal    : 화면 하단 부 [삭제] 클릭 시 발생되는 이벤트
	 * @Brief   : 예약일자와 예약순번으로 DB에 저장된 데이터 삭제
	 * @See     : /reserve/deleteReserveInfo.do
	 * -----------------------------------------------------*
	 *******************************************************/
	function deleteReserveInfo(){
		$.ajax({
			type : "post",
			url  : "/reserve/deleteReserveInfo.do",
			data : {"REQ_DT" : $("#REQ_DT").val().replaceAll(".","")
				  , "SEQ"    : seq
			},
			dataType : "json"
		}).done(function(data){
			if(data.result == 'SUCCESS'){
				alert("삭제가 완료되었습니다.");
				popupClose($('#p_reserveListRegi').data('pid'));
			}
			else{
				alert("삭제에 실패하였습니다. 시스템관리자에게 문의해주세요.");
			}
		});
	 }
	 
	 /*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : Validation [유효성] 체크 시작
	 * @Goal    : 화면 내 필수 값 체크 및 유효성 검사
	 * @Brief   : 데이터 정확성 및 필수항목에대한 체크 진행
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	function isValidation(){ 
		if(vflag == "new"){
			var usrId = $("#USER_ID").val();
			if(fn_empty(usrId)){
				alert("ID찾기 팝업에서 ID를 입력해주세요.");
				return false;
			}
		}
		
		if(fn_empty($("#REQ_TEL_NO").val())){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		 
		if(fn_empty($("#REQ_HAN_NM").val())){
			alert("한글이름을 입력해주세요.");
			return false;
		}
		
		if(fn_empty($("#REQ_ENG_NM").val())){
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
		
		if(mem_gbn != "01"){ // 멤버가 아닌 경우
			if(hdng_gbn == "28"){ // 멤버 상품인 경우
				alert("해당상품은 멤버전용 상품입니다.");
				return false;
			}
			if(add_hdng_gbn == "28"){
				alert("해당상품은 멤버전용 상품입니다.");
				return false;
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
		
		if(mem_gbn == "01" || (mem_gbn == "02" && fn_empty(agn_cd))){
			var twin_cnt = parseInt($("#TWIN_CNT").val().replaceAll("," , ""));
			var king_cnt = parseInt($("#KING_CNT").val().replaceAll("," , ""));
			if($("#ROOM_TYPE").val() != "" && twin_cnt == 0 && king_cnt == 0){
			    alert("트윈/킹 룸 개수를 입력해주세요.");
			    return false;
			}
		}
		
		var pick_gbn = $("#PICK_GBN").val();
		if(pick_gbn != "01"){
			/* var pick_in = $("#PICK_IN").val();
			if(fn_empty(pick_in)){
				alert("픽업차량-도착을 선택해주세요.");
				return false;
			}
			
			var pick_out = $("#PICK_OUT").val();
			if(fn_empty(pick_out)){
				alert("픽업차량-출발을 선택해주세요.");
				return false;
			} */
		}
		
		//동반자정보 그리드 저장 전 인원구분 / 한글명이 적혀있는지 체크
		var ids = jQuery("#reserveGrid").jqGrid("getDataIDs");
		
		for(var i = 0 ; i < ids.length ; i++){
			//필수인 예약자 행의 값 저장
			$("#reserveGrid").jqGrid("saveRow",ids[0]);
			if($('#reserveGrid').jqGrid('getRowData', ids[i]).NUM_GBN == ''){
				alert("동반자 인원구분을 입력을 해주세요.");
				return false;
			}
		}
		
		return true;
	}
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [유효성] 체크 시작
	 * @Goal    : 화면 내 필수 값 체크 및 유효성 검사
	 * @Brief   : 데이터 정확성 및 필수항목에대한 체크 진행
	 * @See     : NONE
	 * -----------------------------------------------------*
	 *******************************************************/
	$('#REQ_TEL_NO').keyup(function (event) {
	    event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenTel(_val);
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [인보이스] 생성
	 * @Goal    : 화면 내 필수 값 체크 및 유효성 검사
	 * @Brief   : 데이터 정확성 및 필수항목에대한 체크 진행
	 * @See     : /reserve/selectReserveDetlYn.do
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#btn_create").click(function() {
		console.log("====== 인보이스 생성버튼 클릭 ======")
		/* ********* 인보이스 팝업 OPEN ********* */
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
			"INV_REG_DT" : $("#INV_REG_DT").val().replaceAll(".", ""),
			"PRC_STS"    : $("#PRC_STS").val(),
			"DEP_AMT"    : parseInt($("#DEP_AMT").val().replaceAll(",", "")),
			"EXP_DT"     : $("#EXP_DT").val().replaceAll(".", "")
		};

		/* *************** 예약상세 여부 확인 *************** */
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

		/* ********* 체크아웃-체크인 일자 수와 기준년도 등록된 일자 비교 ********* */
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
		
		/* ********* 미팅샌딩 데이터 저장 및 업데이트  ********* */
		var day = new Date();
		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2)); 

		if (fn_empty($("#INV_REG_DT").val())) {
			var url4 = "/reserve/updateReserveStatus.do";
			var param4 = {
				"SEQ" : seq, 	
				"REQ_DT" : req_dt,
				"INV_REG_DT" : today,
				"CHG_PRC_STS" : "05"
			}
				
			fn_ajax(url4, false, param4, function(data, xhr) {
				param.INV_REG_DT = today;
			});
		}

		popupOpen(url, pid, param, function(data) {
			initSelect();
		});
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [미팅샌딩- 등록] 버튼 이벤트
	 * @Goal    : [미팅샌딩- 등록] 버튼 이벤트
	 * @Brief   : 화면 내 미팅샌딩 [등록] 버튼 클릭 시 표출되는 팝업
	 * @See     : /reserve/pickUpGbnPopup.do
	 * -----------------------------------------------------*
	 *******************************************************/
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
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [입금관리] 버튼 이벤트
	 * @Goal    : [입금관리] 버튼 이벤트
	 * @Brief   : 화면 내 [입금관리] 버튼 클릭 시 표출되는 팝업
	 * @See     : /reserve/pickUpGbnPopup.do
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#btn_pay").click(function() {
		console.log("===== 입금관리버튼클릭 ======")
		
		var invRegDt = $("#INV_REG_DT").val();		
		console.log("===== 인보이스 발행일자 : "+invRegDt);
		
		if(fn_empty(invRegDt)){
			alert("인보이스 발행을 해주세요.");
			return false;
		}
				
		
	    var url = "/deposit/depositMngPopup.do";
	    var pid = "p_pickUpGbnPopup";
	    var param = { "SEQ"          : seq
			        , "REQ_DT"       : req_dt
			        , "PRC_STS"      : $("#PRC_STS"     ).val()
			        };
	    
		popupOpen(url, pid, param, function(data) {
			console.log("result : "+JSON.stringify(data));
			if(!fn_empty(data)){
				
				$("input[name='PAY_DEP_AMT']").val(data.PAY_DEP_AMT); //입금예약금 세팅
				$("input[name='DEP_IN_DT']").val(data.DEP_IN_DT);     //예약금입금일자 세팅
				$("input[name='PRC_STS_NM']").val(data.PRC_STS_NM);   //상태명 세팅
				
			} else {
				
				initSelect();    //예약상세 다시조회				
			}
		});
	});	
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [회원가입] 버튼 이벤트
	 * @Goal    : [회원가입] 버튼 이벤트
	 * @Brief   : 화면 내 [회원가입] 버튼 클릭 시 표출되는 팝업
	 * @See     : /rrs/UserPopup.do
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#btn_adduser").on("click", function(){
			var url = "/rrs/UserPopup.do";
			var pid = "p_User";  //팝업 페이지의 취상위 div ID
			var param = {"USER_ID" : ""};
			popupOpen(url, pid, param, function(data) {
				if(!fn_empty(data)){
					delProgram();
					$("#USER_ID").val(data.USER_ID);
					$("#MEM_GBN").val(data.MEM_GBN);
					$("#REQ_HAN_NM").val(data.REQ_HAN_NM);
					$("#REQ_ENG_NM").val(data.REQ_ENG_NM);
					$("#REQ_TEL_NO").val(data.REQ_TEL_NO);
					if(data.MEM_GBN == "01"){
						$("#AGN_GB").val("");
						$("#AGN_CD").val("");
				    	$("#AGN_GB").attr("disabled",true);
				    	$("#AGN_CD").attr("disabled",true);
				    	$("#HDNG_GBN").val("28");
				    	$("#HDNG_GBN"     ).attr("disabled",true);
				    	$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON").val("1");
						$("#G_PERSON").val("0");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("1");
						$("#DEP_IN_DT"  ).attr("disabled",false);
					}else if(data.MEM_GBN == "02"){
						$("#AGN_GB").val("");
						$("#AGN_CD").val("");
				    	$("#AGN_GB").attr("disabled",true);
				    	$("#AGN_CD").attr("disabled",true);
				    	$("#M_PERSON").attr("disabled",true);
				    	$("#HDNG_GBN").val("");
						$("#HDNG_GBN").attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON").val("0");
						$("#G_PERSON").val("1");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("1");
						$("#DEP_IN_DT"  ).attr("disabled",false);
					}else if(data.MEM_GBN == "04"){
						$("#AGN_GB").attr("disabled",false);
				    	$("#AGN_CD").attr("disabled",false);
						$("#HDNG_GBN").val("");
						$("#HDNG_GBN").attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON").attr("disabled",false);
						$("#M_PERSON").val("0");
						$("#G_PERSON").val("0");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("0");
						$("#TWIN_KING_CNT").val("0");
						$("#TWIN_CNT").val("0");
						$("#KING_CNT").val("0");
						$("#DEP_IN_DT"  ).attr("disabled",false);
					}else{
						$("#AGN_GB").val("");
						$("#AGN_CD").val("");
						$("#AGN_GB").attr("disabled",true);
				    	$("#AGN_CD").attr("disabled",true);
				    	$("#HDNG_GBN").val("");
						$("#HDNG_GBN").attr("disabled",true);
						$("#ADD_HDNG_GBN").val("");
						$("#ADD_HDNG_GBN").attr("disabled",true);
						$("#M_PERSON").val("0");
						$("#G_PERSON").val("0");
						$("#N_PERSON").val("0");
						$("#K_PERSON").val("0");
						$("#I_PERSON").val("0");
						$("#TOT_PERSON").val("0");
						$("#TWIN_KING_CNT").val("0");
						$("#TWIN_CNT").val("0");
						$("#KING_CNT").val("0");
						$("#DEP_IN_DT"  ).attr("disabled",true);
					}
					fn_roomTypeCnt();
				}
			});
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : [아이디 찾기] 버튼 이벤트
	 * @Goal    : [아이디 찾기] 버튼 이벤트
	 * @Brief   : 화면 내 [아이디 찾기] 버튼 클릭 시 표출되는 팝업
	 * @See     : /reserve/searchId.do
	 * -----------------------------------------------------*
	 *******************************************************/
	$("#btn_search").on("click", function(){
		var url = "/reserve/searchId.do";
	    var pid = "p_searchIdPopup";
	    var param = {};
		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				delProgram();
				$("#USER_ID").val(data.USER_ID);
				$("#MEM_GBN").val(data.MEM_GBN);
				$("#REQ_HAN_NM").val(data.REQ_HAN_NM);
				$("#REQ_ENG_NM").val(data.REQ_ENG_NM);
				$("#REQ_TEL_NO").val(data.REQ_TEL_NO);
				if(data.MEM_GBN == "01"){
					$("#AGN_GB").val("");
					$("#AGN_CD").val("");
			    	$("#AGN_GB").attr("disabled",true);
			    	$("#AGN_CD").attr("disabled",true);
			    	$("#HDNG_GBN").val("28");
			    	$("#HDNG_GBN"     ).attr("disabled",true);
			    	$("#ADD_HDNG_GBN").val("");
					$("#ADD_HDNG_GBN").attr("disabled",true);
					$("#M_PERSON").val("1");
					$("#G_PERSON").val("0");
					$("#N_PERSON").val("0");
					$("#K_PERSON").val("0");
					$("#I_PERSON").val("0");
					$("#TOT_PERSON").val("1");
					$("#DEP_IN_DT"  ).attr("disabled",false);
				}else if(data.MEM_GBN == "02"){
					$("#AGN_GB").val("");
					$("#AGN_CD").val("");
			    	$("#AGN_GB").attr("disabled",true);
			    	$("#AGN_CD").attr("disabled",true);
			    	$("#M_PERSON").attr("disabled",true);
			    	$("#HDNG_GBN").val("");
					$("#HDNG_GBN").attr("disabled",true);
					$("#ADD_HDNG_GBN").val("");
					$("#ADD_HDNG_GBN").attr("disabled",true);
					$("#M_PERSON").val("0");
					$("#G_PERSON").val("1");
					$("#N_PERSON").val("0");
					$("#K_PERSON").val("0");
					$("#I_PERSON").val("0");
					$("#TOT_PERSON").val("1");
					$("#DEP_IN_DT"  ).attr("disabled",false);
				}else if(data.MEM_GBN == "04"){
					$("#AGN_GB").attr("disabled",false);
			    	$("#AGN_CD").attr("disabled",false);
					$("#HDNG_GBN").val("");
					$("#HDNG_GBN").attr("disabled",true);
					$("#ADD_HDNG_GBN").val("");
					$("#ADD_HDNG_GBN").attr("disabled",true);
					$("#M_PERSON").attr("disabled",false);
					$("#M_PERSON").val("0");
					$("#G_PERSON").val("0");
					$("#N_PERSON").val("0");
					$("#K_PERSON").val("0");
					$("#I_PERSON").val("0");
					$("#TOT_PERSON").val("0");
					$("#TWIN_KING_CNT").val("0");
					$("#TWIN_CNT").val("0");
					$("#KING_CNT").val("0");
					$("#DEP_IN_DT"  ).attr("disabled",false);
				}else{
					$("#AGN_GB").val("");
					$("#AGN_CD").val("");
					$("#AGN_GB").attr("disabled",true);
			    	$("#AGN_CD").attr("disabled",true);
			    	$("#HDNG_GBN").val("");
					$("#HDNG_GBN").attr("disabled",true);
					$("#ADD_HDNG_GBN").val("");
					$("#ADD_HDNG_GBN").attr("disabled",true);
					$("#M_PERSON").val("0");
					$("#G_PERSON").val("0");
					$("#N_PERSON").val("0");
					$("#K_PERSON").val("0");
					$("#I_PERSON").val("0");
					$("#TOT_PERSON").val("0");
					$("#TWIN_KING_CNT").val("0");
					$("#TWIN_CNT").val("0");
					$("#KING_CNT").val("0");
					$("#DEP_IN_DT"  ).attr("disabled",true);
				}
				fn_roomTypeCnt();
			}
		});
	});
	
	/*******************************************************
	 *-----------------------------------------------------*
	 * @Subject : 예약 현황 리스트(그리드) 조회
	 * @Goal    : 예약 현황 리스트(그리드) 조회
	 * @Brief   : 예약 현황 리스트(그리드) 조회
	 * @See     : /reserve/reserveSelectAddList.do
	 * -----------------------------------------------------*
	 *******************************************************/
	function cSearch(currentPage){
		var url = "/reserve/reserveSelectAddList.do";
		var formData = formIdAllToMap('frmSearch');
		var reserve_sum_tot = 0;
		var param = {"SEQ"     : seq
				   , "REQ_DT"  : req_dt
				   };
		
		fn_ajax(url, true, param, function(data, xhr){
			$.each(data.result , function(i , val){
				val.TOT_AMT = parseInt(val.TOT_AMT).toLocaleString();
				val.PER_AMT = parseInt(val.PER_AMT).toLocaleString();
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
		   
			$("#reserveGrid_pager_left").hide();
	    });
		
		$('#POP_EXP_DT').datepicker({
	        dateFormat : 'yy.mm.dd',
		    showOn : 'both'
		 }).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		     function(e) {
		 });
		loadingEnd(); /*$('#wrap-loading').remove();*/
	}
	
	
	/* *******************************************동반자 Grid 함수 시작 ***************************************** */
	
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
						  { name: 'REQ_DT'       , width : 24 , align: 'center', hidden:true, editoptions:{readonly: true}}
						, { name: 'SEQ'          , width : 24 , align: 'center', hidden:true, editoptions:{readonly: true}}
						, { name: 'DSEQ'         , width : 24 , align: 'center', editable:false, editoptions:{readonly: true}}
						, { name: 'COM_GBN'      , width : 80 , align: 'center', editable:false, edittype:"select" , formatter : "select" , editoptions:{value:'${COM_GBN}'}}
						, { name: 'NUM_GBN'      , width : 80 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${NUM_GBN}'}}
						, { name: 'COM_HAN_NM'   , width : 120, align: 'center', editable:true, editoptions:{maxlength:100}}
						, { name: 'COM_ENG_NM'   , width : 120, align: 'center', editable:true, editoptions:{maxlength:100}}
						, { name: 'COM_TEL_NO'   , width : 120, align: 'center', editable:true, editoptions:{maxlength:100}}
						, { name: 'CHK_IN_DT'    , width : 84 , align: 'center', editable:true, editoptions:{maxlength:100}}
						, { name: 'CHK_OUT_DT'   , width : 84 , align: 'center', editable:true, editoptions:{maxlength:100}}
						, { name: 'FLIGHT_IN'    , width : 80 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_IN}'}}
						, { name: 'FLIGHT_IN_HH' , width : 74 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_IN_HH}'}}
						, { name: 'FLIGHT_OUT'   , width : 80 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_OUT}'}}
						, { name: 'FLIGHT_OUT_HH', width : 74 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${FLIGHT_OUT_HH}'}}
						, { name: 'ADD_FILE_SEQ' , width : 84 , align: 'center', editable:true, edittype:"button",
									editoptions:{
										dataEvents:[{
											type:"click",
											fn:function(e){
												if (parseInt(this.value) > 0) {
													this.title = "이미지보기";
													reserveSelectAirlineImg(this.value);
												}
											}
										}]
									}
						}
						, { name: 'HDNG_GBN'      , width : 120, align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${list_hdng_gbn_g}'}}
						, { name: 'LATE_CHECK_IN' , width : 80 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${LATE_CHECK_IN}'}}
						, { name: 'LATE_CHECK_OUT', width : 80 , align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${LATE_CHECK_OUT}'}}
						, { name: 'ROOM_TYPE'     , width : 120, align: 'center', editable:true, edittype:"select" , formatter : "select" , editoptions:{value:'${ROOM_TYPE}'}}
						, { name: 'CONFIRM_NO'    , width : 120, align: 'center', editable:true, editoptions:{maxlength:100}}
						, { name: 'STATUS_V'      , width : 80 , align: 'center', editable:true, editoptions:{readonly: true}}
					];
		
		var gSetting = {
		        pgflg:false,
		        exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : false,
				searchInit : false,
				resizeing : true,
				rownumbers : false,
				shrinkToFit : false,
				autowidth : true,
				queryPagingGrid : false, // 쿼리 페이징 처리 여부
				height : 90
		};
		
		// 그리드 생성 및 초기화
		btGrid.createGrid('reserveGrid', colName, colModel, gSetting);
	}
	
	// 그리드 row 삭제
	function delProgram(){
		var ids = $("#reserveGrid").jqGrid("getDataIDs"); // 해당 그리드의 전체 로우의 아이디 조회
		for(var i = 0; i < ids.length; i++){
			btGrid.gridDelRow("reserveGrid", ids[i]);  // 해당 id의 로우 삭제
		}
	}

	// 동반자정보 자동생성
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
			
			if (i == 0 && $("#MEM_GBN").val() != '04'){ //
				g_COM_HAN_NM = $("#REQ_HAN_NM").val();
				g_COM_ENG_NM = $("#REQ_ENG_NM").val();
				g_COM_TEL_NO = $("#REQ_TEL_NO").val();
			}
			
			g_DSEQ = i + 1;
			g_CHK_IN_DT = $("#CHK_IN_DT").val().replaceAll("." , "");
			g_CHK_OUT_DT = $("#CHK_OUT_DT").val().replaceAll("." , "");
			g_FLIGHT_IN = $("#FLIGHT_IN").val();
			g_FLIGHT_IN_HH = $("#FLIGHT_IN_HH").val();
			g_FLIGHT_OUT = $("#FLIGHT_OUT").val();
			g_FLIGHT_OUT_HH = $("#FLIGHT_OUT_HH").val();
			g_ADD_FILE_SEQ = $("#ADD_FILE_SEQ").val();
			g_LATE_CHECK_IN  = $("#LATE_CHECK_IN").val();	//early 체크인
			g_LATE_CHECK_OUT = $("#LATE_CHECK_OUT").val();	//late 체크아웃
			g_ROOM_TYPE = $("#ROOM_TYPE").val();
			g_CONFIRM_NO = $("#CONFIRM_NO").val();
			g_STATUS_V = "I";
			
			data = { "DSEQ" : g_DSEQ 
					, "SEQ" : seq  
					, "COM_GBN" : g_COM_GBN 
					, "NUM_GBN" : g_NUM_GBN 
					, "COM_HAN_NM" : g_COM_HAN_NM 
					, "COM_ENG_NM" : g_COM_ENG_NM 
					, "COM_TEL_NO" : g_COM_TEL_NO 
					, "CHK_IN_DT" : g_CHK_IN_DT 
					, "CHK_OUT_DT" : g_CHK_OUT_DT 
					, "FLIGHT_IN" : g_FLIGHT_IN 
					, "FLIGHT_IN_HH" : g_FLIGHT_IN_HH 
					, "FLIGHT_OUT" : g_FLIGHT_OUT 
					, "FLIGHT_OUT_HH" : g_FLIGHT_OUT_HH 
					, "ADD_FILE_SEQ" : g_ADD_FILE_SEQ 
					, "HDNG_GBN" : g_HDNG_GBN 
					, "LATE_CHECK_IN" : g_LATE_CHECK_IN 
					, "LATE_CHECK_OUT" : g_LATE_CHECK_OUT 
					, "ROOM_TYPE" : g_ROOM_TYPE 
					, "CONFIRM_NO" : g_CONFIRM_NO 
					, "STATUS_V" : g_STATUS_V
					};
			
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
			
			$("#reserveGrid").jqGrid("saveRow",rowId);
			$("#reserveGrid").change();
		}
	});
	
	//동반자 정보 행추가
	$("#btn_List_addRow").on("click" , function(){
		btGrid.gridSaveRow('reserveGrid');
		var rowId = $('#reserveGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $("#reserveGrid").getRowData(rowId);
		var count = $("#reserveGrid").getGridParam("records");
		
		g_DSEQ           = count+1;		//순번
		g_SEQ            = seq;			//해당 예약의 일련변호
		g_CHK_IN_DT      = $("#CHK_IN_DT").val().replaceAll("." , "");		//체크인일자
		g_CHK_OUT_DT     = $("#CHK_OUT_DT").val().replaceAll("." , "");		//체크아웃일자
		g_FLIGHT_IN      = $("#FLIGHT_IN").val();		//도착항공기
		g_FLIGHT_IN_HH   = $("#FLIGHT_IN_HH").val();	//도착시간
		g_FLIGHT_OUT     = $("#FLIGHT_OUT").val();		//출발항공기
		g_FLIGHT_OUT_HH  = $("#FLIGHT_OUT_HH").val();	//출발시간
		g_ADD_FILE_SEQ   = $("#ADD_FILE_SEQ").val();	//항공이미지
		g_HDNG_GBN       = $("#ADD_HDNG_GBN").val();	//패키지상품
		g_LATE_CHECK_IN  = $("#LATE_CHECK_IN").val();	//early 체크인
		g_LATE_CHECK_OUT = $("#LATE_CHECK_OUT").val();	//late 체크아웃
		g_ROOM_TYPE      = $("#ROOM_TYPE").val();		//객실타입
		g_CONFIRM_NO     = $("#CONFIRM_NO").val();		//리조트 confirm 번호
		
		var data = {"DSEQ"           : g_DSEQ, 
					"SEQ"            : g_SEQ, 
					"COM_GBN"        : "2" , 
					"NUM_GBN"        : g_NUM_GBN , 
					"COM_HAN_NM"     : g_COM_HAN_NM , 
					"COM_ENG_NM"     : g_COM_ENG_NM , 
					"COM_TEL_NO"     : g_COM_TEL_NO , 
					"CHK_IN_DT"      : g_CHK_IN_DT , 
					"CHK_OUT_DT"     : g_CHK_OUT_DT , 
					"FLIGHT_IN"      : g_FLIGHT_IN , 
					"FLIGHT_IN_HH"   : g_FLIGHT_IN_HH , 
					"FLIGHT_OUT"     : g_FLIGHT_OUT , 
					"FLIGHT_OUT_HH"  : g_FLIGHT_OUT_HH , 
					"ADD_FILE_SEQ"   : g_ADD_FILE_SEQ , 
					"HDNG_GBN"       : g_HDNG_GBN , 
					"LATE_CHECK_IN"  : g_LATE_CHECK_IN , 
					"LATE_CHECK_OUT" : g_LATE_CHECK_OUT , 
					"ROOM_TYPE"      : g_ROOM_TYPE , 
					"CONFIRM_NO"     : g_CONFIRM_NO , 
					"STATUS_V"       : "I"
		};
		
		btGrid.gridAddRow("reserveGrid", "last", data);
	});
	
	//동반자 정보 행삭제
	$("#btn_List_delRow").on("click" , function(){
		var rowId = $("#reserveGrid").jqGrid('getGridParam','selrow');
		var args = "";
		$("#reserveGrid").jqGrid("saveRow",rowId);
		
		if (rowId == null) {
			args = '<s:message code='title.row'/>';
    		alert("<s:message code='errors.selectdel' arguments='" + args + "' javaScriptEscape='false'/>");
    		return;
		}else{
			var grdData = $("#reserveGrid").jqGrid("getCell", rowId, "STATUS_V");
			//예약자는 삭제 불가
			if($("#reserveGrid").jqGrid("getCell", rowId, "COM_GBN") == '1'){
				alert("예약자는 삭제할 수 없습니다.");
				return;
			}
			//이미 입력된 행 (STATUS_V == 'R') 인 경우 DB에서 삭제한다.
			if(grdData == 'R' || grdData == 'U'){
				if(confirm("삭제하시겠습니까?")){
					var del_num_gbn = $("#reserveGrid").jqGrid("getCell", rowId, "NUM_GBN");//삭제되는 행의 인원구분
					
					//삭제되는 행을 제외한 나머지 행의 DSEQ를 재정의 한다
					$("#reserveGrid").jqGrid("delRowData",rowId);	//선택한 행 삭제
					var ids = jQuery("#reserveGrid").jqGrid("getDataIDs");
					
					for(var i = 0 ; i < ids.length ; i++){
						$("#reserveGrid").jqGrid("setCell",ids[i] , "DSEQ", i+1);
						$("#reserveGrid").jqGrid("setCell",ids[i] , "STATUS_V", 'U');
					}
					
					var updateData = $("#reserveGrid").getRowData();
					
					//TB_REQ_BOOKING_M (예약기본_마스터)의 인원수를 업데이트해준다
					var tot_person = parseInt($("#TOT_PERSON").val().replaceAll("," , "")) - 1;
					var m_person = parseInt($("#M_PERSON").val().replaceAll("," , ""));		//멤버
					var g_person = parseInt($("#G_PERSON").val().replaceAll("," , ""));		//일반
					var n_person = parseInt($("#N_PERSON").val().replaceAll("," , ""));		//비라운딩
					var k_person = parseInt($("#K_PERSON").val().replaceAll("," , ""));		//소아
					var i_person = parseInt($("#I_PERSON").val().replaceAll("," , ""));		//영유아
					var del_person = 0;
					
					if(del_num_gbn == '01'){	// 01 멤버, 02 일반, 03 비라운딩, 04 소아, 05 영유아
						del_num_gbn = "M_PERSON";
						del_person  = m_person - 1;
					} else if(del_num_gbn == '02'){
						del_num_gbn = "G_PERSON";
						del_person  = g_person - 1;
					} else if(del_num_gbn == '03'){
						del_num_gbn = "N_PERSON";
						del_person  = n_person - 1;
					} else if(del_num_gbn == '04'){
						del_num_gbn = "K_PERSON";
						del_person  = k_person - 1;
					} else if(del_num_gbn == '05'){
						del_num_gbn = "I_PERSON";
						del_person  = i_person - 1;
					}
					
					var url = "/reserve/deleteReserveDetail.do";
					var param = { "REQ_DT"     : req_dt
								, "SEQ"        : seq
								, "DSEQ"       : $("#reserveGrid").jqGrid("getCell", rowId, "DSEQ")
								, "NEW_DETAIL" : $("#reserveGrid").getRowData()
								, "TOT_PERSON" : tot_person
							    , "DEL_NUM_GBN": del_num_gbn
							    , "DEL_PERSON" : del_person
								};
					
					fn_ajax(url, false, param, function(data, xhr){
						//삭제에 실패한 경우
						if(data.dup == 'Y'){
							alert("삭제에 실패했습니다.");
						}
						//삭제에 성공한 경우 그리드를 새로고침
						else if(data.dup == 'N'){
							alert("삭제하였습니다.");
							$.each(data.result , function(i , val){
								val.STATUS_V = "R";
							});
							reloadGrid("reserveGrid",data.result);
							$("#reserveGrid").change();
						}
					});
				}
			}
			//추가로 입력된 행(STATUS_V ==  'I') 인 경우 그리드에서만 삭제
			else {
	    			$("#reserveGrid").jqGrid("delRowData",rowId);
	    			$("#reserveGrid").change();
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
	
	//동반자 정보 그리드 변경 시
	$("#reserveGrid").bind("change" , function(){
		var changeRowId  = $('#reserveGrid').jqGrid('getGridParam', 'selrow');
		var rowCnt       = $('#reserveGrid').getGridParam('reccount');
		var ids          = $('#reserveGrid').jqGrid('getDataIDs');
		var full_tot_amt = 0;
		
		$("#reserveGrid").jqGrid("saveRow",changeRowId);
		if($('#reserveGrid').jqGrid('getRowData', changeRowId).STATUS_V != 'I'){
			$("#reserveGrid").jqGrid('setCell',changeRowId , 'STATUS_V', 'U');
		}

		if($('#reserveGrid').jqGrid('getRowData', changeRowId).NUM_GBN != "00"){
			
			var m_person_g = 0;
			var g_person_g = 0;
			var n_person_g = 0;
			var k_person_g = 0;
			var i_person_g = 0;
			
	 		for(var i = 0 ; i < ids.length ; i ++ ){
	 			//01(멤버),02(일반),03(비라운딩),04(소아),05(영유아))
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
	 		fn_roomTypeCnt();
	 		
	 		var getNumGbn = $('#reserveGrid').jqGrid('getRowData', changeRowId).NUM_GBN;
	 		var getComGbn = $('#reserveGrid').jqGrid('getRowData', changeRowId).COM_GBN;
	 		if(getNumGbn == "01"){
	 			if($("#MEM_GBN").val() == '02'){
	 				alert("일반회원 예약등록 시 멤버 동반자는 선택이 안됩니다.");
	 				if(getComGbn == '1'){
	 					$('#reserveGrid').jqGrid('setCell', changeRowId,'NUM_GBN','02');
	 				}
	 				else{ 
	 					$('#reserveGrid').jqGrid('setCell', changeRowId,'NUM_GBN','00');
	 				}
					return false;
	 			}else{
		 			m_person_g = m_person_g;
		 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', $("#HDNG_GBN").val());
	 			}
	 		}else if(getNumGbn == "02"){
	 			g_person_g = g_person_g;
	 			if($("#MEM_GBN").val() == '01'){  
	 				$("#ADD_HDNG_GBN").attr("disabled",false);
	 				$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', $("#ADD_HDNG_GBN").val());
	 			}else{
	 				$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', $("#HDNG_GBN").val());
	 			}
	 		}else if(getNumGbn == "03"){
	 			n_person_g = n_person_g;
	 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', '30');
	 		}else if(getNumGbn == "04"){
	 			k_person_g = k_person_g;
	 			$("#reserveGrid").jqGrid('setCell',changeRowId , 'HDNG_GBN', '30');
	 		}else if(getNumGbn == "05"){
	 			i_person_g = i_person_g;
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