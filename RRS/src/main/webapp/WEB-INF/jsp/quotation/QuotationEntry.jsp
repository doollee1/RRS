<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Quotation
	 * @Description : Quotation List
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SL05" />
</c:import>

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<!--- 검색버튼 ---->
<div id="divBtns">
	<div id="divWindowpath">
		<span id="title1"></span><span id="title2"></span><span id="title3"></span>
	</div>
</div>
<!---------->

<div id="ctu_wrap">
	<input type="hidden"  name="partnerGrid_CURRENT_PAGE"  id="partnerGrid_CURRENT_PAGE" />
	<input type="hidden"  name="partnerGrid_ROWS_PER_PAGE" id="partnerGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="textGrid_CURRENT_PAGE"  id="textGrid_CURRENT_PAGE" />
	<input type="hidden"  name="textGrid_ROWS_PER_PAGE" id="textGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="itemGrid_CURRENT_PAGE"  id="itemGrid_CURRENT_PAGE" />
	<input type="hidden"  name="itemGrid_ROWS_PER_PAGE" id="itemGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="conditionGrid_CURRENT_PAGE"  id="conditionGrid_CURRENT_PAGE" />
	<input type="hidden"  name="conditionGrid_ROWS_PER_PAGE" id="conditionGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="conditionGridDtl_CURRENT_PAGE"  id="conditionGridDtl_CURRENT_PAGE" />
	<input type="hidden"  name="conditionGridDtl_ROWS_PER_PAGE" id="conditionGridDtl_ROWS_PER_PAGE" />
	<input type="hidden"  name="scGrid_CURRENT_PAGE"  id="scGrid_CURRENT_PAGE" />
	<input type="hidden"  name="scGrid_ROWS_PER_PAGE" id="scGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="thGrid_CURRENT_PAGE"  id="thGrid_CURRENT_PAGE" />
	<input type="hidden"  name="thGrid_ROWS_PER_PAGE" id="thGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="hisGrid_CURRENT_PAGE"  id="hisGrid_CURRENT_PAGE" />
	<input type="hidden"  name="hisGrid_ROWS_PER_PAGE" id="hisGrid_ROWS_PER_PAGE" />
	
	<!-- operator top end -->
	<div class="tab_top_search">
		<table>
			<tbody>
				<tr>
					<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.quotationNo"/></p></td>
					<td><input type="text" name="S-DOC_NO" id="S-DOC_NO" maxlength="15" ess="ess"></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>  
	
	<!--  tab start -->
	<div id="tabs">
		<ul>
			<li class="matrix_tab"><a href="#quotation_tab">QuotationHeader</a></li>
			<li class="matrix_tab"><a href="#partner_tab">Partner & Texts</a></li>
			<li class="matrix_tab"><a href="#items_tab">Items</a></li>
			<li class="matrix_tab"><a href="#item_detail_tab">ItemDetail</a></li>
			<li class="matrix_tab"><a href="#condition_tab">Condition</a></li>
			<li class="matrix_tab" style="display:none;"><a href="#schedule_line_tab">ScheduleLine</a></li>
			<li class="matrix_tab" style="display:none;"><a href="#transaction_history_tab">TransactionHistory</a></li>
			<li class="matrix_tab"><a href="#change_history_tab">ChangeHistory</a></li>
		</ul>
		
		<form id="frmHeader" action="#">
			<!----- tab 1 ----->
			<div id="quotation_tab">
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="quotation.infomation"/></h4>
					</div>
					<div class="ct_grid_top_right">
						<p class="alert_approval_ready" style="display:none;"><i class="fa fa-info-circle"></i>Approval Required</p>
						<p class="alert_approval_ing" style="display:none;"><i class="fa fa-info-circle"></i>Approval Pending</p>
						<p class="alert_approval_reject" style="display:none;"><i class="fa fa-info-circle"></i>Approval Rejected</p>
						<p class="alert_approval_closed" style="display:none;"><i class="fa fa-info-circle"></i>Closed</p>
						<p class="alert_approval_SOcreated" style="display:none;"><i class="fa fa-info-circle"></i>S/O Created</p>
						<p class="alert_approval_complete" style="display:none;"><i class="fa fa-info-circle"></i>Approval Complete</p>					
					</div>									
				</div>
				<table class="table_line_quo" width="100%">
					<tr>
						<td class="small_td"><p><s:message code="quotation.quotationNo"/></p></td>
						<td><input type="text" name="SL05-DOC_NO" id="SL05-DOC_NO" maxlength="15" readonly disabled="" data-dbcolumn="DOC_NO"></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.quotType"/></p></td>
						<td><input type="text" name="SL05-DOC_TP" id="SL05-DOC_TP" value="ZAGM" readonly disabled="">
							<p class="data_side_text" name="SL05-DOC_TP_NM" id="SL05-DOC_TP_NM">Quotation Modules</p></td>
						<td class="small_td"><p><s:message code="quotation.poNo"/></p></td>
						<td><input type="text" name="SL05-PO_NO" id="SL05-PO_NO" maxlength="35"></td>
					</tr>
					<tr>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.validFrom"/></p></td>
						<td><input type="text" id="SL05-VAL_FR_DT" name="SL05-VAL_FR_DT" data-type="date" readonly disabled="" ess="ess"/></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.validTo"/></p></td>
						<td><input type="text" name="SL05-VAL_TO_DT" id="SL05-VAL_TO_DT" data-type="date" readonly disabled="" ess="ess"/></td>
						<td class="small_td"><p><s:message code="quotation.poDate"/></p></td>
						<td><input type="text" name="SL05-PO_DT" id="SL05-PO_DT" data-type="date" readonly disabled=""/></td>
					</tr>
					<tr>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.soldTo"/></p></td>
						<td><input  class="side_front_Sinput" type="text" name="SL05-SOLD_CUST_CD" id="SL05-SOLD_CUST_CD" maxlength="10" ess="ess" onKeyPress="fn_onlyNum(this)">
							<button class="grid_popupbtn" id="cmm_pop_SOLD_CUST_CD" name="cmm_pop_SOLD_CUST_CD" type='button'></button>
							<p class="data_side_text" name="SL05-SOLD_CUST_NM" id="SL05-SOLD_CUST_NM"></p></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.shipTo"/></p></td>
						<td><input  class="side_front_Sinput" type="text" name="SL05-SHIP_CUST_CD" id="SL05-SHIP_CUST_CD" maxlength="10" ess="ess" readonly disabled="">
							<p class="data_side_text" name="SL05-SHIP_CUST_NM" id="SL05-SHIP_CUST_NM"></p></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="sales.billto"/></p></td>
						<td><input  class="side_front_Sinput" type="text" name="SL05-BILL_CUST_CD" id="SL05-BILL_CUST_CD" maxlength="10" ess="ess" readonly disabled="">
							<p class="data_side_text" name="SL05-BILL_CUST_NM" id="SL05-BILL_CUST_NM"></p></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.customerClass"/></p></td>
						<td><input class="side_front_Sinput" type="text" name="SL05-CUST_CL" id="SL05-CUST_CL" readonly disabled="">
							<p class="data_side_text" name="SL05-CUST_CL_NM" id="SL05-CUST_CL_NM"></td>
						<td class="small_td"><p><s:message code="quotation.industry"/></p></td>
						<td><input  class="side_front_Sinput" type="text" name="SL05-INDUSTRY_CD" id="SL05-INDUSTRY_CD" readonly disabled="">
							<p class="data_side_text" name="SL05-INDUSTRY_CD_NM" id="SL05-INDUSTRY_CD_NM"></td>
						<td class="small_td"><p><s:message code="quotation.customerGroup"/></p></td>
						<td><input  class="side_front_Sinput" type="text" name="SL05-CUST_GR_CD" id="SL05-CUST_GR_CD" readonly disabled="">
							<p class="data_side_text" name="SL05-CUST_GR_NM" id="SL05-CUST_GR_NM"></td>
					</tr>
				</table>
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="quotation.sales"/></h4>
					</div>
				</div>
				<table class="table_line_quo" width="100%">
					<tr>
						<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
						<td><input class="side_front_Sinput"  type="text" name="SL05-SALES_ORG_CD" id="SL05-SALES_ORG_CD" readonly disabled="">
							<p class="data_side_text" name="SL05-SALES_ORG_CD_NM" id="SL05-SALES_ORG_CD_NM"></td>
						<td class="small_td"><p><s:message code="quotation.distributionCh"/></p></td>
						<td><input class="side_front_Sinput"  type="text" name="SL05-DISTRB_CH" id="SL05-DISTRB_CH" readonly disabled="">
							<p class="data_side_text" name="SL05-DISTRB_CH_NM" id="SL05-DISTRB_CH_NM"></td>
						<td class="small_td"><p><s:message code="quotation.division"/></p></td>
						<td><input class="side_front_Sinput"  type="text" name="SL05-DIV_CD" id="SL05-DIV_CD" readonly disabled="">
							<p class="data_side_text" name="SL05-DIV_CD_NM" id="SL05-DIV_CD_NM"></td>
						
					</tr>
					<tr>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.salesOfc"/></p></td>
						<td><select name="SL05-SALES_OFFICE_CD" id="SL05-SALES_OFFICE_CD" ess="ess"></select></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.salesGrp"/></p></td>
						<td><select name="SL05-SALES_GR" id="SL05-SALES_GR" ess="ess"></select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.reqDelDate"/></p></td>
						<td class="Sbox_in_sel"><select name="SL05-DT_TP" id="SL05-DT_TP"></select>
							<input type="text" name="SL05-REQ_DELI_DT_TYPE" id="SL05-REQ_DELI_DT_TYPE" readonly disabled="" style="display:none;"/>
							<input type="text" name="SL05-REQ_DELI_DT" id="SL05-REQ_DELI_DT" data-type="date" readonly disabled="" /></td>
						<td class="small_td"><p><s:message code="quotation.ordRea"/></p></td>
						<!-- LJM 04,26 ORDER REASON 수정 가능하도록 요청-->
						<td colspan="3"><select name="SL05-ORD_RESN_CD" id="SL05-ORD_RESN_CD"></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.delPl"/></p></td>
						<td><select name="SL05-DELI_PLANT_CD" id="SL05-DELI_PLANT_CD" ></select></td>
						<td><p><s:message code="quotation.compDlv"/></p></td>
						<td><label class="checkbox"><input type="checkbox" id="SL05-CMP_DELI_YN" name="SL05-CMP_DELI_YN"><i></i>&nbsp;</label></td>
						<td class="small_td"><p><s:message code="quotation.attrOrd"/></p></td>
						<td><select name="SL05-ATTR_ORD" id="SL05-ATTR_ORD" ></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.totalWgt"/></p></td>
						<td class="Sbox_in_sel"><input type="text" name="SL05-T_WT" id="SL05-T_WT" style="text-align:right;" data-dbcolumn="T_WT" data-validcurrency="T_WT" maxlength="13" readonly disabled="">
<!-- 							<p style="float:left;"  class="box_pb_sign">/</p> -->
							<input class="grid_input_eur" type="text" name="SL05-WEIGHT" id="SL05-WEIGHT" style="margin-left: 4px;" readonly disabled=""></td>
						<td class="small_td"><p><s:message code="quotation.volume"/></p></td>
						<td class="Sbox_in_sel"><input type="text" name="SL05-VOL_QTY" id="SL05-VOL_QTY" style="text-align:right;" data-dbcolumn="VOL_QTY" data-validcurrency="VOL_QTY" maxlength="13" readonly disabled="">
<!-- 							<p style="float:left;"  class="box_pb_sign">/</p> -->
							<input class="grid_input_eur" type="text" name="SL05-VOLUME" id="SL05-VOLUME" style="margin-left: 5px;"readonly disabled=""></td>
						<td class="small_td"><p><s:message code="quotation.priceDate"/></p></td>
						<td><input type="text" name="SL05-PRICE_DT" id="SL05-PRICE_DT" data-type="date" readonly disabled="" /></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.totalAmt"/></p></td>
						<td><input type="text" name="SL05-T_AMT" id="SL05-T_AMT" style="text-align:right;" data-dbcolumn="T_AMT" data-validcurrency="T_AMT" maxlength="13" readonly disabled="">
						<td class="small_td"><p><s:message code="quotation.docCurr"/></p></td>
						<td class="Sbox_in_sel">
							<input type="text" name="SL05-EXCHG_RATE" id="SL05-EXCHG_RATE" style="text-align:right; " data-dbcolumn="EXCHG_RATE" data-validexchg="EXCHG_RATE" maxlength="13" >
							<input type="text" name="SL05-CURR_VAL" id="SL05-CURR_VAL" style="text-align:right; display: none;" data-dbcolumn="CURR_VAL" data-validcurrency="CURR_VAL" maxlength="13" readonly disabled="" value="1,00">
<!-- 							<p style="float:left;" class="box_pb_sign">/</p> -->
							<input class="grid_input_eur" type="text" name="SL05-CURR_CD" id="SL05-CURR_CD" style="margin-left: 5px;" readonly disabled="" value="EUR">
							<button class="grid_popupbtn" id="cmm_pop_CURR_CD" name="cmm_pop_CURR_CD" type='button'></button></td>
						<td class="small_td"><p><s:message code="quotation.surCharge"/></p></td>
						<td><input type="text" name="SL05-SUR_CHARGE_AMT" id="SL05-SUR_CHARGE_AMT" style="text-align:right;" data-dbcolumn="SUR_CHARGE_AMT" data-validcurrency="SUR_CHARGE_AMT" maxlength="13"></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.netValue"/></p></td>
						<td><input type="text" name="SL05-NET_AMT" id="SL05-NET_AMT" style="text-align:right;" data-dbcolumn="NET_AMT" data-validcurrency="NET_AMT" maxlength="13" readonly disabled=""></td>
						<td class="small_td"><p><s:message code="quotation.vat"/></p></td>
						<td><input type="text" name="SL05-VAT_AMT" style="text-align:right;" id="SL05-VAT_AMT" data-dbcolumn="VAT_AMT" data-validcurrency="VAT_AMT" maxlength="13" readonly disabled="">
<!-- 							<p style="float:left;" class="box_pb_sign">/</p> -->
							<input class="grid_input_eur" type="text" name="SL05-VAT" id="SL05-VAT" style="display: none;" readonly disabled=""></td>
						<td class="small_td"><p><s:message code="quotation.dlvAmt"/></p></td>
						<td><input type="text" name="SL05-DLV_AMT" id="SL05-DLV_AMT" style="text-align:right;" data-dbcolumn="DLV_AMT" data-validcurrency="DLV_AMT" maxlength="13"></td>
					</tr>
					<tr>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.paymentTerms"/></p></td>
						<td><input type="text" class="side_front_Sinput" name="SL05-PAY_TERM" id="SL05-PAY_TERM" readonly disabled="">
							<button class="grid_popupbtn" id="cmm_pop_PAY_TERM" name="cmm_pop_PAY_TERM" type='button'></button>
							<p class="data_side_text" name="SL05-PAY_TERM_NM" id="SL05-PAY_TERM_NM" class="data_under_text"></p></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.incoterms"/></p></td>
						<td class="Sbox_in_sel"><select name="SL05-INCOTERMS_CD" id="SL05-INCOTERMS_CD" ess="ess"></select>
							<input type="text" name="SL05-INCOTERMS_DESC" id="SL05-INCOTERMS_DESC" ess="ess" maxlength="28" style="width:200px !important;"></td>
						<td class="small_td"><p><s:message code="quotation.discount"/></p></td>
						<td class="Sbox_in_sel"><select name="SL05-DC_TP" id="SL05-DC_TP">
							<option value="A">Amount</option><option value="R">Rate(%)</option></select>
<!-- 							<p style="float:left;"  class="box_pb_sign">/</p> -->
							<input type="text" name="SL05-DC_VAL" id="SL05-DC_VAL" style="text-align:right; width:110px !important; margin-left: 4px;" data-validcurrency="DC_VAL" maxlength="13"></td>
					</tr>
					<tr>
						<!--
						TODO
						<td class="small_td"><p><s:message code="quotation.delBlc"/></p></td>
						<td><select name="SL05-DELI_BLOCK_CD" id="SL05-DELI_BLOCK_CD" readonly disabled=""></select></td>
						-->
						<td class="small_td"><p>Quotation Status</p></td>
						<td><select name="SL05-QT_STS_CD" id="SL05-QT_STS_CD"></select></td>
						<td class="small_td"><p><s:message code="quotation.ovlSts"/></p></td>
						<td><select name="SL05-OVL_STS" id="SL05-OVL_STS" readonly disabled=""></select></td>
						<td class="small_td"><p><s:message code="quotation.delSts"/></p></td>
						<td><select name="SL05-DELI_STS" id="SL05-DELI_STS" readonly disabled=""></select></td>
					</tr>
					<tr>
						<!-- <td class="small_td"><p><s:message code="quotation.dunBlc"/></p></td>
						<td><select name="SL05-DUN_BLOCK" id="SL05-DUN_BLOCK"></select></td> -->
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="quotation.shippingCond"/></p></td>
						<td><select name="SL05-SHP_CON_CD" id="SL05-SHP_CON_CD" ess="ess"></select></td>
						<td><p><s:message code="quotation.podRelevan"/></p></td>
						<td><label class="checkbox"><input type="checkbox" name="SL05-REL_POD_YN" id="SL05-REL_POD_YN" ><i></i>&nbsp;</label></td>
						<td><p><s:message code="quotation.availbledAmt"/></p></td>
						<td><input type="text" name="SL05-AVAIL_AMT" id="SL05-AVAIL_AMT" readonly disabled="" style="text-align:right;"></td>
					</tr>
				</table>
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="quotation.status"/></h4>
					</div>
				</div>
				<table class="table_line_quo" width="100%">
					<tr>
						<td class="small_td"><p><s:message code="quotation.leadNo"/></p></td>
						<td><input type="text" name="SL05-LEAD_NO" id="SL05-LEAD_NO" readonly disabled="">
						<td class="small_td"><p><s:message code="quotation.refDocHeadNo"/></p></td>
						<td><input type="text" name="SL05-REF_DOC_NO" id="SL05-REF_DOC_NO" readonly disabled="">
						<!-- <td class="small_td"><p><s:message code="quotation.refDocHeadStatus"/></p></td>
						<td><select id="SL05-REF_DOC_H_STS" name="SL05-REF_DOC_H_STS"></select></td>
						<td class="small_td"><p><s:message code="quotation.totRefStaAllItem"/></p></td>
						<td><select id="SL05-T_REF_STS" name="SL05-T_REF_STS"></select></td> -->
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<!-- <tr>
						<td class="small_td"><p><s:message code="quotation.rejStatus"/></p></td>

						<td><select id="SL05-RJT_STS" name="SL05-RJT_STS"></select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.blockReas"/></p></td>
						<td><input type="text" name="SL05-BLK_RES" id="SL05-LBLK_RES" readonly disabled="">
						<td class="small_td"><p><s:message code="quotation.customerSts"/></p></td>
						<td><select id="SL05-CUST_STS" name="SL05-CUST_STS"></select></td>
						<td></td>
						<td></td>
					</tr>
					 -->
				</table>
			</div>
			<input type="hidden" name="SL05-isStatus" id="SL05-isStatus" />
			<input type="hidden" name="SL05-STATUS" id="SL05-STATUS" />
			<input type="hidden" name="SL05-REJECT_RSN" id="SL05-REJECT_RSN" />
			<!-- <input type="hidden" name="SL05-RSN_RJT_CD" id="SL05-RSN_RJT_CD" />  -->
			<input type="hidden" name="SL05-ORG_DOC_NO" id="SL05-ORG_DOC_NO" />
			<input type="hidden" name="SL05-DOC_STATUS" id="SL05-DOC_STATUS" />
			<input type="hidden" name="SL05-TEMP_DOC_NO" id="SL05-TEMP_DOC_NO" />
			<input type="hidden" name="SL05-ALLOW_STS" id="SL05-ALLOW_STS"/>
			<input type="hidden" name="SL05-APPROVAL_STS" id="SL05-APPROVAL_STS"/>
			<input type="hidden" name="SL05-ERP_T_AMT" id="SL05-ERP_T_AMT" />
			<input type="hidden" name="SL05-ERP_NET_AMT" id="SL05-ERP_NET_AMT" />
			<input type="hidden" name="SL05-ERP_VAT_AMT" id="SL05-ERP_VAT_AMT" />
			<input type="hidden" name="SL05-MODI_TMS" id="SL05-MODI_TMS" />
			<input type="hidden" name="SL05-LOGIN_ID" id="SL05-LOGIN_ID" value="${loginVO.userId}"/>
		</form>
		
		<form id="frmPartner" action="#">
			<!----- tab 2 ----->
			<div id="partner_tab">
				<div id="ctm_wrap">
					<!-- 그리드 시작 -->
					<div id="ctm_mg_wrap">
						<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
							<div class="ct_grid_top_wrap">								
									<div class="ct_grid_top_left">
										<h4><s:message code="quotation.partnerFnc"/></h4>	
									</div>
									<div class="ct_grid_top_right">
										<button class='btn btn-default' id='partner_btnAdd' name='partner_btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
										<button class='btn btn-default' id='partner_btnDel' name='partner_btnDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
									</div>								
							</div>
							<table id="partnerGrid"></table>
							<div id="partnerGrid_pager"></div>
						</div>
						
						<div  class="ctu_gl_wrap ctu_resize"  style="width:calc(70% - 10px);  float:left; padding-top:0px;">
							<div class="ct_grid_top_wrap">								
								<div class="ct_grid_top_left">
									<h4><s:message code="quotation.texts"/></h4>
								</div>
								<div class="ct_grid_top_right">
									<button class='btn btn-default' id='text_btnAdd' name='text_btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
									<button class='btn btn-default' id='text_btnDel' name='text_btnDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
								</div>
							</div>
							<table id="textGrid"></table>
							<div id="textGrid_pager"></div>
						</div>
						<div class="ctu_gr_wrap ctu_resize" style="width:calc(30% - 10px); padding-top:0px;">
						<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left">
									<h4>Contents</h4>
								</div>
								<div class="ct_grid_top_right">
								</div>
							</div>
							<div><textarea id='head_long_txt' name='head_long_txt' style="width:99%; height:300px; margin-top:-1px;"></textarea></div>
						</div>
					</div>
					<!-- 그리드 끝 -->
					<p>&nbsp;</p>
				</div>
			</div>
		</form>
		
		<form id="frmItem" action="#">
			<!----- tab 3 ----->
			<div id="items_tab">
				<div id="ctm_wrap">
					<!-- 그리드 시작 -->
					<div id="ctm_mg_wrap">
						<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
							<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left">
									<h4><s:message code="quotation.itemList"/></h4>
								</div>
								<div class="ct_grid_top_right">
									<button class='btn btn-default' id='item_btnPirce' name='item_btnPirce' type='button'><i class='fa fa-euro'></i>Pricing</button>
									<button class='btn btn-default' id='item_btnStock' name='item_btnStock' type='button' style="display: none;"><i class='fa fa-cube'></i>Stock</button>
									<button class='btn btn-default' id='item_btnAdd' name='item_btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
									<button class='btn btn-default' id='item_btnDel' name='item_btnDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
								</div>
							</div>
							<table id="itemGrid"></table>
							<div id="itemGrid_pager"></div>
						</div>
					</div>
					<!-- 그리드 끝 -->
					<p>&nbsp;</p>
				</div>
			</div>
		</form>
		
		<form id="frmItemDtl" action="#">
			<!----- tab 4 ----->
			<div id="item_detail_tab">
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
					<h4><s:message code="quotation.item"/>&nbsp;<input type="text" name="SL05-DTL_ITEM_SEQ" id="SL05-DTL_ITEM_SEQ" readonly disabled=""></h4>
					</div>
					<div class="ct_grid_top_right">
						<button class='btn btn-default' id='itemDtl_btnPre' name='itemDtl_btnPre' type='button'><i class='fa fa-angle-left'></i><s:message code='button.pre'/></button>
						<button class='btn btn-default' id='itemDtl_btnNxt' name='itemDtl_btnNxt' type='button'><s:message code='button.next'/>&nbsp;<i class='fa fa-angle-right'></i></button>
					</div>
				</div>
			
				<table width="100%" class="table_line_quo">
					<tr>
						<td class="small_td"><p><s:message code="quotation.material"/></p></td>
						<td><input class="side_front_Sinput" type="text" name="SL05-ITEM_DTL_MATL_CD" id="SL05-ITEM_DTL_MATL_CD" data-dbcolumn="MATL_CD" readonly disabled="">
							<p name="SL05-ITEM_DTL_MATL_NM" id="SL05-ITEM_DTL_MATL_NM" class="data_side_text"></p>
						</td>
						<td class="small_td"><p><s:message code="quotation.itemCat"/></p></td>
						<td><select name="SL05-ITEM_CTG_GR" id="SL05-ITEM_CTG_GR" data-dbcolumn="ITEM_CTG_GR" readonly disabled="" ></select></td>
						<td class="small_td"><p><s:message code="quotation.orderQty"/></p></td>
						<td class="Sbox_in_sel"><input type="text" name="SL05-ITEM_DTL_ORD_QTY" id="SL05-ITEM_DTL_ORD_QTY" data-dbcolumn="ORD_QTY" data-validcurrency="ITEM_DTL_ORD_QTY" maxlength="13" readonly disabled="">
							<select  name="SL05-ORD_UNIT_CD" id="SL05-ORD_UNIT_CD" data-dbcolumn="ORD_UNIT_CD" readonly disabled=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.fdd"/></p></td>
						<td class="Sbox_in_sel"><select name="SL05_ITEM_DETAIL-DT_TP" id="SL05_ITEM_DETAIL-DT_TP" style="width:80px;" data-dbcolumn="DELI_DT_1ST_TP" readonly disabled=""></select>
							<input type="text" name="SL05-DELI_DT_1ST_TYPE" id="SL05-DELI_DT_1ST_TYPE" readonly disabled="" style="display:none;"/>
							<input type="text" name="SL05-DELI_DT_1ST" id="SL05-DELI_DT_1ST" readonly disabled="" data-dbcolumn="DELI_DT_1ST"/></td>
						<td class="small_td"><p><s:message code="quotation.route"/></p></td>
						<td><select name="SL05-RUT_CD" id="SL05-RUT_CD" data-dbcolumn="RUT_CD"></select></td>
						<td class="small_td"><p><s:message code="quotation.delPri"/></p></td>
						<td><select name="SL05-DELI_PRIOR_CD" id="SL05-DELI_PRIOR_CD" data-dbcolumn="DELI_PRIOR_CD"></select></td>
<%-- 						<td class="small_td"><p><s:message code="quotation.atpQty"/></p></td> --%>
<!-- 						<td><input type="text" name="SL05-ATP_QTY" id="SL05-ATP_QTY" readonly disabled="" data-dbcolumn="ATP_QTY"> -->
<!-- 							<p name="SL05-ATP_UNIT_CD" id="SL05-ATP_UNIT_CD"></p></td> -->
<%-- 						<td class="small_td"><p><s:message code="quotation.unit"/></p></td> --%>
<!-- 						<td class="Sbox_in_sel"><input type="text" name="SL05-UNIT1_QTY" id="SL05-UNIT1_QTY" data-dbcolumn="UNIT1_QTY"> -->
<!-- 							<p name="SL05-UNIT1_CD" id="SL05-UNIT1_CD"></p><p style="float:left;" class="box_pb_sign"> - </p> -->
<!-- 							<input type="text" name="SL05-UNIT2_QTY" id="SL05-UNIT2_QTY" data-dbcolumn="UNIT2_QTY"> -->
<!-- 							<p name="SL05-UNIT2_CD" id="SL05-UNIT2_CD"></p></td> -->
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.netPrice"/></p></td>
						<td class="Sbox_in_sel"><input type="text" name="SL05-NET_PRICE" id="SL05-NET_PRICE" data-dbcolumn="NET_PRICE" data-validcurrency="NET_PRICE" maxlength="13" value="1,00000" readonly disabled="">
<!-- 							<p class="box_pb_sign" style="float:left;">/</p> -->
							<input class="grid_input_eur" type="text" name="SL05-DETAIL_CURR_CD" id="SL05-DETAIL_CURR_CD" style="margin-left: 5px;" readonly disabled="" value="EUR" data-dbcolumn="CURR">
<!-- 							<button class="grid_popupbtn" id="cmm_pop_DETAIL_CURR_CD" name="cmm_pop_DETAIL_CURR_CD" type='button'></button> -->
						</td>
						<td class="small_td"><p><s:message code="quotation.netValue"/></p></td>
						<td><input type="text" name="SL05-NET_VAL" id="SL05-NET_VAL" data-dbcolumn="NET_VAL" data-validcurrency="NET_VAL" maxlength="13" readonly disabled="" ></td>
						<td class="small_td"><p><s:message code="quotation.priceDate"/></p></td>
						<td><input type="text" name="SL05-DETAIL_PRICE_DT" id="SL05-DETAIL_PRICE_DT" readonly disabled="" data-dbcolumn="PRICE_DT" /></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.bomNo"/></p></td>
						<td><input type="text" name="SL05-BOM_NO" id="SL05-BOM_NO" readonly disabled="" data-dbcolumn="BOM_NO"></td>
						<td class="small_td"><p><s:message code="quotation.batchNo"/></p></td>
						<td><input type="text" name="SL05-BATCH_NO" id="SL05-BATCH_NO" readonly disabled="" data-dbcolumn="BATCH_NO"></td>
						<td class="small_td"><p><s:message code="quotation.orderPro"/></td>
						<td><input type="text" name="SL05-ORD_PROB" id="SL05-ORD_PROB" readonly disabled="" data-dbcolumn="ORD_PROB"></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.usage"/></p></td>
						<td><select name="SL05-USAGE_CD" id="SL05-USAGE_CD" data-dbcolumn="USAGE_CD"></select></td>
						<td class="small_td"><p><s:message code="quotation.reasForReject"/></p></td>
						<td><select name="SL05-RSN_RJT_CD" id="SL05-RSN_RJT_CD" data-dbcolumn="RSN_RJT_CD"></select></td>
						<td class="small_td"><p><s:message code="quotation.shippingPoint"/></p></td>
						<td><select name="SL05-SHIP_PO_CD" id="SL05-SHIP_PO_CD" data-dbcolumn="SHIP_PO_CD"></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.infoText"/></p></td>
						<td colspan="5"><textarea type="text" name="SL05-INFO_TEXT" id="SL05-INFO_TEXT" data-dbcolumn="INFO_TEXT" style="width:100%;height:76px;"></textarea></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.longText"/></p></td>
						<td colspan="5"><textarea type="text" name="SL05-LONG_TEXT" id="SL05-LONG_TEXT" data-dbcolumn="LONG_TEXT" style="width:100%;height:76px;"></textarea></td>
					</tr>
				</table>
				<div class="ct_grid_top_wrap" style="display:none;">
					<div class="ct_grid_top_left">
						<h4><s:message code="quotation.relatedInfo"/></h4>
					</div>
				</div>
				<table class="table_line_quo" width="100%" style="display:none;">
					<tr>
						<td class="small_td"><p><s:message code="quotation.matlGrp"/></p></td>
						<td><input type="text" name="SL05-MATL_GR" id="SL05-MATL_GR" readonly disabled="">
							<p class="data_side_text" name="SL05-MATL_GR_NM" id="SL05-MATL_GR_NM"></p></td>
						<td class="small_td"><p><s:message code="quotation.salesOrdNo"/></p></td>
						<td><input type="text" name="SL05-DETAIL_SO_NO" id="SL05-DETAIL_SO_NO" readonly disabled="">
							<p class="data_side_text" name="SL05-DETAIL_SO_NO_NM" id="SL05-DETAIL_SO_NO_NM"></p></td>
						<td class="small_td"><p><s:message code="quotation.salesOrdQty"/></p></td>
						<td><input type="text" name="SL05-SO_QTY" id="SL05-SO_QTY" readonly disabled=""></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.netWeight"/></p></td>
						<td><input type="text" name="SL05-DETAIL_NET_WGT" id="SL05-DETAIL_NET_WGT" readonly disabled="">
							<p class="data_side_text" name="SL05-DETAIL_NET_WGT_UNIT" id="SL05-DETAIL_NET_WGT_UNIT"></p></td>
						<td class="small_td"><p><s:message code="quotation.grsWeight"/></p></td>
						<td><input type="text" name="SL05-DETAIL_GRS_WGT" id="DETAIL_GRS_WGT" readonly disabled=""></td>
						<td class="small_td"><p><s:message code="quotation.volume"/></p></td>
						<td><input type="text" name="DETAIL_VOLUME" id="DETAIL_VOLUME" readonly disabled="">
							<p class="data_side_text" name="SL05-DETAIL_VOLUME_UNIT" id="SL05-DETAIL_VOLUME_UNIT"></p></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.ovlSts"/></p></td>
						<td><input type="text" name="SL05-DETAIL_OVL_STS" id="SL05-DETAIL_OVL_STS" readonly disabled=""></td>
						<td class="small_td"><p><s:message code="quotation.refStatus"/></p></td>
						<td><input type="text" name="SL05-DETAIL_REF_STS" id="SL05-DETAIL_REF_STS" readonly disabled=""></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				
				<!-- 그리드 시작 -->
				<div id="ctm_mg_wrap">
					<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
						<div class="ct_grid_top_wrap">
							<div class="ct_grid_top_left">
								<h4><s:message code="quotation.partnerFnc"/></h4>
							</div>	
							<div class="ct_grid_top_right">
								<button class='btn btn-default' id='item_btnPfAdd' name='item_btnPfAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
								<button class='btn btn-default' id='item_btnPfDel' name='item_btnPfDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
							</div>
						</div>
						<table id="itemPfGrid"></table>
						<div id="itemPfGrid_pager"></div>
					</div>
				</div>
				<!-- 그리드 끝 -->
				<p>&nbsp;</p>
			</div>
		</form>
		
		<form id="frmCondition" action="#">
			<!----- tab 5 ----->
			<div id="condition_tab">				
				<div style="float:left;width:calc(30% - 42px);height:calc(100% - 40px);padding:0px 0 0 0">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Item</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<!-- 좌측 그리드 -->
					<table id="conditionGrid"></table>
					<div id="conditionGrid_pager"></div>
				</div>
				
				<div style="float:left;display:table;width:30px;height:calc(100% - 40px);padding:40px 0 0 0;">
					<div style="display:table-cell;text-align:center;vertical-align:middle;"> &nbsp;</div>
				</div>
				
				<div style="float:left;width:calc(70% - 0px);height:calc(100% - 40px);padding-top:0px">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4>Condition</h4></div>
						<div class="ct_grid_top_right"></div>
					</div>
					<!-- 우측 그리드 -->
					<table id="conditionGridDtl"></table>
					<div id="conditionGridDtl_pager"></div>
				</div>
				<div class="cls"></div>
				<!-- 그리드 끝 -->
				<p>&nbsp;</p>
			</div>
		</form>
		
		<form id="frmSche" action="#">
			<!----- tab 6 ----->
			<div id="schedule_line_tab" style="display:none;">
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
					<h4><s:message code="quotation.item"/>&nbsp;<input type="text" name="SL05-SC_ITEM_SEQ" id="SL05-SC_ITEM_SEQ" readonly disabled=""></h4>
					</div>
					<div class="ct_grid_top_right">
						<button class='btn btn-default' id='sc_btnPre' name='sc_btnPre' type='button'><i class='fa fa-angle-left'></i><s:message code='button.pre'/></button>
						<button class='btn btn-default' id='sc_btnNxt' name='sc_btnNxt' type='button'><s:message code='button.next'/>&nbsp;<i class='fa fa-angle-right'></i></button>
						<!-- <button class='btn btn-default' id='sc_btnAdd' name='sc_btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button> -->
					</div>
				</div>
				<table  width="100%" class="table_line_quo">
					<tr>
						<td class="small_td"><s:message code="quotation.material"/></td>
						<td><input type="text" name="SL05-SC_MATL_CD" id="SL05-SC_MATL_CD" readonly disabled="">
							<p class="data_side_text" name="SL05-SC_MATL_NM" id="SL05-SC_MATL_NM"></p></td>
						<td class="small_td"><s:message code="quotation.salesOrdQty"/></td>
						<td><input type="text" name="SL05-SC_SO_QTY" id="SL05-SC_SO_QTY" readonly disabled="">
							<p class="data_side_text" name="SL05-SC_SO_UNIT" id="SL05-SC_SO_UNIT"></p></td>
						<td class="small_td"><s:message code="quotation.fdd"/></td>
						<td><input type="text" name="SL05-SC_DELI_DT_1ST" id="SL05-SC_DELI_DT_1ST" readonly disabled="">
							<p class="data_side_text" name="SL05-SC_DELI_DT_1ST_TP" id="SL05-SC_DELI_DT_1ST_TP"></p></td>
					</tr>
				</table>
				<div class="grid_t_small_margin">&nbsp;</div>
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<table id="scGrid"></table>
					<div id="scGrid_pager"></div>
				</div>
				<!-- 그리드 끝 -->
				<p>&nbsp;</p>
			</div>
		</form>
		
		<!----- tab 7 ----->
		<div id="transaction_history_tab" style="display:none;">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
				<h4><s:message code="quotation.item"/>&nbsp;<input type="text" name="SL05-TH_ITEM_SEQ" id="SL05-TH_ITEM_SEQ" readonly disabled=""></h4>
				</div>
				<div class="ct_grid_top_right">
					<button class='btn btn-default' id='th_btnPre' name='th_btnPre' type='button'><i class='fa fa-angle-left'></i><s:message code='button.pre'/></button>
					<button class='btn btn-default' id='th_btnNxt' name='th_btnNxt' type='button'><s:message code='button.next'/>&nbsp;<i class='fa fa-angle-right'></i></button>
				</div>
			</div>
			<table  width="100%" class="table_line_quo">
				<tr>
					<td class="small_td"><s:message code="quotation.material"/></td>
					<td><input type="text" name="SL05-TH_MATL_CD" id="SL05-TH_MATL_CD" readonly disabled="">
						<p class="data_side_text" name="SL05-TH_MATL_NM" id="SL05-TH_MATL_NM"></p></td>
					<td class="small_td"><s:message code="quotation.salesOrdQty"/></td>
					<td><input type="text" name="SL05-TH_SO_QTY" id="SL05-TH_SO_QTY" readonly disabled="">
						<p class="data_side_text" name="SL05-TH_SO_UNIT" id="SL05-TH_SO_UNIT"></p></td>
					<td class="small_td"><s:message code="quotation.fdd"/></td>
					<td><input type="text" name="SL05-TH_DELI_DT_1ST" id="SL05-TH_DELI_DT_1ST" readonly disabled="">
						<p class="data_side_text" name="SL05-TH_DELI_DT_1ST_TP" id="SL05-TH_DELI_DT_1ST_TP"></p></td>
				</tr>
			</table>
			<div class="grid_t_small_margin">&nbsp;</div>
			<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
				<table id="thGrid"></table>
				<div id="thGrid_pager"></div>
			</div>
			<!-- 그리드 끝 -->
			<p>&nbsp;</p>
		</div>
		
		<!----- tab 8 ----->
		<div id="change_history_tab">
		<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4>Change History</h4>
					</div>
					<div class="ct_grid_top_right">
					</div>
				</div>
			<!-- 그리드 시작 -->
			<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
				<table id="hisGrid"></table>
				<div id="hisGrid_pager"></div>
			</div>
			<!-- 그리드 끝 -->
			<p>&nbsp;</p>
		</div>
	</div>
	<!--  tab end -->
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
  
	var toDay = getToday();
	var currencyElms = document.querySelectorAll('[data-validcurrency]');
	var exchgElms = document.querySelectorAll('[data-validexchg]');
	
	var partTabFlag = false;
	var itemTabFlag = false;
	var itemDtlTabFlag = false;
	var slTabFlag = false;
	var thTabFlag = false;
	var hisTabFlag = false;
	var conditionTabFlag = false;
	
	var beforeTab = 'MAIN';
	var preNextBtn = '';
	var delItemArray = new Array();
	//초기 로드
	$(function() {
		
		$('#cBtnUser2').text("<s:message code='button.request'/>");
		$('#cBtnUser3').text("<s:message code='button.copy'/>");
		$('#cBtnUser4').text("<s:message code='button.createSo'/>");
		$('#cBtnUser5').text("<s:message code='mail.grd.sendemail'/>");
		$('#cBtnCancel').text("<s:message code='button.close'/>");
		$('#cBtnAdd').text("New");
		$('#cBtnUser2').addClass("cBtnConfirm_style");
		$('#cBtnUser3').addClass("cBtnCopy_style");
		$('#cBtnUser4').addClass("cBtnPut_style"); 
		$('#cBtnUser5').addClass("cbtnSendMail_style");
		$('#cBtnCancel').addClass("cBtnSoClosed_style");
		$('#cBtnCancel').show();
		
		fn_codeval({type:'COMM',btn_id:'cmm_pop_CURR_CD',head_id:'CURR_CD',code:'SL05-CURR_CD'});
		fn_codeval({type:'COMM',btn_id:'cmm_pop_PAY_TERM',head_id:'PAY_TERM',code:'SL05-PAY_TERM', name:'SL05-PAY_TERM_NM'});
// 		fn_codeval({type:'COMM',btn_id:'cmm_pop_DETAIL_CURR_CD',head_id:'CURR_CD',code:'SL05-DETAIL_CURR_CD'});
		
		$('#S-DOC_NO').on('keypress', function (e) {
			if(e.which == 13){
				(this.value != "") ? cSearch(null) : '';
			}
		});
		
		$('#SL05-DT_TP, #SL05-REQ_DELI_DT').on('change', function (e) {
			setWeekTpToDay('H');
		});
		
		$('#SL05_ITEM_DETAIL-DT_TP').on('change', function (e) {
			setWeekTpToDay('D');
		});
		
		$('#SL05-DELI_DT_1ST').on('change', function (e) {
			setWeekTpToDay('D');
			itemDtlToItem(this);
		});

		
		$('#cmm_pop_SOLD_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#SL05-SOLD_CUST_CD').val(), 'SOLD');
			controlFlag(false);
		});
		
		$('li').click(function() {
			
			var selectedTab = $(this).attr('aria-controls');
			
			if('partner_tab' == selectedTab){
				(!partTabFlag) ? initPartTab() : '' ;
				
				btGrid.gridResizing('partnerGrid');
				btGrid.gridResizing('textGrid');
				
				var ids = $('#textGrid').jqGrid('getDataIDs');
				for (var i = 0, len = ids.length; i < len; i++) {
					if('ERR' == $('#textGrid').jqGrid('getCell', ids[i], 'PF_TP')){
						$('#textGrid').jqGrid('delRowData',ids[i])
					}
				}
				
				tempDataSave();
				beforeTab = 'PARTNER';
			}else if('items_tab' == selectedTab){
				(!partTabFlag) ? initPartTab() : '' ;
				(!itemTabFlag) ? initItemTab() : '' ;
				
				btGrid.gridResizing('itemGrid');
				
				tempDataSave();
				beforeTab = 'ITEM';
			}else if('item_detail_tab' == selectedTab){
				(!partTabFlag) ? initPartTab() : '' ;
				(!itemTabFlag) ? initItemTab() : '' ;
				(!itemDtlTabFlag) ? initItemDtlTab() : '' ;
				
				btGrid.gridResizing('itemPfGrid');
				setItemDtlData('SEL');
				syncItemPfGrid();
				
				tempDataSave();
				beforeTab = 'ITEM_DTL';
			}else if('schedule_line_tab' == selectedTab){
				(!partTabFlag) ? initPartTab() : '' ;
				(!itemTabFlag) ? initItemTab() : '' ;
				(!itemDtlTabFlag) ? initItemDtlTab() : '' ;
				(!slTabFlag) ? initSlTab() : '' ;
				
				btGrid.gridResizing('scGrid');
				setScdlData('SEL');
				
				selectScdlTab();
				
				if('' == $('#SL05-SC_ITEM_SEQ').val()){
					$('#SL05-SC_DELI_DT_1ST').val('')
				}
				
				tempDataSave();
				beforeTab = 'SCHE';
			}else if('transaction_history_tab' == selectedTab){
				(!thTabFlag) ? initThTab() : '' ;
				
				btGrid.gridResizing('thGrid');
			}else if('change_history_tab' == selectedTab){
				(!hisTabFlag) ? initHisTab() : '' ;
				
				btGrid.gridResizing('hisGrid');
			}else if('salesorder_tab' == selectedTab){
				tempDataSave();
				beforeTab = 'MAIN';
			}else if('condition_tab' == selectedTab){
				(!partTabFlag) ? initPartTab() : '' ;
				(!itemTabFlag) ? initItemTab() : '' ;
				(!itemDtlTabFlag) ? initItemDtlTab() : '' ;
				(!slTabFlag) ? initSlTab() : '' ;
				(!conditionTabFlag) ? initConditionTab() : '' ;
				btGrid.gridResizing('conditionGrid');
				btGrid.gridResizing('conditionGridDtl');
				
				selectConditionTab();
				
				$('#conditionGrid').jqGrid('setSelection', $('#conditionGrid').jqGrid('getDataIDs')[0]);
				selectConditionDtlTab('000');
			}
		});
		
		$('#partner_btnAdd').click(function() {
			var data = {"ROW_STATUS" : "I", 'PF_TP' : ''};
			btGrid.gridAddRow("partnerGrid", "last", data);
		});
		
		$('#text_btnAdd').click(function() {
			var data = {"ROW_STATUS" : "I"};
			btGrid.gridAddRow("textGrid", "last", data);
		});
		
		$('#item_btnAdd').click(function() {
			
			var ids = $("#itemGrid").jqGrid("getDataIDs");
			var itemSeq = 0;
			
			if('' != $('#SL05-SOLD_CUST_CD').val()){
				if(ids.length < 1){
					itemSeq = 100;
				}else{
					for(var i = 0; i < ids.length; i++){
						var rowData = $("#itemGrid").getRowData(ids[i]);
						if(i == 0){
							itemSeq = Number(rowData["ITEM_SEQ"]) + 100;
						}else{
							if('' == rowData["pItemSeq"] && itemSeq <= Number(rowData["ITEM_SEQ"])){
								itemSeq = Number(rowData["ITEM_SEQ"]) + 100
							}
						}
					}
				}
				
				var data = {"ROW_STATUS" : "I", "ITEM_SEQ" : itemSeq, "MATL_CD" : "", "CURR" : $('#SL05-CURR_CD').val(),
							"DELI_DT_1ST_TP" : $('#SL05-DT_TP option:selected').val(), "DELI_DT_1ST" : $('#SL05-REQ_DELI_DT').val()};
				btGrid.gridAddRow("itemGrid", "last", data);
				
				openProductPop('', $('#SL05-SALES_ORG_CD').val(), $('#SL05-DISTRB_CH').val(), $('#SL05-DIV_CD').val(), 'N');
			}else{
				var msg = 'Sold-to';
				alert("<s:message code='errors.select' arguments='" + msg + "' javaScriptEscape='false'/>");
			}
		});
		
		$('#itemDtl_btnPre').on('click', function (e) {
			preNextBtn = "ITEM_PF";
			tempDataSave();
			setItemDtlData('PREV');
		});
		
		$('#itemDtl_btnNxt').on('click', function (e) {
			preNextBtn = "ITEM_PF";
			tempDataSave();
			setItemDtlData('NEXT');
		});
		
		$('#item_btnPfAdd').on('click', function (e) {
			if('' != $('#SL05-DTL_ITEM_SEQ').val()){
				var data = {"ROW_STATUS" : "I", "ITEM_SEQ" : $('#SL05-DTL_ITEM_SEQ').val(), 'PF_TP' : ''};
				btGrid.gridAddRow("itemPfGrid", "last", data);
			}
		});
		
		
		$('#sc_btnPre').on('click', function (e) {
			var updateFlg = false;
			var ids = $('#scGrid').jqGrid('getDataIDs');
			
			for(var i = 0; i < ids.length; i++){
				if('' != $('#SL05-DOC_NO').val() && 'U' == $("#scGrid").jqGrid('getCell', ids[i], 'ROW_STATUS')){
					updateFlg = true;
					break;
				}
			}
			
			if(updateFlg){
				if(confirm("<s:message code='errors.noSaveData'/>")){
					preNextBtn = "SCDL";
					tempDataSave();
					setScdlData('PREV');
				}
			}else{
				preNextBtn = "SCDL";
				tempDataSave();
				setScdlData('PREV');
			}
		});
		
		$('#sc_btnNxt').on('click', function (e) {
			var updateFlg = false;
			var ids = $('#scGrid').jqGrid('getDataIDs');
			
			for(var i = 0; i < ids.length; i++){
				if('' != $('#SL05-DOC_NO').val() && 'U' == $("#scGrid").jqGrid('getCell', ids[i], 'ROW_STATUS')){
					updateFlg = true;
					break;
				}
			}
			
			if(updateFlg){
				if(confirm("<s:message code='errors.noSaveData'/>")){
					preNextBtn = "SCDL";
					tempDataSave();
					setScdlData('NEXT');
				}
			}else{
				preNextBtn = "SCDL";
				tempDataSave();
				setScdlData('NEXT');
			}
		});
		
// 		$('#sc_btnAdd').on('click', function (e) {
			
// 			var ids = $("#scGrid").jqGrid("getDataIDs");
// 			var scSeq = 0;
			
// 			if('' != $('#SL05-SC_ITEM_SEQ').val()){
				
// 				var tempData;
				
// 				for(var i = 0; i < ids.length; i++){
					
// 					(i == 0) ? tempData = $("#scGrid").getRowData(ids[i]) : '';
					
// 					var rowData = $("#scGrid").getRowData(ids[i]);
// 					if(i == 0){
// 						scSeq = Number(rowData["SEQ"]) + 1;
// 					}else{
// 						(scSeq <= Number(rowData["SEQ"])) ? scSeq = Number(rowData["SEQ"]) + 1 : '';
// 					}
// 				}
				
// 				var data = {"ROW_STATUS" : "I", "SEQ" : scSeq, "ITEM_SEQ" : $("#SL05-SC_MATL_CD").val(), "MATL_CD" : $("#SL05-SC_ITEM_SEQ").val(),
// 							"CFM_QTY" : "0,00", "SALES_UNIT_CD" : tempData["SALES_UNIT_CD"], "ATP_QTY" : "0", "DELI_BLOCK_CD" : tempData["DELI_BLOCK_CD"],
// 							"BATCH_NO" : tempData["BATCH_NO"]
// 							};
// 				btGrid.gridAddRow("scGrid", "last", data);
// 			}else{
// 				var msg = 'Item';
// 				alert("<s:message code='errors.select' arguments='" + msg + "' javaScriptEscape='false'/>");
// 			}
// 		});
		
		$('#th_btnPre').click(function() {
			
		});
		
		$('#th_btnNxt').click(function() {
			
		});
		
		var dtlEventList  = '#SL05-ITEM_DTL_MATL_CD, #SL05-ITEM_CTG_GR, #SL05-ITEM_DTL_ORD_QTY, '
			dtlEventList += '#SL05-ORD_UNIT_CD, #SL05_ITEM_DETAIL-DT_TP, #SL05-NET_PRICE, ';
			dtlEventList += '#SL05-BOM_NO, #SL05-BATCH_NO, #SL05-ORD_PROB, ';
// 			dtlEventList += '#SL05-USAGE_CD, #SL05-RSN_RJT_CD, #SL05-SHIP_PO_CD, ';
// 			dtlEventList += '#SL05-RUT_CD, #SL05-DELI_PRIOR_CD, #SL05-MAX_P_DELI, ';
// 			dtlEventList += '#SL05-RUT_CD, #SL05-DELI_PRIOR_CD, ';
// 			dtlEventList += '#SL05-SCDL_LINE_YN, #SL05-FIX_DT_QTY_YN, #SL05-INFO_TEXT'
			dtlEventList += '#SL05-INFO_TEXT, #SL05-LONG_TEXT'
		
		$(dtlEventList).on('blur', function (e) {
			itemDtlToItem(this);
		});
		
		$('#SL05-USAGE_CD, #SL05-RSN_RJT_CD, #SL05-SHIP_PO_CD, #SL05-RUT_CD, #SL05-DELI_PRIOR_CD').on('change', function (e) {
			itemDtlToItem(this);
		});
		
		$('#SL05-INCOTERMS_CD').on('change', function (e) {
// 			var tempVal = $('#SL05-INCOTERMS_CD option:selected').text().split(' - ');
// 			$('#SL05-INCOTERMS_DESC').val(tempVal[1]);
			
			var ids = $('#itemGrid').jqGrid('getDataIDs');
			for(var i = 0; i < ids.length; i++){
				$("#itemGrid").jqGrid('setCell', ids[i], 'ERP_STATUS', 'N');
			}
		});
		
// 		$('#SL05-SUR_CHARGE_AMT').on('click', function (e) {
// 			calcPrice();
// 		});
		
		$('#SL05-DC_TP, #SL05-DLV_AMT, #SL05-PAY_TERM').on('change', function (e) {
			(!itemTabFlag) ? initItemTab() : '' ;
			
			var ids = $('#itemGrid').jqGrid('getDataIDs');
			
			for(var i = 0; i < ids.length; i++){
				$("#itemGrid").jqGrid('setCell', ids[i], 'ERP_STATUS', 'N');
			}
		});
		
		$('#SL05-SUR_CHARGE_AMT, #SL05-DLV_AMT').on('keypress', function (e) {
			(!itemTabFlag) ? initItemTab() : '' ;
			
			var ids = $('#itemGrid').jqGrid('getDataIDs');
			
			for(var i = 0; i < ids.length; i++){
				$("#itemGrid").jqGrid('setCell', ids[i], 'ERP_STATUS', 'N');
			}
		});
		
		$('#SL05-CURR_CD').on('change', function (e) {
			(!itemTabFlag) ? initItemTab() : '' ;
			
			var ids = $('#itemGrid').jqGrid('getDataIDs');
			
			for(var i = 0; i < ids.length; i++){
				$("#itemGrid").jqGrid('setCell', ids[i], 'ERP_STATUS', 'N');
				$("#itemGrid").jqGrid('setCell', ids[i], 'CURR', $(this).val());
			}
		});
		
		$('#SL05-SALES_OFFICE_CD').on('change', function (e) {
			if('' == $(this).val()){
				$('#SL05-SALES_GR').val('');
// 				$('#SL05-SALES_GR').attr('disabled', true);
			}else{
				$('#SL05-SALES_GR').attr('disabled', false);
				
				var url = "/salesOrder/selectSalesGrp.do";
				var param = {"param" : {"SALES_ORG" : $(this).val()}};
				
				fn_ajax(url, false, param, function(data, xhr){
					var retVal = data.result.split(';');
					
					$("#SL05-SALES_GR").empty().data('options');
					$("#SL05-SALES_GR").append('<option value=' + "" + '></option>');
					
					if(!fn_empty(data.result)){
						for(j = 0; j < retVal.length; j++){
							var tempVal = retVal[j].split(':');
							$("#SL05-SALES_GR").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
						}
					}else{
// 						$('#SL05-SALES_GR').attr('disabled', true);
					}
				});
			}
		});
		
		$('#item_btnDel').on('click', function (e) {
			setHideRow('itemGrid');
		});
		
		$('#partner_btnDel').on('click', function (e) {
			setHideRow('partnerGrid');
		});
		
		$('#text_btnDel').on('click', function (e) {
			setHideRow('textGrid');
		});
		
		$('#item_btnPfDel').on('click', function (e) {
			setHideRow('itemPfGrid');
		});
		
		$('#SL05-SOLD_CUST_CD').on('keypress', function (e) {
			if(e.which == 13){
// 				if(this.value != ""){
// 					selectCustomerInfo(this.value, 'SOLD');
// 				}else{
					openCustomerPopUp(this.value, 'SOLD');
// 				}
			}
		});
		
		$('#SL05-SHIP_CUST_CD').on('keypress', function (e) {
			if(e.which == 13){
// 				if(this.value != ""){
// 					selectCustomerInfo(this.value, 'SHIP');
// 				}else{
					openCustomerPopUp(this.value, 'SHIP');
// 				}
			}
		});
		
		$('#item_btnPirce').on('click', function (e) {
			getPrice();
		});
		
		$('#head_long_txt').on('keyup', function (e) {
			$("#textGrid").jqGrid('setCell', $('#textGrid').jqGrid('getGridParam', 'selrow'), 'MATL_TEXT', $(this).val().replace(/(\n|\r\n)/g, '\n'));
			if('I' != $("#textGrid").jqGrid('getCell', $('#textGrid').jqGrid('getGridParam', 'selrow'), 'ROW_STATUS')){
				$("#textGrid").jqGrid('setCell', $('#textGrid').jqGrid('getGridParam', 'selrow'), 'ROW_STATUS', 'U');
			}
			
// 			$(this).val('');
		});
		
		$('#head_long_txt').on('blur', function (e) {
			$(this).val('');
		});
		
// 		$('#SL05-SOLD_CUST_CD').on('change, blur', function (e) {
// 			if('' == $('#SL05-SHIP_CUST_CD').val()){
// 				if(this.value != ""){
// 					selectCustomerInfo(this.value, 'SOLD');
// 				}else{
// 					openCustomerPopUp(this.value, 'SOLD');
// 				}
// 			}
// 		});
		
		$('#SL05-DC_TP').on('change', function (e) {
			if('' != $('#SL05-DC_VAL').val() && 'R' == $('#SL05-DC_TP option:selected').val()){
				(99 < createNormalFm($('#SL05-DC_VAL').val())) ? $('#SL05-DC_VAL').val('') : '';
			}
		});
		
		$('#SL05-DC_VAL').on('keyup', function (e) {
			(!itemTabFlag) ? initItemTab() : '' ;
			
			var ids = $('#itemGrid').jqGrid('getDataIDs');
			
			for(var i = 0; i < ids.length; i++){
				$("#itemGrid").jqGrid('setCell', ids[i], 'ERP_STATUS', 'N');
			}
			
			if('' != $('#SL05-DC_VAL').val() && 'R' == $('#SL05-DC_TP option:selected').val()){
				(99 < createNormalFm($('#SL05-DC_VAL').val())) ? $('#SL05-DC_VAL').val('') : '';
			}
		});
		
		$('#item_btnStock').on('click', function (e) {
			if(!fn_empty($('#itemGrid').getRowData())){
				var url = "/popup/StockPopup.do";
				var pid = "stockPopup";  //팝업 페이지의 취상위 div ID
				var gridData2 = $('#itemGrid').getRowData();
				var param = {"ITEM" : gridData2};
				
				popupOpen(url, pid, param);
			}
		});
		
		initScreen();
	});
	
	var copyFlag;
	var leadData;
	var leadItem;
	var leadPart;
	
	function initScreen(){
		
		$("#SL05-ORG_DOC_NO").val($.QueryString['DOC_NO']);
		$("#SL05-isStatus").val($.QueryString['isStatus']);
		
// 		('C' == $.QueryString['isStatus']) ? copyFlag = true : copyFlag = false;
		
		if('C' == $.QueryString['isStatus']){
			copyFlag = true;
		}else if('LD' == $.QueryString['isStatus']){
			leadData = $.QueryString['leadData'].split(',');
			leadItem = $.QueryString['item'].split('[');
			leadPart = $.QueryString['partner'].split(',');
			
			$('#SL05-SOLD_CUST_CD').prop('disabled', true);
			$('#cmm_pop_SOLD_CUST_CD').hide();
		}else{
			copyFlag = false;
		}
		
		//$('#SL05-SALES_GR').attr('disabled', true);
		
		$('#SL05-VAL_FR_DT').val(toDay);
		$('#SL05-VAL_TO_DT').val(getDayAfterToday(7));
		
		fn_setModify('frmHeader', 'SL05-');
		
		Util.validator.applyCurrency(currencyElms);
		Util.validator.applyExchg(exchgElms);
		
		var codeBoxArray = [  'SL05-CUST_STS'      , 'SL05-SALES_OFFICE_CD' //, 'SL05-SALES_GR'
// 							, 'SL05-ORD_RESN_CD'   , 'SL05-DELI_PLANT_CD'   , 'SL05-ATTR_ORD'
							, 'SL05-ORD_RESN_CD'   , 'SL05-DELI_PLANT_CD'   , 'SL05-ATTR_ORD'
							, 'SL05-PAY_TERM'
							, 'SL05-INCOTERMS_CD'  , 'SL05-DELI_BLOCK_CD'   , 'SL05-OVL_STS'
// 							, 'SL05-DELI_STS'      , 'SL05-DUN_BLOCK'    , 'SL05-SHP_CON_CD'
							, 'SL05-DELI_STS'      , 'SL05-SHP_CON_CD', 'SL05-QT_STS_CD'
// 							, 'SL05-REF_DOC_H_STS' , 'SL05-T_REF_STS'       , 'SL05-RJT_STS'
							];
		
		var codeBoxArrayDt = [ 'SL05-DT_TP' ];
		
		createCodeBoxByEdit(codeBoxArray, true);
		createCodeBoxByEdit(codeBoxArrayDt, false);
		
		var url = "/salesOrder/selectSalesGrp.do";
		var param = {"param" : {"SALES_ORG" : ''}};
		
		fn_ajax(url, false, param, function(data, xhr){
			var retVal = data.result.split(';');
			
			$("#SL05-SALES_GR").empty().data('options');
			$("#SL05-SALES_GR").append('<option value=' + "" + '></option>');
			
			if(!fn_empty(data.result)){
				for(j = 0; j < retVal.length; j++){
					var tempVal = retVal[j].split(':');
					$("#SL05-SALES_GR").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
				}
			}else{
//					$('#SL05-SALES_GR').attr('disabled', true);
			}
		});
		
		$('#SL05-DELI_PLANT_CD').attr('disabled', true);
		
		if('M' != $("#SL05-isStatus").val()){
			$('#SL05-REQ_DELI_DT').val(getDayAfterToday(14));
			$('#SL05-PRICE_DT').val(toDay);
			$('#SL05-PO_DT').val(toDay);
			$('#SL05-DELI_BLOCK_CD').val('G4');
			$('#SL05-QT_STS_CD').val('E0002');
			$('#SL05-EXCHG_RATE').val(createGridNumFm(Number(1).toFixed(5)));
		}
		
		if('' != $("#SL05-ORG_DOC_NO").val()){
			$("#S-DOC_NO").val($("#SL05-ORG_DOC_NO").val()); 
			cSearch();
		}
		
		setTimeout(function() { 
			if(copyFlag){
				copyQuotation();
			}else if('LD' == $.QueryString['isStatus']){
				openCustomerPopUp(leadData[0], 'LEAD');
				$('#SL05-SOLD_CUST_CD').prop('disabled', true);
				$('#cmm_pop_SOLD_CUST_CD').hide();
			}
		}, 300);
	}
	
	function setWeekTpToDay(type){
		if('H' == type){
			if('1' == $('#SL05-DT_TP').val()){
				$('#SL05-REQ_DELI_DT_TYPE').hide();
				$('#SL05-REQ_DELI_DT').show();
			}else if('2' == $('#SL05-DT_TP').val()){
				$('#SL05-REQ_DELI_DT').hide();
				$('#SL05-REQ_DELI_DT_TYPE').show();
				$('#SL05-REQ_DELI_DT_TYPE').val(getWeekNo($('#SL05-REQ_DELI_DT').val()));
			}else{
				$('#SL05-REQ_DELI_DT').hide();
				$('#SL05-REQ_DELI_DT_TYPE').show();
				var tempVal = $('#SL05-REQ_DELI_DT').val().split('\.');
				$('#SL05-REQ_DELI_DT_TYPE').val(tempVal[1] + '.' + tempVal[2]);
			}
		}else if('D' == type){
			if('1' == $('#SL05_ITEM_DETAIL-DT_TP').val()){
				$('#SL05-DELI_DT_1ST_TYPE').hide();
				$('#SL05-DELI_DT_1ST').show();
			}else if('2' == $('#SL05_ITEM_DETAIL-DT_TP').val()){
				$('#SL05-DELI_DT_1ST').hide();
				$('#SL05-DELI_DT_1ST_TYPE').show();
				$('#SL05-DELI_DT_1ST_TYPE').val(getWeekNo($('#SL05-DELI_DT_1ST').val()));
			}else{
				$('#SL05-DELI_DT_1ST').hide();
				$('#SL05-DELI_DT_1ST_TYPE').show();
				var tempVal = $('#SL05-DELI_DT_1ST').val().split('\.');
				$('#SL05-DELI_DT_1ST_TYPE').val(tempVal[1] + '.' + tempVal[2]);
			}
		}else if('SC' == type){
			if('Day' == $('#SL05-SC_DELI_DT_1ST_TP').text()){
				//$('#SL05-DELI_DT_1ST_TYPE').hide();
				//$('#SL05-DELI_DT_1ST').show();
			}else if('Weekly' == $('#SL05-SC_DELI_DT_1ST_TP').text()){
				$('#SL05-SC_DELI_DT_1ST').val(getWeekNo($('#SL05-SC_DELI_DT_1ST').val()));
			}else{
				var tempVal = $('#SL05-SC_DELI_DT_1ST').val().split('\.');
				$('#SL05-SC_DELI_DT_1ST').val(tempVal[1] + '.' + tempVal[2]);
			}
		}else if('TH' == type){
			if('1' == $('#SL05-TH_DELI_DT_1ST_TP').text()){
				//$('#SL05-DELI_DT_1ST_TYPE').hide();
				//$('#SL05-DELI_DT_1ST').show();
			}else if('2' == $('#SL05-TH_DELI_DT_1ST_TP').text()){
				$('#SL05-TH_DELI_DT_1ST').val(getWeekNo($('#SL05-TH_DELI_DT_1ST').val()));
			}else if('' != $('#SL05-TH_DELI_DT_1ST_TP').text()){
				var tempVal = $('#SL05-TH_DELI_DT_1ST').val().split('\.');
				$('#SL05-TH_DELI_DT_1ST').val(tempVal[1] + '.' + tempVal[2]);
			}
		}
	}
	
	var accountGrp = '';
	
	function openCustomerPopUp(custVal, type) {
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param;
		
		if('LEAD' == type){
			param = { 'CUST_CD':custVal, 'SALES_ORG_CD':leadData[1], 'DISTRB_CH':leadData[2], 'DIV_CD':leadData[3], 'DIV_FLAG':'Y' };
		}else if(('PF' == type || 'ITEM' == type)){
			param = { 'SALES_ORG_CD' : $('#SL05-SALES_ORG_CD').val(), 'DIV_CD' : $('#SL05-DIV_CD').val()
					, 'DISTRB_CH' : $('#SL05-DISTRB_CH').val()
					}
		}else{
			param = { 'CUST_CD':custVal, 'DIV_FLAG':'Y' };
		}
		
		param.window = window;
		
		oneTimeFlag = false;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				
				/*0423 LJM quotation_tab에서 SOLD-TO 변경 시에만 REFRESH 되도록 */
				if($('#tabs .ui-state-active a').attr('href') == "#quotation_tab" && type == 'SOLD'){
					clearForm($('#frmHeader'));
					initScreen();
					
					////////////////////////////////////////////////////////////////////////////
					// TODO
					var param = {
						HEAD_ID: 'SALES_OFFICE_CD',
						CODE: selecedData.SALES_ORG_CD + selecedData.DISTRB_CH + selecedData.DIV_CD
					};
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var elm = document.getElementById('SL05-SALES_OFFICE_CD');
						var value = elm.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">[' + v.CODE + '] ' + v.CODE_NM + '</option>';
						});
						elm.innerHTML = context;
						elm.value = value;
					});
					////////////////////////////////////////////////////////////////////////////
				}
				
				$.each(selecedData, function(k, v) {
					if('CUST_CD' == k){
						if('SHIP' == type){
							$('#SL05-SHIP_CUST_CD').val(v);
						}else if('SOLD' == type || 'EXCEL' == type || 'LEAD' == type){
							$('#SL05-SOLD_CUST_CD').val(v);
						}else if('PF' == type){
							$("#partnerGrid").jqGrid('setCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NO', v);
						}else if('ITEM' == type){
							$("#itemPfGrid").jqGrid('setCell', $('#itemPfGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NO', v);
						}else if('SHIP' == type){
							$('#SL05-SHIP_CUST_CD').val(v);
						}else if('BILL' == type){
							$('#SL05-BILL_CUST_CD').val(v);
						}
					}
					if('CUST_NM' == k){
						if('SHIP' == type){
							$('#SL05-SHIP_CUST_NM').text(v);
						}else if('SOLD' == type || 'EXCEL' == type || 'LEAD' == type){
							$('#SL05-SOLD_CUST_NM').text(v);
						}else if('PF' == type){
							$("#partnerGrid").jqGrid('setCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NM', v);
						}else if('ITEM' == type){
							$("#itemPfGrid").jqGrid('setCell', $('#itemPfGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NM', v);
						}else if('SHIP' == type){
							$('#SL05-SHIP_CUST_NM').text(v);
						}else if('BILL' == type){
							$('#SL05-BILL_CUST_NM').text(v);
						}
					}
					if('PF' == type || 'ITEM' == type){
						var tempGrid;
						var selRow;
						
						('PF' == type) ? tempGrid = 'partnerGrid' : tempGrid = 'itemPfGrid';
						
						selRow = $('#' + tempGrid).jqGrid('getGridParam', 'selrow');
						if('SEARCH_NM1' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'NAME_1ST', v);
						}else if('SEARCH_NM2' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'NAME_2ND', v);
						}else if('HAUS_NO' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'HAUS_NO', v);
						}else if('STREET_NM' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'STREET_NM', v);
						}else if('STREET_NM2' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'STREET_NM2', v);
						}else if('POST_CD' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'POST_CD', v);
						}else if('REGION_CD' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'REGION_CD', v);
						}else if('CITY_CD' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'CITY_CD', v);
						}else if('COUNTRY_CD' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'COUNTRY_CD', v);
						}else if('TIME_ZONE' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'TIME_ZONE', v);
						}else if('TRANSP_ZONE' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'TRANSP_ZONE', v);
						}else if('LANG_CD' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'LANG_CD', v);
						}else if('TEL_NO' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'TEL_NO', v);
						}else if('TEL_NO_EXT' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'TEL_NO_EXT', v);
						}else if('MOBILE_NO' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'MOBILE_NO', v);
						}else if('FAX_NO' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'FAX_NO', v);
						}else if('FAX_NO_EXT' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'FAX_NO_EXT', v);
						}else if('E_MAIL' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'E_MAIL', v);
						}else if('VAT_REG_NO' == k){
							$('#' + tempGrid).jqGrid('setCell', selRow, 'VAT_REG_NO', v);
						}
					}
					
					if('ACCOUNT_GR' == k){
						accountGrp = v;
						if('CPD' == v || 'CPDA' == v || 'Z007' == v){
							openOnetimeCustPop(type, selRow, 'NEW');
						}
						if(!('CPD' == accountGrp || 'CPDA' == accountGrp || 'Z007' == accountGrp || 'Z001' == accountGrp)){
							$('#cBtnUser4').hide();
						}else{
							$('#cBtnUser4').show();
						}
					}
					
					if('SOLD' == type || 'EXCEL' == type || 'LEAD' == type){
						if('INDUSTRY_CD' == k){
							$('#SL05-INDUSTRY_CD').val(v);
						}else if('INDUSTRY_NM' == k){
							$('#SL05-INDUSTRY_CD_NM').text(v);
						}else if('CUST_GR' == k){
							$('#SL05-CUST_GR_CD').val(v);
						}else if('CUST_GR_NM' == k){
							$('#SL05-CUST_GR_NM').text(v);
						}else if('CURR_CD' == k){
							$('#SL05-CURR_CD').val(v);
						}else if('SALES_ORG_CD' == k){
							$('#SL05-SALES_ORG_CD').val(v);
						}else if('SALES_ORG_CD_NM' == k){
							$('#SL05-SALES_ORG_CD_NM').text(v);
						}else if('DISTRB_CH' == k){
							$('#SL05-DISTRB_CH').val(v);
						}else if('DISTRB_CH_NM' == k){
							$('#SL05-DISTRB_CH_NM').text(v);
						}else if('DIV_CD' == k){
							$('#SL05-DIV_CD').val(v);
						}else if('DIV_CD_NM' == k){
							$('#SL05-DIV_CD_NM').text(v);
						}else if('GRADE' == k){
							$('#SL05-CUST_CL').val(v);
							(!fn_empty(v)) ? $('#SL05-ORD_RESN_CD').val('055') : '';
						}else if('GRADE_NM' == k){
							$('#SL05-CUST_CL_NM').text(v);
// 						}else if('DUN_BLOCK_CD' == k){
// 							$('#SL05-DUN_BLOCK').val(v);
						}else if('SALES_OFFICE_CD' == k){
							$('#SL05-SALES_OFFICE_CD').val(v);
						}else if('SALES_GR' == k){
							$('#SL05-SALES_GR').val(v);
						}else if('DELI_PLANT_CD' == k){
							$('#SL05-DELI_PLANT_CD').val(v);
						}else if('SHIP_CONDI_CD' == k){
							$('#SL05-SHP_CON_CD').val(v);
						}else if('REL_POD_YN' == k){
							('Y' == v) ? $('#SL05-REL_POD_YN').prop('checked', true) : '';
						}else if('COMPLT_DELI_REQ_YN' == k){
							('Y' == v) ? $('#SL05-CMP_DELI_YN').prop('checked', true) : '';
						}else if('INCOTERMS_CD' == k){
							$('#SL05-INCOTERMS_CD').val(v);
// 							var tempVal = $('#SL05-INCOTERMS_CD option:selected').text().split(' - ');
// 							$('#SL05-INCOTERMS_DESC').val(tempVal[1])
						}else if('TERM_PAY_CD' == k){
							$('#SL05-PAY_TERM').val(v);
						}else if('TERM_PAY_NM' == k){
							$('#SL05-PAY_TERM_NM').text(v);
						}else if('INCOTERMS_NM' == k){
							$('#SL05-INCOTERMS_DESC').val(v);
						}
						$('#SL05-TEMP_DOC_NO').val('');
					}
				});
				if('PF' == type){
					setRowStatus('partnerGrid');
					syncItemPfGrid();
					
					var selRow = $('#partnerGrid').jqGrid('getGridParam', 'selrow');
					
					if('WE' == $('#partnerGrid').jqGrid('getCell', selRow, 'PF_TP')){
						$('#SL05-SHIP_CUST_CD').val($('#partnerGrid').jqGrid('getCell', selRow, 'PF_PS_NO'));
						$('#SL05-SHIP_CUST_NM').text($('#partnerGrid').jqGrid('getCell', selRow, 'PF_PS_NM'));
					}else if('RE' == $('#partnerGrid').jqGrid('getCell', selRow, 'PF_TP')){
						$('#SL05-BILL_CUST_CD').val($('#partnerGrid').jqGrid('getCell', selRow, 'PF_PS_NO'));
						$('#SL05-BILL_CUST_NM').text($('#partnerGrid').jqGrid('getCell', selRow, 'PF_PS_NO'));
					}
					
				}else if('ITEM' == type){
					setRowStatus('itemPfGrid');
					$("#itemPfGrid").jqGrid('setCell', $('#itemPfGrid').jqGrid('getGridParam', 'selrow'), 'SYNC_FLAG', 'N');
				}else if('SOLD' == type || 'EXCEL' == type || 'LEAD' == type){
					getShipToBySold();
					
					if('' != $('#SL05-SOLD_CUST_CD').val()){
						var url = "/salesOrder/getSoldCreditAmt.do";
						var param = { 'SOLD_CUST_CD' : $('#SL05-SOLD_CUST_CD').val() }
						fn_ajax(url, false, param, function(data, xhr){
							if(!fn_empty(data)){
								if (data.RESULT != null && data.RESULT.length>0) {
									var aLimitAmt = data.RESULT[1];
									$('#SL05-AVAIL_AMT').val(createGridNumFm(aLimitAmt.rows[0].EV_AVAIL));
								}
							}
						});
						
						setDeliPlantCombo(false);
					}
					
					var msg = '';
					var validFlag = true;
					
					if('' == $('#SL05-SALES_ORG_CD').val()){
						msg = '<s:message code="quotation.salesOrg"/>';
						validFlag = false;
					}else if('' == $('#SL05-DISTRB_CH').val()){
						msg = '<s:message code="quotation.distributionCh"/>';
						validFlag = false;
					}else if('' == $('#SL05-DIV_CD').val()){
						msg = '<s:message code="quotation.division"/>';
						validFlag = false;
					}
					
					if(!validFlag){
						alert($('#SL05-SOLD_CUST_CD').val() + " " + "<s:message code='error.custInfoRequired' arguments='" + msg + "' javaScriptEscape='false'/>");
						clearForm($('#frmHeader'));
						initScreen();
						
						controlFlag(false);
					}
				}
				
				if('EXCEL' == type){
					// clear
					$('#ui-id-3').click();
					$('#itemGrid').jqGrid('clearGridData');
					
					var itemSeq = 100;
					var i = 0;
					validList.forEach(function(v) {
						if(0 < i){
// 							if(1 < Number(validList[i].MATL_CD.substring(0, 1))){
// 								itemSeq++;
// 							}else{
								itemSeq = ((itemSeq / 100) + 1) * 100;
// 							}
						}
						
						getMatlData(validList[i].MATL_CD, itemSeq, i, type);
						i++;
					});
					
					$('#SL05-SOLD_CUST_CD').prop('disabled', true);
					$('#cmm_pop_SOLD_CUST_CD').hide();
				}else if('LEAD' == type){
					$('#SL05-SALES_OFFICE_CD').val(leadData[4]);
					$('#SL05-SALES_GR').val(leadData[5]);
					$('#SL05-LEAD_NO').val(leadData[6]);
					
					// clear
					$('#ui-id-3').click();
					$('#itemGrid').jqGrid('clearGridData');
					
					var itemSeq = 100;
					for(var i = 0; i < leadItem.length; i += 2){
						if(0 < i){
							if(1 < Number(leadItem[i].substring(0, 1))){
								itemSeq++;
							}else{
								itemSeq = ((itemSeq / 100) + 1) * 100;
							}
						}
						if(!fn_empty(leadItem[i])){
							getMatlData(leadItem[i], itemSeq, i + 1, type);
						}
					}
					
					for(var i = 0; i < leadPart.length; i += 2){
						if(!fn_empty(leadPart[i])){
							getPartData(leadPart[i], leadPart[i + 1]);
						}
					}
					$('#SL05-SOLD_CUST_CD').prop('disabled', true);
					$('#cmm_pop_SOLD_CUST_CD').hide();
					
					var param = {
							HEAD_ID: 'SALES_OFFICE_CD',
							CODE: $('#SL05-SALES_ORG_CD').val() + $('#SL05-DISTRB_CH').val() + $('#SL05-DIV_CD').val()
					};
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var elm = document.getElementById('SL05-SALES_OFFICE_CD');
						var value = elm.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">[' + v.CODE + '] ' + v.CODE_NM + '</option>';
						});
						elm.innerHTML = context;
						elm.value = value;
					});
				}
				
				if('WE' == $("#partnerGrid").jqGrid('getCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_TP')){
					$('#SL05-SHIP_CUST_CD').val($("#partnerGrid").jqGrid('getCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NO'));
					$('#SL05-SHIP_CUST_NM').text($("#partnerGrid").jqGrid('getCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NM'));
				}
				
				if('RE' == $("#partnerGrid").jqGrid('getCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_TP')){
					$('#SL05-BILL_CUST_CD').val($("#partnerGrid").jqGrid('getCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NO'));
					$('#SL05-BILL_CUST_NM').text($("#partnerGrid").jqGrid('getCell', $('#partnerGrid').jqGrid('getGridParam', 'selrow'), 'PF_PS_NM'));
				}
			}
			
			if ($("#SL05-SOLD_CUST_CD").val() != "" && type == 'SOLD') {		
				var param = {			
					CUST_CD: $("#SL05-SOLD_CUST_CD").val()
				}
				fn_ajax('/customer/getCustText.do', true, param, function(data) {
					if (!!data.RESULT) {
						if (data.RESULT.length>0 && data.RESULT[0] != null && data.RESULT[0].CUST_TEXT != undefined && data.RESULT[0].CUST_TEXT != "") {
							
							var url = "<c:url value="/customer/InternalMessagePopup.do"/>";
							var pid = "InternalMessagePopup";
							var param = {
								CUST_CD: $("#SL05-SOLD_CUST_CD").val()
							};				
							popupOpen(url, pid, param);
						}
					}
				});
			}
		});
	}
	
	function initPartTab(){
		partTabFlag = true;
		
		createPartnerGrid();
		createTextGrid();
		
		selectPartnerTab();
		
		$('#partnerGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				saveAllGrid();
				if(index == 5 && ('AG' != $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP'))){
					if('AP' == $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP')){
						var url = "/popup/ContactPersonPopup.do";
						var pid = "ContactPersonPopup";  //팝업 페이지의 취상위 div ID
						var param = { 'CUST_CD':$('#SL05-SOLD_CUST_CD').val()
									, 'CUST_NM':$('#SL05-SOLD_CUST_NM').text()
						};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].FULL_NM);	
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_DESC', data[0].SEARCH_NM);
								$("#partnerGrid").jqGrid('setCell', rowId, 'NAME_1ST', data[0].H_NAME_1ST);
								$("#partnerGrid").jqGrid('setCell', rowId, 'NAME_2ND', data[0].H_NAME_2ND);
								$("#partnerGrid").jqGrid('setCell', rowId, 'STREET_NM', data[0].H_STREET_NM);
								$("#partnerGrid").jqGrid('setCell', rowId, 'STREET_NM2', data[0].H_STREET_NM2);
								$("#partnerGrid").jqGrid('setCell', rowId, 'HAUS_NO', data[0].H_HAUS_NO);
								$("#partnerGrid").jqGrid('setCell', rowId, 'POST_CD', data[0].H_POST_CD);
								$("#partnerGrid").jqGrid('setCell', rowId, 'CITY_CD', data[0].H_CITY_NM);
								$("#partnerGrid").jqGrid('setCell', rowId, 'COUNTRY_CD', data[0].H_COUNTRY_CD);
								$("#partnerGrid").jqGrid('setCell', rowId, 'REGION_CD', data[0].H_REGION_CD);
								$("#partnerGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].H_TEL_NO1);
								$("#partnerGrid").jqGrid('setCell', rowId, 'TEL_NO_EXT', data[0].H_TEL_NO1_EXT);
								$("#partnerGrid").jqGrid('setCell', rowId, 'FAX_NO', data[0].H_FAX_NO);
								$("#partnerGrid").jqGrid('setCell', rowId, 'FAX_NO_EXT', data[0].H_FAX_NO_EXT);
								$("#partnerGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].H_E_MAIL);
								$("#partnerGrid").jqGrid('setCell', rowId, 'VAT_REG_NO', data[0].H_VAT_ID);
								$("#partnerGrid").jqGrid('setCell', rowId, 'STREET', data[0].H_STREET);
								setRowStatus('partnerGrid');
								saveAllGrid();
							}
						});
					}else if('VN' == $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP')
							|| 'SP' == $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP')){
						var url = "/popup/VendorPopup.do";
						var pid = "VendorPopup";  //팝업 페이지의 취상위 div ID
						var param = {};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].FULL_NM);	
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_DESC', data[0].SEARCH_NM);	
								$("#partnerGrid").jqGrid('setCell', rowId, 'NAME_1ST', data[0].H_NAME_1ST);
								$("#partnerGrid").jqGrid('setCell', rowId, 'NAME_2ND', data[0].H_NAME_2ND);
								$("#partnerGrid").jqGrid('setCell', rowId, 'STREET_NM', data[0].H_STREET_NM);
								$("#partnerGrid").jqGrid('setCell', rowId, 'STREET_NM2', data[0].H_STREET_NM2);
								$("#partnerGrid").jqGrid('setCell', rowId, 'HAUS_NO', data[0].H_HAUS_NO);
								$("#partnerGrid").jqGrid('setCell', rowId, 'POST_CD', data[0].H_POST_CD);
								$("#partnerGrid").jqGrid('setCell', rowId, 'CITY_CD', data[0].H_CITY_NM);
								$("#partnerGrid").jqGrid('setCell', rowId, 'COUNTRY_CD', data[0].H_COUNTRY_CD);
								$("#partnerGrid").jqGrid('setCell', rowId, 'REGION_CD', data[0].H_REGION_CD);
								$("#partnerGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].H_TEL_NO1);
								$("#partnerGrid").jqGrid('setCell', rowId, 'TEL_NO_EXT', data[0].H_TEL_NO1_EXT);
								$("#partnerGrid").jqGrid('setCell', rowId, 'FAX_NO', data[0].H_FAX_NO);
								$("#partnerGrid").jqGrid('setCell', rowId, 'FAX_NO_EXT', data[0].H_FAX_NO_EXT);
								$("#partnerGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].H_E_MAIL);
								$("#partnerGrid").jqGrid('setCell', rowId, 'VAT_REG_NO', data[0].H_VAT_ID);
								$("#partnerGrid").jqGrid('setCell', rowId, 'STREET', data[0].H_STREET);
								setRowStatus('partnerGrid');
								saveAllGrid();
							}
						});
					} else if ($("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ZI' ||
							   $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ZK' ||
							   $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP') === 'SP'||
							   $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP') === 'PE'||
							   $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ZP'||
							   $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ER') {
						var url = "/popup/UserPopup2.do";
						var pid = "UserPopup2";
						var param = {
							S_CODE: $("#partnerGrid").jqGrid('getCell', rowId, 'PF_PS_NO'),
							SEARCH : 'S_USER_ID'
						};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].USER_ID);
								$("#partnerGrid").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].NAME_FULL);
								setRowStatus('partnerGrid');
							}
							btGrid.gridSaveRow('pfGrd');
						});
					} else{
// 						openCustomerPopUp($("#partnerGrid").jqGrid('getCell', rowId, 'PF_PS_NO'), 'PF');
						openCustomerPopUp('', 'PF');
// 						openPfPop2($("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP'), rowId, 'partnerGrid', $("#partnerGrid").jqGrid('getCell', rowId, 'PF_TP'));
					}
				}else if(index == 9){
					openOnetimeCustPop('PF', rowId);
					setRowStatus('partnerGrid');
				}
			}
		});
		
		$('#textGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				var tempVal = $("#textGrid").jqGrid('getCell', rowId, 'MATL_TEXT');
				tempVal = tempVal.replace(/\\r\\n/g, '\r\n');
				tempVal = tempVal.replace(/(\n|<br\/>|<br \/>)/g, '\r\n');

				$('#head_long_txt').val(tempVal);
			}
		});
		
		chkPfGrid();
		
		tempDataSave();
		beforeTab = 'PARTNER';
	}
	
	function createPartnerGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, 'SEQ'
				, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'partnerGrid\')" />'
				, '<s:message code="quotation.grd.partnerFnc"/>'
				, '<s:message code="quotation.grd.number"/>'
				, '<s:message code="quotation.grd.name"/>'
				, '<s:message code="quotation.grd.partDesc"/>'
				, '<s:message code="sales.grd.street"/>'
				, '<s:message code="quotation.grd.moreData"/>'
				, '<s:message code="sales.grd.title"/>'
				, '<s:message code="sales.grd.nameF"/>'
				, '<s:message code="sales.grd.nameS"/>'
				, '<s:message code="sales.grd.house"/>'
				, '<s:message code="sales.grd.postCd"/>'
				, '<s:message code="sales.grd.city"/>'
				, '<s:message code="sales.grd.country"/>'
				, '<s:message code="sales.grd.region"/>'
				, '<s:message code="sales.grd.timeZone"/>'
				, '<s:message code="sales.grd.transpZone"/>'
				, '<s:message code="sales.grd.poBox"/>'
				, '<s:message code="sales.grd.postalCode"/>'
				, '<s:message code="sales.grd.companyPost"/>'
				, '<s:message code="sales.grd.language"/>'
				, '<s:message code="sales.grd.telephone"/>'
				, '<s:message code="sales.grd.extension"/>'
				, '<s:message code="sales.grd.mobilePhn"/>'
				, '<s:message code="sales.grd.fax"/>'
				, '<s:message code="sales.grd.extension"/>'
				, '<s:message code="sales.grd.eml"/>'
				, '<s:message code="sales.grd.stdComMtd"/>'
				, '<s:message code="sales.grd.dataLine"/>'
				, '<s:message code="sales.grd.comments"/>'
				, '<s:message code="sales.grd.unloadPoint"/>'
				, '<s:message code="sales.grd.vatRegNo"/>'
				, 'PF_CNT'
				, 'ITEM_SEQ'
				, 'ACCOUNT_GR'
				, 'STREET_NM'
				, 'STREET_NM2'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'CHK', width : 40, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
			, { name: 'PF_TP', width: 100, align: 'left', editable:true, edittype:"select", formatter : "select", sortable: false, editoptions:{
				value:'${pf_tp}', dataEvents:[{type:"change",fn:function(e){setRowStatus('partnerGrid'); chkDupPFCode('partnerGrid');}}]}}
			, { name: 'PF_PS_NO', width: 150, align: 'center', classes: 'gridbtnsearch', editable:false, hidden: false, sortable: false}
			, { name: 'PF_PS_NM', width: 150, align: 'left', editable:false, sortable: false, editoptions:{
				dataEvents:[{type:"change",fn:function(e){setRowStatus('partnerGrid'); }}]}}
			, { name: 'PF_DESC', width: 250, align: 'left', editable:false, hidden: true, sortable: false, editoptions:{
				dataEvents:[{type:"change",fn:function(e){setRowStatus('partnerGrid'); }}]}}
			, { name: 'STREET', width: 250, align: 'left', editable:false, hidden: false, sortable: false, editoptions:{
				dataEvents:[{type:"change",fn:function(e){setRowStatus('partnerGrid'); }}]}}
			, { name: 'MORE_DATA', width: 10, align: 'center', editable:false, classes: 'gridbtnsearch2', sortable: false}
			, { name: 'TITLE', width: 100, align: 'center', editable:false, hidden: true}
			, { name: 'NAME_1ST', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'NAME_2ND', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'HAUS_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'POST_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'CITY_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'COUNTRY_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'REGION_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TIME_ZONE', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TRANSP_ZONE', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'PO_BOX', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'PO_POST_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'COMP_POST_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'LANG_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TEL_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TEL_NO_EXT', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'MOBILE_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'FAX_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'FAX_NO_EXT', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'E_MAIL', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'STD_COM_MTD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'DATA_LINE', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'COMMENTS', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'UNLD_PT', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'VAT_REG_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'PF_CNT', width: 50, align: 'center', hidden:true}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'ACCOUNT_GR', width: 50, align: 'center', hidden:true}
			, { name: 'STREET_NM', width: 250, align: 'left', hidden:true}
			, { name: 'STREET_NM2', width: 250, align: 'left', hidden:true}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:254,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('partnerGrid', colName, colModel, gSetting);
	}
	
	function createTextGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, 'SEQ'
				, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'textGrid\')" />'
				, '<s:message code="quotation.grd.textType"/>'
				, '<s:message code="quotation.grd.lang"/>'
				, 'Contents'
				, 'ROW_STATUS'
				];
		var colModel = [
				  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
				, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
				, { name: 'SEQ', width: 50, align: 'center', hidden:true}
				, { name: 'CHK', width : 50, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
				, { name: 'TEXT_TP', width: 250, align: 'left', editable:true, edittype:"select", formatter : "select", sortable: false, editoptions:{value:'${text_tp}'
					, dataEvents:[{type:"change",fn:function(e){setRowStatus('textGrid'); chkDupTextCode();}}]}}
				, { name: 'LANG_CD', width: 150, align: 'left', editable:true, edittype:"select", formatter : "select", sortable: false, editoptions:{value:'${text_lang}'
					, dataEvents:[{type:"change",fn:function(e){setRowStatus('textGrid');}}]}}
				, { name: 'MATL_TEXT', width: 650, align: 'left', sortable: false, editoptions:{dataEvents:[ { type:"change", fn:function(e){setRowStatus('textGrid'); }}]}, editable:false}
				, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
				];
		
		var gSetting = {
			height:250,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: false,
			autowidth: false,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('textGrid', colName, colModel, gSetting);
	}
	
	function initItemTab(){
		itemTabFlag = true;
		
		createItemGrid();
		
		$('#itemGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				if(index == 5){
// 					openProductPop($("#itemGrid").jqGrid('getCell', rowId, 'MATL_CD'), $('#SL05-SALES_ORG_CD').val(), $('#SL05-DISTRB_CH').val(), $('#SL05-DIV_CD').val());
 					if(fn_empty($("#itemGrid").jqGrid('getCell', rowId, 'pItemSeq'))){
 						openProductPop('', $('#SL05-SALES_ORG_CD').val(), $('#SL05-DISTRB_CH').val(), $('#SL05-DIV_CD').val(), 'N');
 					}
				}
			}
		});
		
		selectItemTab();
		
		tempDataSave();
		beforeTab = 'ITEM';
	}
	
	function createItemGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, 'SEQ'
				, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'itemGrid\')" />'
				, '<s:message code="quotation.grd.item"/>'
				, '<s:message code="quotation.grd.material"/>'
				, '<s:message code="quotation.grd.description"/>'
				, '<s:message code="quotation.grd.itemCat"/>'
				, '<s:message code="quotation.grd.qty"/>'
				, '<s:message code="quotation.grd.ordUnit"/>'
				, '<s:message code="quotation.grd.bUnit"/>'
				, '<s:message code="quotation.grd.batch"/>'
				, '<s:message code="quotation.grd.netPrice"/>'
				, '<s:message code="quotation.grd.erpNetPrice"/>'
				, '<s:message code="quotation.grd.erpPer"/>'
				, '<s:message code="quotation.grd.uomErp"/>'
				, '<s:message code="quotation.grd.curr"/>'
				, '<s:message code="quotation.grd.netValue"/>'
				, '<s:message code="quotation.grd.listPrice"/>'
				, '<s:message code="quotation.grd.per"/>'
				, '<s:message code="quotation.grd.uom"/>'
				, 'COND_SUM'
				, '<s:message code="quotation.grd.dayType"/>'
				, '<s:message code="quotation.grd.dlvDate"/>'
				//, '<s:message code="quotation.grd.atpQty"/>'
				, '<s:message code="quotation.grd.div"/>'
				, '<s:message code="quotation.grd.plnt"/>'
				//, '<s:message code="quotation.grd.atpChk"/>'
				//, '<s:message code="quotation.grd.fixDateQty"/>'
				, 'UNIT1_QTY'
				, 'UNIT1_CD'
				, 'UNIT2_QTY'
				, 'UNIT2_CD'
				, 'PRICE_DT'
				, 'BOM_NO'
				, 'ORD_PROB'
				, 'USAGE_CD'
				, 'RSN_RJT_CD'
				, 'DB_RSN_RJT_CD'
				, 'SHIP_PO_CD'
				, 'RUT_CD'
				, 'DELI_PRIOR_CD'
				, 'MAX_P_DELI'
				, 'SCDL_LINE_YN'
				, 'INFO_TEXT'
				, 'pItemSeq'
				, 'pItemSeq_QTY'
				, 'GROSS_WT'
				, 'NET_WT'
				, 'WT_UNIT'
				, 'VOL_QTY'
				, 'VOL_UNIT'
				, 'ERP_NET_VAL'
				, 'OUTPUT'
				, 'LONG_TEXT'
				, 'ERP_STATUS'
				, 'BS_QTY'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'CHK', width : 40, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:false, sortable: false}
			, { name: 'MATL_CD', width: 80, align: 'center', classes: 'gridbtnsearch', editable:false, hidden: false, sortable: false}
			, { name: 'MATL_DESC', width: 150, align: 'left', hidden:false, editable:true, sortable: false, editoptions:{
				  dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid');}}]} }
			, { name: 'ITEM_CTG_GR', width: 50, align: 'center', edittype:"select", formatter : "select", sortable: false, editoptions:{
				  value:'${item_cat}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); checkItemGrp(this); setErpStatus();}}]}, editable:true}
			, { name: 'ORD_QTY', width: 50, align: 'right', hidden:false, editable:true, sortable: false,
				editoptions:{ maxlength:10
							, dataInit: function(element) {
								$(element).keyup(function(e){
									var val1 = element.value;
									var orgNum = element.value;
									
									var pItemSeq = $("#itemGrid").jqGrid('getCell', $('#itemGrid').jqGrid('getGridParam', 'selrow'), 'pItemSeq');
									var pItemQty = $("#itemGrid").jqGrid('getCell', $('#itemGrid').jqGrid('getGridParam', 'selrow'), 'pItemSeq_QTY');
									
									if(!fn_empty(pItemSeq) && 0 < Number(pItemSeq)){
										$(this).val(pItemQty);
									}else{
										if('190' != e.which){
											var tempArr;
											if (val1.indexOf(',') != -1) {
												tempArr = val1.split(",");
												val1 = fn_replaceAll(tempArr[0], '.', '') + '.' + tempArr[1];
											}else{
												val1 = fn_replaceAll(val1, '.', '');
											}
											
											var num = new Number(val1);
											
											if(isNaN(num)){
												$(this).val("");
											}else{
												$(this).val(orgNum);
												setRowStatus('itemGrid');
		// 										calcWgtVol();
												setErpStatus();
											}
										}else{
											$(this).val("");
										}
									}
								})
// 							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); calcWgtVol(); setErpStatus();} } ]
							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); setErpStatus();} } ]
// 							}
						}
				}
			, { name: 'ORD_UNIT_CD', width: 50, align: 'center', edittype:"select", formatter : "select", editoptions:{
				  value:'${unit_cd}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); }}]}, editable:true, sortable: false}
			, { name: 'BASIC_UNIT', width: 50, align: 'center', width: 50, align: 'center', sortable: false, hidden:true}
			, { name: 'BATCH_NO', width: 60, align: 'left', hidden:true, editable:false, sortable: false}  // CRM, ERP DISPLAY NONE
			, { name: 'NET_PRICE', width: 50, align: 'right', hidden:false, editable:true, sortable: false,
				editoptions:{ maxlength:10
							, dataInit: function(element) {
								$(element).keyup(function(e){
									var val1 = element.value;
									var orgNum = element.value;
									
									if('190' != e.which){
										var tempArr;
										if (val1.indexOf(',') != -1) {
											tempArr = val1.split(",");
											val1 = fn_replaceAll(tempArr[0], '.', '') + '.' + tempArr[1];
										}else{
											val1 = fn_replaceAll(val1, '.', '');
										}
										
										var num = new Number(val1);
										
										if(isNaN(num)){
											$(this).val("");
										}else{
											$(this).val(orgNum);
											setRowStatus('itemGrid');
											setErpStatus();
										}
									}else{
										$(this).val("");
									}
								})
// 							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); calcPrice(); setErpStatus();} } ]
							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); setErpStatus();} } ]
// 							}
						}
				}
			, { name: 'ZPNN_PRICE', width: 60, align: 'right', hidden:true, sortable: false}
			
// 			, { name: 'ZPNN_PER', width: 50, align: 'right', hidden:false, edittype:"select", formatter : "select", sortable: false, editoptions:{
// 				  value:'${per_tp}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); setErpStatus(); }}]}, editable:true}

			, { name: 'ZPNN_PER', width: 50, align: 'right', hidden:false, editable:true, sortable: false, 
				formatter: 'integer',
                formatoptions :{ decimalSeparator: "", decimalPlaces:0, thousandsSeparator:".", defaultValue: ''},
				editoptions:{ maxlength:5
                , dataEvents:[ { type:'change', fn:function(e){setRowStatus('itemGrid'); setErpStatus();} } ]
				}
			   }			
			
			
			
			, { name: 'ZPNN_UOM', width: 50, align: 'center', hidden:false, edittype:"select", formatter : "select", sortable: false, editoptions:{
				  value:'${uom_tp}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); setErpStatus(); }}]}, editable:true}
			, { name: 'CURR', width: 50, align: 'center', hidden:false, edittype:"select", formatter : "select", editoptions:{
				  value:'${curr_cd}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); }}]}, editable:true, sortable: false}
			, { name: 'NET_VAL', width: 50, align: 'right', hidden:false, editable:false, sortable: false}
			, { name: 'ERP_NET_PRICE', width: 60, align: 'right', hidden:false, sortable: false}
			
// 			, { name: 'PER', width: 50, align: 'right', hidden:false, edittype:"select", formatter : "select", sortable: false, editoptions:{
// 				  value:'${per_tp}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); setErpStatus(); }}]}, editable:false}
			
			, { name: 'PER', width: 50, align: 'right', hidden:false, editable:false, sortable: false }			
		   
			
			, { name: 'UOM', width: 50, align: 'center', hidden:false, edittype:"select", formatter : "select", sortable: false, editoptions:{
				  value:'${uom_tp}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); setErpStatus(); }}]}, editable:false}
			, { name: 'COND_SUM', width: 50, align: 'right', hidden:true, editable:false, sortable: false}
			, { name: 'DELI_DT_1ST_TP', width: 50, align: 'center', hidden:true, edittype:"select", formatter : "select", editoptions:{
				  value:'${dt_tp}', dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); }}]}, editable:true, sortable: false}
			, { name: 'DELI_DT_1ST', width: 60, align: 'left', hidden:false, editable: true, sortable: false,
				reformatAfterEdit : false , formatter: 'date',
				formatoptions: {srcformat: 'd.m.Y', newformat: 'd.m.Y', defaultValue:null },
				editoptions: {size: 12, maxlengh: 12,
					dataInit: function (element) {
						$(element).datepicker({ dateFormat: 'dd.mm.yy' })
					}, dataEvents:[{type:"change", fn:function(e){ setRowStatus('itemGrid'); } }]
				}
			}
// 			, { name: 'ATP_QTY', width: 50, align: 'center', hidden:false, editable:true, 
// 				editoptions:{ maxlength:10
// 							, dataInit: function(element) {
// 								$(element).keyup(function(e){
// 									var val1 = element.value;
// 									var num = new Number(val1);
// 									(isNaN(num)) ? $(this).val("") : '';
// 								})
// 							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); } } ]
// 						}
// 				}
			, { name: 'DIV_CD', width: 50, align: 'center', hidden:false, editable:false, sortable: false, hidden:true}
			, { name: 'PLANT_CD', width: 50, align: 'center', hidden:false, editable:false, sortable: false, hidden:true}
// 			, { name: 'ATP_CHK', width: 50, align: 'center', hidden:false, editable:true, editoptions:{ maxlength:1
// 				, dataEvents:[ { type:"change", fn:function(e){setRowStatus('itemGrid'); } } ] }}
// 			, { name: 'FIX_DT_QTY_YN', width: 50, align: 'center', hidden:false, hidden: false, formatter : gridCboxFormat, sortable: false}
			, { name: 'UNIT1_QTY', width: 50, align: 'center', hidden:true}
			, { name: 'UNIT1_CD', width: 50, align: 'center', hidden:true}
			, { name: 'UNIT2_QTY', width: 50, align: 'center', hidden:true}
			, { name: 'UNIT2_CD', width: 50, align: 'center', hidden:true}
			, { name: 'PRICE_DT', width: 50, align: 'center', hidden:true}
			, { name: 'BOM_NO', width: 50, align: 'center', hidden:true}
			, { name: 'ORD_PROB', width: 50, align: 'center', hidden:true}
			, { name: 'USAGE_CD', width: 50, align: 'center', hidden:true}
			, { name: 'RSN_RJT_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DB_RSN_RJT_CD', width: 50, align: 'center', hidden:true}
			, { name: 'SHIP_PO_CD', width: 50, align: 'center', hidden:true}
			, { name: 'RUT_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DELI_PRIOR_CD', width: 50, align: 'center', hidden:true}
			, { name: 'MAX_P_DELI', width: 50, align: 'center', hidden:true}
			, { name: 'SCDL_LINE_YN', width: 50, align: 'center', hidden:true}
			, { name: 'INFO_TEXT', width: 50, align: 'center', hidden:true}
			, { name: 'pItemSeq', width: 50, align: 'center', hidden:true}
			, { name: 'pItemSeq_QTY', width: 50, align: 'center', hidden:true}
			, { name: 'GROSS_WT', width: 50, align: 'center', hidden:true}
			, { name: 'NET_WT', width: 50, align: 'center', hidden:true}
			, { name: 'WT_UNIT', width: 50, align: 'center', hidden:true}
			, { name: 'VOL_QTY', width: 50, align: 'center', hidden:true}
			, { name: 'VOL_UNIT', width: 50, align: 'center', hidden:true}
			
			, { name: 'ERP_NET_VAL', width: 50, align: 'center', hidden:true}
			, { name: 'OUTPUT', width: 50, align: 'center', hidden:true}
			, { name: 'LONG_TEXT', width: 50, align: 'center', hidden:true}
			, { name: 'ERP_STATUS', width: 50, align: 'center', hidden:true}
			, { name: 'BS_QTY', width: 50, align: 'center', hidden:true}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:592,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('itemGrid', colName, colModel, gSetting);
	}
	
	function initItemDtlTab(){
		itemDtlTabFlag = true;
		
		var codeBoxArray = [  'SL05-ITEM_CTG_GR' , 'SL05_ITEM_DETAIL-DT_TP'
							, 'SL05-USAGE_CD'        , 'SL05-RSN_RJT_CD'    , 'SL05-SHIP_PO_CD'
							, 'SL05-RUT_CD'          , 'SL05-DELI_PRIOR_CD' 
							];
		
		var codeBoxArrayDt = [ 'SL05_ITEM_DETAIL-DT_TP' ];
		
		createCodeBoxByEdit(codeBoxArray, true);
		createCodeBoxByEdit(codeBoxArrayDt, false);
		
		var unitCd = '${unit_cd}';
		var retVal = unitCd.split(';');
		
		$("#SL05-ORD_UNIT_CD").empty().data('options');
		$("#SL05-ORD_UNIT_CD").append('<option value=' + "" + '></option>');
		
		for(j = 0; j < retVal.length; j++){
			var tempVal = retVal[j].split(':');
			$("#SL05-ORD_UNIT_CD").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
		}
		
		createItemPfGrid();
		
		('' == $('#SL05-DELI_DT_1ST').val()) ? $('#SL05-DELI_DT_1ST').val(toDay) : '';
		
		$('#itemPfGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				saveAllGrid();
				if(index == 5 && ('AG' != $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP'))){
					if('AP' == $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP')){
						var url = "/popup/ContactPersonPopup.do";
						var pid = "ContactPersonPopup";  //팝업 페이지의 취상위 div ID
						var param = { 'CUST_CD':$('#SL05-SOLD_CUST_CD').val()
									, 'CUST_NM':$('#SL05-SOLD_CUST_NM').text()
						};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].FULL_NM);	
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_DESC', data[0].SEARCH_NM);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'SYNC_FLAG', 'N');
								$("#itemPfGrid").jqGrid('setCell', rowId, 'NAME_1ST', data[0].H_NAME_1ST);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'NAME_2ND', data[0].H_NAME_2ND);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'STREET_NM', data[0].H_STREET_NM);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'STREET_NM2', data[0].H_STREET_NM2);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'HAUS_NO', data[0].H_HAUS_NO);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'POST_CD', data[0].H_POST_CD);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'CITY_CD', data[0].H_CITY_NM);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'COUNTRY_CD', data[0].H_COUNTRY_CD);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'REGION_CD', data[0].H_REGION_CD);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].H_TEL_NO1);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'TEL_NO_EXT', data[0].H_TEL_NO1_EXT);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'FAX_NO', data[0].H_FAX_NO);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'FAX_NO_EXT', data[0].H_FAX_NO_EXT);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].H_E_MAIL);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'VAT_REG_NO', data[0].H_VAT_ID);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'STREET', data[0].H_STREET);
								setRowStatus('itemPfGrid');
							}
						});
					}else if('VN' == $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP')
							|| 'SP' == $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP')){
						var url = "/popup/VendorPopup.do";
						var pid = "VendorPopup";  //팝업 페이지의 취상위 div ID
						var param = {};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].FULL_NM);	
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_DESC', data[0].SEARCH_NM);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'SYNC_FLAG', 'N');
								$("#itemPfGrid").jqGrid('setCell', rowId, 'NAME_1ST', data[0].H_NAME_1ST);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'NAME_2ND', data[0].H_NAME_2ND);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'STREET_NM', data[0].H_STREET_NM);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'STREET_NM2', data[0].H_STREET_NM2);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'HAUS_NO', data[0].H_HAUS_NO);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'POST_CD', data[0].H_POST_CD);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'CITY_CD', data[0].H_CITY_NM);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'COUNTRY_CD', data[0].H_COUNTRY_CD);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'REGION_CD', data[0].H_REGION_CD);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].H_TEL_NO1);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'TEL_NO_EXT', data[0].H_TEL_NO1_EXT);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'FAX_NO', data[0].H_FAX_NO);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'FAX_NO_EXT', data[0].H_FAX_NO_EXT);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].H_E_MAIL);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'VAT_REG_NO', data[0].H_VAT_ID);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'STREET', data[0].H_STREET);
								setRowStatus('itemPfGrid');
							}
						});
					}else if ($("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ZI' ||
							   $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ZK' ||
							   $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP') === 'SP' ||
							   $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP') === 'PE'||
							   $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ZP'||
							   $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP') === 'ER') {
						var url = "/popup/UserPopup2.do";
						var pid = "UserPopup2";
						var param = {
							S_CODE: $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_PS_NO'),
							SEARCH : 'S_USER_ID'
						};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].USER_ID);
								$("#itemPfGrid").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].NAME_FULL);
								setRowStatus('itemPfGrid');
							}
							btGrid.gridSaveRow('itemPfGrid');
						});
					}else{
// 						openCustomerPopUp($("#itemPfGrid").jqGrid('getCell', rowId, 'PF_PS_NO'), 'ITEM');
						openCustomerPopUp('', 'ITEM');
// 						openPfPop2($("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP'), rowId, 'itemPfGrid', $("#itemPfGrid").jqGrid('getCell', rowId, 'PF_TP'));
					}
				}else if(index == 9){
					openOnetimeCustPop('ITEM', rowId);
					setRowStatus('itemPfGrid');
				}
				saveAllGrid();
			}
		});
		
		fn_setModify('frmItemDtl', 'SL05-');
		
		tempDataSave();
		beforeTab = 'ITEM_DTL';
		
		setItemDtlDisalbed();
	}
	
	function initSlTab(){
		slTabFlag = true;
		
		setWeekTpToDay('SC');
		
		createScGrid();
		
		tempDataSave();
		beforeTab = 'SCHE';
	}
	
	function createScGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
// 				, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'scGrid\')" />'
				, 'SEQ'
				, '<s:message code="quotation.grd.seq"/>'
				, '<s:message code="quotation.grd.material"/>'
				, '<s:message code="quotation.grd.period"/>'
				, '<s:message code="quotation.grd.deliDate"/>'
				, '<s:message code="quotation.grd.orderQty"/>'
				, '<s:message code="quotation.grd.confirmQty"/>'
				, '<s:message code="quotation.grd.salesUnit"/>'
				, '<s:message code="quotation.grd.atpQty"/>'
				, '<s:message code="quotation.grd.deliveryBl"/>'
				, '<s:message code="quotation.grd.batch"/>'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
// 			, { name: 'CHK', width : 40, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
			, { name: 'SEQ', width: 50, align: 'center', hidden:false}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'MATL_CD', width: 50, align: 'center', hidden:true}
			, { name: 'PERI_CD', width: 50, align: 'center', editable:false, edittype:"select", formatter : "select", editoptions:{
				  value:'${dt_tp}'
						, dataEvents:[ { type:"change", fn:function(e){setRowStatus('scGrid'); } } ]
				}, editable:false}
			, { name: 'DELI_DT', width: 60, align: 'center', hidden:false, editable: false, 
				reformatAfterEdit : false , formatter: 'date',
				formatoptions: {srcformat: 'd.m.Y', newformat: 'd.m.Y', defaultValue:null },
				editoptions: {size: 12, maxlengh: 12,
					dataInit: function (element) {
						$(element).datepicker({ dateFormat: 'dd.mm.yy' })
					}, dataEvents:[{type:"change", fn:function(e){ setRowStatus('scGrid'); } }]
				}
			}
			, { name: 'ORD_QTY', width: 50, align: 'center', hidden:false, 
						editoptions:{ maxlength:10
							, dataInit: function(element) {
								$(element).keyup(function(e){
									var val1 = element.value;
									var num = new Number(val1);
									(isNaN(num)) ? $(this).val("") : '';
								})
							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('scGrid'); } } ]
						}, editable:false
				}
			, { name: 'CFM_QTY', width: 50, align: 'center', hidden:false, 
						editoptions:{ maxlength:10
							, dataInit: function(element) {
								$(element).keyup(function(e){
									var val1 = element.value;
									var num = new Number(val1);
									(isNaN(num)) ? $(this).val("") : '';
								})
							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('scGrid'); } } ]
						}, editable:false
				}
			, { name: 'SALES_UNIT_CD', width: 50, align: 'center', hidden:false,editoptions:{ maxlength:3
				, dataEvents:[ { type:"change", fn:function(e){setRowStatus('scGrid'); } } ]
				}, editable:false}
			, { name: 'ATP_QTY', width: 50, align: 'center', hidden:false, 
						editoptions:{ maxlength:10
							, dataInit: function(element) {
								$(element).keyup(function(e){
									var val1 = element.value;
									var num = new Number(val1);
									(isNaN(num)) ? $(this).val("") : '';
								})
							}, dataEvents:[ { type:"change", fn:function(e){setRowStatus('scGrid'); } } ]
						}, editable:false
				}
			, { name: 'DELI_BLOCK_CD', width: 50, align: 'left', editable:true, edittype:"select", formatter : "select", editoptions:{
				  value:'${dvl_blc_cd}'
						, dataEvents:[ { type:"change", fn:function(e){setRowStatus('scGrid'); } } ]
				}, editable:true}
			, { name: 'BATCH_NO', width: 50, align: 'center', hidden:false,editoptions:{ maxlength:10}, editable:false}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:560,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('scGrid', colName, colModel, gSetting);
	}
	
	function initThTab(){
		thTabFlag = true;
		
		setWeekTpToDay('TH');
		
		createThGrid();
	}
	
	function createThGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, '<s:message code="quotation.grd.item"/>'
				, 'SEQ'
				, '<s:message code="quotation.grd.document"/>'
				, '<s:message code="quotation.grd.document"/>' + ' ' + '<s:message code="quotation.grd.item"/>'
				, '<s:message code="quotation.grd.date"/>'
				, '<s:message code="quotation.grd.qty"/>'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:false}
			, { name: 'SEQ', width: 50, align: 'center', hidden:false}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:false}
			, { name: 'DOC_ITEM', width: 50, align: 'center', hidden:false}
			, { name: 'DATE', width: 50, align: 'center', hidden:false}
			, { name: 'QTY', width: 50, align: 'center', hidden:false}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:560,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('thGrid', colName, colModel, gSetting);
	}
	
	function initHisTab(){
		hisTabFlag = true;
		
		createHisGrid();
		
		selectHisTab();
	}
	
	function createHisGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, 'SEQ'
				, '<s:message code="quotation.grd.action"/>'
				, '<s:message code="quotation.grd.field"/>'
				, '<s:message code="quotation.grd.oldVal"/>'
				, '<s:message code="quotation.grd.newVal"/>'
				, '<s:message code="quotation.grd.changeOn"/>'
				, '<s:message code="quotation.grd.changeAt"/>'
				, '<s:message code="quotation.grd.changeId"/>'
				, '<s:message code="quotation.grd.changeBy"/>'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'ACT', width: 50, align: 'center', hidden:false}
			, { name: 'FIELD', width: 50, align: 'left', hidden:false}
			, { name: 'OLD_VAL', width: 50, align: 'left', hidden:false}
			, { name: 'NEW_VAL', width: 50, align: 'left', hidden:false}
			, { name: 'CHG_DT', width: 50, align: 'center', hidden:false}
			, { name: 'CHG_TM', width: 50, align: 'center', hidden:true}
			, { name: 'CHG_ID', width: 50, align: 'center', hidden:true}
			, { name: 'CHG_NM', width: 50, align: 'left', hidden:false}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:592,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('hisGrid', colName, colModel, gSetting);
	}
	
	function initConditionTab(){
		conditionTabFlag = true;
		
		createConditionGrid();
		createConditionDtlGrid();
		
		$('#conditionGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				selectConditionDtlTab($("#conditionGrid").jqGrid('getCell', rowId, 'ITEM_SEQ'));
			}
		});
	}
	
	function createConditionGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, '<s:message code="quotation.grd.item"/>'
				, '<s:message code="quotation.grd.material"/>'
				, '<s:message code="quotation.grd.description"/>'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:false}
			, { name: 'MATL_CD', width: 50, align: 'center', hidden:false}
			, { name: 'MATL_DESC', width: 150, align: 'left', hidden:false}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:592,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('conditionGrid', colName, colModel, gSetting);
	}
	
	function createConditionDtlGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, '<s:message code="quotation.grd.item"/>'
				, '<s:message code="quotation.grd.conditionType"/>'
				, '<s:message code="quotation.grd.description"/>'
				, '<s:message code="quotation.grd.step"/>'
				, '<s:message code="quotation.grd.conditionCnt"/>'
				, '<s:message code="quotation.grd.netPrice"/>'
				, 'Currency'
				, '<s:message code="quotation.grd.per"/>'
				, '<s:message code="quotation.grd.uom"/>'
				, '<s:message code="quotation.grd.netValue"/>'
				, '<s:message code="quotation.grd.curr"/>'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:false}
			, { name: 'COND_TP', width: 50, align: 'center', hidden:false}
			, { name: 'COND_DESC', width: 150, align: 'left', hidden:false}
			, { name: 'STEP_NO', width: 50, align: 'right', hidden:true}
			, { name: 'COND_CNTR', width: 50, align: 'right', hidden:true}
			, { name: 'COND_VAL', width: 50, align: 'right', hidden:false}
			, { name: 'CURRENCY', width: 50, align: 'center', hidden:false}
			, { name: 'COND_P_UNIT_CD', width: 50, align: 'right', hidden:false}
			, { name: 'COND_UNIT_CD', width: 50, align: 'center', hidden:false}
			, { name: 'PRICE', width: 50, align: 'right', hidden:false}
			, { name: 'COND_CURR_CD', width: 50, align: 'center', hidden:false}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
			
		var gSetting = {
			height:592,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('conditionGridDtl', colName, colModel, gSetting);
	}
	
	function cSave(){
		
		(!partTabFlag) ? initPartTab() : '' ;
		(!itemTabFlag) ? initItemTab() : '' ;
		(!itemDtlTabFlag) ? initItemDtlTab() : '' ;
// 		(!slTabFlag) ? initSlTab() : '' ;
		
		calcWgtVol();
		
		if(saveValdChk()){
			if(confirm("<s:message code='confirm.save'/>")){
				
				tempDataSave();
				
				$('#SL05-DOC_STATUS').val("A");
				
				var ids = $('#itemGrid').jqGrid('getDataIDs');
				for(var i = 0; i < ids.length; i++){
					var netPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'NET_PRICE')));
					var erpNetPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'ERP_NET_PRICE')));
					var zpnnPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'ZPNN_PRICE')));
					
					var tempPrice = (0 == zpnnPrice) ? netPrice : zpnnPrice;
// 					if(netPrice < erpNetPrice){
					if(tempPrice < erpNetPrice){
						$('#SL05-APPROVAL_STS').val('N');
						$('#SL05-ALLOW_STS').val('N');
					}
				}
				
				beforeTab = 'MAIN';
				tempDataSave();
				
				var headData = formIdAllToMap('frmHeader');
				var partnerGrid = setPartnerData();
				var textGrid = setTextData();
				var itemGrid = setItemData();
				var itemDtl = formIdAllToMap('frmItemDtl');
				var scGrid = setScData();
				var itemPfGrid = setItemPartnerData();
				
				var param = {"param" : {
								  "headData" : headData
								, "partnerGrid" : partnerGrid
								, "textGrid" : textGrid
								, "itemGrid" : itemGrid
								, "itemDtl" : itemDtl
								, "scGrid" : scGrid
								, "itemPfGrid" : itemPfGrid
								}
							};
				var url = '/quotation/SaveQuotation.do';
				
				fn_ajax(url, true, param, function(data, xhr){
					$("#SL05-DOC_NO").val(data.docNo);
					$("#S-DOC_NO").val(data.docNo);
					
					alert("<s:message code='info.save'/>");
					
					$("#SL05-isStatus").val('M');
					
					ids = $('#textGrid').jqGrid('getDataIDs');
					for(var i = 0; i < ids.length; i++){
						if('' == $("#textGrid").jqGrid('getCell', ids[i], 'TEXT_TP')){
							$("#textGrid").jqGrid('delRowData',ids[i]);
						}
						$("#textGrid").jqGrid('setCell', ids[i], 'ROW_STATUS', 'R');
					}
					
					ids = $('#partnerGrid').jqGrid('getDataIDs');
					for(var i = 0; i < ids.length; i++){
						$("#partnerGrid").jqGrid('setCell', ids[i], 'ROW_STATUS', 'R');
					}
					
					ids = $('#itemPfGrid').jqGrid('getDataIDs');
					for(var i = 0; i < ids.length; i++){
						$("#itemPfGrid").jqGrid('setCell', ids[i], 'ROW_STATUS', 'R');
					}
					
					var url = '/salesOrder/getModiTms.do';
					var param = {"param" : { "DOC_NO" : $('#SL05-DOC_NO').val(), "DOC_GR" : "QT" }};
					
					fn_ajax(url, false, param, function(data, xhr){
						$('#SL05-MODI_TMS').val(data.result)
					});
					
					if('' != $('#SL05-APPROVAL_STS').val()){
						cUser2();
						$('#cBtnUser2').show();
					}
// 					else{
// 						setTimeout(function() {
// 							window.top.$('.ui-tabs-nav .ui-tabs-active span').trigger('click') ;
// 						});
// 					}
					
					cSearch();
				});
				
				$('#ui-id-1').trigger('click'); // Header
			}
		}
	}
	
	function setPartnerData(){
		saveAllGrid();
		var ids = $("#partnerGrid").jqGrid("getDataIDs");
		var gridData = [];
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#partnerGrid").getRowData(ids[i]);
			
			var auth = "";
			
			if($('#partnerGrid_' + ids[i] + '_CHK').prop('checked')){
				auth += "Y";
			}else{
				auth += "N";
			}
			
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "DOC_NO" : rowData["DOC_NO"]
					, "SEQ" : rowData["SEQ"]
					, "PF_TP" : rowData["PF_TP"]
					, "PF_PS_NM" : rowData["PF_PS_NM"]
					, "PF_PS_NO" : rowData["PF_PS_NO"]
					, "PF_DESC" : rowData["PF_DESC"]
					, "PF_CNT" : rowData["PF_CNT"]
					, "TITLE" : rowData["TITLE"]
					, "NAME_1ST" : rowData["NAME_1ST"]
					, "NAME_2ND" : rowData["NAME_2ND"]
					, "STREET_NM" : rowData["STREET_NM"]
		    		, "STREET_NM2" : rowData["STREET_NM2"]
					, "HAUS_NO" : rowData["HAUS_NO"]
					, "POST_CD" : rowData["POST_CD"]
					, "CITY_CD" : rowData["CITY_CD"]
					, "COUNTRY_CD" : rowData["COUNTRY_CD"]
					, "REGION_CD" : rowData["REGION_CD"]
					, "TIME_ZONE" : rowData["TIME_ZONE"]
					, "TRANSP_ZONE" : rowData["TRANSP_ZONE"]
					, "PO_BOX" : rowData["PO_BOX"]
					, "PO_POST_CD" : rowData["PO_POST_CD"]
					, "COMP_POST_CD" : rowData["COMP_POST_CD"]
					, "LANG_CD" : rowData["LANG_CD"]
					, "TEL_NO" : rowData["TEL_NO"]
					, "TEL_NO_EXT" : rowData["TEL_NO_EXT"]
					, "MOBILE_NO" : rowData["MOBILE_NO"]
					, "FAX_NO" : rowData["FAX_NO"]
					, "FAX_NO_EXT" : rowData["FAX_NO_EXT"]
					, "E_MAIL" : rowData["E_MAIL"]
					, "STD_COM_MTD" : rowData["STD_COM_MTD"]
					, "DATA_LINE" : rowData["DATA_LINE"]
					, "COMMENTS" : rowData["COMMENTS"]
					, "UNLD_PT" : rowData["UNLD_PT"]
					, "VAT_REG_NO" : rowData["VAT_REG_NO"]
					, "ITEM_SEQ":"000000"
					, "ROW_STATUS" : ('N' == auth) ? rowData["ROW_STATUS"] : 'D'
				}
			gridData.push(data);
		}
		
		return gridData;
	}
	
	function setItemData(){
		saveAllGrid();
		var ids = $("#itemGrid").jqGrid("getDataIDs");
		var gridData = [];
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#itemGrid").getRowData(ids[i]);
			var auth = "N";
			var fixDt = "";
			var scdl = "";
			
// 			if($('#itemGrid_' + ids[i] + '_CHK').prop('checked')){
// 				auth += "Y";
// 			}else{
// 				auth += "N";
// 			}
			
			if($('#itemGrid_' + ids[i] + '_FIX_DT_QTY_YN').prop('checked')){
				fixDt += "Y";
			}else{
				fixDt += "N";
			}
			
			if($('#itemGrid_' + ids[i] + '_SCDL_LINE_YN').prop('checked')){
				scdl += "Y";
			}else{
				scdl += "N";
			}
			
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "DOC_NO" : rowData["DOC_NO"]
					, "SEQ" : rowData["SEQ"]
					, "CHK" : auth
					, "ITEM_SEQ" : rowData["ITEM_SEQ"]
					, "MATL_CD" : rowData["MATL_CD"]
					, "MATL_DESC" : rowData["MATL_DESC"]
					, "ITEM_CTG_GR" : rowData["ITEM_CTG_GR"]
					, "ORD_QTY" : createNormalFm(rowData["ORD_QTY"])
					, "ORD_UNIT" : rowData["ORD_UNIT"]
					, "BATCH_NO" : rowData["BATCH_NO"]
					, "PER" : rowData["PER"]
					, "UOM" : rowData["UOM"]
					, "BASIC_UNIT" : rowData["BASIC_UNIT"]
					, "DELI_DT_1ST_TP" : rowData["DELI_DT_1ST_TP"]
					, "DELI_DT_1ST" : (' ' == rowData["DELI_DT_1ST"]) ? '' : rowData["DELI_DT_1ST"]
					, "NET_PRICE" : createNormalFm(rowData["NET_PRICE"])
					, "NET_VAL" : rowData["NET_VAL"]
					, "CURR" : rowData["CURR"]
					, "ATP_QTY" : rowData["ATP_QTY"]
					, "DIV_CD" : rowData["DIV_CD"]
					, "PLANT_CD" : rowData["PLANT_CD"]
					, "ATP_CHK" : rowData["ATP_CHK"]
					, "FIX_DT_QTY_YN" : fixDt
					, "ORD_UNIT_CD" : rowData["ORD_UNIT_CD"]
					, "UNIT1_QTY" : rowData["UNIT1_QTY"]
					, "UNIT1_CD" : rowData["UNIT1_CD"]
					, "UNIT2_QTY" : rowData["UNIT2_QTY"]
					, "UNIT2_CD" : rowData["UNIT2_CD"]
					, "PRICE_DT" : rowData["PRICE_DT"]
					, "BOM_NO" : rowData["BOM_NO"]
					, "ORD_PROB" : rowData["ORD_PROB"]
					, "USAGE_CD" : rowData["USAGE_CD"]
					, "RSN_RJT_CD" : rowData["RSN_RJT_CD"]
					, "SHIP_PO_CD" : rowData["SHIP_PO_CD"]
					, "RUT_CD" : rowData["RUT_CD"]
					, "DELI_PRIOR_CD" : rowData["DELI_PRIOR_CD"]
					, "MAX_P_DELI" : rowData["MAX_P_DELI"]
					, "SCDL_LINE_YN" : scdl
					, "ERP_NET_PRICE" : rowData["ERP_NET_PRICE"]
					, "ERP_NET_VAL" : rowData["ERP_NET_VAL"]
					, "ZPNN_PRICE" : rowData["ZPNN_PRICE"]
					, "ZPNN_PER" : rowData["ZPNN_PER"]
					, "ZPNN_UOM" : rowData["ZPNN_UOM"]
					, "ERP_STATUS" : rowData["ERP_STATUS"]
					, "LONG_TEXT" : rowData["LONG_TEXT"]
					, "INFO_TEXT" : rowData["INFO_TEXT"]
					, "PITEMSEQ" : rowData["pItemSeq"]
					, "ROW_STATUS" : ('N' == auth) ? rowData["ROW_STATUS"] : 'D'
					}
			gridData.push(data);
// 			if(fn_empty(rowData["DB_RSN_RJT_CD"])){
//				gridData.push(data);
//			}else{
//				if(fn_empty(rowData["RSN_RJT_CD"])){
//					gridData.push(data);
//				}else{
//		    		alert("<s:message code='errors.rsnLock' arguments='" + rowData["ITEM_SEQ"] + "' javaScriptEscape='false'/>");
//				}
//			}
		}
		
		return gridData;
	}
	
	function setScData(){
		saveAllGrid();
		var ids = $("#scGrid").jqGrid("getDataIDs");
		var gridData = [];
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#scGrid").getRowData(ids[i]);
			var auth = "";
			
			if($('#scGrid_' + ids[i] + '_CHK').prop('checked')){
				auth += "Y";
			}else{
				auth += "N";
			}
			
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "DOC_NO" : rowData["DOC_NO"]
					, "SEQ" : rowData["SEQ"]
					, "ITEM_SEQ" : rowData["ITEM_SEQ"]
					, "MATL_CD" : rowData["MATL_CD"]
					, "PERI_CD" : rowData["PERI_CD"]
					, "DELI_DT" : (' ' == rowData["DELI_DT"]) ? '' : rowData["DELI_DT"]
					, "ORD_QTY" : createNormalFm(rowData["ORD_QTY"])
					, "CFM_QTY" : Number(createNormalFm(rowData["CFM_QTY"])).toFixed(2)
					, "SALES_UNIT_CD" : rowData["SALES_UNIT_CD"]
					, "ATP_QTY" : rowData["ATP_QTY"]
					, "DELI_BLOCK_CD" : rowData["DELI_BLOCK_CD"]
					, "BATCH_NO" : rowData["BATCH_NO"]
					, "ROW_STATUS" : ('N' == auth) ? rowData["ROW_STATUS"] : 'D'
					}
			gridData.push(data);
		}
		
		return gridData;
	}
	
	/* 그리드 헤더 체크박스 선택 */
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;

		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				if('itemGrid' == gid){
					$('#' + gid + '_' + ids[i] + '_CHK').prop('disabled', false);
				}
				if($('#' + gid + '_' + ids[i] + '_CHK').prop('disabled') == false){
					$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
				}
				if('itemGrid' == gid && !fn_empty($("#" + gid).jqGrid('getCell', ids[i], 'pItemSeq'))){
					$('#' + gid + '_' + ids[i] + '_CHK').prop('disabled', true);
				}
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
	}

	//그리드 체크박스 이벤트
	function grid_cbox_onclick(gid, rowid, colkey) {
// 		var rowSts = "";
		
// 		if(('partnerGrid' == gid && 'DEFAULT_YN' == colkey)
// 			|| ('itemGrid' == gid && 'FIX_DT_QTY_YN' == colkey)){
// 			('I' != $("#" + gid).jqGrid('getCell', rowid, 'ROW_STATUS')) ? rowSts = 'U' : rowSts = 'I';
// 			$("#" + gid).jqGrid('setCell', rowid, 'ROW_STATUS', rowSts);
// 		}else if(('itemGrid' == gid && 'CHK' == colkey)
// 				|| ('partnerGrid' == gid && 'CHK' == colkey)
// 				|| ('itemPfGrid' == gid && 'CHK' == colkey)
// 				|| ('scGrid' == gid && 'CHK' == colkey)){
// 			var rowIdx = $('#itemGrid').getInd(rowid);
// 			 $('#' + gid).find('tbody tr:eq(' + rowIdx + ')').hide();
// 			('I' == $("#" + gid).jqGrid('getCell', rowid, 'ROW_STATUS')) ? $("#" + gid).jqGrid('delRowData',rowid) : $("#" + gid).jqGrid('setCell', rowid, 'ROW_STATUS', 'D');
// 		}

		if('itemGrid' == gid){
			btGrid.gridSaveRow('itemGrid');
			var pItemSeq = '';
			var checkFlag = false;
			
			if($('#itemGrid_' + rowid + '_CHK').prop('checked')){
				checkFlag = true;
			}else{
				checkFlag = false;
			}
			
			('' == $("#" + gid).jqGrid('getCell', rowid, 'pItemSeq')) ? pItemSeq = $("#" + gid).jqGrid('getCell', rowid, 'ITEM_SEQ') : '';
			
			if('' != pItemSeq){
				var ids = $('#' + gid).jqGrid('getDataIDs');
				for (var i = 0, len = ids.length; i < len; i++) {
					if(pItemSeq == $("#" + gid).jqGrid('getCell', ids[i], 'pItemSeq')){
						$('#' + gid + '_' + ids[i] + '_CHK').prop('disabled', false);
						if (checkFlag == true) {
							if($('#' + gid + '_' + ids[i] + '_CHK').prop('disabled') == false){
								$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
							}
						} else {
							$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
						}
						if(!fn_empty($("#" + gid).jqGrid('getCell', ids[i], 'pItemSeq'))){
							$('#' + gid + '_' + ids[i] + '_CHK').prop('disabled', true);
						}
					}
				}
			}
		}
	}
	
	var docRegId = '';
	var docSts = '';
	
	function cSearch(){
		delItemArray = [];
		
		if($("#S-DOC_NO").val() == ""){
			return;
		}
		
		var url = "/quotation/selectQuotationInfo.do";
		var param = { "param" : {
				  "DOC_NO"  : $("#S-DOC_NO").val()
			}
		};
		
		controlFlag(false);
		erpInfoFlag = false;
		
		fn_ajax(url, false, param, function(data, xhr){
			if(data.resultQuotationInfo != null){
				
				//초기화
				clearForm($('#frmHeader'));
				
				//bind
				fn_dataBindByPrefix('frmHeader', 'SL05-', data.resultQuotationInfo);
				
				//셋팅
				$("#SL05-DT_TP").val(data.resultQuotationInfo.REQ_PERI_CD);
				
				$('#SL05-DELI_BLOCK_CD').prop('disabled', false);
				$('#SL05-DELI_BLOCK_CD').val(data.resultQuotationInfo.DELI_BLOCK_CD);
				
				$.when($("#SL05-SALES_OFFICE_CD").val(data.resultQuotationInfo.SALES_OFFICE_CD).trigger('change'))
				.done(function() {
					$('#SL05-SALES_GR').val(data.resultQuotationInfo.SALES_GR);
				});				
				//$('#SL05-SALES_GR').val(data.resultQuotationInfo.SALES_GR);
				
				$('#SL05-ORD_RESN_CD').val(data.resultQuotationInfo.ORD_RESN_CD);
				
				docRegId = data.resultQuotationInfo.REG_ID;
				accountGrp = data.resultQuotationInfo.ACCOUNT_GR;
				
				docSts = data.resultQuotationInfo.STATUS;
				
				if('C' == data.resultQuotationInfo.STATUS){
					setTag(data.resultQuotationInfo.STATUS);
				}else{
					setTag(data.resultQuotationInfo.ALLOW_STS);
				}
				if(!fn_empty(data.resultQuotationInfo.QT_TO_SO_ID)){
					setTag('S');
				}
				/* 04.23 LJM 수정, 승인요청 안한 상태일때만 승인요청버튼이 보이도록  */
				('N' == data.resultQuotationInfo.ALLOW_STS) ? $('#cBtnUser2').show() :  $('#cBtnUser2').hide();
				('Y' == data.resultQuotationInfo.CMP_DELI_YN) ? $('#SL05-CMP_DELI_YN').prop('checked', true) : $('#SL05-CMP_DELI_YN').prop('checked', false);
				('Y' == data.resultQuotationInfo.REL_POD_YN) ? $('#SL05-REL_POD_YN').prop('checked', true) : $('#SL05-REL_POD_YN').prop('checked', false);
				
				setWeekTpToDay('H');
				$("#SL05-isStatus").val('M');
				
				setDeliPlantCombo(false);
				
				var url = '/salesOrder/getModiTms.do';
				var param = {"param" : { "DOC_NO" : $('#SL05-DOC_NO').val(), "DOC_GR" : "QT" }};
				
				fn_ajax(url, false, param, function(data, xhr){
					$('#SL05-MODI_TMS').val(data.result)
				});
				
				$('#SL05-SOLD_CUST_CD').prop('disabled', true);
				$('#cmm_pop_SOLD_CUST_CD').hide();
				
				if(!('CPD' == accountGrp || 'CPDA' == accountGrp || 'Z007' == accountGrp || 'Z001' == accountGrp)){
					$('#cBtnUser4').hide();
				}
				
				var param = {
					HEAD_ID: 'SALES_OFFICE_CD',
					CODE: $('#SL05-SALES_ORG_CD').val() + $('#SL05-DISTRB_CH').val() + $('#SL05-DIV_CD').val()
				};
				fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
					var elm = document.getElementById('SL05-SALES_OFFICE_CD');
					var value = elm.value;
					var context = '<option value=""></option>';
					Array.prototype.forEach.call(data.RESULT, function(v) {
						context += '<option value="' + v.CODE + '">[' + v.CODE + '] ' + v.CODE_NM + '</option>';
					});
					elm.innerHTML = context;
					elm.value = value;
				});

				if ( docRegId.substring(0, 11) !== 'crm_oms_mig' ) {
					$("#SL05-SUR_CHARGE_AMT").removeAttr('disabled');
				} else {
					$("#SL05-SUR_CHARGE_AMT").attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				}
				
				$("#S-DOC_NO").attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				
			}else{
				alert('<s:message code="info.nodata.msg"/>');
				$("#S-DOC_NO").val("");
				$("#S-DOC_NO").focus();
			}
			
			//탭 초기화 셋팅
			$('#ui-id-1').trigger('click'); // 첫번째 탭
			controlFlag(false);
		});
	}
	
	function selectPartnerTab(){
		if('' != $('#SL05-SOLD_CUST_CD').val() && !erpInfoFlag){
			var url = "/quotation/selectPartnerTab.do";
			
			var docNo;
			('' != $('#SL05-DOC_NO').val()) ? docNo = $('#SL05-DOC_NO').val() : docNo = $('#SL05-TEMP_DOC_NO').val()
					
			var param = { "param" : {
					  "DOC_NO"  : docNo
					, "CUST_CD" : $('#SL05-SOLD_CUST_CD').val()
					, "SALES_ORG_CD" : $('#SL05-SALES_ORG_CD').val()
					, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
					, "DIV_CD" : $('#SL05-DIV_CD').val()
					, "isStatus" : $('#SL05-isStatus').val()
				}
			};
			
			fn_ajax(url, false, param, function(data, xhr){
				reloadGrid("partnerGrid", data.resultPartnerFncGrid);   // 그리드 조회 데이터 출력
				btGrid.gridQueryPaging($('#partnerGrid'), 'selectPartnerTab', data.resultPartnerFncGrid);  // 그리드 페이징 설정
				
				reloadGrid("textGrid", data.resultTextsGrid);   // 그리드 조회 데이터 출력
				btGrid.gridQueryPaging($('#textGrid'), 'selectPartnerTab', data.resultTextsGrid);  // 그리드 페이징 설정
				
				var ziFlag = false;
				var zkFlag = false;
				
				var ids = $('#partnerGrid').jqGrid('getDataIDs');
				
				for(var i = 0; i < ids.length; i++){
					
					if('ZI' == $("#partnerGrid").jqGrid('getCell', ids[i], 'PF_TP')){
						ziFlag = true;
					}
					
					if('ZK' == $("#partnerGrid").jqGrid('getCell', ids[i], 'PF_TP')){
						zkFlag = true;
					}
				}
				
				if(oneTimeFlag){
					
					var tempArr = [];
					for(var i = 0; i < ids.length; i++){
						
						if('WE' != $("#partnerGrid").jqGrid('getCell', ids[i], 'PF_TP')){
							tempArr = oneTimeValue;
						}else{
							if(!fn_empty(oneTimeValueShip)){
								tempArr = oneTimeValueShip;
							}else{
								tempArr = oneTimeValue;
							}
						}
						$("#partnerGrid").jqGrid('setCell', ids[i], 'PF_PS_NO', $('#SL05-SOLD_CUST_CD').val());
						$("#partnerGrid").jqGrid('setCell', ids[i], 'PF_PS_NM', $('#SL05-SOLD_CUST_NM').text());
						$("#partnerGrid").jqGrid('setCell', ids[i], 'NAME_1ST', tempArr[0]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'NAME_2ND', tempArr[1]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'STREET_NM', tempArr[2]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'HAUS_NO', tempArr[3]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'POST_CD', tempArr[4]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'CITY_CD', tempArr[5]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'COUNTRY_CD', tempArr[6]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'REGION_CD', tempArr[7]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'TIME_ZONE', tempArr[8]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'TRANSP_ZONE', tempArr[9]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'PO_BOX', tempArr[10]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'PO_POST_CD', tempArr[11]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'COMP_POST_CD', tempArr[12]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'LANG_CD', tempArr[13]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'TEL_NO', tempArr[14]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'TEL_NO_EXT', tempArr[15]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'MOBILE_NO', tempArr[16]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'FAX_NO', tempArr[17]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'FAX_NO_EXT', tempArr[18]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'E_MAIL', tempArr[19]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'DATA_LINE', tempArr[20]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'COMMENTS', tempArr[21]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'UNLD_PT', tempArr[22]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'VAT_REG_NO', tempArr[23]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'STREET_NM2', tempArr[24]);
						$("#partnerGrid").jqGrid('setCell', ids[i], 'STREET', tempArr[25]);
					}
				}
				
				if(!ziFlag){
					var data = {"ROW_STATUS" : "I", "PF_TP" : "ZI"};
					btGrid.gridAddRow("partnerGrid", "last", data);
				}
				
				if(!zkFlag){
					var data = {"ROW_STATUS" : "I", "PF_TP" : "ZK"};
					btGrid.gridAddRow("partnerGrid", "last", data);
				}
			});
		}
	}
	
	function itemDtlToItem(obj){
		
		var ids = $("#itemGrid").jqGrid("getDataIDs");
		var objId = $(obj).attr('data-dbcolumn');
		var checkYn = "";
		
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#itemGrid").getRowData(ids[i]);
			$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
			
			if($('#SL05-DTL_ITEM_SEQ').val() == rowData["ITEM_SEQ"]){
				if(objId == 'DELI_DT_1ST' || objId == 'DELI_DT_1ST_TP') {
					$("#itemGrid").jqGrid('setCell', ids[i], 'DELI_DT_1ST', $('#SL05-DELI_DT_1ST').val());
					$("#itemGrid").jqGrid('setCell', ids[i], 'DELI_DT_1ST_TP', $('#SL05_ITEM_DETAIL-DT_TP').val());
				}else if(objId == 'SCDL_LINE_YN' || objId == 'FIX_DT_QTY_YN'){
					($(obj).prop('checked')) ? checkYn = 'Y' : checkYn = 'N';
					$("#itemGrid").jqGrid('setCell', ids[i], objId, checkYn);
					
				}else if(objId == 'ORD_QTY' || objId == 'NET_PRICE'){
					var ordQty = fn_replaceAll(fn_replaceAll($('#SL05-ITEM_DTL_ORD_QTY').val(), '.' , ''), ',', '.');
					var nPrice = fn_replaceAll(fn_replaceAll($('#SL05-NET_PRICE').val(), '.' , ''), ',', '.');
					
					$('#SL05-NET_VAL').val(createGridNumFm(ordQty * nPrice));
					$("#itemGrid").jqGrid('setCell', ids[i], 'ORD_QTY', createGridNumFm(ordQty * 1));
					$("#itemGrid").jqGrid('setCell', ids[i], 'NET_PRICE', createGridNumFm(nPrice * 1));
					$("#itemGrid").jqGrid('setCell', ids[i], 'NET_VAL', createGridNumFm(ordQty * nPrice));
				}else{
					if(fn_empty($(obj).val())){
						$("#itemGrid").jqGrid('setCell', ids[i], objId, null);
					}else{
						$("#itemGrid").jqGrid('setCell', ids[i], objId, $(obj).val());
					} 
				}
				setRowStatus('itemGrid');
				break;
			}
		}
	}
	
	function selectItemTab(){
		
		if(('' != $("#SL05-DOC_NO").val() || '' != $("#SL05-TEMP_DOC_NO").val()) && !erpInfoFlag){
			
			var docNo;
			
			if('' != $("#SL05-DOC_NO").val()){
				docNo = $("#SL05-DOC_NO").val();
			}else{
				docNo = $("#SL05-TEMP_DOC_NO").val();
			}
			
			var url = "/quotation/selectItemTab.do";
			var param = { "param" : {
					  "DOC_NO"  : docNo
					, "SALES_ORG_CD" : $('#SL05-SALES_ORG_CD').val()
					, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
				}
			};
			
			fn_ajax(url, false, param, function(data, xhr){
				reloadGrid("itemGrid", data.result);   // 그리드 조회 데이터 출력
				btGrid.gridQueryPaging($('#itemGrid'), 'selectItemTab', data.result);  // 그리드 페이징 설정
				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[0]);
			});
		}
	}
	
	function setItemDtlData(type){
		var itemGridData = setItemData();
		var selRow = $('#itemGrid').jqGrid('getGridParam', 'selrow');
		var rowIdx = $('#itemGrid').getInd(selRow);
		var itemGridRowsCnt = itemGridData.length;
		
		if(type == 'PREV'){
			rowIdx--;
			
			(rowIdx < 1) ? rowIdx = 1 : '';
		}else if(type == 'NEXT'){
			rowIdx++;
			
			(itemGridRowsCnt < rowIdx) ? rowIdx = itemGridRowsCnt : '';
		}
		
		$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[rowIdx - 1]);
		var gridData = $("#itemGrid").getRowData($("#itemGrid").getGridParam('selrow'));
		
		for(var i = 0; i < itemGridRowsCnt; i++){
			if(gridData["ITEM_SEQ"] == itemGridData[i]["ITEM_SEQ"]){
				$('#SL05-DTL_ITEM_SEQ').val(itemGridData[i]["ITEM_SEQ"]);
				$('#SL05-ITEM_DTL_MATL_CD').val(itemGridData[i]["MATL_CD"]);
				$('#SL05-ITEM_DTL_MATL_NM').text(itemGridData[i]["MATL_DESC"]);
				$('#SL05-ITEM_CTG_GR').val(itemGridData[i]["ITEM_CTG_GR"]);
				$('#SL05-ITEM_DTL_ORD_QTY').val(itemGridData[i]["ORD_QTY"]);
				$('#SL05-ORD_UNIT_CD').val(itemGridData[i]["ORD_UNIT_CD"]);
				$('#SL05-DELI_DT_1ST').val(itemGridData[i]["DELI_DT_1ST"]);
				$('#SL05_ITEM_DETAIL-DT_TP').val(itemGridData[i]["DELI_DT_1ST_TP"]);
				$('#SL05-UNIT1_QTY').val(itemGridData[i]["UNIT1_QTY"]);
				$('#SL05-UNIT1_CD').text(itemGridData[i]["UNIT1_CD"]);
				$('#SL05-UNIT2_QTY').val(itemGridData[i]["UNIT2_QTY"]);
				$('#SL05-UNIT2_CD').text(itemGridData[i]["UNIT1_CD"]);
				$('#SL05-NET_PRICE').val(itemGridData[i]["NET_PRICE"]);
				$('#SL05-DETAIL_CURR_CD').val(itemGridData[i]["CURR"]);
				$('#SL05-NET_VAL').val(itemGridData[i]["NET_VAL"]);
				$('#SL05-DETAIL_PRICE_DT').val(itemGridData[i]["PRICE_DT"]);
				$('#SL05-BOM_NO').val(itemGridData[i]["BOM_NO"]);
				$('#SL05-BATCH_NO').val(itemGridData[i]["BATCH_NO"]);
				$('#SL05-ORD_PROB').val(itemGridData[i]["ORD_PROB"]);
				$('#SL05-USAGE_CD').val(itemGridData[i]["USAGE_CD"]);
				$('#SL05-RSN_RJT_CD').val(itemGridData[i]["RSN_RJT_CD"]);
				$('#SL05-SHIP_PO_CD').val(itemGridData[i]["SHIP_PO_CD"]);
// 				$('#SL05-ATP_QTY').val(itemGridData[i]["ATP_QTY"]);
				$('#SL05-RUT_CD').val(itemGridData[i]["RUT_CD"]);
				$('#SL05-DELI_PRIOR_CD').val(itemGridData[i]["DELI_PRIOR_CD"]);
// 				$('#SL05-MAX_P_DELI').val(itemGridData[i]["MAX_P_DELI"]);
// 				('Y' == itemGridData[i]["SCDL_LINE_YN"]) ? $('#SL05-SCDL_LINE_YN').prop('checked', true) : $('#SL05-SCDL_LINE_YN').prop('checked', false) ;
// 				('Y' == itemGridData[i]["FIX_DT_QTY_YN"]) ? $('#SL05-FIX_DT_QTY_YN').prop('checked', true) : $('#SL05-FIX_DT_QTY_YN').prop('checked', false) ;
				$('#SL05-INFO_TEXT').val(itemGridData[i]["INFO_TEXT"]);
				$('#SL05-LONG_TEXT').val(itemGridData[i]["LONG_TEXT"]);
				
				setWeekTpToDay('D');
				break;
			}
		}
		
		if('' != $('#SL05-DTL_ITEM_SEQ').val()){
			if('' != $('#SL05-DOC_NO').val()){
				if(!checkItemPfGrid()){
					if(confirm("<s:message code='errors.noSaveData'/>")){
						if($("#cBtnUser2").is($("#cBtnUser2").show())){
							selectItemPfGrid();
							chkItemPfGrid();
						}
					}
				}else{
					selectItemPfGrid();
				}
			}else{
				selectItemPfGrid();
				chkItemPfGrid();
			}
		}
		setItemDtlDisalbed();
	}
	
	function checkItemPfGrid(){
		var rtnFlag = true;
		var ids = $("#itemPfGrid").jqGrid("getDataIDs");
		
		if(0 < ids.length){
			for(var i = 0; i < ids.length; i++){
				var rowData = $("#itemPfGrid").getRowData(ids[i]);
				if('R' != rowData["ROW_STATUS"] && 'N' == rowData["SYNC_FLAG"]){
					rtnFlag = false;
					break;
				}
			}
		}else{
			selectItemPfGrid();
		}
		return rtnFlag;
	}
	
	function setScdlData(type){
		var itemGridData = setItemData();
		var selRow = $('#itemGrid').jqGrid('getGridParam', 'selrow');
		var rowIdx = $('#itemGrid').getInd(selRow);
		var itemGridRowsCnt = itemGridData.length;
		
		if(type == 'PREV'){
			rowIdx--;
			
			(rowIdx < 1) ? rowIdx = 1 : '';
		}else if(type == 'NEXT'){
			rowIdx++;
			
			(itemGridRowsCnt < rowIdx) ? rowIdx = itemGridRowsCnt : '';
		}
		
		$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[rowIdx - 1]);
		var gridData = $("#itemGrid").getRowData($("#itemGrid").getGridParam('selrow'));
		
		for(var i = 0; i < itemGridRowsCnt; i++){
			if(gridData["ITEM_SEQ"] == itemGridData[i]["ITEM_SEQ"]){
				$('#SL05-SC_ITEM_SEQ').val(itemGridData[i]["ITEM_SEQ"]);
				$('#SL05-SC_MATL_CD').val(itemGridData[i]["MATL_CD"]);
				$('#SL05-SC_SO_QTY').val(itemGridData[i]["ORD_QTY"]);
				$('#SL05-SC_DELI_DT_1ST').val(itemGridData[i]["DELI_DT_1ST"]);
				if("1" == itemGridData[i]["DELI_DT_1ST_TP"]){
					$('#SL05-SC_DELI_DT_1ST_TP').text("Day");
				}else if("2" == itemGridData[i]["DELI_DT_1ST_TP"]){
					$('#SL05-SC_DELI_DT_1ST_TP').text("Weekly");
				}else{
					$('#SL05-SC_DELI_DT_1ST_TP').text("Monthly");
				}
				
				break;
			}
		}
		selectScdlTab();
	}
	
	function selectScdlTab(isAll){
		
		var docNo = "";
		var param;
		
		if('' != $("#SL05-DOC_NO").val()){
			docNo = $("#SL05-DOC_NO").val();
		}else{
			docNo = $("#SL05-TEMP_DOC_NO").val();
		}
		
		var url = "/quotation/selectScdlTab.do";
		if(isAll){
			param = { "param" : {
				  "DOC_NO"   : docNo
				, "ITEM_SEQ" : ''
				, "MATL_CD"  : ''
				}
			};
		}else{
			param = { "param" : {
				  "DOC_NO"   : docNo
				, "ITEM_SEQ" : $("#SL05-SC_ITEM_SEQ").val()
				, "MATL_CD"  : $("#SL05-SC_MATL_CD").val()
				}
			};
		}
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("scGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#scGrid'), 'selectScdlTab', data.result);  // 그리드 페이징 설정
		});
	}
	
	function selectConditionTab(){
		var docNo = "";
		var param;
		
		saveAllGrid();
		
		if('' != $("#SL05-DOC_NO").val()){
			docNo = $("#SL05-DOC_NO").val();
		}else{
			docNo = $("#SL05-TEMP_DOC_NO").val();
		}
		
		if('' != docNo){
			
			$('#conditionGrid').clearGridData();

			var data;
			data = {"ROW_STATUS" : "R", "ITEM_SEQ" : "000"
				, "MATL_CD" : ""
				, "MATL_DESC" : ""};
			btGrid.gridAddRow("conditionGrid", "last", data);
			
			var ids = $('#itemGrid').jqGrid('getDataIDs');
			for(var i = 0; i < ids.length; i++){
				if('D' != $("#itemGrid").jqGrid('getCell', ids[i], 'ROW_STATUS')){
					data = {"ROW_STATUS" : "R", "ITEM_SEQ" : $("#itemGrid").jqGrid('getCell', ids[i], 'ITEM_SEQ')
							, "MATL_CD" : $("#itemGrid").jqGrid('getCell', ids[i], 'MATL_CD')
							, "MATL_DESC" : $("#itemGrid").jqGrid('getCell', ids[i], 'MATL_DESC')};
					
					btGrid.gridAddRow("conditionGrid", "last", data);
				}
				/*itemGrid에서 삭제한 제품은 Condition에서 조회 안되도록 수정 요청*/
// 				($.inArray($("#itemGrid").jqGrid('getCell', ids[i], 'ITEM_SEQ'), delItemArray) == -1) ? btGrid.gridAddRow("conditionGrid", "last", data) : ""  ;
			}
// 			var url = "/quotation/selectConditionTab.do";
// 			var param = { "param" : { "DOC_NO" : docNo } };
			
// 			fn_ajax(url, false, param, function(data, xhr){
// 				reloadGrid("conditionGrid", data.result);   // 그리드 조회 데이터 출력
// 				btGrid.gridQueryPaging($('#conditionGrid'), 'selectConditionTab', data.result);  // 그리드 페이징 설정
// 			});
		}
	}
	
	function selectConditionDtlTab(itemSeq){
		var docNo = "";
		var param;
		
		if('' != $("#SL05-DOC_NO").val()){
			docNo = $("#SL05-DOC_NO").val();
		}else{
			docNo = $("#SL05-TEMP_DOC_NO").val();
		}
		
		if('' != docNo){
			var url = "/quotation/selectConditionDtlTab.do";
			var param = { "param" : { "DOC_NO" : docNo, "ITEM_SEQ" : itemSeq } };
			
			fn_ajax(url, false, param, function(data, xhr){
				reloadGrid("conditionGridDtl", data.result);   // 그리드 조회 데이터 출력
				btGrid.gridQueryPaging($('#conditionGridDtl'), 'selectConditionDtlTab', data.result);  // 그리드 페이징 설정
			});
		}
	}
	
	function saveValdChk(){
		
		calcWgtVol();
		
		var rtnFlag = true;
		
		var ids;
		var msg;
		
		var disabled = $('form[id=frmHeader]').find(':input:disabled').removeAttr('disabled');
		
		if(!fn_inputCheckByPrefix('frmHeader', 'SL05-')){
			$('#ui-id-1').trigger('click');
			disabled.attr('disabled','disabled');
			return false;
		}
		
		var inco2 = $('#SL05-INCOTERMS_DESC').val().trim();
		
		if ( inco2 == '' ) {
			alert('Incoterms Description is required input value.');
			$('#SL05-INCOTERMS_DESC').val(inco2);
			$('#SL05-INCOTERMS_DESC').focus();
			disabled.attr('disabled','disabled');
			return false;
		}
		
		
		if(fn_empty($('#SL05-SALES_GR option:selected').val())){
			alert('<s:message code="info.required"/>');
			$('[#SL05-SALES_GR]').focus();
			disabled.attr('disabled','disabled');
			return false;
		}
		
		if(!checkBetweenDate($('#SL05-VAL_FR_DT').val(), $('#SL05-VAL_TO_DT').val())){
			$('#ui-id-1').trigger('click');
			$('#SL05-VAL_FR_DT').focus();
			disabled.attr('disabled','disabled');
			return false;
		}
		
// 		// date check
// 		if(!checkBetweenDate(toDay, $('#SL05-REQ_DELI_DT').val())){
// 			$('#ui-id-1').trigger('click');
// 			$('#SL05-REQ_DELI_DT').focus();
// 			disabled.attr('disabled','disabled');
// 			return false;
// 		}
		
		disabled.attr('disabled','disabled');
		
		//Partner Grid Valid Check
		ids = $("#partnerGrid").jqGrid("getDataIDs");
		
		var pfChkCnt = 0;
		for(var i = 0; i < ids.length; i++){
			
			var rowData = $("#partnerGrid").getRowData(ids[i]);
			
			if('ERR' == rowData["PF_TP"]){
				$('#ui-id-2').trigger('click'); // 아이템 탭
				$('#partnerGrid').jqGrid('setSelection', $('#partnerGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Partner Function";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			if('' == rowData["PF_PS_NO"] && 'D' != rowData["ROW_STATUS"]){
				$('#ui-id-2').trigger('click'); // 아이템 탭
				$('#partnerGrid').jqGrid('setSelection', $('#partnerGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Partner Function";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			
			if('AG' == rowData["PF_TP"] || 'RE' == rowData["PF_TP"] || 'RG' == rowData["PF_TP"]
				|| 'WE' == rowData["PF_TP"] || 'ZI' == rowData["PF_TP"] || 'ZK' == rowData["PF_TP"]){
				pfChkCnt++;
			}
		}
		
		if(pfChkCnt < 6){
			msg = "Partner Function";
			alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
			return false;
		}
		
		//Item Grid Valid Check
		ids = $("#itemGrid").jqGrid("getDataIDs");
		var rowStsDCnt = 0;
		for(var i = 0; i < ids.length; i++){
			
			var rowData = $("#itemGrid").getRowData(ids[i]);
			
			if('D' != rowData["ROW_STATUS"]){
				var tempVal = rowData["DELI_DT_1ST"];
				if(tempVal.length != 10 && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Items";
					alert("<s:message code='errors.date' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				
//	 			// date check
//	 			if(!checkBetweenDate(toDay, rowData["DELI_DT_1ST"])){
//	 				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
//	 				$('#ui-id-3').trigger('click');
//	 				return false;
//	 			}
				////////////////////////////////////////////////////////////////////////////
				// TODO
				/*
				if(($('#SL05-DIV_CD').val() != rowData["DIV_CD"]) && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Division";
					alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				*/
				////////////////////////////////////////////////////////////////////////////
				if('' == rowData["MATL_CD"] && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Material";
					alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				if('' == rowData["ORD_QTY"] && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Qty";
					alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				if('ERR' == rowData["ITEM_CTG_GR"] && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Item Cat. Grp";
					alert("<s:message code='errors.required' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				if(('' == rowData["NET_PRICE"] && fn_empty(rowData["pItemSeq"])) || (0 == createNormalFm(rowData["NET_PRICE"]) && fn_empty(rowData["pItemSeq"]))){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Unit Price";
					alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				if((('' == $("#SL05-DOC_NO").val() && '' == rowData["ERP_NET_PRICE"]) || copyFlag) && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					msg = "Price";
					alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				if((('N' == rowData["ERP_STATUS"] || copyFlag) && 'D' != rowData["ROW_STATUS"]) && fn_empty(rowData["pItemSeq"])){
					
					$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
					
					alert("<s:message code='error.editPrice'/>");
					
					$('#ui-id-3').trigger('click');
					return false;
				}
				
			}
			
			
// 			var erpNetPrice = Number(createNormalFm(rowData["ERP_NET_PRICE"]));
// 			var netPrice = Number(createNormalFm(rowData["NET_PRICE"]));
			
// 			if(netPrice < erpNetPrice){
// 				$('#SL05-ALLOW_STS').val('N');
// 				$('#SL05-APPROVAL_STS').val('N');
// 			}
			
			if('D' == rowData["ROW_STATUS"]){
				rowStsDCnt++;
			}
		}
		
		if(ids.length <= rowStsDCnt || ids.length == 0){
			
			$('#ui-id-3').trigger('click'); // 아이템 탭
			
			msg = "Item Data";
			alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
			return false;
		}
		
		//Item Dtl Partner Grid Valid Check
		ids = $("#itemPfGrid").jqGrid("getDataIDs");
		for(var i = 0; i < ids.length; i++){
			
			var rowData = $("#itemPfGrid").getRowData(ids[i]);
			
			var tempVal = rowData["PF_TP"];
			if('ERR' == tempVal){
				
				$('#ui-id-4').trigger('click'); // 아이템 탭
				$('#itemPfGrid').jqGrid('itemPfGrid', $('#itemPfGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Item Partner Function";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			if('' == rowData["PF_PS_NO"]){
				$('#ui-id-4').trigger('click'); // 아이템 탭
				$('#partnerGrid').jqGrid('setSelection', $('#partnerGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Item Partner Function";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
		}
		
		//Sc Grid Valid Check
// 		ids = $("#scGrid").jqGrid("getDataIDs");
// 		var ordQty = $('#SL05-SC_SO_QTY').val();
// 		var gridOrdQty = 0;
		
// 		for(var i = 0; i < ids.length; i++){
			
// 			var rowData = $("#scGrid").getRowData(ids[i]);
			
// 			gridOrdQty = gridOrdQty + Number(rowData["ORD_QTY"]);
// 			if(ordQty < gridOrdQty && ('U' == rowData["ROW_STATUS"] || 'I' == rowData["ROW_STATUS"])){
				
// 				$('#ui-id-5').trigger('click'); // Sc 탭
// 				$('#scGrid').jqGrid('setSelection', $('#scGrid').jqGrid('getDataIDs')[i]);
				
// 				msg = "Schedule Line";
// 				alert("<s:message code='errors.overCnt' arguments='" + msg + "' javaScriptEscape='false'/>");
// 				return false;
// 			}
			
// 			var tempVal = rowData["DELI_DT"];
// 			if(tempVal.length < 10 && ('U' == rowData["ROW_STATUS"] || 'I' == rowData["ROW_STATUS"])){
				
// 				$('#ui-id-5').trigger('click'); // Sc 탭
// 				$('#scGrid').jqGrid('setSelection', $('#scGrid').jqGrid('getDataIDs')[i]);
				
// 				msg = "Items";
// 				alert("<s:message code='errors.date' arguments='" + msg + "' javaScriptEscape='false'/>");
// 				return false;
// 			}
// 		}
		
		if('' != $('#SL05-DOC_NO').val() && !copyFlag){
			var url = '/salesOrder/getModiTms.do';
			var param = {"param" : { "DOC_NO" : $('#SL05-DOC_NO').val(), "DOC_GR" : "QT" }};
			
			fn_ajax(url, false, param, function(data, xhr){
				
				if(data.result != $('#SL05-MODI_TMS').val()){
					alert("<s:message code='error.alreadyUpd'/>");
					rtnFlag = false;
				}
			});
		}
		
		return rtnFlag;
	}
	
	function checkItemGrp(obj){
		
		var selRow = $('#itemGrid').jqGrid('getGridParam', 'selrow');
		var itemSeq = $("#itemGrid").jqGrid('getCell', selRow, 'ITEM_SEQ');
		
		var url = '/salesOrder/checkItemCatGrpCodeGrid.do';
		var param = {"param" : {
			  "DOC_TP" : 'ZAGM'
			, "MATL_CD" : $("#itemGrid").jqGrid('getCell', selRow, 'MATL_CD')
			, "SALES_ORG_CD" :  $('#SL05-SALES_ORG_CD').val()
			, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
			, "DELI_PLANT_CD" : $("#itemGrid").jqGrid('getCell', selRow, 'PLANT_CD')
			, "SEL_ITEM_CTG" : $("#itemGrid").jqGrid('getCell', selRow, 'ITEM_CTG_GR')
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(!(1 <= Number(data.itemCatGrp))){
				alert("<s:message code='errors.invalid' arguments='" + $(obj).val() + "' javaScriptEscape='false'/>");
				setTimeout(function() { $("#itemGrid").jqGrid('setCell', selRow, 'ITEM_CTG_GR', 'ERR'); }, 300);
			}else{
				var ids = $("#itemGrid").jqGrid("getDataIDs");
				for(var i = 0; i < ids.length; i++){
					if(itemSeq == $("#itemGrid").jqGrid('getCell', ids[i], 'pItemSeq')){
						//$("#itemGrid").jqGrid('setCell', ids[i], 'ITEM_CTG_GR', $(obj).val());
					}
				}
			}
		});
	}

	var mCtg = '';
	function setProductToGrid(){
		
		var selRow = $('#itemGrid').jqGrid('getGridParam', 'selrow');
		
		$("#itemGrid").jqGrid('setCell', selRow, 'MATL_CD', rtnProPopArr[0]);
		$("#itemGrid").jqGrid('setCell', selRow, 'MATL_DESC', rtnProPopArr[1]);
		$("#itemGrid").jqGrid('setCell', selRow, 'DIV_CD', rtnProPopArr[5]);
		$("#itemGrid").jqGrid('setCell', selRow, 'PLANT_CD', rtnProPopArr[6]);
		$("#itemGrid").jqGrid('setCell', selRow, 'ORD_UNIT_CD', rtnProPopArr[8]);
		$("#itemGrid").jqGrid('setCell', selRow, 'BASIC_UNIT', rtnProPopArr[8]);
		$("#itemGrid").jqGrid('setCell', selRow, 'GROSS_WT', rtnProPopArr[12]);
		$("#itemGrid").jqGrid('setCell', selRow, 'NET_WT', rtnProPopArr[13]);
		$("#itemGrid").jqGrid('setCell', selRow, 'WT_UNIT', rtnProPopArr[14]);
		$("#itemGrid").jqGrid('setCell', selRow, 'VOL_QTY', rtnProPopArr[15]);
		$("#itemGrid").jqGrid('setCell', selRow, 'VOL_UNIT', rtnProPopArr[16]);
		$("#itemGrid").jqGrid('setCell', selRow, 'OUTPUT', rtnProPopArr[9]);
		$("#itemGrid").jqGrid('setCell', selRow, 'LONG_TEXT', rtnProPopArr[17]);
		$("#itemGrid").jqGrid('setCell', selRow, 'BATCH_NO', rtnProPopArr[18]);
		
		$("#itemGrid").jqGrid('setCell', selRow, 'ORD_QTY', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'NET_PRICE', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'ERP_NET_PRICE', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'PER', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'UOM', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'NET_VAL', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'RSN_RJT_CD', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'ERP_NET_VAL', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'ERP_STATUS', 'N');
// 		$("#itemGrid").jqGrid('setCell', selRow, 'BATCH_NO', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'ZPNN_PRICE', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'ZPNN_PER', null);
		$("#itemGrid").jqGrid('setCell', selRow, 'ZPNN_UOM', null);
		
		var rowSts = '';
		('I' != $('#itemGrid').jqGrid('getCell', selRow, 'ROW_STATUS')) ? rowSts = 'U' : rowSts = 'I';
		$('#itemGrid').jqGrid('setCell', selRow, 'ROW_STATUS', rowSts);
		
		var url = '/salesOrder/getItemCatGrpCodeGrid.do';
		var param = {"param" : {
			  "DOC_TP" : 'ZAGM'
			, "MATL_CD" : $("#itemGrid").jqGrid('getCell', selRow, 'MATL_CD')
			, "SALES_ORG_CD" :  $('#SL05-SALES_ORG_CD').val()
			, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
			, "DELI_PLANT_CD" : $("#itemGrid").jqGrid('getCell', selRow, 'PLANT_CD')
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			mCtg = data.itemCatGrp;
			setTimeout(function() { $("#itemGrid").jqGrid('setCell', selRow, 'ITEM_CTG_GR', data.itemCatGrp); }, 300);
		});
		
		saveAllGrid();
		setRowStatus('itemGrid');
		
		calcWgtVol();
		
		//버그로 인해 주석처리
// 		createItemCatBox();
		
		selectBomToGrid(rtnProPopArr[0], rtnProPopArr[6], $('#SL05-SALES_ORG_CD').val(), $('#SL05-DISTRB_CH').val(), $("#itemGrid").jqGrid('getCell', selRow, 'ITEM_SEQ'), selRow);
	}
	
	function selectBomToGrid(matlCd, plantCd, salesOrgCd, distrbCh, itemSeq, selRow){
		
		var url = "/quotation/selectBomList.do";
		var param = { "param" : {
				  "MATL_CD"  : matlCd
				, "PLANT_CD" : plantCd
				, "SALES_ORG_CD" : salesOrgCd
				, "DISTRB_CH" : distrbCh
				, "ITEM_SEQ" : Number(itemSeq) + 1
			}
		};
		
		var pItemSeq = itemSeq;
		var rowIdx = $('#itemGrid').getInd(selRow);
		
		fn_ajax(url, false, param, function(data, xhr){
			var rtnData = data.result;
			setTimeout(function() {
				if (mCtg == 'ZTAQ' && rtnData.length == 0) {
					alert("It did not find a valid bill of material(BOM) : " +  matlCd );
					$('#itemGrid').jqGrid('delRowData', selRow);
					return false;
				} else {
			
						for(var i = 0; i < rtnData.length; i++){
							
							itemSeq = Number(itemSeq) + 1;
							
							var data = {  "ROW_STATUS" : "I", "ITEM_SEQ" : itemSeq, "pItemSeq" : pItemSeq, "MATL_CD" : rtnData[i].BOM_CD
										, "MATL_DESC" : rtnData[i].MATL_DESC, "PLANT_CD" : rtnData[i].PLANT_CD, "DIV_CD" : rtnData[i].DIV_CD
										, "ITEM_CTG_GR" : rtnData[i].ITEM_CTG_GR//$("#itemGrid").jqGrid('getCell', selRow, 'ITEM_CTG_GR')
										, "ORD_UNIT_CD" : rtnData[i].UNIT_CD, "BASIC_UNIT" : rtnData[i].BS_UNIT
										, "DELI_DT_1ST_TP" : $("#itemGrid").jqGrid('getCell', selRow, 'DELI_DT_1ST_TP'), "DELI_DT_1ST" : $("#itemGrid").jqGrid('getCell', selRow, 'DELI_DT_1ST')
										, "CURR" : $("#itemGrid").jqGrid('getCell', selRow, 'CURR'), "BS_QTY" : rtnData[i].BS_QTY
									};
							btGrid.gridAddRow("itemGrid", "last", data);
							
							$('#itemGrid_' + (rowIdx + i + 1)  + '_CHK').attr('disabled','disabled');
							$('#itemGrid_new' + (rowIdx + i + 1)  + '_CHK').attr('disabled','disabled');
						}
				}  
			}, 300);
			
			
		});
	}
	
	function controlFlag(flag){
		partTabFlag = flag;
		itemTabFlag = flag;
		itemDtlTabFlag = flag;
		slTabFlag = flag;
		thTabFlag = flag;
		hisTabFlag = flag;
		conditionTabFlag = flag;
	}
	
	function chkPfGrid(){
		
		var pfGridData = setPartnerData();
		var pfGridRowsCnt = pfGridData.length;
		
		for(var i = 0; i < pfGridRowsCnt; i++){
			$('#partnerGrid').jqGrid('setSelection', $('#partnerGrid').jqGrid('getDataIDs')[i]);
			
			if('LD' == $.QueryString['isStatus'] && ('ZI' == pfGridData[i]["PF_TP"] || 'ZK' == pfGridData[i]["PF_TP"])){
				pfGridData[i]["PF_CNT"] = 1;
			}
			
			if(1 < Number(pfGridData[i]["PF_CNT"])){
				openPfPop(pfGridData[i]["PF_TP"]);
				break;
			}
			
			if(	   'AG' == pfGridData[i]["PF_TP"]
				|| 'WE' == pfGridData[i]["PF_TP"]
				|| 'RE' == pfGridData[i]["PF_TP"]
				|| 'RG' == pfGridData[i]["PF_TP"]
				|| 'ZI' == pfGridData[i]["PF_TP"]
				|| 'ZK' == pfGridData[i]["PF_TP"]
				){
				$('#partnerGrid_' + (i + 1)  + '_CHK').attr('disabled','disabled');
				$('#partnerGrid_new' + (i + 1)  + '_CHK').attr('disabled','disabled');
			}
			
			if('WE' == pfGridData[i]["PF_TP"]){
				$('#SL05-SHIP_CUST_CD').val(pfGridData[i]["PF_PS_NO"]);
				$('#SL05-SHIP_CUST_NM').text(pfGridData[i]["PF_PS_NM"]);
			}
			
			if('RE' == pfGridData[i]["PF_TP"]){
				$('#SL05-BILL_CUST_CD').val(pfGridData[i]["PF_PS_NO"]);
				$('#SL05-BILL_CUST_NM').text(pfGridData[i]["PF_PS_NM"]);
			}
		}
	}
	
	function chkItemPfGrid(){
// 		var itemPfGrid = setItemPartnerData();
// 		var itemPfGridRowsCnt = itemPfGrid.length;
		
// 		for(var i = 0; i < itemPfGridRowsCnt; i++){
// 			if('ZI' == itemPfGrid[i]["PF_TP"]){
// 				$('#itemPfGrid_' + (i + 1)  + '_CHK').attr('disabled','disabled');
// 				$('#itemPfGrid_new' + (i + 1)  + '_CHK').attr('disabled','disabled');
// 			}
// 		}
	}
	
	function openPfPop(pfTp){
		
		var url = "/popup/PartnerFunctionPopup.do";
		var pid = "PartnerFunctionPopup";  //팝업 페이지의 취상위 div ID
		var param = { "DOC_NO"  : $('#SL05-DOC_NO').val()
				, "CUST_CD" : $('#SL05-SOLD_CUST_CD').val()
				, "CUST_NM" : $('#SL05-SOLD_CUST_NM').text()
				, "SALES_ORG_CD" : $('#SL05-SALES_ORG_CD').val()
				, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
				, "DIV_CD" : $('#SL05-DIV_CD').val()
				, "PF_TP" : pfTp
		};
		
		var selRow = $('#partnerGrid').jqGrid('getGridParam', 'selrow');
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				for(var i = 0; i < data.length; i++){
					$("#partnerGrid").jqGrid('setCell', selRow, 'PF_PS_NM', data[i]["PF_PS_NM"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'PF_PS_NO', data[i]["PF_PS_NO"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'PF_DESC', data[i]["PF_DESC"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'PF_CNT', "1");
					$("#partnerGrid").jqGrid('setCell', selRow, 'NAME_1ST', data[i]["NAME_1ST"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'NAME_2ND', data[i]["NAME_2ND"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'HAUS_NO', data[i]["HAUS_NO"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'POST_CD', data[i]["POST_CD"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'CITY_CD', data[i]["CITY_CD"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'COUNTRY_CD', data[i]["COUNTRY_CD"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'REGION_CD', data[i]["REGION_CD"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'TIME_ZONE', data[i]["TIME_ZONE"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'TRANSP_ZONE', data[i]["TRANSP_ZONE"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'PO_BOX', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'PO_POST_CD', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'COMP_POST_CD', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'LANG_CD', data[i]["LANG_CD"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'TEL_NO', data[i]["TEL_NO"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'TEL_NO_EXT', data[i]["TEL_NO_EXT"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'MOBILE_NO', data[i]["MOBILE_NO"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'FAX_NO', data[i]["FAX_NO"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'FAX_NO_EXT', data[i]["FAX_NO_EXT"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'E_MAIL', data[i]["E_MAIL"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'STD_COM_MTD', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'DATA_LINE', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'COMMENTS', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'UNLD_PT', '');
					$("#partnerGrid").jqGrid('setCell', selRow, 'VAT_REG_NO', data[i]["VAT_REG_NO"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'ACCOUNT_GR', data[i]["ACCOUNT_GR"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'STREET_NM', data[i]["STREET_NM"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'STREET_NM2', data[i]["STREET_NM2"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'STREET', data[i]["STREET"]);
					$("#partnerGrid").jqGrid('setCell', selRow, 'TITLE', '');
					
					//재귀호출
					setTimeout(function() { chkPfGrid(); }, 300);
				}
			}
		});
	}
	/* P/F 탭에서 사용하는 팝업 */
	function openPfPop2(pfTp, selRow, tId, type){
		
		var url = "/popup/PartnerFunctionPopup.do";
		var pid = "PartnerFunctionPopup";  //팝업 페이지의 취상위 div ID
		var param = { "DOC_NO"  : $('#SL05-DOC_NO').val()
				, "CUST_CD" : $('#SL05-SOLD_CUST_CD').val()
				, "CUST_NM" : $('#SL05-SOLD_CUST_NM').text()
				, "SALES_ORG_CD" : $('#SL05-SALES_ORG_CD').val()
				, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
				, "DIV_CD" : $('#SL05-DIV_CD').val()
				, "PF_TP" : pfTp
		};
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				for(var i = 0; i < data.length; i++){
					$("#" + tId).jqGrid('setCell', selRow, 'PF_PS_NM', data[i]["PF_PS_NM"]);
					$("#" + tId).jqGrid('setCell', selRow, 'PF_PS_NO', data[i]["PF_PS_NO"]);
					$("#" + tId).jqGrid('setCell', selRow, 'PF_DESC', data[i]["PF_DESC"]);
					$("#" + tId).jqGrid('setCell', selRow, 'PF_CNT', "1");
					$("#" + tId).jqGrid('setCell', selRow, 'NAME_1ST', data[i]["NAME_1ST"]);
					$("#" + tId).jqGrid('setCell', selRow, 'NAME_2ND', data[i]["NAME_2ND"]);
					$("#" + tId).jqGrid('setCell', selRow, 'HAUS_NO', data[i]["HAUS_NO"]);
					$("#" + tId).jqGrid('setCell', selRow, 'POST_CD', data[i]["POST_CD"]);
					$("#" + tId).jqGrid('setCell', selRow, 'CITY_CD', data[i]["CITY_CD"]);
					$("#" + tId).jqGrid('setCell', selRow, 'COUNTRY_CD', data[i]["COUNTRY_CD"]);
					$("#" + tId).jqGrid('setCell', selRow, 'REGION_CD', data[i]["REGION_CD"]);
					$("#" + tId).jqGrid('setCell', selRow, 'TIME_ZONE', data[i]["TIME_ZONE"]);
					$("#" + tId).jqGrid('setCell', selRow, 'TRANSP_ZONE', data[i]["TRANSP_ZONE"]);
					$("#" + tId).jqGrid('setCell', selRow, 'PO_BOX', '');
					$("#" + tId).jqGrid('setCell', selRow, 'PO_POST_CD', '');
					$("#" + tId).jqGrid('setCell', selRow, 'COMP_POST_CD', '');
					$("#" + tId).jqGrid('setCell', selRow, 'LANG_CD', data[i]["LANG_CD"]);
					$("#" + tId).jqGrid('setCell', selRow, 'TEL_NO', data[i]["TEL_NO"]);
					$("#" + tId).jqGrid('setCell', selRow, 'TEL_NO_EXT', data[i]["TEL_NO_EXT"]);
					$("#" + tId).jqGrid('setCell', selRow, 'MOBILE_NO', data[i]["MOBILE_NO"]);
					$("#" + tId).jqGrid('setCell', selRow, 'FAX_NO', data[i]["FAX_NO"]);
					$("#" + tId).jqGrid('setCell', selRow, 'FAX_NO_EXT', data[i]["FAX_NO_EXT"]);
					$("#" + tId).jqGrid('setCell', selRow, 'E_MAIL', data[i]["E_MAIL"]);
					$("#" + tId).jqGrid('setCell', selRow, 'STD_COM_MTD', '');
					$("#" + tId).jqGrid('setCell', selRow, 'DATA_LINE', '');
					$("#" + tId).jqGrid('setCell', selRow, 'COMMENTS', '');
					$("#" + tId).jqGrid('setCell', selRow, 'UNLD_PT', '');
					$("#" + tId).jqGrid('setCell', selRow, 'VAT_REG_NO', data[i]["VAT_REG_NO"]);
					$("#" + tId).jqGrid('setCell', selRow, 'ACCOUNT_GR', data[i]["ACCOUNT_GR"]);
					$("#" + tId).jqGrid('setCell', selRow, 'STREET_NM', data[i]["STREET_NM"]);
					$("#" + tId).jqGrid('setCell', selRow, 'STREET_NM2', data[i]["STREET_NM2"]);
					$("#" + tId).jqGrid('setCell', selRow, 'STREET', data[i]["STREET"]);
					$("#" + tId).jqGrid('setCell', selRow, 'TITLE', '');
					
					if('partnerGrid' == tId){
						if('WE' == type){
							$('#SL05-SHIP_CUST_CD').val(data[i]["PF_PS_NO"]);
							$('#SL05-SHIP_CUST_NM').text(data[i]["PF_PS_NM"]);
						}else if('RE' == type){
							$('#SL05-BILL_CUST_CD').val(data[i]["PF_PS_NO"]);
							$('#SL05-BILL_CUST_NM').text(data[i]["PF_PS_NM"]);
						}
					}
				}
			}
		});
	}
	
	function createItemPfGrid(){
		var colName = [
				  'COMP_CD'
				, '<s:message code="quotation.grd.document"/>'
				, 'SEQ'
				, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'itemPfGrid\')" />'
				, '<s:message code="quotation.grd.partnerFnc"/>'
				, '<s:message code="quotation.grd.number"/>'
				, '<s:message code="quotation.grd.name"/>'
				, '<s:message code="quotation.grd.partDesc"/>'
				, '<s:message code="sales.grd.street"/>'
				, '<s:message code="quotation.grd.moreData"/>'
				, '<s:message code="sales.grd.title"/>'
				, '<s:message code="sales.grd.nameF"/>'
				, '<s:message code="sales.grd.nameS"/>'
				, '<s:message code="sales.grd.house"/>'
				, '<s:message code="sales.grd.postCd"/>'
				, '<s:message code="sales.grd.city"/>'
				, '<s:message code="sales.grd.country"/>'
				, '<s:message code="sales.grd.region"/>'
				, '<s:message code="sales.grd.timeZone"/>'
				, '<s:message code="sales.grd.transpZone"/>'
				, '<s:message code="sales.grd.poBox"/>'
				, '<s:message code="sales.grd.postalCode"/>'
				, '<s:message code="sales.grd.companyPost"/>'
				, '<s:message code="sales.grd.language"/>'
				, '<s:message code="sales.grd.telephone"/>'
				, '<s:message code="sales.grd.extension"/>'
				, '<s:message code="sales.grd.mobilePhn"/>'
				, '<s:message code="sales.grd.fax"/>'
				, '<s:message code="sales.grd.extension"/>'
				, '<s:message code="sales.grd.eml"/>'
				, '<s:message code="sales.grd.stdComMtd"/>'
				, '<s:message code="sales.grd.dataLine"/>'
				, '<s:message code="sales.grd.comments"/>'
				, '<s:message code="sales.grd.unloadPoint"/>'
				, '<s:message code="sales.grd.vatRegNo"/>'
				, 'PF_CNT'
				, 'ITEM_SEQ'
				, 'SYNC_FLAG'
				, 'STREET_NM'
				, 'STREET_NM2'
				, 'ROW_STATUS'
				];
		var colModel = [
			  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
			, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
			, { name: 'SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'CHK', width : 40, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
			, { name: 'PF_TP', width: 100, align: 'left', editable:true, edittype:"select", formatter : "select", sortable: false, editoptions:{
				value:'${pf_tp}', dataEvents:[{type:"change",fn:function(e){setRowStatus('itemPfGrid'); chkDupPFCode('itemPfGrid');}}]}}
			, { name: 'PF_PS_NO', width: 150, align: 'center', classes: 'gridbtnsearch', editable:false, hidden: false, sortable: false}
			, { name: 'PF_PS_NM', width: 150, align: 'left', editable:false, sortable: false}
			, { name: 'PF_DESC', width: 250, align: 'left', editable:false, hidden: true, sortable: false}
			, { name: 'STREET', width: 250, align: 'left', editable:false, hidden: false, sortable: false}
			, { name: 'MORE_DATA', width: 10, align: 'center', editable:false, classes: 'gridbtnsearch2', sortable: false}
			, { name: 'TITLE', width: 100, align: 'center', editable:false, hidden: true}
			, { name: 'NAME_1ST', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'NAME_2ND', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'HAUS_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'POST_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'CITY_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'COUNTRY_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'REGION_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TIME_ZONE', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TRANSP_ZONE', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'PO_BOX', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'PO_POST_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'COMP_POST_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'LANG_CD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TEL_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'TEL_NO_EXT', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'MOBILE_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'FAX_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'FAX_NO_EXT', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'E_MAIL', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'STD_COM_MTD', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'DATA_LINE', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'COMMENTS', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'UNLD_PT', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'VAT_REG_NO', width: 50, align: 'center', editable:false, hidden: true}
			, { name: 'PF_CNT', width: 50, align: 'center', hidden:true}
			, { name: 'ITEM_SEQ', width: 50, align: 'center', hidden:true}
			, { name: 'SYNC_FLAG', width: 50, align: 'center', hidden:true}
			, { name: 'STREET_NM', width: 250, align: 'left', hidden:true}
			, { name: 'STREET_NM2', width: 250, align: 'left', hidden:true}
			, { name: 'ROW_STATUS', width: 50, align: 'center', hidden:true}
			];
		
		var gSetting = {
			height:234,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		// 그리드 생성 및 초기화
		btGrid.createGrid('itemPfGrid', colName, colModel, gSetting);
	}
	
	function setItemPartnerData(){
		saveAllGrid();
		var ids = $("#itemPfGrid").jqGrid("getDataIDs");
		var gridData = [];
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#itemPfGrid").getRowData(ids[i]);
			
			var auth = "";
			
			if($('#itemPfGrid_' + ids[i] + '_CHK').prop('checked')){
				auth += "Y";
			}else{
				auth += "N";
			}
			
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "DOC_NO" : rowData["DOC_NO"]
					, "SEQ" : rowData["SEQ"]
					, "PF_TP" : rowData["PF_TP"]
					, "PF_PS_NM" : rowData["PF_PS_NM"]
					, "PF_PS_NO" : rowData["PF_PS_NO"]
					, "PF_DESC" : rowData["PF_DESC"]
					, "PF_CNT" : rowData["PF_CNT"]
					, "TITLE" : rowData["TITLE"]
					, "NAME_1ST" : rowData["NAME_1ST"]
					, "NAME_2ND" : rowData["NAME_2ND"]
					, "STREET_NM" : rowData["STREET_NM"]
					, "STREET_NM2" : rowData["STREET_NM2"]
					, "HAUS_NO" : rowData["HAUS_NO"]
					, "POST_CD" : rowData["POST_CD"]
					, "CITY_CD" : rowData["CITY_CD"]
					, "COUNTRY_CD" : rowData["COUNTRY_CD"]
					, "REGION_CD" : rowData["REGION_CD"]
					, "TIME_ZONE" : rowData["TIME_ZONE"]
					, "TRANSP_ZONE" : rowData["TRANSP_ZONE"]
					, "PO_BOX" : rowData["PO_BOX"]
					, "PO_POST_CD" : rowData["PO_POST_CD"]
					, "COMP_POST_CD" : rowData["COMP_POST_CD"]
					, "LANG_CD" : rowData["LANG_CD"]
					, "TEL_NO" : rowData["TEL_NO"]
					, "TEL_NO_EXT" : rowData["TEL_NO_EXT"]
					, "MOBILE_NO" : rowData["MOBILE_NO"]
					, "FAX_NO" : rowData["FAX_NO"]
					, "FAX_NO_EXT" : rowData["FAX_NO_EXT"]
					, "E_MAIL" : rowData["E_MAIL"]
					, "STD_COM_MTD" : rowData["STD_COM_MTD"]
					, "DATA_LINE" : rowData["DATA_LINE"]
					, "COMMENTS" : rowData["COMMENTS"]
					, "UNLD_PT" : rowData["UNLD_PT"]
					, "VAT_REG_NO" : rowData["VAT_REG_NO"]
					, "ITEM_SEQ":rowData["ITEM_SEQ"]
					, "SYNC_FLAG":rowData["SYNC_FLAG"]
					, "ROW_STATUS" : ('N' == auth) ? rowData["ROW_STATUS"] : 'D'
			}
			gridData.push(data);
		}
		
		return gridData;
	}
	
	function matchPfGrid(){
		saveAllGrid();
		
		var selRow = $('#itemPfGrid').jqGrid('getGridParam', 'selrow');
		var rowIdx = $('#itemPfGrid').getInd(selRow);
		
		var idsItem = $("#itemPfGrid").jqGrid("getDataIDs");
		var idsPart = $("#partnerGrid").jqGrid("getDataIDs");
		
		var itemPfTp = $("#itemPfGrid").jqGrid('getCell', selRow, 'PF_TP');
		
		for(var i = 0; i < idsItem.length; i++){
			var rowData = $("#itemPfGrid").getRowData(idsItem[i]);
			if((rowIdx - 1) != i && '' != itemPfTp){
				if(itemPfTp == rowData["PF_TP"]){
					alert('<s:message code="errors.dup"/>');
					$("#itemPfGrid").jqGrid('setCell', selRow, 'PF_TP', '');
					return;
				}
			}
		}
		
		for(var i = 0; i < idsPart.length; i++){
			var rowData = $("#partnerGrid").getRowData(idsPart[i]);
			
			if(itemPfTp == rowData["PF_TP"]){
				$("#itemPfGrid").jqGrid('setCell', selRow, 'PF_PS_NO', rowData["PF_PS_NO"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'PF_PS_NM', rowData["PF_PS_NM"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'PF_DESC', rowData["PF_DESC"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'NAME_1ST', rowData["NAME_1ST"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'NAME_2ND', rowData["NAME_2ND"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'STREET_NM', rowData["STREET_NM"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'HAUS_NO', rowData["HAUS_NO"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'POST_CD', rowData["POST_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'CITY_CD', rowData["CITY_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'COUNTRY_CD', rowData["COUNTRY_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'REGION_CD', rowData["REGION_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'TIME_ZONE', rowData["TIME_ZONE"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'TRANSP_ZONE', rowData["TRANSP_ZONE"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'PO_BOX', rowData["PO_BOX"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'PO_POST_CD', rowData["PO_POST_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'COMP_POST_CD', rowData["COMP_POST_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'LANG_CD', rowData["LANG_CD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'TEL_NO', rowData["TEL_NO"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'TEL_NO_EXT', rowData["TEL_NO_EXT"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'MOBILE_NO', rowData["MOBILE_NO"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'FAX_NO', rowData["FAX_NO"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'FAX_NO_EXT', rowData["FAX_NO_EXT"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'E_MAIL', rowData["E_MAIL"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'STD_COM_MTD', rowData["STD_COM_MTD"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'DATA_LINE', rowData["DATA_LINE"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'COMMENTS', rowData["COMMENTS"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'UNLD_PT', rowData["UNLD_PT"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'VAT_REG_NO', rowData["VAT_REG_NO"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'STREET_NM2', rowData["STREET_NM2"]);
				$("#itemPfGrid").jqGrid('setCell', selRow, 'STREET', rowData["STREET"]);
			}
		}
	}
	
	function chkDupPFCode(tId){
		saveAllGrid();
		
		var selRow = $('#' + tId).jqGrid('getGridParam', 'selrow');
		var rowIdx = $('#' + tId).getInd(selRow);
		var idsPart = $('#' + tId).jqGrid("getDataIDs");
		var itemPfTp = $('#' + tId).jqGrid('getCell', selRow, 'PF_TP');
		
		for(var i = 0; i < idsPart.length; i++){
			var rowData = $('#' + tId).getRowData(idsPart[i]);
			if((rowIdx - 1) != i && '' != itemPfTp){
				if(itemPfTp == rowData["PF_TP"] && 'D' != rowData["ROW_STATUS"]){
					alert('<s:message code="errors.dup"/>');
					setTimeout(function() { $('#' + tId).jqGrid('setCell', selRow, 'PF_TP', 'ERR'); }, 300);
					return;
				}
			}
		}
		
		if('itemPfGrid' == tId){
			if(!('WE' == itemPfTp || 'RE' == itemPfTp || 'RG' == itemPfTp || 'ZI' == itemPfTp || 'ZP' == itemPfTp)){
				alert("<s:message code='errors.invalid' arguments='" + itemPfTp + "' javaScriptEscape='false'/>");
				setTimeout(function() { $('#' + tId).jqGrid('setCell', selRow, 'PF_TP', 'ERR'); }, 300);
				return;
			}
		}
	}
	
	function chkDupTextCode(){
		saveAllGrid();
		
		var selRow = $('#textGrid').jqGrid('getGridParam', 'selrow');
		var rowIdx = $('#textGrid').getInd(selRow);
		var idsPart = $('#textGrid').jqGrid("getDataIDs");
		var itemPfTp = $('#textGrid').jqGrid('getCell', selRow, 'TEXT_TP');
		
		for(var i = 0; i < idsPart.length; i++){
			var rowData = $('#textGrid').getRowData(idsPart[i]);
			if((rowIdx - 1) != i && '' != itemPfTp){
				if(itemPfTp == rowData["TEXT_TP"]){
					alert('<s:message code="errors.dup"/>');
					setTimeout(function() { $('#textGrid').jqGrid('setCell', selRow, 'TEXT_TP', 'ERR'); }, 300);
					return;
				}
			}
		}
	}
	
	function saveAllGrid(){
		btGrid.gridSaveRow('scGrid');
		btGrid.gridSaveRow('itemGrid');
		btGrid.gridSaveRow('itemPfGrid');
		btGrid.gridSaveRow('partnerGrid');
	}
	
	var erpInfoFlag = false;
	
	function getPrice(){
		
		(!partTabFlag) ? initPartTab() : '' ;
		(!itemTabFlag) ? initItemTab() : '' ;
		(!itemDtlTabFlag) ? initItemDtlTab() : '' ;
		(!slTabFlag) ? initSlTab() : '' ;
		
		calcWgtVol();
		
		//Item Grid Valid Check
		var ids = $("#itemGrid").jqGrid("getDataIDs");
		
		if(ids.length < 1){
			return false;
		}
		
		$('#ui-id-4').trigger('click');
		$('#ui-id-3').trigger('click');
		
		var priceAlretFlg = false;
		
		for(var i = 0; i < ids.length; i++){
			
			var rowData = $("#itemGrid").getRowData(ids[i]);
			
			var tempVal = rowData["DELI_DT_1ST"];
			if((tempVal.length != 10 && ('U' == rowData["ROW_STATUS"] || 'I' == rowData["ROW_STATUS"])) && fn_empty(rowData["pItemSeq"])){
				
				$('#ui-id-3').trigger('click'); // 아이템 탭
				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Items";
				alert("<s:message code='errors.date' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			////////////////////////////////////////////////////////////////////////////
			// TODO
			/*
			if(($('#SL05-DIV_CD').val() != rowData["DIV_CD"]) && fn_empty(rowData["pItemSeq"])){
				
				$('#ui-id-3').trigger('click'); // 아이템 탭
				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Division";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			*/
			////////////////////////////////////////////////////////////////////////////
			if('' == rowData["MATL_CD"] && fn_empty(rowData["pItemSeq"])){
				
				$('#ui-id-3').trigger('click'); // 아이템 탭
				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Material";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			if(('' == rowData["ORD_QTY"] || 0 == Number(createNormalFm(rowData["ORD_QTY"]))) && fn_empty(rowData["pItemSeq"])){
				
				$('#ui-id-3').trigger('click'); // 아이템 탭
				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Qty";
				alert("<s:message code='errors.invalid' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
			if('ERR' == rowData["ITEM_CTG_GR"] && fn_empty(rowData["pItemSeq"])){
				
				$('#ui-id-3').trigger('click'); // 아이템 탭
				$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[i]);
				
				msg = "Item Cat. Grp";
				alert("<s:message code='errors.required' arguments='" + msg + "' javaScriptEscape='false'/>");
				return false;
			}
		}
		
		$('#ui-id-6').trigger('click'); // Header
		var disabled = $('form[id=frmHeader]').find(':input:disabled').removeAttr('disabled');
		
		var url = "/salesOrder/selectItemPriceList.do";
		var reqDeliDate = $('#SL05-REQ_DELI_DT').val();
		
		if('2' == $('#SL05-REQ_DELI_DT_TYPE option:selected').val()){
			reqDeliDate = changeDateFormat(getWeekDay(reqDeliDate));
		}else if('3' == $('#SL05-REQ_DELI_DT_TYPE option:selected').val()){
			var tempDate = reqDeliDate.split('\.');
			reqDeliDate = tempDate[2].toString() + tempDate[1].toString() + '01';
		}else{
			reqDeliDate = changeDateFormat(reqDeliDate);
		}
		
		selectScdlTab(true);
		
		var headData = formIdAllToMap('frmHeader');
		var partnerGrid = setPartnerData();
		var textGrid = $('#textGrid').getRowData();
		var itemGrid = setItemData();
		var itemDtl = formIdAllToMap('frmItemDtl');
		var scGrid = setScData();
		var itemPfGrid = setItemPartnerData();
		
		var itemGridRowsCnt = itemGrid.length;
		var scGridRowsCnt = scGrid.length;
		
		for(var i = 0; i < itemGridRowsCnt; i++){
			var itemIsNewCnt = 0;
			if('' != itemGrid[i]["DELI_DT_1ST_TP"]){
				itemGrid[i]["DELI_DT_1ST_TP"] = changeDateFormat(itemGrid[i]["DELI_DT_1ST_TP"]);
			}
			if('' != itemGrid[i]["PRICE_DT"]){
				itemGrid[i]["PRICE_DT"] = changeDateFormat(itemGrid[i]["PRICE_DT"]);
			}
			for(var j = 0; j < scGridRowsCnt; j++){
				////////////////////////////////////////////////////////////////////////////
				// TODO
				if(itemGrid[i]["ITEM_SEQ"] == scGrid[j]["ITEM_SEQ"] && "1" == scGrid[j]["SEQ"]){
					if (!!itemGrid[j] && !!itemGrid[j]["ORD_QTY"]) {
						scGrid[j]["ORD_QTY"] = itemGrid[j]["ORD_QTY"];
					}
				}
				/*
				if (!!itemGrid[j] && !!itemGrid[j]["ORD_QTY"]) {
					scGrid[j]["ORD_QTY"] = itemGrid[j]["ORD_QTY"];
				}
				*/
				////////////////////////////////////////////////////////////////////////////
				if(itemGrid[i]["ITEM_SEQ"] == scGrid[j]["ITEM_SEQ"] && 'D' != itemGrid[i]["ROW_STATUS"]){
					itemIsNewCnt++;
				}
			}
			
			if(itemIsNewCnt < 1){
				var data = {"ROW_STATUS" : "I", "SEQ" : "1", "ITEM_SEQ" : itemGrid[i]["ITEM_SEQ"], "MATL_CD" : itemGrid[i]["MATL_CD"],
					"CFM_QTY" : "", "SALES_UNIT_CD" : itemGrid[i]["ORD_UNIT_CD"], "ATP_QTY" : "0", "DELI_BLOCK_CD" : "G4",
					"BATCH_NO" : itemGrid[i]["BATCH_NO"], "PERI_CD" : itemGrid[i]["DELI_DT_1ST_TP"], "DELI_DT" : itemGrid[i]["DELI_DT_1ST"],
					"ORD_QTY" : itemGrid[i]["ORD_QTY"]
					};
				btGrid.gridAddRow("scGrid", "last", data);
			}
		}
		
		scGrid = setScData();
		scGridRowsCnt = scGrid.length;

		for(var i = 0; i < itemGridRowsCnt; i++){
			for(var j = 0; j < scGridRowsCnt; j++){
				if('' != scGrid[j]["DELI_DT"]){
					scGrid[j]["DELI_DT"] = changeDateFormat(scGrid[j]["DELI_DT"]);
				}
				if(itemGrid[i]["ITEM_SEQ"] == scGrid[j]["ITEM_SEQ"] && "1" == scGrid[j]["SEQ"]){
					scGrid[j]["ORD_QTY"] = itemGrid[i]["ORD_QTY"];
				}
			}
		}
		
		var param = { 'DOC_TP':'ZAGM'
					, 'SALES_ORG_CD':$('#SL05-SALES_ORG_CD').val()
					, 'DISTRB_CH':$('#SL05-DISTRB_CH').val()
					, 'DIV_CD':$('#SL05-DIV_CD').val()
					, 'SALES_GR':$('#SL05-SALES_GR option:selected').val()
					, 'SALES_OFFICE_CD':$('#SL05-SALES_OFFICE_CD option:selected').val()
					, 'REQ_DELI_DT':reqDeliDate
					, 'DATE_TYPE':$('#SL05-REQ_DELI_DT_TYPE option:selected').val()
					, 'PO_DT_TP':'2'
					, 'PO_DT':changeDateFormat($('#SL05-PO_DT').val())
					, 'INCOTERMS_CD':$('#SL05-INCOTERMS_CD option:selected').val()
					, 'INCOTERMS_NM':$('#SL05-INCOTERMS_DESC').val()
					, 'TERM_PAY_CD':$('#SL05-PAY_TERM').val()
					, 'PRICE_DT':changeDateFormat($('#SL05-PRICE_DT').val())
					, 'ATTR_ORD': $('#SL05-ATTR_ORD option:selected').val()
					, 'PO_NO':$('#SL05-PO_NO').val()
					, 'IF_DT':changeDateFormat(toDay)
					, 'SHIP_CONDI_CD':$('#SL05-SHP_CON_CD option:selected').val()
					, 'CURR_CD':$('#SL05-CURR_CD').val()
					, 'PMNTTRMS':$('#SL05-PAY_TERM').val()
					, 'partnerGrid':partnerGrid
					, 'itemGrid':itemGrid
					, 'scGrid':scGrid
					, 'DOC_NO':('' != $("#SL05-DOC_NO").val()) ? $("#SL05-DOC_NO").val() : $('#SL05-TEMP_DOC_NO').val()
					, 'DOC_GR':'QT'
					, 'SUR_CHARGE':Number(createNormalFm($('#SL05-SUR_CHARGE_AMT').val())).toFixed(2)
					, 'SOLD_TO':$('#SL05-SOLD_CUST_CD').val()
					, 'ORD_REASON':$('#SL05-ORD_RESN_CD option:selected').val()
					, 'DLV_AMT':Number(createNormalFm($('#SL05-DLV_AMT').val())).toFixed(2)
					, 'DC_TP': $('#SL05-DC_TP option:selected').val()
					, 'DC_VAL': createNormalFm($('#SL05-DC_VAL').val())
					, 'ACCT_GRP': accountGrp
					, 'EXCHG_RATE':Number(createNormalFm($('#SL05-EXCHG_RATE').val())).toFixed(5)
					};
		
		disabled.attr('disabled','disabled');
		
		$('#ui-id-3').trigger('click');
		
		fn_ajax(url, true, param, function(data, xhr){
			
			if('OK' == data.MESSAGE){
				var headEx = data.RESULT[1];
				var busiEx = data.RESULT[2];
				var condEx = data.RESULT[3];
				var itemEx = data.RESULT[4];
				var scheEx = data.RESULT[6];
				var textEx = data.RESULT[8];
				
				var idsItem = $('#itemGrid').jqGrid('getDataIDs');
				var idsSc = $('#scGrid').jqGrid('getDataIDs');
				var idsText = $('#textGrid').jqGrid('getDataIDs');
				
				var totAmt = 0;
				var vatRate = 0;
				var vatAmt = 0;
				var grandTotAmt = 0;
				
				for(var i = 0; i < itemEx.rows['length']; i++){
					for(var j = 0; j < idsItem.length; j++){
						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
							&& $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ') == Number(itemEx.rows[i].ITM_NUMBER)
							){
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'BATCH_NO', itemEx.rows[i].BATCH);
							
							for(var k = 0; k < idsSc.length; k++){
								if($("#scGrid").jqGrid('getCell', idsSc[k], 'ITEM_SEQ') == Number(itemEx.rows[i].ITM_NUMBER)){
									$("#scGrid").jqGrid('setCell', idsSc[k], 'BATCH_NO', itemEx.rows[i].BATCH);
								}
							}
							
							var reqQty = itemEx.rows[i].REQ_QTY;
							if(!fn_empty($("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq'))){
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'pItemSeq_QTY', createGridNumFm(Number(reqQty).toFixed(2)));
							}
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ORD_QTY', createGridNumFm(Number(reqQty).toFixed(2)));
						}
					}
				}
				
				for(var j = 0; j < idsItem.length; j++){
					var condPrice = '';
					var condVal = '';
					var zpnmFlg = false;
					var zpnnPrice = '';
					
					for(var i = 0; i < condEx.rows['length']; i++){
						
						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
								&& $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ') == Number(condEx.rows[i].ITM_NUMBER) 
								&& 'ZPL0' == condEx.rows[i].COND_TYPE){
							condPrice = Number(condEx.rows[i].COND_VALUE).toFixed(2);
							condVal = Number(condEx.rows[i].CONDVALUE).toFixed(2);
							if('' == $("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq')){
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_VAL', createGridNumFm(Number(condEx.rows[i].CONDVALUE).toFixed(2)));
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_PRICE', createGridNumFm(Number(condEx.rows[i].COND_VALUE).toFixed(2)));
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'PER', condEx.rows[i].COND_P_UNT);
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'UOM', condEx.rows[i].COND_UNIT);
								
								if(!zpnmFlg){
									$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PRICE', createGridNumFm(Number(condEx.rows[i].COND_VALUE).toFixed(2)));
									$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PER', condEx.rows[i].COND_P_UNT);
									$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_UOM', condEx.rows[i].COND_UNIT);
								}
							}
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_STATUS', 'Y');
						}

// 						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
// 								&& $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ') == Number(condEx.rows[i].ITM_NUMBER) 
// 								&& 'ZPR0' == condEx.rows[i].COND_TYPE){
// 							condPrice = Number(condEx.rows[i].COND_VALUE).toFixed(2);
// 							condVal = Number(condEx.rows[i].CONDVALUE).toFixed(2);
// 							if('' == $("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq')){
// 								$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_VAL', createGridNumFm(Number(condEx.rows[i].CONDVALUE).toFixed(2)));
// 								$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_PRICE', createGridNumFm(Number(condEx.rows[i].COND_VALUE).toFixed(2)));
// 								$("#itemGrid").jqGrid('setCell', idsItem[j], 'PER', condEx.rows[i].COND_P_UNT);
// 								$("#itemGrid").jqGrid('setCell', idsItem[j], 'UOM', condEx.rows[i].COND_UNIT);
								
// 								if(!zpnmFlg){
// 									$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PRICE', createGridNumFm(Number(condEx.rows[i].COND_VALUE).toFixed(2)));
// 									$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PER', condEx.rows[i].COND_P_UNT);
// 									$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_UOM', condEx.rows[i].COND_UNIT);
// 								}
// 							}
// 							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_STATUS', 'Y');
// 						}
						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
								&& $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ') == Number(condEx.rows[i].ITM_NUMBER) 
								&& 'MWST' == condEx.rows[i].COND_TYPE){
							vatRate = condEx.rows[i].COND_VALUE;
							vatAmt = vatAmt + Number(condEx.rows[i].CONDVALUE);
						}
						
						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
								&& $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ') == Number(condEx.rows[i].ITM_NUMBER) 
								&& 'ZPNM' == condEx.rows[i].COND_TYPE){
							if('' == $("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq')){
								condPrice = Number(condEx.rows[i].COND_VALUE).toFixed(2);
								condVal = Number(condEx.rows[i].CONDVALUE).toFixed(2);
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PER', condEx.rows[i].COND_P_UNT);
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_UOM', condEx.rows[i].COND_UNIT);
							}
							
							zpnmFlg = true;
						}
						
						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
								&& $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ') == Number(condEx.rows[i].ITM_NUMBER) 
								&& 'ZPNN' == condEx.rows[i].COND_TYPE){
//								condPrice = Number(condEx.rows[i].COND_VALUE).toFixed(2);
//								condVal = Number(condEx.rows[i].CONDVALUE).toFixed(2);
							if('' == $("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq')){
								zpnnPrice = createGridNumFm(Number(condEx.rows[i].COND_VALUE).toFixed(2));
							}
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_STATUS', 'Y');
						}
						
						if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')
							&& '' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq')){
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PRICE', '');
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_VAL', '');
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_PRICE', '');
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PER', null);
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_UOM', null);
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'PER', null);
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'UOM', null);
						}
					}
					
					(zpnmFlg) ? $("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PRICE', zpnnPrice) : '';
					
					if('' == $("#itemGrid").jqGrid('getCell', idsItem[j], 'pItemSeq')){
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'NET_VAL', createGridNumFm(condVal));
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'NET_PRICE', createGridNumFm(condPrice));
					}else{
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'NET_VAL', '');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'NET_PRICE', '');
					}
					
					if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')){
						if('I' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')){
							$("#itemGrid").jqGrid('setCell', idsItem[j], 'ROW_STATUS', 'U')
						}
					}
					
					if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS')){
						
						var docNo;
						
						if('' != $("#SL05-DOC_NO").val()){
							docNo = $("#SL05-DOC_NO").val();
						}else{
							docNo = $("#SL05-TEMP_DOC_NO").val();
						}
						
						var url = "/salesOrder/getItemCondition.do";
						var param = {"DOC_NO"  : docNo
								, "ITEM_SEQ" : $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_SEQ')
								, "DOC_GR" : "QT"
							};
						
						fn_ajax(url, false, param, function(data, xhr){
							if(!fn_empty(data.COND_SUM)){
								$("#itemGrid").jqGrid('setCell', idsItem[j], 'COND_SUM', createGridNumFm(data.COND_SUM));
								totAmt = totAmt + Number(data.COND_SUM);
							}
						});
					}
					
					var zpnnPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', idsItem[j], 'ZPNN_PRICE')));
					var erpNetPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', idsItem[j], 'ERP_NET_PRICE')));
					
					if(!fn_empty(erpNetPrice)){
						if(!priceAlretFlg){
							(zpnnPrice < erpNetPrice) ? alert("<s:message code='error.lowPrice'/>") : '';
						}
						priceAlretFlg = true;
					}
					

					if('D' != $("#itemGrid").jqGrid('getCell', idsItem[j], 'ROW_STATUS') && 'TANN' == $("#itemGrid").jqGrid('getCell', idsItem[j], 'ITEM_CTG_GR')){
						var unitCd = $("#itemGrid").jqGrid('getCell', idsItem[j], 'ORD_UNIT_CD');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'NET_VAL', '0,00');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'NET_PRICE', '0,00');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PRICE', '0,00');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_VAL', '0,00');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'ERP_NET_PRICE', '0,00');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_PER', '1');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'ZPNN_UOM', unitCd);
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'PER', '1');
						$("#itemGrid").jqGrid('setCell', idsItem[j], 'UOM', unitCd);
					}
				}
				
				grandTotAmt = vatAmt + totAmt;
				
				$('#SL05-T_AMT').val(createGridNumFm(Number(grandTotAmt).toFixed(2)));
				$('#SL05-NET_AMT').val(createGridNumFm(Number(totAmt).toFixed(2)));
				$('#SL05-VAT_AMT').val(createGridNumFm(Number(vatAmt).toFixed(2)));
				$('#SL05-VAT').val(createGridNumFm(Number(vatRate).toFixed(2)));
				$('#SL05-ERP_T_AMT').val(createGridNumFm(Number(grandTotAmt).toFixed(2)));
				$('#SL05-ERP_NET_AMT').val(createGridNumFm(Number(totAmt).toFixed(2)));
				$('#SL05-ERP_VAT_AMT').val(createGridNumFm(Number(vatAmt).toFixed(2)));
				
				//(0 < Number(busiEx.rows[0].EXCHG_RATE_V)) ? $('#SL05-CURR_VAL').val(createGridNumFm(Number(busiEx.rows[0].EXCHG_RATE_V).toFixed(2))) : '';
				(0 < Number(busiEx.rows[0].EXCHG_RATE_V)) ? $('#SL05-EXCHG_RATE').val(createGridNumFm(Number(busiEx.rows[0].EXCHG_RATE_V).toFixed(5))) : '';
				
// 				for(var k = 0; k < idsSc.length; k++){
// 					var cfmQty = 0;
// 					for(var i = 0; i < scheEx.rows['length']; i++){
// 						if($("#scGrid").jqGrid('getCell', idsSc[k], 'ITEM_SEQ') == Number(scheEx.rows[i].ITM_NUMBER)){
// 							cfmQty = cfmQty + Number(scheEx.rows[i].CONFIR_QTY);
// 						}
// 					}
// 					$("#scGrid").jqGrid('setCell', idsSc[k], 'CFM_QTY', createGridNumFm(Number(cfmQty).toFixed(2)));
// 				}
				
				var z020Val = '';
				var z021Val = '';
				var z023Val = '';
				var z001Val = '';
				var lang = '';
				
				var data;
				var flag_0001 = true;
				var flag_z023 = true;
				var flag_z021 = true;
				var flag_z020 = true;
				
				for(var i = 0; i < idsText.length; i++){
					('0001' == $("#textGrid").jqGrid('getCell', idsText[i], 'TEXT_TP')) ? flag_0001 = false : '';
					('Z023' == $("#textGrid").jqGrid('getCell', idsText[i], 'TEXT_TP')) ? flag_z023 = false : '';
					('Z021' == $("#textGrid").jqGrid('getCell', idsText[i], 'TEXT_TP')) ? flag_z021 = false : '';
					('Z020' == $("#textGrid").jqGrid('getCell', idsText[i], 'TEXT_TP')) ? flag_z020 = false : '';
				}
				
				for(var i = 0; i < textEx.rows['length']; i++){
					('E' == textEx.rows[i].LANGU) ? lang = 'EN' : lang = 'DE';
					if(flag_z020){
						if('Z020' == textEx.rows[i].TEXT_ID){
// 							if('' == textEx.rows[i].LINE){
								z020Val += '\n';
// 							}else{
								z020Val += textEx.rows[i].LINE;
// 							}
						}
					}
					if(flag_z021){
						if('Z021' == textEx.rows[i].TEXT_ID){
// 							if('' == textEx.rows[i].LINE){
								z021Val += '\n';
// 							}else{
								z021Val += textEx.rows[i].LINE;
// 							}
						}
					}
					if(flag_z023){
						if('Z023' == textEx.rows[i].TEXT_ID){
// 							if('' == textEx.rows[i].LINE){
								z023Val += '\n';
// 							}else{
								z023Val += textEx.rows[i].LINE;
// 							}
						}
					}
					if(flag_0001){
						if('0001' == textEx.rows[i].TEXT_ID){
// 							if('' == textEx.rows[i].LINE){
								z001Val += '\n';
// 							}else{
								z001Val += textEx.rows[i].LINE;
// 							}
						}
					}
				}
				
				data = {"ROW_STATUS" : "I", "TEXT_TP" : "0001", "LANG_CD" : lang, "MATL_TEXT" : z001Val};
				(flag_0001) ? btGrid.gridAddRow("textGrid", "last", data) : '';
				
				data = {"ROW_STATUS" : "I", "TEXT_TP" : "Z023", "LANG_CD" : lang, "MATL_TEXT" : z023Val};
				(flag_z023) ? btGrid.gridAddRow("textGrid", "last", data) : '';
				
				data = {"ROW_STATUS" : "I", "TEXT_TP" : "Z021", "LANG_CD" : lang, "MATL_TEXT" : z021Val};
				(flag_z021) ? btGrid.gridAddRow("textGrid", "last", data) : '';
				
				data = {"ROW_STATUS" : "I", "TEXT_TP" : "Z020", "LANG_CD" : lang, "MATL_TEXT" : z020Val};
				(flag_z020) ? btGrid.gridAddRow("textGrid", "last", data) : '';
				
				data = {"ROW_STATUS" : "R", "TEXT_TP" : "", "LANG_CD" : lang, "MATL_TEXT" : ''};
				btGrid.gridAddRow("textGrid", "last", data);
				
				$('#textGrid').find('tbody tr:eq(' + $('#textGrid').getInd($('#textGrid').jqGrid('getGridParam', 'selrow')) + ')').hide();
				
				saveAllGrid();
				
				controlFlag(false);
				
				erpInfoFlag = true;
				
				beforeTab = "SCHE";
				tempDataSave();
				
				beforeTab = "ITEM";
				tempDataSave();
				
				copyFlag = false;
			}
		});
	}
	
	function setTextData(){
		saveAllGrid();
		var data = {};
		
		if('' != $('#SL05-DOC_NO').val()){
			btGrid.gridAddRow("textGrid", "last", data);
		}
		
		var ids = $("#textGrid").jqGrid("getDataIDs");
		var gridData = [];
		
		$('#textGrid').jqGrid('setSelection', ids.length);
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#textGrid").getRowData(ids[i]);
			
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "DOC_NO" : rowData["DOC_NO"]
					, "SEQ" : rowData["SEQ"]
					, "TEXT_TP" : rowData["TEXT_TP"]
					, "LANG_CD" : rowData["LANG_CD"]
					, "MATL_TEXT" : rowData["MATL_TEXT"]
					, "ROW_STATUS" : rowData["ROW_STATUS"]
				}
			gridData.push(data);
		}
		
		return gridData;
	}
	
	var oneTimeValue = [];
	var oneTimeValueShip = [];
	var oneTimeFlag = false;
	
	function openOnetimeCustPop(type, rowId, isNew){
		
		saveAllGrid();
		
		var url = "/popup/OneTimeCustomerPopup.do";
		var pid = "OneTimeCustomerPopup";  //팝업 페이지의 취상위 div ID
		var param = {};
		var selRow;
		var tableId = "";
		
		if('PF' == type || 'ITEM' == type){
			
			('ITEM' == type) ? tableId = "itemPfGrid" : tableId = "partnerGrid";
			
			('' != rowId) ? selRow = rowId : selRow = $('#' + tableId).jqGrid('getGridParam', 'selrow');
			
			if('CPD' == $('#' + tableId).jqGrid('getCell', selRow, 'ACCOUNT_GR')
					|| 'CPDA' == $('#' + tableId).jqGrid('getCell', selRow, 'ACCOUNT_GR')
					|| 'Z007' == $('#' + tableId).jqGrid('getCell', selRow, 'ACCOUNT_GR')){
				oneTimeFlag = true;
			}
			
			param = { 'NAME_1ST':$('#' + tableId).jqGrid('getCell', selRow, 'NAME_1ST')
					, 'NAME_2ND':$('#' + tableId).jqGrid('getCell', selRow, 'NAME_2ND')
					, 'HAUS_NO' :$('#' + tableId).jqGrid('getCell', selRow, 'HAUS_NO')
					, 'STREET_NM':$('#' + tableId).jqGrid('getCell', selRow, 'STREET_NM')
					, 'POST_CD':$('#' + tableId).jqGrid('getCell', selRow, 'POST_CD')
					, 'CITY_CD':$('#' + tableId).jqGrid('getCell', selRow, 'CITY_CD')
					, 'COUNTRY_CD':$('#' + tableId).jqGrid('getCell', selRow, 'COUNTRY_CD')
					, 'REGION_CD':$('#' + tableId).jqGrid('getCell', selRow, 'REGION_CD')
					, 'TIME_ZONE':$('#' + tableId).jqGrid('getCell', selRow, 'TIME_ZONE')
					, 'TRANSP_ZONE':$('#' + tableId).jqGrid('getCell', selRow, 'TRANSP_ZONE')
					, 'PO_BOX':$('#' + tableId).jqGrid('getCell', selRow, 'PO_BOX')
					, 'PO_POST_CD':$('#' + tableId).jqGrid('getCell', selRow, 'PO_POST_CD')
					, 'COMP_POST_CD':$('#' + tableId).jqGrid('getCell', selRow, 'COMP_POST_CD')
					, 'LANG_CD':$('#' + tableId).jqGrid('getCell', selRow, 'LANG_CD')
					, 'TEL_NO':$('#' + tableId).jqGrid('getCell', selRow, 'TEL_NO')
					, 'TEL_NO_EXT':$('#' + tableId).jqGrid('getCell', selRow, 'TEL_NO_EXT')
					, 'MOBILE_NO':$('#' + tableId).jqGrid('getCell', selRow, 'MOBILE_NO')
					, 'FAX_NO':$('#' + tableId).jqGrid('getCell', selRow, 'FAX_NO')
					, 'FAX_NO_EXT':$('#' + tableId).jqGrid('getCell', selRow, 'FAX_NO_EXT')
					, 'E_MAIL':$('#' + tableId).jqGrid('getCell', selRow, 'E_MAIL')
					, 'DATA_LINE':$('#' + tableId).jqGrid('getCell', selRow, 'DATA_LINE')
					, 'COMMENTS':$('#' + tableId).jqGrid('getCell', selRow, 'COMMENTS')
					, 'UNLD_PT':$('#' + tableId).jqGrid('getCell', selRow, 'UNLD_PT')
					, 'STREET_NM2': $('#' + tableId).jqGrid('getCell', selRow, 'STREET_NM2')
					, 'NEW': (isNew != undefined && isNew != null) ? 'NEW' : rowId
					, 'VAT_REG_NO':$('#' + tableId).jqGrid('getCell', selRow, 'VAT_REG_NO')
			};
		}else if('SOLD' == type || 'SHIP' == type){
			oneTimeFlag = true;
		}
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data))
			{
				if('PF' == type || 'ITEM' == type){
					$('#' + tableId).jqGrid('setCell', selRow, 'PF_PS_NM', (!fn_empty(data[0])) ? data[0] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'NAME_1ST', (!fn_empty(data[0])) ? data[0] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'NAME_2ND', (!fn_empty(data[1])) ? data[1] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'STREET_NM', (!fn_empty(data[2])) ? data[2] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'HAUS_NO', (!fn_empty(data[3])) ? data[3] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'POST_CD', (!fn_empty(data[4])) ? data[4] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'CITY_CD', (!fn_empty(data[5])) ? data[5] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'COUNTRY_CD', (!fn_empty(data[6])) ? data[6] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'REGION_CD', (!fn_empty(data[7])) ? data[7] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'TIME_ZONE', (!fn_empty(data[8])) ? data[8] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'TRANSP_ZONE', (!fn_empty(data[9])) ? data[9] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'PO_BOX', (!fn_empty(data[10])) ? data[10] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'PO_POST_CD', (!fn_empty(data[11])) ? data[11] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'COMP_POST_CD', (!fn_empty(data[12])) ? data[12] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'LANG_CD', (!fn_empty(data[13])) ? data[13] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'TEL_NO', (!fn_empty(data[14])) ? data[14] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'TEL_NO_EXT', (!fn_empty(data[15])) ? data[15] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'MOBILE_NO', (!fn_empty(data[16])) ? data[16] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'FAX_NO', (!fn_empty(data[17])) ? data[17] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'FAX_NO_EXT', (!fn_empty(data[18])) ? data[18] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'E_MAIL', (!fn_empty(data[19])) ? data[19] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'DATA_LINE', (!fn_empty(data[20])) ? data[20] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'COMMENTS', (!fn_empty(data[21])) ? data[21] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'UNLD_PT', (!fn_empty(data[22])) ? data[22] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'VAT_REG_NO', (!fn_empty(data[23])) ? data[23] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'STREET_NM2', (!fn_empty(data[24])) ? data[24] : null);
					$('#' + tableId).jqGrid('setCell', selRow, 'STREET', (!fn_empty(data[25])) ? data[25] : null);
					//$('#' + tableId).jqGrid('setCell', selRow, 'ROW_STATUS', (!fn_empty(data[26])) ? data[26] : null);

					setRowStatus('partnerGrid');
					setRowStatus('itemPfGrid');
					btGrid.gridSaveRow(tableId);
					
					if('PF' == type){
						if('WE' == $('#' + tableId).jqGrid('getCell', selRow, 'PF_TP')){
							$('#' + tableId).jqGrid('setCell', selRow, 'PF_PS_NM', data[0]);
							$('#SL05-SHIP_CUST_NM').text(data[0]);
						}
					}
					
				}else if('SHIP' == type){
					oneTimeValueShip = [];
					oneTimeValueShip.push(data[0]);		//0 NAME_1ST
					oneTimeValueShip.push(data[1]);		//1 NAME_2ND
					oneTimeValueShip.push(data[2]);		//2 STREET_NM
					oneTimeValueShip.push(data[3]);		//3 HAUS_NO
					oneTimeValueShip.push(data[4]);		//4 POST_CD
					oneTimeValueShip.push(data[5]);		//5 CITY_CD
					oneTimeValueShip.push(data[6]);		//6 COUNTRY_CD
					oneTimeValueShip.push(data[7]);		//7 REGION_CD
					oneTimeValueShip.push(data[8]);		//8 TIME_ZONE
					oneTimeValueShip.push(data[9]);		//9 TRANSP_ZONE
					oneTimeValueShip.push(data[10]);	//10 PO_BOX
					oneTimeValueShip.push(data[11]);	//11 PO_POST_CD
					oneTimeValueShip.push(data[12]);	//12 COMP_POST_CD
					oneTimeValueShip.push(data[13]);	//13 LANG_CD
					oneTimeValueShip.push(data[14]);	//14 TEL_NO
					oneTimeValueShip.push(data[15]);	//15 TEL_NO_EXT
					oneTimeValueShip.push(data[16]);	//16 MOBILE_NO
					oneTimeValueShip.push(data[17]);	//17 FAX_NO
					oneTimeValueShip.push(data[18]);	//18 FAX_NO_EXT
					oneTimeValueShip.push(data[19]);	//19 E_MAIL
					oneTimeValueShip.push(data[20]);	//20 DATA_LINE
					oneTimeValueShip.push(data[21]);	//21 COMMENTS
					oneTimeValueShip.push(data[22]);	//22 UNLD_PT
					oneTimeValueShip.push(data[23]);	//23 VAT_REG_NO
					oneTimeValueShip.push(data[24]);	//24 STREET_NM2
					oneTimeValueShip.push(data[25]);	//25 STREET
					//oneTimeValueShip.push(data[26]);	//25 ROW_STATUS
					setRowStatus('partnerGrid');
					setRowStatus('itemPfGrid');
					
					var tempTb = '';
					for(var i = 0; i < 2; i++){
						(i == 0) ? tempTb = 'partnerGrid' : tempTb = 'itemPfGrid';
						
						var ids = $('#' + tempTb).jqGrid("getDataIDs");
						
						for(var j = 0; j < ids.length; j++){
							if('WE' == $('#' + tempTb).jqGrid('getCell', ids[j], 'PF_TP')){
								$('#' + tempTb).jqGrid('setCell', ids[j], 'NAME_1ST', oneTimeValueShip[0]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'NAME_2ND', oneTimeValueShip[1]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'STREET_NM', oneTimeValueShip[2]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'HAUS_NO', oneTimeValueShip[3]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'POST_CD', oneTimeValueShip[4]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'CITY_CD', oneTimeValueShip[5]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'COUNTRY_CD', oneTimeValueShip[6]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'REGION_CD', oneTimeValueShip[7]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'TIME_ZONE', oneTimeValueShip[8]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'TRANSP_ZONE', oneTimeValueShip[9]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'PO_BOX', oneTimeValueShip[10]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'PO_POST_CD', oneTimeValueShip[11]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'COMP_POST_CD', oneTimeValueShip[12]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'LANG_CD', oneTimeValueShip[13]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'TEL_NO', oneTimeValueShip[14]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'TEL_NO_EXT', oneTimeValueShip[15]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'MOBILE_NO', oneTimeValueShip[16]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'FAX_NO', oneTimeValueShip[17]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'FAX_NO_EXT', oneTimeValueShip[18]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'E_MAIL', oneTimeValueShip[19]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'DATA_LINE', oneTimeValueShip[20]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'COMMENTS', oneTimeValueShip[21]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'UNLD_PT', oneTimeValueShip[22]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'VAT_REG_NO', oneTimeValueShip[23]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'STREET_NM2', oneTimeValueShip[24]);
								$('#' + tempTb).jqGrid('setCell', ids[j], 'STREET', oneTimeValueShip[25]);
								//$('#' + tempTb).jqGrid('setCell', ids[j], 'ROW_STATUS', oneTimeValueShip[26]);
								setRowStatus('partnerGrid');
								setRowStatus('itemPfGrid');
							}
						}
					}
				}else{
					oneTimeValue = [];
					oneTimeValue.push(data[0]);		//0 NAME_1ST
					oneTimeValue.push(data[1]);		//1 NAME_2ND
					oneTimeValue.push(data[2]);		//2 STREET_NM
					oneTimeValue.push(data[3]);		//3 HAUS_NO
					oneTimeValue.push(data[4]);		//4 POST_CD
					oneTimeValue.push(data[5]);		//5 CITY_CD
					oneTimeValue.push(data[6]);		//6 COUNTRY_CD
					oneTimeValue.push(data[7]);		//7 REGION_CD
					oneTimeValue.push(data[8]);		//8 TIME_ZONE
					oneTimeValue.push(data[9]);		//9 TRANSP_ZONE
					oneTimeValue.push(data[10]);	//10 PO_BOX
					oneTimeValue.push(data[11]);	//11 PO_POST_CD
					oneTimeValue.push(data[12]);	//12 COMP_POST_CD
					oneTimeValue.push(data[13]);	//13 LANG_CD
					oneTimeValue.push(data[14]);	//14 TEL_NO
					oneTimeValue.push(data[15]);	//15 TEL_NO_EXT
					oneTimeValue.push(data[16]);	//16 MOBILE_NO
					oneTimeValue.push(data[17]);	//17 FAX_NO
					oneTimeValue.push(data[18]);	//18 FAX_NO_EXT
					oneTimeValue.push(data[19]);	//19 E_MAIL
					oneTimeValue.push(data[20]);	//20 DATA_LINE
					oneTimeValue.push(data[21]);	//21 COMMENTS
					oneTimeValue.push(data[22]);	//22 UNLD_PT
					oneTimeValue.push(data[23]);	//23 VAT_REG_NO
					oneTimeValue.push(data[24]);	//24 STREET_NM2
					oneTimeValue.push(data[25]);	//25 STREET
					//oneTimeValue.push(data[26]);	//26
					setRowStatus('partnerGrid');
					setRowStatus('itemPfGrid');
				}
			}
		});
	}
	
	function selectItemPfGrid(){
		
		var url = "/quotation/selectItemPfGrid.do";
		var docNo = "";
		
		('' != $('#SL05-DOC_NO').val()) ? docNo = $('#SL05-DOC_NO').val() : docNo = $('#SL05-TEMP_DOC_NO').val()
		
		var param = { "param" : {
				  "DOC_NO"  : docNo
				, "CUST_CD" : $('#SL05-SOLD_CUST_CD').val()
				, "ITEM_SEQ" : $('#SL05-DTL_ITEM_SEQ').val()
				, "SALES_ORG_CD" : $('#SL05-SALES_ORG_CD').val()
				, "DISTRB_CH" : $('#SL05-DISTRB_CH').val()
				, "DIV_CD" : $('#SL05-DIV_CD').val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("itemPfGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#itemPfGrid'), 'selectItemPfGrid', data.result);  // 그리드 페이징 설정
			
			syncItemPfGrid();
			
			var ids = $('#itemPfGrid').jqGrid('getDataIDs');
			for(var i = 0; i < ids.length; i++){
				$("#itemPfGrid").jqGrid('setCell', ids[i], 'ITEM_SEQ', $('#SL05-DTL_ITEM_SEQ').val());
			}
			saveAllGrid();
		});
	}
	
	function syncItemPfGrid(){
		var partnerData = setPartnerData();
		var partnerDataRowsCnt = partnerData.length;
		var ids = $('#itemPfGrid').jqGrid("getDataIDs");
			
		for(var i = 0; i < partnerDataRowsCnt; i++){
			var isNew = true;
			
			if('SH' == partnerData[i]['PF_TP']
			|| 'BP' == partnerData[i]['PF_TP']
			|| 'PY' == partnerData[i]['PF_TP']
			|| 'ZI' == partnerData[i]['PF_TP']
			|| 'ZP' == partnerData[i]['PF_TP']
			){
				for(var j = 0; j < ids.length; j++){
					if(partnerData[i]['PF_TP'] == $('#itemPfGrid').jqGrid('getCell', ids[j], 'PF_TP')){
						isNew = false;
						if('N' != $('#itemPfGrid').jqGrid('getCell', ids[j], 'SYNC_FLAG')){
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'PF_PS_NO', partnerData[i]['PF_PS_NO']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'PF_PS_NM', partnerData[i]['PF_PS_NM']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'PF_DESC', partnerData[i]['PF_DESC']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'NAME_1ST', partnerData[i]['NAME_1ST']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'NAME_2ND', partnerData[i]['NAME_2ND']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'STREET_NM', partnerData[i]['STREET_NM']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'STREET_NM2', partnerData[i]['STREET_NM2']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'HAUS_NO', partnerData[i]['HAUS_NO']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'POST_CD', partnerData[i]['POST_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'CITY_CD', partnerData[i]['CITY_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'COUNTRY_CD', partnerData[i]['COUNTRY_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'REGION_CD', partnerData[i]['REGION_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'TIME_ZONE', partnerData[i]['TIME_ZONE']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'TRANSP_ZONE', partnerData[i]['TRANSP_ZONE']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'PO_BOX', partnerData[i]['PO_BOX']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'PO_POST_CD', partnerData[i]['PO_POST_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'COMP_POST_CD', partnerData[i]['COMP_POST_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'LANG_CD', partnerData[i]['LANG_CD']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'TEL_NO', partnerData[i]['TEL_NO']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'TEL_NO_EXT', partnerData[i]['TEL_NO_EXT']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'MOBILE_NO', partnerData[i]['MOBILE_NO']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'FAX_NO', partnerData[i]['FAX_NO']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'FAX_NO_EXT', partnerData[i]['FAX_NO_EXT']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'E_MAIL', partnerData[i]['E_MAIL']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'DATA_LINE', partnerData[i]['DATA_LINE']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'COMMENTS', partnerData[i]['COMMENTS']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'UNLD_PT', partnerData[i]['UNLD_PT']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'VAT_REG_NO', partnerData[i]['VAT_REG_NO']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'ACCOUNT_GR', partnerData[i]['ACCOUNT_GR']);
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'ITEM_SEQ', $('#SL05-DTL_ITEM_SEQ').val());
							$('#itemPfGrid').jqGrid('setCell', ids[j], 'STREET', partnerData[i]['STREET']);
						}
					}
				}
				if(isNew){
					var data = {"ROW_STATUS" : "I", "ITEM_SEQ" : $('#SL05-DTL_ITEM_SEQ').val()
							, 'PF_TP' : partnerData[i]['PF_TP']
							, 'PF_PS_NO' : partnerData[i]['PF_PS_NO']
							, 'PF_PS_NM' : partnerData[i]['PF_PS_NM']
							, 'PF_DESC' : partnerData[i]['PF_DESC']
							, 'NAME_1ST' : partnerData[i]['NAME_1ST']
							, 'NAME_2ND' : partnerData[i]['NAME_2ND']
							, 'STREET_NM' : partnerData[i]['STREET_NM']
							, 'STREET_NM2' : partnerData[i]['STREET_NM2']
							, 'HAUS_NO' : partnerData[i]['HAUS_NO']
							, 'POST_CD' : partnerData[i]['POST_CD']
							, 'CITY_CD' : partnerData[i]['CITY_CD']
							, 'COUNTRY_CD' : partnerData[i]['COUNTRY_CD']
							, 'REGION_CD' : partnerData[i]['REGION_CD']
							, 'TIME_ZONE' : partnerData[i]['TIME_ZONE']
							, 'TRANSP_ZONE' : partnerData[i]['TRANSP_ZONE']
							, 'PO_BOX' : partnerData[i]['PO_BOX']
							, 'PO_POST_CD' : partnerData[i]['PO_POST_CD']
							, 'COMP_POST_CD' : partnerData[i]['COMP_POST_CD']
							, 'LANG_CD' : partnerData[i]['LANG_CD']
							, 'TEL_NO' : partnerData[i]['TEL_NO']
							, 'TEL_NO_EXT' : partnerData[i]['TEL_NO_EXT']
							, 'MOBILE_NO' : partnerData[i]['MOBILE_NO']
							, 'FAX_NO' : partnerData[i]['FAX_NO']
							, 'FAX_NO_EXT' : partnerData[i]['FAX_NO_EXT']
							, 'E_MAIL' : partnerData[i]['E_MAIL']
							, 'DATA_LINE' : partnerData[i]['DATA_LINE']
							, 'COMMENTS' : partnerData[i]['COMMENTS']
							, 'UNLD_PT' : partnerData[i]['UNLD_PT']
							, 'VAT_REG_NO' : partnerData[i]['VAT_REG_NO']
							, 'ACCOUNT_GR' : partnerData[i]['ACCOUNT_GR']
							, 'ITEM_SEQ' : $('#SL05-DTL_ITEM_SEQ').val()
							        , 'STREET' : partnerData[i]['STREET']
					};
					btGrid.gridAddRow("itemPfGrid", "last", data);
				}
			}
		}
	}
	
	function tempDataSave(){
		if('' == $('#SL05-DOC_NO').val() && '' != $('#SL05-SOLD_CUST_CD').val()){
			$('#SL05-DOC_STATUS').val("T");
			
			var headData = formIdAllToMap('frmHeader');
			var partnerGrid = setPartnerData();
			var textGrid = setTextData();
			var itemGrid = setItemData();
			var itemDtl = formIdAllToMap('frmItemDtl');
			var scGrid = setScData();
			var itemPfGrid = setItemPartnerData();
			
			var param = {"param" : {
							  "headData" : headData
							, "partnerGrid" : partnerGrid
							, "textGrid" : textGrid
							, "itemGrid" : itemGrid
							, "itemDtl" : itemDtl
							, "scGrid" : scGrid
							, "itemPfGrid" : itemPfGrid
							, "beforeTab" : beforeTab
							, "preNextBtn" : preNextBtn
							, "erpInfoFlag" : (erpInfoFlag) ? 'Y' : 'N'
							}
						};
			var url = '/quotation/SaveTempQuotation.do';
			
			fn_ajax(url, false, param, function(data, xhr){
				$("#SL05-TEMP_DOC_NO").val(data.tempDocNo);
				$("#SL05-isStatus").val('T');
				preNextBtn = '';
			});
		}
	}
	
	function calcWgtVol(){
		var totWgt = 0;
		var wgtUnit = '';
		var volQty = 0;
		var volUnit = '';
		
		saveAllGrid();
		
		var ids = $('#itemGrid').jqGrid('getDataIDs');
		
		for(var i = 0; i < ids.length; i++){
			var itemSeq = $("#itemGrid").jqGrid('getCell', ids[i], 'ITEM_SEQ');
			var itemCtg = $("#itemGrid").jqGrid('getCell', ids[i], 'ITEM_CTG_GR');
			var curr = $("#itemGrid").jqGrid('getCell', ids[i], 'CURR');
			var ordQty = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'ORD_QTY')));
			
			(fn_empty(ordQty)) ? ordQty = 1 : '';
			
			totWgt = totWgt + (Number($("#itemGrid").jqGrid('getCell', ids[i], 'GROSS_WT')) * ordQty);
			('' == wgtUnit) ? wgtUnit = $("#itemGrid").jqGrid('getCell', ids[i], 'WT_UNIT') : '';
			volQty = volQty + (Number($("#itemGrid").jqGrid('getCell', ids[i], 'VOL_QTY')) * ordQty);
			('' == volUnit) ? volUnit = $("#itemGrid").jqGrid('getCell', ids[i], 'VOL_UNIT') : '';
			
			for(var j = 0; j < ids.length; j++){
				if(itemSeq == $("#itemGrid").jqGrid('getCell', ids[j], 'pItemSeq')){
					//$("#itemGrid").jqGrid('setCell', ids[j], 'ITEM_CTG_GR', itemCtg);
					$("#itemGrid").jqGrid('setCell', ids[j], 'CURR', curr);
					
					$("#itemGrid").jqGrid('setCell', ids[j], 'ERP_NET_VAL', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'ERP_NET_PRICE', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'PER', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'UOM', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'NET_VAL', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'NET_PRICE', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'RSN_RJT_CD', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'ERP_NET_VAL', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'ERP_STATUS', 'N');
					$("#itemGrid").jqGrid('setCell', ids[j], 'ZPNN_PRICE', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'ZPNN_PER', null);
					$("#itemGrid").jqGrid('setCell', ids[j], 'ZPNN_UOM', null);	
					
// 					var bsQty = Number($("#itemGrid").jqGrid('getCell', ids[j], 'BS_QTY'))
// 					if(0 < bsQty){
// 						$("#itemGrid").jqGrid('setCell', ids[j], 'ORD_QTY', createGridNumFm((Number(createNormalFm(ordQty)) / bsQty).toFixed(2)));
// 					}else{
// 						$("#itemGrid").jqGrid('setCell', ids[j], 'ORD_QTY', createGridNumFm((Number(createNormalFm(ordQty))).toFixed(2)));
// 					}
				}
			}
		}
		
		$('#SL05-T_WT').val(createGridNumFm(Number(totWgt).toFixed(3)));
		$('#SL05-WEIGHT').val(wgtUnit);
		$('#SL05-VOL_QTY').val(createGridNumFm(Number(volQty).toFixed(3)));
		$('#SL05-VOLUME').val(volUnit);
	}
	function openApprovalPopup(){
		var url = "/popup/mailPreview.do";
		var pid = "MailPreviewPopup";
		var param = { 
				'MAIL_CD': 'AP'
			  , 'MAIL_LANG': getCookie("Language")
			  , 'BTN_YN': 'Y'
			  , 'DOC_NO': $('#SL05-DOC_NO').val()
			  , 'CUST_CD': $('#SL05-SOLD_CUST_CD').val()
			  , 'CUST_NM': $('#SL05-SOLD_CUST_NM').text()
			  , 'DOC_GR' : 'QT'
			  , 'TYPE' : 'ENTRY'
				};
		param.window = window;

		popupOpen(url, pid, param, function(data) {
			if(!fn_empty(data)){
				if(data.SEND_EMAIL == "Y"){
					setTag('Q');
					$('#ui-id-1').trigger('click'); // Header
					confirmSalesOrder();
				}
			}
		});	
	};
	
	function confirmSalesOrder(){
		var ids = $('#itemGrid').jqGrid('getDataIDs');
		
		for(var i = 0; i < ids.length; i++){
			var netPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'NET_VAL')));
			var erpNetPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'ERP_NET_PRICE')));
			if(netPrice < erpNetPrice){
				$('#SL05-ALLOW_STS').val('Q');
				$('#SL05-APPROVAL_STS').val('Q');
			}
		}
		
		var url = "/quotation/confirmQuotation.do";
		var headData = formIdAllToMap('frmHeader');
		var itemGrid = setItemData();
		
		var param = {"param" : {"headData" : headData, "itemGrid" : itemGrid}};
		
		fn_ajax(url, false, param, function(data, xhr){
			if('OK' == data.MESSAGE){
				alert("<s:message code='success.request'/>");
				
// 				setTimeout(function() {
// 					window.top.$('.ui-tabs-nav .ui-tabs-active span').trigger('click') ;
// 				});
			}
		});
	}
	
	function cUser2(){
		if('' != $('#SL05-DOC_NO').val()){
			
			(!partTabFlag) ? initPartTab() : '' ;
			(!itemTabFlag) ? initItemTab() : '' ;
			(!itemDtlTabFlag) ? initItemDtlTab() : '' ;
			(!slTabFlag) ? initSlTab() : '' ;
			
// 			if(saveValdChk()){
				if(confirm("<s:message code='confirm.request'/>")){
					saveAllGrid();
					openApprovalPopup();
					//confirmSalesOrder();
				}
// 			}
		}
	}
	
	function cDel(){
		if('' != $('#SL05-DOC_NO').val()){
			if(confirm("<s:message code='confirm.delete'/>")){
				var url = "/quotation/deleteQuotation.do";
				var param = {"param" : { 'DOC_NO':$('#SL05-DOC_NO').val() } };
				
				fn_ajax(url, false, param, function(data, xhr){
					if('OK' == data.MESSAGE){
						controlBtn(false);
						$('#ui-id-1').trigger('click'); // Header
						alert("<s:message code='success.delete'/>");
					}
				});
			}
		}
	}
	
	function calcPrice(){
		
		if(erpInfoFlag){
			saveAllGrid();
			
			var selRow = $('#itemGrid').jqGrid('getGridParam', 'selrow');
			var netPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', selRow, 'NET_PRICE')));
			var per = Number(createNormalFm($("#itemGrid").jqGrid('getCell', selRow, 'PER')));
			var output = Number(createNormalFm($("#itemGrid").jqGrid('getCell', selRow, 'OUTPUT')));
			var qty = Number(createNormalFm($("#itemGrid").jqGrid('getCell', selRow, 'ORD_QTY')));
			//var excRate = Number(createNormalFm($('#SL05-CURR_VAL').val())).toFixed(2);
			var excRate = Number(createNormalFm($('#SL05-EXCHG_RATE').val())).toFixed(5);
			var vatRate = Number(createNormalFm($('#SL05-VAT').val())).toFixed(2);
			var surCharge = Number(createNormalFm($('#SL05-SUR_CHARGE_AMT').val())).toFixed(2);
			
			if(qty < 0){
				$("#itemGrid").jqGrid('setCell', selRow, 'ORD_QTY', '0');
				qty = 0;
			}
			if(netPrice < 0){
				$("#itemGrid").jqGrid('setCell', selRow, 'NET_PRICE', '0');
				netPrice = 0;
			}
			if(fn_empty(surCharge)){
				surCharge = 0;
			}
			
			var calcNetValue = Number(((((output / per) * netPrice) * qty) + surCharge) * excRate).toFixed(2);
			var erpNetPrice = Number(createNormalFm($("#itemGrid").jqGrid('getCell', selRow, 'ERP_NET_PRICE')));
			
			if(0 < erpNetPrice){
				$("#itemGrid").jqGrid('setCell', selRow, 'NET_VAL', createGridNumFm(Number(calcNetValue).toFixed(2)));
				
				var sumNetValue = 0;
				
				var ids = $('#itemGrid').jqGrid('getDataIDs');
					
				for(var i = 0; i < ids.length; i++){
					var netValue = Number(createNormalFm($("#itemGrid").jqGrid('getCell', ids[i], 'NET_VAL')));
					sumNetValue = sumNetValue + netValue;
					if(netPrice < erpNetPrice){
						$('#SL05-ALLOW_STS').val('N');
						$('#SL05-APPROVAL_STS').val('N');
						$('#SL05-REJECT_RSN').val('');
					}
				}
				
				var sumVatAmt = sumNetValue * (vatRate / 100);
				
				$('#SL05-T_AMT').val(createGridNumFm(Number(sumNetValue + sumVatAmt).toFixed(2)));
				$('#SL05-NET_AMT').val(createGridNumFm(Number(sumNetValue).toFixed(2)));
				$('#SL05-VAT_AMT').val(createGridNumFm(Number(sumVatAmt).toFixed(2)));
			}
		}
	}
	
	function setErpStatus(){
// 		saveAllGrid();
		$('#itemGrid').jqGrid('setCell', $('#itemGrid').jqGrid('getGridParam', 'selrow'), 'ERP_STATUS', 'N');
		$('#SL05-APPROVAL_STS').val('');
		$('#SL05-ALLOW_STS').val('');
	}
	
	function cUser3(){
		if('' != $('#SL05-DOC_NO').val()){
			if(confirm("<s:message code='confirm.copy'/>")){
				var param = "?isStatus=C" + "&DOC_NO=" + $('#SL05-DOC_NO').val();
				window.top.addTab('QE_' + $('#SL05-DOC_NO').val() + 'C', '/quotation/QuotationEntry.do' + param, 'QE_Copy');
			}
		}
	}
	
	function copyQuotation(){
		if('' != $('#SL05-ORG_DOC_NO').val()){
			
			if(copyFlag){
				
				var url = "/quotation/copyQuotation.do";
				var param = {"param" : {'DOC_NO':$('#SL05-DOC_NO').val()}};
				
				fn_ajax(url, false, param, function(data, xhr){
					
					var disabled = $('form[id=frmHeader]').find(':input:disabled').removeAttr('disabled');
					$('#SL05-REF_DOC_NO').val($('#SL05-ORG_DOC_NO').val());
					$('#S-DOC_NO').val('');
					$('#SL05-DOC_NO').val('');
					$("#SL05-TEMP_DOC_NO").val(data.tempDocNo);
					$("#SL05-isStatus").val('T');
					$('#SL05-T_AMT').val('');
					$('#SL05-VAL_FR_DT').val(toDay);
					$('#SL05-VAL_TO_DT').val(getDayAfterToday(7));
					$('#SL05-REQ_DELI_DT').val(getDayAfterToday(7));
					$('#SL05-PO_DT').val(toDay);
					$('#SL05-PRICE_DT').val(toDay);
					$('#SL05-NET_AMT').val('');
					$('#SL05-VAT_AMT').val('');
					$('#SL05-VAT').val('');
					$('#SL05-SUR_CHARGE_AMT').val('');
// 					$('#SL05-PO_NO').val('');
					$('#SL05-ALLOW_STS').val('');
					
					setTag('');
					
					$('#ui-id-1').trigger('click'); // Header
					controlFlag(false);
					
					var param = {
							HEAD_ID: 'SALES_OFFICE_CD',
							CODE: $('#SL05-SALES_ORG_CD').val() + $('#SL05-DISTRB_CH').val() + $('#SL05-DIV_CD').val()
					};
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var elm = document.getElementById('SL05-SALES_OFFICE_CD');
						var value = elm.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">[' + v.CODE + '] ' + v.CODE_NM + '</option>';
						});
						elm.innerHTML = context;
						elm.value = value;
					});
					
					disabled.attr('disabled','disabled');
				});
			}
		}
	}
	
	function cUser4(){
		var param = "?isStatus=SOC" + "&DOC_NO=" +  $('#SL05-DOC_NO').val();
		
		if('' != $('#SL05-DOC_NO').val()){
			if(confirm("<s:message code='confirm.createSo'/>")){
				window.top.addTab('SO_' +  $('#SL05-DOC_NO').val() + 'SOC', '/salesOrder/SalesOrderEntry.do' + param, 'S.O-Create');
			}
		}
	}
	
	function cUser5() {
		if ($('#SL05-DOC_NO').val() != '' ) {
			
			var url = "/quotation/createPdf.do";
			var pdfFile = '';
			
			var param = { 
					'MAIL_CD': 'QT'
				  , 'MAIL_LANG': getCookie("Language")
				  , 'BTN_YN': 'Y'
				  , 'DOC_NO': $('#SL05-DOC_NO').val()
				  , 'CUST_CD': $('#SL05-SOLD_CUST_CD').val()
					};

			fn_ajax(url, true, param, function(data, xhr){
				pdfFile = data.fileInfo;
				previewMail(pdfFile);
			});
		}
	}
	
	function previewMail(pdfFile){
		url = "/popup/mailPreview.do";
		var pid = "MailPreviewPopup";
		var param = { 
				'MAIL_CD': 'QT'
			  , 'MAIL_LANG': getCookie("Language")
			  , 'BTN_YN': 'Y'
			  , 'DOC_NO': $('#SL05-DOC_NO').val()
			  , 'CUST_CD': $('#SL05-SOLD_CUST_CD').val()
			  , 'CUST_NM': $('#SL05-SOLD_CUST_NM').text()
			  , 'FILE_NM' : pdfFile.fileTitle
			  , 'FILE_DOC': pdfFile.fileDoc
				};
		param.window = window;
		popupOpen(url, pid, param, function(e, selectedData) {
			
		});	
	}
	
	var validList = []
	
	function cUpload() {
		var docNo = document.getElementById('SL05-DOC_NO').value;
		if (!!docNo) {
			return;
		}
		
		var soldto = $("#SL05-SOLD_CUST_CD").val();
		if (soldto == "") {
			alert('we need sold-to customer!');
			return;
		}
		
		var param = {
			url:'/common/uploadQuotationExcel.do',
			SOLD_CUST_CD: soldto
		};
		
		validList = [];
		
		popupOpen('/common/ExcelUploadPopup.do', 'excelupload', param, function(data, result) {
			if(!fn_empty(result)){
				Array.prototype.forEach.call(result.RESULT, function(v) {
					validList.push(v);				
					//if (!!v.SOLD_CUST_CD && v.SOLD_CUST_CD !== 'Customer ID') {
					//	validList.push(v);
					//}
				});
				
				if (validList.length === 0) {
					return;
				}
				
				// document.getElementById('SL05-SOLD_CUST_CD').value = validList[0].SOLD_CUST_CD;
				document.getElementById('SL05-VAL_FR_DT').value = Util.converter.dateFormat1(validList[0].VAL_FR_DT);
				
				var soldto = $("#SL05-SOLD_CUST_CD").val();
				if (soldto == "") {
					alert('we need sold-to customer!');
				} else {
					
					getShipToBySold();					
					if('' != $('#SL05-SOLD_CUST_CD').val()){
						var url = "/salesOrder/getSoldCreditAmt.do";
						var param = { 'SOLD_CUST_CD' : $('#SL05-SOLD_CUST_CD').val() }
						fn_ajax(url, false, param, function(data, xhr){
							if(!fn_empty(data)){								
								if (data.RESULT != null && data.RESULT.length>0) {
									var aLimitAmt = data.RESULT[1];
									$('#SL05-AVAIL_AMT').val(createGridNumFm(aLimitAmt.rows[0].EV_AVAIL));
								}
							}
						});						
						setDeliPlantCombo(false);
					}
					
					var msg = '';
					var validFlag = true;					
					if('' == $('#SL05-SALES_ORG_CD').val()){
						msg = '<s:message code="quotation.salesOrg"/>';
						validFlag = false;
					}else if('' == $('#SL05-DISTRB_CH').val()){
						msg = '<s:message code="quotation.distributionCh"/>';
						validFlag = false;
					}else if('' == $('#SL05-DIV_CD').val()){
						msg = '<s:message code="quotation.division"/>';
						validFlag = false;
					}					
					if(!validFlag){
						alert($('#SL05-SOLD_CUST_CD').val() + " " + "<s:message code='error.custInfoRequired' arguments='" + msg + "' javaScriptEscape='false'/>");
						clearForm($('#frmHeader'));
						initScreen();						
						controlFlag(false);
					}
					
					$('#ui-id-3').click();
					$('#itemGrid').jqGrid('clearGridData');
					
					
					var itemSeq = 100;
					var i = 0;
					validList.forEach(function(v) {
						if(0 < i){
							itemSeq = ((itemSeq / 100) + 1) * 100;
						}
						
						getMatlData(validList[i].MATL_CD, itemSeq, i, 'EXCEL');
						i++;
					});
					
					$('#SL05-SOLD_CUST_CD').prop('disabled', true);
					$('#cmm_pop_SOLD_CUST_CD').hide();
				}	
				// openCustomerPopUp(validList[0].SOLD_CUST_CD, 'EXCEL');
			}
		});
	} 
	
	function setHideRow(tId){
		var ids = $('#' + tId).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if($('#' + tId + '_' + ids[i] + '_CHK').prop('checked')){
				if('I' == $("#" + tId).jqGrid('getCell', ids[i], 'ROW_STATUS')){
					$("#" + tId).jqGrid('delRowData',ids[i])
				}else{
					$('#' + tId).jqGrid('setCell', ids[i], 'ROW_STATUS', 'D')
					var rowIdx = $('#' + tId).getInd(ids[i]);
					$('#' + tId).find('tbody tr:eq(' + rowIdx + ')').hide();
					
					var itemSeq = ($("#itemGrid").getRowData(ids[i]).ITEM_SEQ);
					(tId == 'itemGrid' && $.inArray(itemSeq, delItemArray) == -1) ? delItemArray.push(itemSeq) : "";
				}
			}
		}
		
		if('itemGrid' == tId){
			clearForm($('#frmItemDtl'));
			$('#itemPfGrid').jqGrid('clearGridData');
			$('#scGrid').jqGrid('clearGridData');
		}
	}
	
	function selectCustomerInfo(custCd, type){
		
		var url = "/salesOrder/selectCustomerInfo.do";
		var param = {"param" : {'CUST_CD' : custCd}};
		
		fn_ajax(url, false, param, function(data, xhr){
			
			if(1 == data.result.length){
				if('SOLD' == type){
					$('#SL05-INDUSTRY_CD').val(data.result[0].INDUSTRY_CD);
					$('#SL05-INDUSTRY_CD_NM').text(data.result[0].INDUSTRY_NM);
					$('#SL05-CUST_GR_CD').val(data.result[0].CUST_GR);
					$('#SL05-CUST_GR_NM').text(data.result[0].CUST_GR_NM);
					$('#SL05-CURR_CD').val(data.result[0].CURR_CD);
					$('#SL05-SALES_ORG_CD').val(data.result[0].SALES_ORG_CD);
					$('#SL05-SALES_ORG_CD_NM').text(data.result[0].SALES_ORG_CD_NM);
					$('#SL05-DISTRB_CH').val(data.result[0].DISTRB_CH);
					$('#SL05-DISTRB_CH_NM').text(data.result[0].DISTRB_CH_NM);
					$('#SL05-DIV_CD').val(data.result[0].DIV_CD);
					$('#SL05-DIV_CD_NM').text(data.result[0].DIV_CD_NM);
					(!fn_empty(data.result[0].GRADE)) ? $('#SL05-ORD_RESN_CD').val('055') : '';
// 					$('#SL05-DUN_BLOCK').val(data.result[0].DUN_BLOCK_CD);
					$('#SL05-SALES_OFFICE_CD').val(data.result[0].SALES_OFFICE_CD);
					$('#SL05-SALES_GR').val(data.result[0].SALES_GR);
					$('#SL05-DELI_PLANT_CD').val(data.result[0].DELI_PLANT_CD);
					$('#SL05-SHP_CON_CD').val(data.result[0].SHIP_CONDI_CD);
					('Y' == data.result[0].REL_POD_YN) ? $('#SL05-REL_POD_YN').prop('checked', true) : '';
					('Y' == data.result[0].COMPLT_DELI_REQ_YN) ? $('#SL05-CMP_DELI_YN').prop('checked', true) : '';
					$('#SL05-INCOTERMS_CD').val(data.result[0].INCOTERMS_CD);
// 					var tempVal = $('#SL05-INCOTERMS_CD option:selected').text().split(' - ');
// 					$('#SL05-INCOTERMS_DESC').val(tempVal[1])
					$('#SL05-PAY_TERM').val(data.result[0].TERM_PAY_CD);
// 					$('#SL05-PAY_TERM_NM').val(data.result[0].TERM_PAY_NM);
					$('#SL05-TEMP_DOC_NO').val('');
					$('#SL05-SOLD_CUST_CD').val(data.result[0].CUST_CD);
					$('#SL05-SOLD_CUST_NM').text(data.result[0].CUST_NM);
					$('#SL05-CUST_CL').val(data.result[0].GRADE);
					$('#SL05-CUST_CL_NM').text(data.result[0].GRADE_NM);
				}else{
					$('#SL05-SHIP_CUST_CD').val(data.result[0].CUST_CD);
					$('#SL05-SHIP_CUST_NM').text(data.result[0].CUST_NM);
				}
				if('CPD' == data.result[0].ACCOUNT_GR || 'CPDA' == data.result[0].ACCOUNT_GR || 'Z007' == data.result[0].ACCOUNT_GR){
					openOnetimeCustPop(type, '');
				}
			}else{
				('SOLD' == type) ? openCustomerPopUp($('#SL05-SOLD_CUST_CD').val(), type) : openCustomerPopUp($('#SL05-SHIP_CUST_CD').val(), type);
			}
			controlFlag(false);
		});
	}
	
	function getShipToBySold(){
		
		var url = "/salesOrder/getShipToBySold.do";
		var param = {"param" : {'CUST_CD' : $('#SL05-SOLD_CUST_CD').val() }};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(!fn_empty(data.result)){
				var retVal = data.result[0].PARTNER.split(';');
				$('#SL05-SHIP_CUST_CD').val(retVal[0]);
				$('#SL05-SHIP_CUST_NM').text(retVal[1]);
				retVal = data.result[1].PARTNER.split(';');
				$('#SL05-BILL_CUST_CD').val(retVal[0]);
				$('#SL05-BILL_CUST_NM').text(retVal[1]);
			}else{
				$('#SL05-SHIP_CUST_CD').val('');
				$('#SL05-SHIP_CUST_NM').text('');
				$('#SL05-BILL_CUST_CD').val('');
				$('#SL05-BILL_CUST_NM').text('');
			}
		});
	}
	function cCancel(){
		var closeSts = $('#SL05-STATUS').val();
		if('' != $('#SL05-DOC_NO').val()){
			if('C' != closeSts){
				if(confirm("<s:message code='confirm.close'/>")){
					
					var url = "/popup/closePopUp.do";
					var pid = "closePopUp";  //팝업 페이지의 취상위 div ID
					var param = { };
					
					popupOpen(url, pid, param, function(data){
						if(!fn_empty(data)){
							$('#SL05-RSN_RJT_CD').val(data);
							$('#SL05-STATUS').val('C');
							
							var url = "/quotation/quotationClosed.do";
							var param = {"param" : {"DOC_NO":$('#SL05-DOC_NO').val(), "STATUS":$('#SL05-STATUS').val()
								, "RSN_RJT_CD":$('#SL05-RSN_RJT_CD').val(),}};
							
							fn_ajax(url, false, param, function(data, xhr){
								alert("<s:message code='success.close'/>");
								cSearch();
							});
						}
					});
				}
			}else{
				if(confirm("<s:message code='confirm.unclose'/>")){
					
					$('#SL05-RSN_RJT_CD').val('');
					$('#SL05-STATUS').val('A');
					
					var url = "/quotation/quotationClosed.do";
					var param = {"param" : {"DOC_NO":$('#SL05-DOC_NO').val(), "STATUS":$('#SL05-STATUS').val()
						, "RSN_RJT_CD":$('#SL05-RSN_RJT_CD').val(),}};
					
					fn_ajax(url, false, param, function(data, xhr){
						alert("<s:message code='success.unclose'/>");
						cSearch();
					});
				}
			}
		}
	}
	
	function controlBtn(btnFlag){
		if(btnFlag){
			$('#cBtnDel').show();
			$('#cBtnSave').show();
			$('#cBtnUser1').show();
			$('#cBtnUser2').show();
			$('#partner_btnAdd').show();
			$('#item_btnAdd').show();
			$('#item_btnPfAdd').show();
			$('#item_btnDel').show();
			$('#partner_btnDel').show();
			$('#text_btnDel').show();
			$('#item_btnPfDel').show();
			$('#cBtnUser4').show();
			$("#item_btnPirce").show();
			$('#cBtnUpload').show();
		}else{
			$('#cBtnDel').hide();
			$('#cBtnSave').hide();
			$('#cBtnUser1').hide();
			$('#cBtnUser2').hide();
			$('#partner_btnAdd').hide();
			$('#item_btnAdd').hide();
			$('#item_btnPfAdd').hide();
			$('#item_btnDel').hide();
			$('#partner_btnDel').hide();
			$('#text_btnDel').hide();
			$('#item_btnPfDel').hide();
			$('#cBtnUser4').hide();
			/*LJM 0426 저장버튼이 없을 때는 PRICE버튼도 숨기기*/
			$("#item_btnPirce").hide();
			$('#cBtnUpload').hide();
		}
	}
	
	function getMatlData(matlCd, itemSeq, lineNum, type){
		
		var url = "/product/getMatlData.do";
		
		var disabled = $('form[id=frmHeader]').find(':input:disabled').removeAttr('disabled');
		
		var param = {"param" : {"MATL_CD" : matlCd, "SALES_ORG_CD" : $('#SL05-SALES_ORG_CD').val()
							, "DISTRB_CH" : $('#SL05-DISTRB_CH').val() //"DIV_CD" : $('#SL05-DIV_CD').val()
							, "DOC_TP" : "ZAGM"
					}};
		
		disabled.attr('disabled','disabled');

		fn_ajax(url, false, param, function(data, xhr){
			if(!fn_empty(data.result)){
				var gridData;
				if('EXCEL' == type){
					gridData = {  "MATL_CD" : matlCd, "MATL_DESC" : data.result.MATL_DESC, "DIV_CD" : data.result.DIV_CD, "PLANT_CD" : data.result.PLANT_CD
							, "ORD_UNIT_CD" : data.result.BUM, "BASIC_UNIT" : data.result.BUM, "GROSS_WT" : data.result.GROSS_WT, "NET_WT" : data.result.NET_WT
							, "WT_UNIT" : data.result.WT_UNIT, "VOL_QTY" : data.result.VOL_QTY, "VOL_UNIT" : data.result.VOL_UNIT, "OUTPUT" : data.result.WP_OUT
							, "LONG_TEXT" : data.result.LONG_TEXT, "ROW_STATUS" : "I", "ITEM_SEQ" : itemSeq,  "CURR" : $('#SL05-CURR_CD').val()
							, "DELI_DT_1ST_TP" : $('#SL05-DT_TP option:selected').val(), "DELI_DT_1ST" : $('#SL05-REQ_DELI_DT').val()
							, "ORD_QTY" : validList[lineNum].ORD_QTY.replace(".", ",")
							, "NET_VAL" : validList[lineNum].NET_VAL.replace(".", ",")
							, "NET_PRICE" : validList[lineNum].NET_PRICE.replace(".", ",")
							, "ITEM_CTG_GR" : data.result.MATL_ITEM_CTG};
					btGrid.gridAddRow("itemGrid", "last", gridData);
					var selRow = $('#itemGrid').jqGrid('getGridParam', 'selrow');
					selectBomToGrid(matlCd, data.result.PLANT_CD, $('#SL05-SALES_ORG_CD').val(), $('#SL05-DISTRB_CH').val(), itemSeq, selRow);
				}else{
					gridData = {  "MATL_CD" : matlCd, "MATL_DESC" : data.result.MATL_DESC, "DIV_CD" : data.result.DIV_CD, "PLANT_CD" : data.result.PLANT_CD
							, "ORD_UNIT_CD" : data.result.BUM, "BASIC_UNIT" : data.result.BUM, "GROSS_WT" : data.result.GROSS_WT, "NET_WT" : data.result.NET_WT
							, "WT_UNIT" : data.result.WT_UNIT, "VOL_QTY" : data.result.VOL_QTY, "VOL_UNIT" : data.result.VOL_UNIT, "OUTPUT" : data.result.WP_OUT
							, "LONG_TEXT" : data.result.LONG_TEXT, "ROW_STATUS" : "I", "ITEM_SEQ" : itemSeq,  "CURR" : $('#SL05-CURR_CD').val()
							, "DELI_DT_1ST_TP" : $('#SL05-DT_TP option:selected').val(), "DELI_DT_1ST" : $('#SL05-REQ_DELI_DT').val()
							, "ORD_QTY" : leadItem[lineNum], "ITEM_CTG_GR" : data.result.MATL_ITEM_CTG};
					btGrid.gridAddRow("itemGrid", "last", gridData);
				}
			}else{
				alert(matlCd + " - " + "<s:message code='info.nodata.msg'/>");
			}
		});
	}
	
	function getPartData(pfTp, pfNo){
		if('AP' != pfTp && 'AG' != pfTp){
			var url = "/quotation/getPFData.do";
			var param = { "param" : { "S_USER_ID" : pfNo, "G_COMP_CD" : '1000'}};
			
			var ids = $('#partnerGrid').jqGrid('getDataIDs');
			for(var i = 0; i < ids.length; i++){
				if(pfTp == $("#partnerGrid").jqGrid('getCell', ids[i], 'PF_TP')){
					$("#partnerGrid").jqGrid('delRowData',ids[i])
				}
			}
			
			var data;
			
			fn_ajax(url, false, param, function(data, xhr){
				if(!fn_empty(data.result)){
					
					if('PR' == pfTp){
	 					data = {  "PF_TP" : pfTp, "PF_PS_NO" : pfNo, "PF_PS_NM" : data.result.NAME_FULL, "STREET_NM" : data.result.ADDR, "NAME_1ST" : data.result.NAME_1ST
							, "NAME_2ND" : data.result.NAME_2ND, "HAUS_NO" : data.result.HAUS_NO, "POST_CD" : data.result.ZIP_NO, "CITY_CD" : data.result.CITY_CD
							, "COUNTRY_CD" : data.result.COUNTRY_CD, "REGION_CD" : data.result.REGION_CD, "TIME_ZONE" : data.result.TIME_ZONE, "TRANSP_ZONE" : data.result.TRANSP_ZONE
							, "COMP_POST_CD" : data.result.POST_CD, "ROW_STATUS" : "I", "LANG_CD" :  data.result.LANG_CD,  "TEL_NO" :  data.result.TEL_NO
							, "TEL_NO_EXT" : data.result.TEL_NO_EXT, "MOBILE_NO" : data.result.MOBILE_NO, "FAX_NO" : data.result.FAX_NO, "FAX_NO_EXT" : data.result.FAX_NO_EXT
							, "E_MAIL" : data.result.E_MAIL, "VAT_REG_NO" : data.result.VAT_REG_NO, "PF_CNT" : '1', "ACCOUNT_GR" : data.result.ACCOUNT_GR
						};
					}else{
						data = {  "PF_TP" : pfTp, "PF_PS_NO" : pfNo, "PF_PS_NM" : data.result[0].NAME_FULL, "STREET_NM" : data.result[0].ADDR, "NAME_1ST" : data.result[0].NAME_1ST
								, "NAME_2ND" : data.result[0].NAME_2ND, "HAUS_NO" : data.result[0].HAUS_NO, "POST_CD" : data.result[0].ZIP_NO,  "REGION_CD" : data.result[0].REGION_CD
								, "ROW_STATUS" : "I", "LANG_CD" :  data.result[0].LANG_CD, "E_MAIL" : data.result[0].E_MAIL, "PF_CNT" : '1'
						};
					}
				}else{
					data = {"PF_TP" : pfTp, "ROW_STATUS" : "I", "PF_PS_NO" : pfNo};
				}
				btGrid.gridAddRow("partnerGrid", "last", data);
			});
		}
	}
	
	function setTag(apprTp){
		controlBtn(false);
		$('.alert_approval_ready').hide();
		$('.alert_approval_ing').hide();
		$('.alert_approval_complete').hide();
		$('.alert_approval_reject').hide();
		$('.alert_approval_closed').hide();
		$('.alert_approval_SOcreated').hide();
		$('#cBtnCancel').text("<s:message code='button.close'/>");
		
		switch (apprTp) {
		case 'R'  :
			controlBtn(true);
			$('.alert_approval_reject').show();
			$('#cBtnUser4').hide(); /* 04.25 LJM 거절된 주문일 경우 S.O 생성 안되도록 */
			$('#SL05-ALLOW_STS').val('');
			$('#SL05-APPROVAL_STS').val('');
			break;
		case 'Y'  :
			$('.alert_approval_complete').show();
			$('#cBtnUser4').show(); /* 04.23 LJM 승인된 주문일 경우 S.O 생성 가능하도록 */
			break;
		case 'N'  :
			controlBtn(true);
			$('.alert_approval_ready').show();
			break;
		case ''   :
			controlBtn(true);
			break;
		case 'C'  :
			$('.alert_approval_closed').show(); 
			$('#cBtnCancel').show();
			$('#cBtnCancel').text("Un" + "<s:message code='button.close'/>");
		break;
		case 'Q'  :
			$('.alert_approval_ing').show();
			$('#cBtnCancel').hide();
			alert("<s:message code='quotation.pendingMsg'/>");
		break;
		case 'S'  :
			$('.alert_approval_SOcreated').show();
			
			$('#cBtnUser2').hide();
			$('#cBtnUser4').hide();
			break;
		default   : controlBtn(true); break;
		}
		
		if('C' == docSts){
			$('#cBtnCancel').text("Un" + "<s:message code='button.close'/>");
		}else{
			$('#cBtnCancel').text("<s:message code='button.close'/>");
		}
	}
	
	function selectHisTab(){
		var url = "/quotation/selectHisTab.do";
		var param = { "param" : { "DOC_NO" : $('#SL05-DOC_NO').val() }};
		
		fn_ajax(url, false, param, function(data, xhr){
			if(!fn_empty(data.result)){
				reloadGrid("hisGrid", data.result);   // 그리드 조회 데이터 출력
				btGrid.gridQueryPaging($('#hisGrid'), 'selectHisTab', data.result);  // 그리드 페이징 설정
			}
		});
	}
	
	function setItemDtlDisalbed(){
		var ids = $("#itemGrid").jqGrid("getDataIDs");
		
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#itemGrid").getRowData(ids[i]);
			
			if($('#SL05-DTL_ITEM_SEQ').val() == rowData["ITEM_SEQ"]){
				if(!fn_empty(rowData["DB_RSN_RJT_CD"])){
					$('#SL05-RUT_CD').prop('disabled', true);
					$('#SL05-DELI_PRIOR_CD').prop('disabled', true);
					$('#SL05-USAGE_CD').prop('disabled', true);
// 					$('#SL05-RSN_RJT_CD').prop('disabled', true);
					$('#SL05-SHIP_PO_CD').prop('disabled', true);
					$('#SL05-INFO_TEXT').prop('disabled', true);
					$('#SL05-LONG_TEXT').prop('disabled', true);
					$('#item_btnPfAdd').hide();
					$('#item_btnPfDel').hide();
				}else{
					$('#SL05-RUT_CD').prop('disabled', false);
					$('#SL05-DELI_PRIOR_CD').prop('disabled', false);
					$('#SL05-USAGE_CD').prop('disabled', false);
// 					$('#SL05-RSN_RJT_CD').prop('disabled', false);
					$('#SL05-SHIP_PO_CD').prop('disabled', false);
					$('#SL05-INFO_TEXT').prop('disabled', false);
					$('#SL05-LONG_TEXT').prop('disabled', false);
					$('#item_btnPfAdd').show();
					$('#item_btnPfDel').show();
				}
				break;
			}
		}
	}
	
	function setDeliPlantCombo(flag){
		$('#SL05-DELI_PLANT_CD').attr('disabled', flag);
		
		var deliPlantCd = $('#SL05-DELI_PLANT_CD').val();
		var salesOrgCd = $('#SL05-SALES_ORG_CD').val();
		var distrbCh = $('#SL05-DISTRB_CH').val();
		
		var url = "/salesOrder/setDeliPlantCombo.do";
		var param = {"param" : {"CODE" : salesOrgCd + distrbCh}};
		
		fn_ajax(url, false, param, function(data, xhr){
			var retVal = data.result.split(';');
			
			$("#SL05-DELI_PLANT_CD").empty().data('options');
			$("#SL05-DELI_PLANT_CD").append('<option value=' + "" + '></option>');
			
			if(!fn_empty(data.result)){
				for(j = 0; j < retVal.length; j++){
					var tempVal = retVal[j].split(':');
					$("#SL05-DELI_PLANT_CD").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
				}
				$('#SL05-DELI_PLANT_CD').val(deliPlantCd);
			}else{
				$('#SL05-DELI_PLANT_CD').attr('disabled', true);
			}
		});
	}
	
	function cAdd(){
		addNewTab('/quotation/QuotationEntry.do', 'New Quotation');
	}
	
</script>

<c:import url="../import/frameBottom.jsp" />