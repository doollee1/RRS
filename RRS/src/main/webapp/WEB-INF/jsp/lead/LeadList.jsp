<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Lead
	 * @Description : Lead List
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SL06" />
</c:import>

<!-- dummy -->
<div class="top_button_h_margin"></div>

<!--- 검색버튼 ---->
<div id="divBtns">
	<div id="divWindowpath">
		<span id="title1"></span><span id="title2"></span><span id="title3"></span>
	</div>
</div>
<!---------->

<div id="ctu_wrap">	
	
	<form id="frmSearch" action="#" >
		<div class="tab_top_search">
			<input type="hidden" name="CURRENT_PAGE" id="CURRENT_PAGE">
			<input type="hidden" name="ROWS_PER_PAGE" id="ROWS_PER_PAGE">
			<table  width="100%">
				<tbody>
					<tr>
						<td class="small_td" style="width:149px;"><p><s:message code="customer.partnerf"/></p></td>
						<td class="medium_td" style="width:320px;"><input type="text" name="S-PROSPECT" id="S-PROSPECT" maxlength="10">
							<button class="grid_popupbtn" id="cmm_pop_CUST_CD" name="cmm_pop_CUST_CD" type='button'></button>
							<p class="data_side_text" name="S-PROSPECT_NM" id="S-PROSPECT_NM"></p>
						</td>	
						<td class="small_td" style="width:150px;"><p><s:message code="lead.address"/></p></td>
						<td class="medium_td" style="width:320px;"><input type="text" name="S-ADDRESS_NM" id="S-ADDRESS_NM" maxlength="50"  ></td>
						<td class="small_td" style="width:150px;"><p><s:message code="customer.Country"/></p></td>
						<td><select id="S-COUNTRY_CD" name="S-COUNTRY_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td" style="width:150px;"><p><s:message code="lead.leadID"/></p></td>
						<td style="width:320px;"><input type="text" id="S-LEAD_ID" name="S-LEAD_ID" maxlength="10"></td>
						<td class="small_td"><p><s:message code="lead.description"/></p></td>
						<td><input type="text" name="S-DESCRIPTION" id="S-DESCRIPTION" style="ime-mode:disabled" ></td>
						<td class="small_td"><p><s:message code="lead.orgin"/></p></td>
						<td><select id="S-ORIGIN_TP" name="S-ORIGIN_TP" class=""></select></td>
						<td class="small_td"></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.startDate"/></p></td>
						<td><input type="text" name="S-START_DT" id="S-START_DT" data-type="date" disabled="" readonly/></td>
						<td class="small_td"><p><s:message code="lead.endDate"/></p></td>
						<td><input type="text" id="S-END_DT" name="S-END_DT" data-type="date" disabled="" readonly/></td>
						<td class="small_td"></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.mainContact"/></p></td>
						<td><input type="text" id="S-MAIN_CONTACT" name="S-MAIN_CONTACT" style="ime-mode:disabled" >
							<button class="grid_popupbtn" id="cmm_pop_CONTACT_PERSON" name="cmm_pop_CONTACT_PERSON" type='button'></button>
							<p class="data_side_text" name="S-MAIN_CONTACT_NM" id="S-MAIN_CONTACT_NM"></p>
						</td>
						<td class="small_td"><p><s:message code="lead.employeeResponsible"/></p></td>
						<td><input type="text" id="S-EMP_RESP" name="S-EMP_RESP" style="ime-mode:disabled" >
							<button class="grid_popupbtn" id="cmm_pop_EMP_CD" name="cmm_pop_EMP_CD" type='button'></button>
							<p class="data_side_text" name="S-EMP_RESP_NM" id="S-EMP_RESP_NM"></p>
						</td>
						<td class="small_td"></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.status"/></p></td>
						<td><select id="S-LEAD_STS" name="S-LEAD_STS" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.reason"/></p></td>
						<td><select id="S-LEAD_REASON" name="S-LEAD_REASON" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.qualLevel"/></p></td>
						<td><select id="S-QUAL_LVL" name="S-QUAL_LVL" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.salesOrg"/></p></td>
						<td><select id="S-SALES_ORG_CD" name="S-SALES_ORG_CD" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.distributionCh"/></p></td>
						<td><select id="S-DISTRB_CH" name="S-DISTRB_CH" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.division"/></p></td>
						<td><select id="S-DIV_CD" name="S-DIV_CD" class=""></select></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<!-------------------->


<div id="ctm_wrap">
	<!-- 그리드 시작 -->
	<div id="ctm_mg_wrap">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>Lead List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="leadGrid"></table>
		<div id="leadGrid_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>


<script type="text/javascript">
<%-- 
  * ========= 공통버튼 클릭함수 =========
  * 검색 : cSearch()
  * 추가 : cAdd()
  * 삭제 : cDel()
  * 저장 : cSave()
  * 인쇄 : cPrint()
  * 업로드 : cUpload()
  * 엑셀다운 : cExcel()
  * PDF다운 : cPdf()
  * 취소 : cCancel()
  * 사용자버튼 : cUser1() ~ cUser5()
  * -------------------------------
  * 버튼 순서 : setCommBtnSeq(['ret','list']) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * 버튼 표시/숨김 : setCommBtn('ret', true) : Search,Add,Del,Save,Print,Upload,Excel,Pdf,Cancel,User1,2,3,4,5
  * ===============================
--%>
	//초기 로드
	$(function() {
		initLayout();			
		createGrid1();
		
		$('#cBtnUser1').text("<s:message code='button.copy'/>");
		$('#cBtnUser1').addClass("cls");
		$('#cBtnUser1').addClass("cBtnCopy_style");
		$('#cBtnAdd').text("New");
		
		var codeBoxArray = [ 'S-PROSPECT'
		                    ,'S-MAIN_CONTACT'
		                    ,'S-EMP_RESP'
							,'S-LEAD_STS'
		                    ,'S-LEAD_REASON'
							,'S-QUAL_LVL'
		                    ,'S-SALES_ORG_CD'
		                    ,'S-DISTRB_CH'
		                    ,'S-DIV_CD'
		                    ,'S-ORIGIN_TP'
		                    ,'S-COUNTRY_CD'
							];
					
		createCodeBoxByArr(codeBoxArray, true);
		
		/* 그리드 grid1 이벤트 */
		$('#leadGrid').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				leadGrid_ondblClickRow(rowid, iRow, iCol, e);
			}
		}); 
		
		$('#cmm_pop_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#S-PROSPECT').val(), 'CUST');
		});
		
		$('#cmm_pop_EMP_CD').on('click', function (e) {
			openEmpPopup('S-EMP_RESP', 'S-EMP_RESP_NM');			
		});
		
		$('#cmm_pop_CONTACT_PERSON').on('click', function (e) {
			openContactPersonPopup('S-MAIN_CONTACT', 'S-MAIN_CONTACT_NM');			
		});
		
		$('#SL07-LEAD_STS').on('change', function (e) {
			var sts = $(this).val();
			$('#SL07-LEAD_REASON').empty();
			if ( sts == '02' || sts == '06' ) {
				sts = 'P';
				getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);				
			} else if ( sts == '05'	) {
				sts = 'C';
				getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);
			}
		});
		
		$('.tab_top_search input').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } }); 
	});

	function createGrid1(){
		var colName = [
					 '<s:message code="lead.leadID"/>'
				 	,'<s:message code="lead.status"/>'
					, 'Q/T No.'
				 	,'<s:message code="lead.Description"/>'
				 	,'<s:message code="customer.partnerf"/>'
				 	,'<s:message code="customer.partnerf"/>'
				 	,'<s:message code="lead.employeeResponsible"/>'
				 	,'<s:message code="lead.qual"/>'
				 	,'<s:message code="system.startdt"/>'
				 	,'<s:message code="system.stopdt"/>'
				 	,'<s:message code="lead.origin"/>'
				 	,'<s:message code="lead.mainContact"/>'
				 	,'<s:message code="report.quotation.contract"/>'
				 	,'<s:message code="lead.status"/>'
				 	,'<s:message code="mail.grd.Priority"/>'
				 	,'<s:message code="system.group"/>'
		             ];
		
		var colModel = [
				  { name: 'LEAD_NO', width: 80, align: 'center' }
				, { name: 'STATUS', width: 90, align: 'left' }
				, { name: 'REF_QT_NO', width: 100, align: 'center' }
				, { name: 'DESCRIPTION', width: 150, align: 'left' }
				, { name: 'PROSPECT', width: 100, align: 'center', hidden:true }
				, { name: 'ACCOUNT', width: 200, align: 'left' }
				, { name: 'EMP_RESP', width: 200, align: 'left' }
				, { name: 'QUALIFICATION', width: 90, align: 'center' }
				, { name: 'START_DATE', width: 90, align: 'center',formatter: 'date',
			          formatoptions: {
			              srcformat: 'ISO8601Long',
			              newformat: 'd.m.Y',
			              defaultValue:null
			          } }
				, { name: 'END_DATE', width: 90, align: 'center',formatter: 'date',
			          formatoptions: {
			              srcformat: 'ISO8601Long',
			              newformat: 'd.m.Y',
			              defaultValue:null
			          } }
				, { name: 'ORGIN', width: 100, align: 'left' }				
				, { name: 'MAIN_CONTACT', width: 350, align: 'left' }
				, { name: 'CONTACT', width: 100, align: 'center', hidden:true } 
				, { name: 'ACT_STS', width: 100, align: 'center', hidden:true }
				, { name: 'PRIORITY', width: 100, align: 'center', hidden:true }
				, { name: 'LEAD_GROUP', width: 100, align: 'center', hidden:true }
	  	];
		
		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				//autowidth: false,
				rownumbers:false,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 536
				};
		// 그리드 생성 및 초기화
		btGrid.createGrid('leadGrid', colName, colModel, gSetting);
	}
	
	function cSearch(currentPage){
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE').val())) {
			vCurrentPage = $('#CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('leadGrid_pager');
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/lead/searchLeadList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("leadGrid", data.result);
			btGrid.gridQueryPaging($('#leadGrid'), 'cSearch', data.result);
		});
	}
	
	function getLeadStatusReasonCode(codeArray, optVal, flag){
		
		var url = "/lead/getLeadStatusReasonCode.do";
			
		var tempArry = codeArray.split('-');
		tempVal = tempArry[1];
		
		var param = {"param":tempVal + ";" + optVal + ";" + getCookie("Language")};
		
		fn_ajax(url, false, param, function(data, xhr){
			var retVal = data.result.split(';');
			
			$("#" + codeArray).empty().data('options');
			
			if(flag){
				$("#" + codeArray).append('<option value=' + "" + '></option>');
			}
			
			for(j = 0; j < retVal.length; j++){
				var tempVal = retVal[j].split(':');
				$("#" + codeArray).append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
			}
		});
		

	}
	

	function openCustomerPopUp(custVal, type){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		var objCd = '';
		var objNm = '';
		
		if('CUST' == type) {
			obj = $('#S-PROSPECT');
			objNm = $('#S-PROSPECT_NM');
		} 
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if (!selecedData) {
				return;
			}
			console.log(selecedData);
			$.each(selecedData, function(k, v) {
				
				('CUST_CD' == k) ? obj.val(v) : '';
				('CUST_NM' == k) ? objNm.text(v) : '';

				if('CUST' == type){
					if('CUST_CD' == k){
						var obj2 = $('#S-PROSPECT');
						obj2.val(v);
					}else if('CUST_NM' == k){
						var objNm2 = $('#S-PROSPECT_NM');
						objNm2.text(v);
					}
					else if('STREET_NM' == k){
						var objNm2 = $('#S-ADDRESS_NM');
						objNm2.val(v);
					}
				}
			
			});
			
		});		
	}

	function openEmpPopup(code, name) {
		var gridData, resultData = [];
		var popflg = true;
		var compCdVal = parent.$('#G_COMP_CD').val();

		var sendData = {'S_CODE':$('[name="' + code + '"]').val(),
				'S_COMP_CD':compCdVal};
		
		var url = '/popup/UserPopup2.do';
		var pid = 'UserPopup2';
		
		popupOpen(url, pid, sendData, function(data) {
			
			$('[name="' + code + '"]').val(data[0].USER_ID);
			$('[name="' + name + '"]').text(data[0].NAME_FULL);
		});
	}
	
	function openContactPersonPopup(code, name) {
		var url = "/popup/ContactPersonPopup2.do";
		var pid = "ContactPersonPopup2";  //팝업 페이지의 취상위 div ID
		var param = { };
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				$('[name="' + code + '"]').val(data[0].CODE);
				$('[name="' + name + '"]').text(data[0].FULL_NM);
				
			}
		});
	}
	
	function cAdd(){
		var param = "?isStatus=N";
		
		window.top.addTab('SL07', '/lead/LeadEntry.do' + param, 'Lead Entry');
	}
	
	function cUser1(){
		var gridData = $("#leadGrid").getRowData($("#leadGrid").getGridParam('selrow'));
		var param = "?isStatus=C" + "&LEAD_NO=" + gridData["LEAD_NO"];
		
		if(!fn_empty(gridData)){
			window.top.addTab('LE_' + gridData["LEAD_NO"] + 'C', '/lead/LeadEntry.do' + param, 'LD_Copy');
		}
	}
	
	function leadGrid_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#leadGrid").getRowData(rowid);
		var param = "?isStatus=S" + "&LEAD_NO=" + gridData["LEAD_NO"];
		
		window.top.addTab('LE_' + gridData["LEAD_NO"], '/lead/LeadEntry.do' + param, 'L.E-' + gridData["LEAD_NO"]);
		//window.top.addTab('SL07', '/lead/LeadEntry.do' + param, 'Lead Entry');
	}
	

</script>

<c:import url="../import/frameBottom.jsp" />