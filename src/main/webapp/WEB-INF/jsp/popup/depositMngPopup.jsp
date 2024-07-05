<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
/**
 * @Name : depositMngPopup
 * @Description : 입금관리 팝업
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
					<col width="10%" />
			        <col width="15%" />
			        <col width="10%" />
			        <col width="15%" />
			        <col width="10%" />
			        <col width="15%" />
			        <col width="10%" />
			        <col width="15%" />
			    </colgroup>
			    <tr>
			    	<th>검색</th>
					<td class="medium_td" colspan="7">
						<select id="PAY_TYPE_SEARCH" name="PAY_TYPE_SEARCH" class="cmc_combo" style="width:15%;">
						    <c:forEach var="i" items="${searchType}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>
						<button type="button" class="btn btn-success" id="btn_deposit" style="width:160px; height:25px; opacity:70%; margin: 0 20px">조회</button>							
					</td>			
			    </tr>
		   		<tr>		   			
		   	     	<th><s:message code='deposit.paydt'/></th>
					<td>						
						<input type="text" id="PAY_DT" name="PAY_DT" data-type="date" readonly="readonly" style="width:60%;"/>					
					</td>
					<th><s:message code='deposit.paytype'/></th>
					<td>
					    <select id="PAY_TYPE" name="PAY_TYPE" class="cmc_combo" style="width:80%;">
						    <c:forEach var="i" items="${depositType}">
								<option value="${i.CODE}">${i.CODE_NM}</option>
							</c:forEach>
						</select>	
					</td>
					<th><s:message code='deposit.payamt'/></th>
					<td>
						<input type="text" class="cmc_txt fee withComma" id="PAY_AMT" value="0" name="PAY_AMT" style="text-align:right;width:70%;" maxlength="9"/>원
					</td>
					<th><s:message code='deposit.payreg'/></th>
					<td>
						<button type="button" class="btn btn-success" id="btn_payreg"  style="width:160px; opacity:70%; margin: 0 20px">입금등록</button>
						<input type="hidden" id="DEP_AMT"   name="DEP_AMT"    />
					</td>
				</tr>
				<tr>
				    <th><s:message code='deposit.dctamt'/></th>
					<td>
						<input type="text" class="cmc_txt fee withComma" id="DCT_AMT" value="0" name="DCT_AMT" style="text-align:right;width:70%;" maxlength="9"/>원
					</td>
					<th><s:message code='deposit.accuamt'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="ACCU_AMT" value="0" name="ACCU_AMT" style="text-align:right;width:70%;" readonly/>원
					</td>
					<th><s:message code='deposit.invoiceamt'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="INVOICE_AMT" value="0" name="INVOICE_AMT" style="text-align:right;width:70%;" readonly/>원
					</td>
					<th><s:message code='deposit.balamt'/></th>
					<td>
						<input type="text" class="cmc_txt fee" id="BAL_AMT" value="0" name="BAL_AMT" style="text-align:right;width:70%;" readonly/>원
					</td>
				</tr>				
			</table>
			
		</div>
		
		<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">		
		<div class="pop_grid_wrap">
			<table id="depositGrid"></table>			
		</div>
	</div>
	</form>	
</div>

<script type="text/javascript">
$(function() {
	var gv_req_dt;  //요청일자
	var gv_seq;		//일련번호
	
	$('#p_pickUpGbnPopup').dialog({
		title :'<s:message code='deposit.mng'/>',   //입금관리
		autoOpen : false,
		//height: 400,
		width: 940,
		modal : false,
		buttons : {
			'<s:message code='system.save'/>' : {
				text: '<s:message code='system.save'/>',
				id : 'save',
				click: function() {
					returnPopupRslt();  //팝업결과 반환
				}
			},			
			'<s:message code='system.delete'/>' : {
				text: '<s:message code='system.delete'/>',
				id : 'delete',
				click: function() {
					fnRowDelete();
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
			fn_init($(this).data());  //최초수행
		}
	});
	
	
	//금액입력시
	$(".withComma").on("keyup" , function(){
		var tmpValue = $(this).val().replace(/[^0-9,]/g,'');
		tmpValue = tmpValue.replace(/[,]/g,'');
		// 천단위 콤마 처리 후 값 강제변경
	    $(this).val(numberWithCommas(tmpValue));
	});
	
	
	// 천단위 콤마 (소수점포함)
	function numberWithCommas(num) {
	    var parts = num.toString().split(".");	
	    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
	}
	
	
	//입금금액, 할인금액 키입력시 공백 체크 
	$('#PAY_AMT, #DCT_AMT').on("keyup" , function(){
				
		if($('#PAY_AMT').val() == ""){		//입금금액	
			$('#PAY_AMT').val("0");
		}
		
		if($('#DCT_AMT').val() == ""){		//할인금액	
			$('#DCT_AMT').val("0");
		}
		
	});
	
	//조회 클릭
	$("#btn_deposit").click(function() {
		var payType = $("#PAY_TYPE_SEARCH").val();
		cSearch(payType); //입금목록 조회
	});
	
	
	//입금등록 클릭
	$("#btn_payreg").click(function() {
		
		var pay_dt   = $("#PAY_DT").val().replaceAll(".","");
	    var pay_type = $("#PAY_TYPE").val();
		var pay_amt  = $("#PAY_AMT").val().replaceAll(",","");
	    var dct_amt  = $("#DCT_AMT").val().replaceAll(",","");
	    var dep_amt  = $("#DEP_AMT").val().replaceAll(",","");
	    
	    //입금일자 확인
	    if(fn_empty(pay_dt)){
	    	
	    	alert("입금일자를 확인해주세요.");
			return false;
	    }
	    
	    //입금금액 확인
	    if(parseInt(pay_amt) == 0){
	    	
	    	alert("입금금액을 확인해주세요.");
			return false;
	    }
	    
	    
	    //입금구분이 예약(03)이고 예약금액이 없을 경우
		if((pay_type == '03') && (parseInt(dep_amt) == 0)){
	    	
	    	alert("예약금액이 없어 입금이 불가합니다.");
			return false;
	    }
	    
	    
		var url = "/deposit/registDepositAjax.do";
	    var param = { "SEQ"         : gv_seq
			        , "REQ_DT"      : gv_req_dt
			        , "PAY_TYPE" 	: pay_type
			        , "PAY_DT" 		: pay_dt
			        , "PAY_AMT"     : pay_amt
			        , "DCT_AMT"     : dct_amt
	    }; 
			        
	    fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("입금등록 통신오류발생, 시스템관리자에게 문의해주세요.");
			} else{
				if(!fn_empty(data.result)){
					//성공(SUCCESS)일 경우
					if(data.result.RESULT == "SUCCESS") {
						//임금목록조회
						cSearch('00');   //전체 
					}										
				}else{
					alert("입금 등록이 실패하였습니다, 시스템관리자에게 문의해주세요.")
				}
			}
		});	        
	});
	
	//최소 수행
	function fn_init(recevicedData) {
		gv_req_dt     = recevicedData.REQ_DT;
		gv_seq        = recevicedData.SEQ;
		
		//예약상태가 입금완료(10) 일 경우 입금등록버튼 비활성화
		if(!fn_empty(recevicedData.PRC_STS)){
			if(recevicedData.PRC_STS == "08" || recevicedData.PRC_STS == "09" || recevicedData.PRC_STS == "10"){
				$(".ui-dialog-buttonset > button#save").attr("disabled", true);
				$(".ui-dialog-buttonset > button#delete").attr("disabled", true);
				$("#btn_payreg").attr("disabled",true);
				$("#btn_payreg").attr("disabled",true);
			}	
		}
		
		//입금일자 달력세팅
		$('#PAY_DT').datepicker({
		    dateFormat : 'yy.mm.dd',
		    showOn : 'both'
		}).css('ime-mode', 'disabled').attr('maxlength', 10).blur(
		    function(e) {
		});
		
		//입금일자 현재일자로 세팅
		var day = new Date();
		var today = String(day.getFullYear()) + String(("0" + (1 + day.getMonth())).slice(-2)) + String(("0" + day.getDate()).slice(-2));
		$("#PAY_DT"      ).val(Util.converter.dateFormat1(today));
		
		//그리드 생성
		createGrid();
		
		var url = "/deposit/selectDepositHdrAjax.do";
     	var param = {"REQ_DT" : gv_req_dt 
	               , "SEQ"    : gv_seq
	                };
     	fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("입금 정보조회 오류, 시스템 관리자에게 문의해주세요.");
			} else{
				if(!fn_empty(data.result)){
					$("input[name='INVOICE_AMT']").val(numberWithCommas(data.result.INVOICE_AMT));  //견적금액
					$("input[name='BAL_AMT']").val(numberWithCommas(data.result.BAL_AMT));  //잔액금액
					$("input[name='DEP_AMT']").val(numberWithCommas(data.result.DEP_AMT));  //예약금액
					//입금록록 조회
					cSearch('00');  //전체					
				}else{
					alert("비용 테이블 자료가 존재하지않습니다.")
				}
			}
		});
	}
	
	//비용상세 마지막레코드 조회
	function selectLastTbReqFeeInfo(){
		var url = "/deposit/selectLastTbReqFeeInfoAjax.do";
     	var param = {"REQ_DT" : gv_req_dt 
	               , "SEQ"    : gv_seq
	                };
     	fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("비용 상세 조회오류, 시스템 관리자에게 문의하세요.");
			} else{
				if(!fn_empty(data.result)){
					$("input[name='DCT_AMT']").val(0);				//할인금액 초기화
					$("input[name='ACCU_AMT']").val(numberWithCommas(data.result.ACCU_AMT)); //총입금금액(누적금액)
					$("input[name='BAL_AMT']").val(numberWithCommas(data.result.BAL_AMT));  //잔액금액						
					
					//잔액이 0일 경우, 등록버튼 비활성화
					if(data.result.BAL_AMT == 0){
						$("#btn_payreg").attr("disabled",true);
					}
					
				}else{
					alert("총 입금 금액이 존재하지 않습니다, 시스템 관리자에게 문의하세요.")
				}
				
			}
		});
	}
	
	//하단 목록리스트 출력
	function cSearch(payType){
		var url = "/deposit/selectDepositListAjax.do";
		var param = {"SEQ"     : gv_seq
				   , "REQ_DT"  : gv_req_dt
				   , "PAY_TYPE": payType
				   };
		
		fn_ajax(url, true, param, function(data, xhr){
			if(data.MESSAGE != "OK"){
				alert("입금목록 리스트 조회 오류, 시스템관리자에게 문의하세요.");
			} else {
				if(!fn_empty(data.result)){
					reloadGrid("depositGrid", data.result);  //그리드 재로드
					btGrid.gridResizing('depositGrid');  //그리드 리사이킹
					//비용상세 마지막레코드 조회
					selectLastTbReqFeeInfo();
				} else {
					reloadGrid("depositGrid", data.result);  //그리드 재로드
					btGrid.gridResizing('depositGrid');  //그리드 리사이킹
				}
			}
	    });
	}
	
	function returnPopupRslt(){
		if(confirm("<s:message code='confirm.save'/>")){
			
			var url = '/deposit/selectPopupReturnRsltAjx.do';			
			var param = {"SEQ"     : gv_seq
					   , "REQ_DT"  : gv_req_dt			  
					   };
			
			fn_ajax(url, false, param, function(data, xhr){
				if(data.MESSAGE != "OK"){
					alert("입금 저장 오류, 시스템 관리자에게 문의하세요.");
				} else {
					if(!fn_empty(data.result)){
						p_rtnData = {"PAY_DEP_AMT": data.result.pay_dep_amt   //입금예약금
								   , "DEP_IN_DT"  : data.result.dep_in_dt     //예약금입금일자
								   , "PRC_STS_NM" : data.result.prc_sts_nm};  //예약상태명
						popupClose($('#p_pickUpGbnPopup').data('pid'));
					} else {
						alert("입금 저장 오류, 시스템 관리자에게 문의하세요.");
					}	
				}
			});
		}	
	}
	
	//그리드 생성
	function createGrid(){
		var colName = [
						  '<s:message code="deposit.seq"/>'
						, '<s:message code="deposit.paydt"/>'
						, '<s:message code="deposit.paytype"/>'
						, '<s:message code="deposit.payamt"/>'
						, '<s:message code="deposit.dctamt"/>'
						, '<s:message code="deposit.invoiceamt"/>'
						, '<s:message code="deposit.balamt"/>'
						, '<s:message code="deposit.regdtm"/>'						
					];

		var colModel = [
						  { name: 'SEQ'        , width : 30 , align: 'center' , editable : true, editoptions:{readonly: true}}
						, { name: 'PAY_DT'     , width : 120, align: 'center' , editable:true, editoptions:{readonly: true}}
						, { name: 'PAY_TYPE_NM', width : 120, align: 'center' , editable:true, editoptions:{readonly: true}}
						, { name: 'PAY_AMT'    , width : 120, align: 'right'  ,  formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{readonly: true}}
						, { name: 'DCT_AMT'    , width : 120, align: 'right'  ,  formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{readonly: true}}
						, { name: 'INVOICE_AMT', width : 120, align: 'right'  ,  formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{readonly: true}}
						, { name: 'BAL_AMT'    , width : 120, align: 'right'  ,  formatter:'integer', formatoptions:{thousandsSeparator:",", decimalPlaces: 0}, editoptions:{readonly: true}}
						, { name: 'REG_DTM'    , width : 140, align: 'center' ,  editoptions:{readonly: true}}						
						
					];
		
		var gSetting = {
		        pgflg:false,
		        exportflg : false,  //엑셀, pdf 출력 버튼 노출여부
		        colsetting : false,
				searchInit : false,
				resizeing : true,
				rownumbers:false,
				shrinkToFit: false,
				autowidth: true,
				queryPagingGrid:false, // 쿼리 페이징 처리 여부
				height : 300
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('depositGrid', colName, colModel, gSetting);
	}
	
	function fnRowDelete() {
		var rowId =$("#depositGrid").jqGrid('getGridParam','selrow');
		
		if(rowId == null) {
			alert("삭제 할 행을 선택해주세요.");
			return;
		}
		
		if(confirm($("#"+rowId+"_SEQ").val() + "번 행을 삭제하시겠습니까?")){
			var pqyDctAmt = Number($("#depositGrid").jqGrid("getCell", rowId, "PAY_AMT")) + Number($("#depositGrid").jqGrid("getCell", rowId, "DCT_AMT"));
			var payType   = $("#"+rowId+"_PAY_TYPE_NM").val();
			
			var url   = '/deposit/deleteDepositAjax.do';
			var param = { "REQ_DT"      : gv_req_dt	
					  	, "REQ_SEQ"     : gv_seq
						, "PAY_DT"      : $("#"+rowId+"_PAY_DT").val()
						, "REQ_DSEQ"    : $("#"+rowId+"_SEQ").val()
						, "PAY_AMT"     : $("#depositGrid").jqGrid("getCell", rowId, "PAY_AMT")
						, "PAY_TYPE"    : ''
						, "PAY_DCT_AMT" : pqyDctAmt.toString()
						}

			if (payType == "예약") {
				param.PAY_TYPE = '03';
			}
			
			fn_ajax(url, false, param, function(data, xhr){
				if (data.result.message != 'success') {
					alert("입금 삭제 오류, 시스템 관리자에게 문의하세요.");
					return;
				}
				alert("삭제하였습니다.");
				
				var payType = $("#PAY_TYPE_SEARCH").val();
				cSearch(payType); //입금목록 조회
				
				// 삭제한 행이 마지막 행일 경우
				if ($('#depositGrid').getGridParam('reccount') == '1') {
					$("input[name='BAL_AMT']" ).val($("input[name='INVOICE_AMT']").val());  // 잔여금액 초기화
					$("input[name='ACCU_AMT']").val('0');  // 총입금금액 초기화
				}
			});
		}
	}
});

</script>