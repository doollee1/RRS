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
		<h4>※예약확정은 입금완료로 처리됩니다.</h4>
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
					updateStatus();
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
		var param = {"CODE"   : prc_sts
				    };
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("ajax 통신 error!");
			}else{
				var vhtml;
				vhtml += '<option value="" >--<s:message code="system.select"/>--</option>'
				$.each(data.result , function ( i , v){
					if(mem_gbn == "01"){ // 멤버 
                        if((parseInt(v.CODE) <= 10) && v.CODE != "02" && v.CODE != "06"){
                        	vhtml += '<option value = '+v.CODE+'>'+v.CODE_NM+'</option>';
                        }
					}else if(mem_gbn == "02"){ // 일반
						if((parseInt(v.CODE) <= 10) && v.CODE != "02" && v.CODE != "06"){	
                        	vhtml += '<option value = '+ v.CODE+'>'+v.CODE_NM+'</option>';
                        }
					}else if(mem_gbn == "03"){ //교민
						if(((10 < parseInt(v.CODE)) && (parseInt(v.CODE) <= 20)) || v.CODE == "96"){
							vhtml += '<option value = '+ v.CODE +'>'+v.CODE_NM+'</option>';
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
	
	function updateStatus(){
		var url = "/reserve/updateReserveStatus.do";
		var param = {"REQ_DT"      : req_dt
				   , "SEQ"         : parseInt(seq)
				   , "PRC_STS"     : prc_sts 
				   , "CHG_PRC_STS" : $("#CHG_PRC_STS option:selected").val()
				   , "MEM_GBN"     : mem_gbn
				    };
		if(confirm("<s:message code='confirm.save'/>")){
			fn_ajax(url, true, param, function(data, xhr){
				if(data.dup == 'Y'){
					alert("<s:message code='errors.failErpValid' javaScriptEscape='false'/>"); 
				}else{
					alert("<s:message code='info.save'/>");
					p_rtnData = {};
					popupClose($('#p_changeStatusPopup').data('pid'));
				}
			});
		}
	}
	
});

</script>