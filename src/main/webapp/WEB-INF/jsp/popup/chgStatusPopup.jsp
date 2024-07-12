<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : chgStatusPopup
 * @Description : 예약관리-상태변경 팝업
 */
%>
<style>
.pbtn_default {margin: 0 3px -1px 5px;padding: 3px 10px 3px 10px;border: 1px solid #a9cbeb !important;background: #bdd6ee !important;color: #2269b1;}
</style>
<div id="p_changeStatusPopup">
	<div id="pop_ct_form_wrap">
		<table class="pop_tblForm">
			<colgroup>
				<col width="20%" />
		        <col width="30%" />
		        <col width="20%" />
		        <col width="30%" />
		    </colgroup>
			<tr>
			    <th>현재상태</th>
			    <td>
				    <div style="display:inline-flex;" >
						<input type="text"    name="P_PRC_STS_NM" id="P_PRC_STS_NM" readonly>
						<input type="hidden"  name="P_PRC_STS"    id="P_PRC_STS"    readonly>
					</div>
				</td>
				<th>변경상태</th>
			    <td>
				    <select id="CHG_PRC_STS" name="CHG_PRC_STS" class="cmc_combo" style="width:62%;">
					</select>
				</td>
			</tr>
		</table>
		<b id="advice_pop" style="opacity:75%;">&nbsp;
			※   [<b style="color: red; font-weight: bold;">예약요청</b>]에서 상태변경 시 : 예약가능, 예약취소
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">예약가능</b>]에서 상태변경 시 : 예약신청, 예약취소
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">예약신청</b>]에서 상태변경 시 : 예약입금대기,예약취소<br/>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">예약입금대기</b>]에서 상태변경 시 : 예약신청, 예약확정, 예약취소
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">예약확정</b>]에서 상태변경 시 : 예약입금대기, 환불요청, 환불완료, 입금완료, 예약취소<br/>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">환불요청</b>]에서 상태변경 시 : 예약입금대기, 예약확정, 환불완료
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">환불완료</b>]에서 상태변경 시 : 환불요청
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">예약취소</b>]에서 상태변경 시 : 예약입금대기, 예약확정<br/>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			  [<b style="color: red; font-weight: bold;">입금완료</b>]에서 상태변경 시 : 예약확정, 환불요청, 환불완료, 예약취소<br/>
			  &nbsp;&nbsp;&nbsp;&nbsp;
		</b>
			
	</div>
</div>

<script type="text/javascript">
$(function() {
	var req_dt;
	var seq;
	var prc_sts;
	var prc_sts_nm;
	var mem_gbn;
	
	$('#p_changeStatusPopup').dialog({
		title :'<s:message code='reservation.stateTitle'/>',
		autoOpen : false,
		height: 'auto',
		width: 1076.4,
		modal : true,
		buttons : {
			'<s:message code='reservation.chgState'/>' : {
				text: '<s:message code='reservation.chgState'/>',
				id : 'save',
				click: function() {
					saveStatus();
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
			cSearch();
		}
	});
	
	
	function cSearch(receivcedData){
		var url = "/reserve/selectReserveStatus.do";
		//var param = {"CODE"   : prc_sts };
		var param = { "SEQ"    : seq
				    , "REQ_DT" : req_dt
		};
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("조회에 실패했습니다. 시스템 관리자에게 문의해 주세요.");
			}else{
				// 01 예약요청(일반), 02 예약요청(멤버), 03 예약가능(일반), 04 예약신청(일반), 05 예약입금대기
				// 06 예약확정       , 07 환불요청       , 08 환불완료, 09 예약취소, 10 입금완료
				var vhtml;
				vhtml += '<option value="" >--<s:message code="system.select"/>--</option>'
				$.each(data.result , function ( i , v){
					if(prc_sts == "01"){ // 예약요청(일반) >> 예약가능, 예약취소
						if(v.CODE == "03" || v.CODE == "09"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="02"){ // 예약요청(멤버) >> 예약입금대기, 예약취소
						if(v.CODE == "05" || v.CODE == "09"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="03"){ // 예약가능(일반) >> 예약요청(일반), 예약신청, 예약취소
						if(v.CODE == "01" || v.CODE == "04" || v.CODE == "09"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="04"){ // 예약신청(일반) >> 예약입금대기, 예약가능(일반/에이전트 일때), 예약취소
						if(mem_gbn == "02" || mem_gbn == "04"){
							if(v.CODE == "03"){
								vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
							}
						} 
						if(v.CODE == "05" || v.CODE == "09"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="05"){ // 예약입금대기 >> 예약신청, 예약확정, 예약취소
						if(mem_gbn == "01"){
							if(v.CODE == "02"){
								vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
							}
						} else {
							if(v.CODE == "04"){
								vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
							}
						}
					
						if(v.CODE == "06" || v.CODE == "09"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="06"){ // 예약확정 >> 예약입금대기, 환불요청, 환불완료, 예약취소, 입금완료
						if(v.CODE == "05" || v.CODE == "07" || v.CODE == "08" || v.CODE == "09" || v.CODE == "10"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="07"){ // 환불요청 >> 예약입금대기, 예약확정, 환불완료
						if(v.CODE == "05" || v.CODE == "06" || v.CODE == "08"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="08"){ // 환불완료 >> 환불요청
						if(v.CODE == "07"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts =="09"){ // 예약취소 >> 예약입금대기, 예약확정
						if(v.CODE == "05" || v.CODE == "06"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					} else if(prc_sts == "10"){ // 입금완료 >> 예약확정, 환불요청, 환불완료, 예약취소
						if(v.CODE == "06" || v.CODE == "07" || v.CODE == "08" || v.CODE == "09"){
							vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
						}
					}
				});
				$("#CHG_PRC_STS").append(vhtml);
			}
		});
	}
	
	function fn_init (receivedData){
		prc_sts    = receivedData.PRC_STS;
		prc_sts_nm = receivedData.PRC_STS_NM;
		req_dt     = receivedData.REQ_DT;
		seq        = receivedData.SEQ;
		mem_gbn    = receivedData.MEM_GBN;
		
		$("#P_PRC_STS"   ).val(prc_sts);
		$("#P_PRC_STS_NM").val(prc_sts_nm);
	}
	
	function saveStatus() {
		var prcSts =  $("#CHG_PRC_STS option:selected").val();
		if($("#CHG_PRC_STS option:selected").val() == ""){
			alert("변경상태를 선택해주세요.");
			return;
		}
		
		var url = "/reserve/selectBalAmt.do";
		var param = { "SEQ"    : seq
				    , "REQ_DT" : req_dt
		};
		// 환불 완료, 예약취소, 입금완료 일때 잔금 확인
		if (prcSts == "08" || prcSts == "09" || prcSts == "10") {
			fn_ajax(url, true, param, function(data, xhr){
				// 잔금이 남아 있을 경우 confirm 
				if( data.bal_amt != 0 ){
					if( confirm("입금이 완료되지 않았습니다. 계속 상태변경을 진행하시겠습니까?") ){
						updateStatus();
					}
				} else {
					// 잔금이 없으면 바로 저장
					updateStatus();
				}
			});
		} else {
			updateStatus();
		}
	}
	
	function updateStatus(){
		var url = "/reserve/updateReserveStatus.do";
		var param = { "REQ_DT"      : req_dt
				    , "SEQ"         : parseInt(seq)
				    , "CHG_PRC_STS" : $("#CHG_PRC_STS option:selected").val()
				    };
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, true, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					popupClose($('#p_changeStatusPopup').data('pid'));
				}
			});
		}
	}
	
});

</script>