<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<%
	/**
	 * @Name : Lead Report
	 * @Description : Lead Report
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="LeadReport" />
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
			<table width="100%">
				<tbody>
					<tr>
						<td class="small_td" width="150px"><p><s:message code="lead.Prospect"/></p></td>
						<td class="medium_td" width="320px"><input type="text" name="S-PROSPECT" id="S-PROSPECT" maxlength="10">	
						<button class="grid_popupbtn" id="cmm_pop_CUST_CD" name="cmm_pop_CUST_CD" type='button'></button>	
						<p class="data_side_text" name="S-PROSPECT_NM" id="S-PROSPECT_NM"></p>			
						<td class="small_td" width="150px"><p><s:message code="lead.address"/></p></td>
						<td class="medium_td" width="320px"><input type="text" name="S-ADDRESS_NM" id="S-ADDRESS_NM" maxlength="50"></td>
						<td class="small_td"  width="150px"><p><s:message code="lead.leadID"/></p></td>
						<td width="320px"><input type="text" id="S-LEAD_ID" name="S-LEAD_ID" maxlength="10"></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.status"/></p></td>
						<td><select id="S-LEAD_STS" name="S-LEAD_STS" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.startDate"/></p></td>
						<td><input type="text" name="S-START_DT" id="S-START_DT" data-type="date" readonly/></td>
						<td class="small_td"><p><s:message code="lead.endDate"/></p></td>
						<td><input type="text" id="S-END_DT" name="S-END_DT" data-type="date" readonly/></td>
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
							<p class="data_side_text" name="S-EMP_RESP_NM" id="S-EMP_RESP_NM"></p></td>
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
							];
					
		createCodeBoxByArr(codeBoxArray, true);
		
		$('#S-PROSPECT').on('keypress', function (e) {
			if(e.which == 13){
				(this.value != "") ? cSearch(null) : '';
			}
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
		
		$('#cmm_pop_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#S-PROSPECT').val(), 'CUST');
		});
		
		$('#cmm_pop_EMP_CD').on('click', function (e) {
			openEmpPopup('S-EMP_RESP', 'S-EMP_RESP_NM');			
		});
		
		$('#cmm_pop_CONTACT_PERSON').on('click', function (e) {
			openContactPersonPopup('S-MAIN_CONTACT', 'S-MAIN_CONTACT_NM');			
		});
		
		//cSearch();
	});

	function createGrid1(){
		var colName = [
				  '<s:message code="customer.Company"/>'
				, '<s:message code="customer.Company"/>'
				, '<s:message code="lead.leadID"/>'
				, '<s:message code="lead.status"/>'
				, '<s:message code="customer.custCd"/>'
				, '<s:message code="customer.CustNm"/>'
				, '<s:message code="lead.grd.address"/>'
				, '<s:message code="lead.employeeResponsible"/>'
				, '<s:message code="lead.startDate"/>'
				, '<s:message code="lead.endDate"/>'
				, '<s:message code="lead.orgin"/>'
				, '<s:message code="sales.grd.SOrg"/>'
				, '<s:message code="sales.grd.SOrg"/>'
				, '<s:message code="sales.grd.DChl"/>'
				, '<s:message code="sales.grd.DChl"/>'
				, '<s:message code="sales.grd.Dv"/>'
				, '<s:message code="sales.grd.Dv"/>'
				, '<s:message code="lead.mainContact"/>'
				, '<s:message code="lead.employee"/>'
				, '<s:message code="lead.reason"/>'
				, '<s:message code="lead.qualLevel"/>'
				, '<s:message code="lead.description"/>'
				, '<s:message code="lead.CustomerNotes(printed)"/>'
				, '<s:message code="lead.leadType"/>'
				, '<s:message code="mail.grd.Priority"/>'
				, '<s:message code="lead.leadgroup"/>'
				, '<s:message code="lead.PrivatesNotes"/>'
				, '<s:message code="lead.grd.Status"/>'
				, '<s:message code="lead.grd.Status"/>'
				, '<s:message code="customer.createDate"/>'
				, '<s:message code="customer.regid"/>'
				, '<s:message code="customer.changeDate"/>'
				, '<s:message code="customer.updateid"/>'
				, '<s:message code="sales.grd.Item"/>'
				, '<s:message code="lead.productId"/>'
				, '<s:message code="report.quotation.material"/>'
				, '<s:message code="material.quantity"/>'
				, '<s:message code="material.unit"/>'
				, '<s:message code="lead.ReqDeliveryMon"/>'
				, '<s:message code="lead.PartnerFunc"/>'
				, '<s:message code="lead.PartnerFunc"/>'
				, '<s:message code="lead.PartnerID"/>'
				, '<s:message code="lead.Name"/>'
				, '<s:message code="lead.grd.address"/>'
				, '<s:message code="lead.grd.mainPartner"/>'
				, '<s:message code="lead.grd.phone"/>'
				, '<s:message code="lead.grd.email"/>'
				, '<s:message code="quotation.grd.textType"/>'
				, '<s:message code="quotation.grd.textType"/>'
				, '<s:message code="lead.grd.Language"/>'
				, '<s:message code="lead.grd.Language"/>'
				, '<s:message code="lead.grd.Text"/>'
				, '<s:message code="lead.Description"/>'
				, '<s:message code="lead.account"/>'
				, '<s:message code="lead.Location"/>'
				, '<s:message code="lead.mainContact"/>'
				, '<s:message code="lead.Date"/>'
				, '<s:message code="lead.Category"/>'
				, '<s:message code="lead.Category"/>'
				, '<s:message code="material.salesOrg"/>'
				, '<s:message code="material.salesOrg"/>'
				, '<s:message code="lead.Importance"/>'
				, '<s:message code="lead.ActiveStatus"/>'
		              ];
		
		var colModel = [
				  { name: 'COMP_CD', width : 100, align: 'left', hidden:true }
				, { name: 'COMP_NM', width : 100, align: 'left', hidden:true }
				, { name: 'LEAD_NO', width : 80, align: 'left' }
				, { name: 'STS_NM', width : 70, align: 'center' }
				, { name: 'CUST_CD', width : 100, align: 'left' }
				, { name: 'CUST_NM', width : 150, align: 'left' }
				, { name: 'ADDR', width : 100, align: 'left' }
				, { name: 'EMP_RESP_NO', width : 120, align: 'left' }
				, { name: 'START_DT', width : 100, align: 'center' }
				, { name: 'END_DT', width : 100, align: 'center' }
				, { name: 'ORGN_TP', width : 70, align: 'center' }
				, { name: 'SALES_ORG_CD', width : 70, align: 'center' }
				, { name: 'SALES_ORG_NM', width : 150, align: 'left' }
				, { name: 'DISTRB_CH', width : 70, align: 'center' }
				, { name: 'DISTRB_CH_NM', width : 100, align: 'left' }
				, { name: 'DIV_CD', width : 70, align: 'center' }
				, { name: 'DIV_NM', width : 100, align: 'left' }
				, { name: 'M_PS_NO', width : 100, align: 'left' }
				, { name: 'EMP_NO', width : 100, align: 'left' }
				, { name: 'RSN_CD', width : 70, align: 'center' }
				, { name: 'QUAL_LVL', width : 70, align: 'center' }
				, { name: 'LEAD_DESC', width : 150, align: 'left' }
				, { name: 'CUST_NOTE', width : 150, align: 'left' }
				, { name: 'LEAD_TP', width : 100, align: 'left' }
				, { name: 'PRIOTY', width : 100, align: 'left' , hidden:true}
				, { name: 'LEAD_GR', width : 100, align: 'left' , hidden:true}
				, { name: 'PRV_NOTE', width : 100, align: 'left' , hidden:true}
				, { name: 'STATUS', width : 70, align: 'left', hidden:true}
				, { name: 'STATUS_NM', width : 70, align: 'center' }
				, { name: 'REG_DT', width : 100, align: 'center', hidden:true}
				, { name: 'REG_ID', width : 70, align: 'left' , hidden:true}
				, { name: 'UPT_DT', width : 100, align: 'center', hidden:true}
				, { name: 'UPT_ID', width : 70, align: 'left' , hidden:true}
				, { name: 'ITEM_SEQ', width : 60, align: 'center' }
				, { name: 'MATL_CD', width : 100, align: 'left' }
				, { name: 'MATL_NM', width : 150, align: 'left' }
				, { name: 'QTY', width : 70, align: 'right' }
				, { name: 'UNIT_CD', width : 70, align: 'left' }
				, { name: 'DELI_MON', width : 100, align: 'center' , formatter: "date", formatoptions: { newformat: " d.m.Y" }}
				, { name: 'PF_TP', width : 70, align: 'left' }
				, { name: 'PF_TP_NM', width : 120, align: 'left' }
				, { name: 'PF_PS_NO', width : 70, align: 'left' }
				, { name: 'PF_NM', width : 100, align: 'left' }
				, { name: 'ADDR_PART', width : 100, align: 'left' }
				, { name: 'M_PART_YN', width : 70, align: 'center' }
				, { name: 'TEL_NO', width : 100, align: 'left' }
				, { name: 'E_MAIL', width : 100, align: 'left' }
				, { name: 'TEXT_TP', width : 70, align: 'left' }
				, { name: 'TEXT_TP_NM', width : 100, align: 'left' }
				, { name: 'LANG_CD', width : 70, align: 'left' }
				, { name: 'LANG_NM', width : 100, align: 'left' }
				, { name: 'NOTE_TEXT', width : 120, align: 'left' }
				, { name: 'ACT_DESC', width : 120, align: 'left' , hidden:true}
				, { name: 'ACCOUNT_CD', width : 100, align: 'left' , hidden:true}
				, { name: 'LOCATION', width : 70, align: 'left', hidden:true }
				, { name: 'M_PS_NO_INACT', width : 100, align: 'left' , hidden:true}
				, { name: 'ACT_DT', width : 100, align: 'center', hidden:true }
				, { name: 'ACT_CTG', width : 70, align: 'center' , hidden:true}
				, { name: 'ACT_CTG_NM', width : 120, align: 'left' , hidden:true}
				, { name: 'SALES_ORG_CD_INTACT', width : 70, align: 'center', hidden:true}
				, { name: 'SALES_ORG_NM_INTACT', width : 120, align: 'left', hidden:true }
				, { name: 'IMPT_CL', width : 70, align: 'center', hidden:true }
				, { name: 'ACT_STS', width : 70, align: 'center', hidden:true}
	  	];
		
		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				autowidth: false,
				rownumbers:false,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height : 537
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
		
		var url = "/report/retrieveLeadReport.do";
		
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
	</script>
<c:import url="../import/frameBottom.jsp" />