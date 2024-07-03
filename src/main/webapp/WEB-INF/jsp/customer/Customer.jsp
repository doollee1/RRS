<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Customer
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="Customer" />
</c:import>

<!-- 검색조건 영역 시작 -->
<div id="ctu_no_resize">
	<form id="frmSearch" action="#" style="display: none;">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
		<input type="hidden"  name="OLD_REQ_CREDIT"  id="OLD_REQ_CREDIT" data-dbcolumn="OLD_REQ_CREDIT"/>
		<select id="MS01_DEPT_CD" data-dbcolumn="DEPT_CD"></select>
		<select id="MS01_TAX_CTG" data-dbcolumn="TAX_CTG"></select>
		<select id="MS01_TAX_CL_CD" data-dbcolumn="TAX_CL_CD"></select>
		<select id="MS01_PF_TP" data-dbcolumn="PF_TP"></select>
		<select data-dbcolumn="SALES_ORG_CD"></select>
		<select data-dbcolumn="DISTRB_CH"></select>
		<select data-dbcolumn="DIV_CD"></select>
	</form>
</div>
<!-- 검색조건 영역 끝 -->

<!-- dummy -->
<div class="top_button_h_margin">
</div>
	
<div id="ctu_wrap">
		<div class="tab_top_search">
		<table style="width: 100%">
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="customer.Customer"/></p></td>
					<td><input type="text" data-searchcolumn="CUST_CD"></td>
					<td class="small_td"><p><s:message code="customer.Name"/></p></td>
					<td><input type="text" data-searchcolumn="CUST_NM" maxlength="20"></td>
					<td class="small_td"><p><s:message code="customer.SrchTerm"/></p></td>
					<td class="2coll_wide_td">
						<input type="text" data-searchcolumn="SEARCH_NM1">
						<input type="text" data-searchcolumn="SEARCH_NM2">
					</td>
				</tr>
				<tr style="display: none;">
					<td class="small_td"><p><s:message code="customer.CityName"/></p></td>
					<td><input type="text" data-searchcolumn="CITY_NM"></td>
					<td class="small_td"><p><s:message code="customer.PostalCode"/></p></td>
					<td><input type="text" data-searchcolumn="POST_CD"></td>
					<td class="small_td"><p><s:message code="customer.Country"/></p></td>
					<td><select data-searchcolumn="COUNTRY_CD"></select></td>
				</tr>
				<tr style="display: none;">
					<td class="small_td"><p><s:message code="customer.Grade"/></td>
					<td><p><select id="MS01_QPARTNERGRADE" data-searchcolumn="GRADE"></select></p></td>
					<td class="small_td"><p><s:message code="customer.QPartner"/></td>
					<td><p><select id="MS01_QPARTNER"><option value="">ALL</option><option value="Y">Y - Yes</option><option value="N">N - No</option></select></p></td>
					<td class="small_td"><p><s:message code="customer.SalesGrp"/></p></td>
					<td><select data-searchcolumn="SALES_GR"></select></td>
				</tr>
				<tr style="display: none;">
					<td class="small_td"><p><s:message code="customer.CustGrp"/></p></td>
					<td><select data-searchcolumn="CUST_GR"></select>
					<td class="small_td"><p><s:message code="customer.AccountGrp"/></p></td>
					<td><select data-searchcolumn="ACCOUNT_GR"></select>
				</tr>
			</tbody>
		</table>
		</div>
		
	<!-- custCd custName -->
	<table>
		<tr>
		<td style="padding:5px 5px 0px 0px; margin:5px 5px 5px 10px;"><div style="width:300px; border:1px solid #b9b9b9;background-color:#bdd6ee; color:#333; font-weight:700; padding:5px; padding-left:28px; float: left; border-radius:3px;"><div style="float:left;margin-top:5px;"><s:message code="customer.Customer"/> :</div> <div><input type="text" data-dbcolumn="DISPLAY_CUST_CD" disabled="disabled" style="padding-top:2px; margin-left:10px; width:60%; margin-right:5px; background-color:#c1d6ec; border:1px solid #c1d6ec;"/></div></div></td>
		<td style="padding:5px 5px 0px 0px; margin:5px 5px 5px 10px;"><div style="width:450px; border:1px solid #b9b9b9;background-color:#bdd6ee; color:#333; font-weight:700; padding:5px; padding-left:28px; border-radius:3px;"><div style="float:left;margin-top:5px;"><s:message code="customer.Name"/> :</div> <div><input type="text" data-dbcolumn="DISPLAY_CUST_NM" disabled="disabled"  style="padding-top:2px; margin-left:10px; width:74%; background-color:#c1d6ec; border:1px solid #c1d6ec;"/></div></div></td>
		</tr>
	</table>			
	      <!--  tab start -->
	      <div id="tabs">
	      	<ul>
	      		<li id= "MS01_general_tab" class="matrix_tab"><a href="#general_tab"><s:message code="customer.GeneralData"/></a></li>
				<li id= "MS01_company_tab" class="matrix_tab" style="display: none"><a href="#company_tab"><s:message code="customer.CompanyData"/></a></li>
				<li id= "MS01_sales_tab" class="matrix_tab"><a href="#sales_tab"><s:message code="customer.SalesAreaData"/></a></li>
				<li id= "MS01_partner_tab" class="matrix_tab"><a href="#partner_tab"><s:message code="customer.PtnData"/></a></li>
				<li id= "MS01_message_tab" class="matrix_tab"><a href="#message_tab">internal message</a></li>
				<li id= "MS01_contact_report_tab" class="matrix_tab"><a href="#lead_ContactReport"><s:message code="lead.ContactReport"/></a></li>
			</ul>
			
			<!----- tab 1 ----->
			<div id="general_tab">
				<div style="height:5px;"></div>
				<table class="table_line" style="width: 100%">
			  		<tbody>
			    		<tr>
			    			<td><p><s:message code="customer.Customer"/></p></td>
			      			<td><input type="text" data-dbcolumn="CUST_CD" disabled></td>
			      			<td><p><span>*</span>&nbsp;<s:message code="customer.Name"/></p></td>
	      					<td colspan="2"><input style="width:56%; float:left;" class="long_text_input" type="text" id="MS01_CUST_NM" data-dbcolumn="CUST_NM" data-validmandatory="CUST_NM" maxlength="40">
							<input class="long_text_input" style="width:40%;" type="text" id="MS01_CUST_ABNM" data-dbcolumn="CUST_ABNM" maxlength="40"></td>
			    		</tr>
		        		<tr>
        					<td><p><span>*</span>&nbsp;<s:message code="customer.SrchTerm"/></p></td>
      						<td class="Sbox_in_sel2"><input style="width:45% !important;" id="MS01_SEARCH_NM1" type="text" data-dbcolumn="SEARCH_NM1" data-validmandatory="SEARCH_NM1" maxlength="20">
      							<input style="width:45% !important;" id="MS01_SEARCH_NM2" type="text" data-dbcolumn="SEARCH_NM2" maxlength="20"></td>
      						<td><p><span>*</span>&nbsp;<s:message code="customer.AccountGrp"/></p></td>
      						<td><select style="width:92%;" name="MS01_ACCOUNT_GR" id="MS01_ACCOUNT_GR" data-dbcolumn="ACCOUNT_GR" data-validmandatory="ACCOUNT_GR"></select></td>
      						<td><p><s:message code="customer.Grade"/></p></td>
							<td><select name="MS01_GRADE" id="MS01_GRADE" data-dbcolumn="GRADE" disabled>
							</select></td>
      						<td style="display: none;"><input id="MS01_COMP_CD" data-dbcolumn="COMP_CD" value="1000" style="display: none;"/></td>
      					</tr>
		      		</tbody>
		  		</table>				
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="customer.Address"/></h4>
					</div>
				</div>
				<table class="table_line" style="width: 100%">
					<tbody>
						<tr>
							<td><p><s:message code="customer.Street"/>2</p></td>
							<td colspan="3"><input class="cus_street" type="text" id="MS01_STREET_NM2" data-dbcolumn="STREET_NM2" maxlength="60"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><p><span>*</span>&nbsp;<s:message code="customer.Street"/>1</p></td>
							<td colspan="3"><input class="cus_street" type="text" id="MS01_STREET_NM" data-dbcolumn="STREET_NM" data-validmandatory="STREET_NM" maxlength="60"></td>
							<td><p><s:message code="customer.HouseNumber"/></p></td>
							<td><input type="text" id="MS01_HAUS_NO" data-dbcolumn="HAUS_NO" maxlength="10"></td>
						</tr>
						<tr>
							<td><p><span>*</span>&nbsp;<s:message code="customer.PostalCode"/></p></td>
							<td><input type="text" id="MS01_POST_CD" data-dbcolumn="POST_CD" data-validmandatory="POST_CD" maxlength="10"></td>
							<td><p><span>*</span>&nbsp;<s:message code="customer.CityName"/></p></td>
							<td><input type="text" id="MS01_CITY_NM" data-dbcolumn="CITY_NM" data-validmandatory="CITY_NM" maxlength="40"></td>
							<td><p><span>*</span>&nbsp;<s:message code="customer.Country"/></p></td>
							<td><select id="MS01_COUNTRY_CD" data-dbcolumn="COUNTRY_CD" data-validmandatory="COUNTRY_CD"></select>
								<p class="data_side_text" id="MS01_COUNTRY_CD_NM"></p></td>
						</tr>
						<tr>
							<!--
							<td><p><span>*</span>&nbsp;<s:message code="customer.TimeZone"/></p></td>
							<td><select name="MS01_TIME_ZONE" id="MS01_TIME_ZONE" data-dbcolumn="TIME_ZONE" data-validmandatory="TIME_ZONE"></select></td>
							-->
							<td><p><span>*</span>&nbsp;<s:message code="customer.TransportationZone"/></p></td>
							<td><select id="MS01_TRANSP_ZONE" data-dbcolumn="TRANSP_ZONE" data-validmandatory="TRANSP_ZONE"></select>
								<p class="data_side_text" id="MS01_TRANSP_ZONE_NM"></p>
							</td>
							<td><p><s:message code="customer.Region"/></p></td>
							<td><select id="MS01_REGION_CD" data-dbcolumn="REGION_CD"></select>
								<p class="data_side_text" id="MS01_REGION_CD_NM"></p>
							</td>
							<td></td>
							<td></td> 
						</tr>
					</tbody>
				</table>
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="customer.Communication"/></h4>
					</div>
				</div>		
				<table class="table_line" style="width: 100%">
					<tbody>
						<tr>
							<td><p><span>*</span>&nbsp;<s:message code="customer.Language"/></p></td>
							<td><select id="MS01_LANG_CD" data-dbcolumn="LANG_CD" data-validmandatory="LANG_CD"></select>
							</td>
							<td><p><s:message code="customer.Homepage"/></p></td>
							<td><input type="text" id="MS01_HOMEPAGE" data-dbcolumn="HOMEPAGE" maxlength="30"></td>
							<td></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><p><s:message code="customer.Telephone"/></p></td>
							<td><input type="text" id="MS01_TEL_NO" data-dbcolumn="TEL_NO" maxlength="30"></td>
							<td><p><s:message code="customer.Extension"/></p></td>
							<td><input type="text" id="MS01_TEL_NO_EXT" data-dbcolumn="TEL_NO_EXT" maxlength="10"></td>
							<td><p><s:message code="customer.MobilePhone"/></p></td>
							<td><input type="text" id="MS01_MOBILE_NO" data-dbcolumn="MOBILE_NO" maxlength="30"></td>
						</tr>
						<tr>
							<td><p><s:message code="customer.Fax"/></p></td>
							<td><input type="text" id="MS01_FAX_NO" data-dbcolumn="FAX_NO" maxlength="30"></td>
							<td><p><s:message code="customer.Extension"/></p></td>
							<td><input type="text" id="MS01_FAX_NO_EXT" data-dbcolumn="FAX_NO_EXT" maxlength="10"></td>
							<td><p><s:message code="customer.E_MAIL"/></p></td>
							<td><input type="text" id="MS01_E_MAIL" data-dbcolumn="E_MAIL" data-validemail="E_MAIL" maxlength="100"></td>
						</tr>
					</tbody>
				</table>
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="customer.ControlData"/></h4>
					</div>
				</div>		
				<table class="table_line" style="width: 100%">
					<tbody>
						<tr>
							<td><p><s:message code="customer.ReqAmount"/></p></td>
							<td><input type="text" id="MS01_REQ_CREDIT" data-dbcolumn="REQ_CREDIT" data-validcurrency="REQ_CREDIT" maxlength="19"></td>
							<td><p><s:message code="customer.VATRegNo"/></p></td>
							<td><input style="width:147px;" type="text" id="MS01_VAT_REG_NO" data-dbcolumn="VAT_REG_NO" maxlength="20">
								<input class="btn btn-default" id="MS01_CreditCustomer_checkVat" type="button" value="Verify" style="height: 22px;">
								<p style="color:#ff0000;" class="data_side_text" id="MS01_VAT_NO_CHK_YN_NM"></p>
								<input type="text" id="MS01_VAT_NO_CHK_YN" data-dbcolumn="VAT_NO_CHK_YN" style="display: none;"/>
							</td>
							<td><p><s:message code="customer.ExtVat"/></p></td>
							<td><input class="btn btn-default" id="MS01_CreditCustomer_extVat" type="button" value="Add. VAT"></td>
						</tr>
						<tr>
							<!--
							<td><p><s:message code="customer.Location1"/></p></td>
							<td><input type="text" id="MS01_LOCAT_NO1" data-dbcolumn="LOCAT_NO1" data-validnumeric="LOCAT_NO1" maxlength="7"></td>
							<td><p><s:message code="customer.Location2"/></p></td>
							<td><input type="text" id="MS01_LOCAT_NO2" data-dbcolumn="LOCAT_NO2" data-validnumeric="LOCAT_NO2" maxlength="5"></td>
							-->
							<td><p><s:message code="customer.Industry"/></p></td>
							<td><select id="MS01_INDUSTRY_CD" data-dbcolumn="INDUSTRY_CD"></select>
								<p class="data_side_text" id="MS01_INDUSTRY_CD_NM"></p>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!-- 그리드 시작 -->
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4><s:message code="customer.ContactPerson"/></h4></div>
						<div class="ct_grid_top_right">  
							<button type='button' class='btn btn-default' id='cpGrdAdd'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
							<button type='button' class='btn btn-default' id='cpGrdDel'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
						</div>
					</div>
					<table id="contactPersonGrd"></table>
				    <div id="contactPersonGrd_pager"></div>
				</div>
				<!-- 그리드 끝 -->
			<!------ contact person  값 들어가는 자리 //---->

		    <p>&nbsp;</p>
		    </div>		
			<!----- tab 2 ----->
			<div id="company_tab">
				<div style="height:5px;"></div>
				<table class="table_line" style="width: 100%">
					<tbody>
						<tr>
							<td><p><s:message code="customer.CompanyCode"/></p></td>
							<td><select id="MS01_CUST_COMP_CD" data-dbcolumn="CUST_COMP_CD"></select></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="customer.AccountInfo"/></h4>
					</div>
				</div>
				<table class="table_line" style="width: 100%">
              			<tr>
                			<td><p><span>*</span>&nbsp;<s:message code="customer.ReconAcnt"/></p></td>
                			<td><select id="MS01_RECON_ACC_CD" data-dbcolumn="RECON_ACC_CD" data-companycode="" data-validmandatory2="RECON_ACC_CD"></select>
							</td>
			                <td><p><s:message code="customer.Softkey"/></p></td>
			                <td><select id="MS01_SORT_KEY" data-dbcolumn="SORT_KEY" data-companycode=""></select>
								<p class="data_side_text" id="MS01_SORT_KEY_NM"></p>
							</td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
			            </tr>
		              	<tr>
			                <td><p><s:message code="customer.CashMgmtGrp"/></p></td>
			                <td><select id="MS01_CASH_MGMT_GR" data-dbcolumn="CASH_MGMT_GR" data-companycode=""></select>
								<p class="data_side_text" id="MS01_CASH_MGMT_GR_NM"></p>
			                </td>
			                <td><p><s:message code="customer.InterestIndic"/></p></td>
			                <td><select id="MS01_INTEREST_IND_CD" data-dbcolumn="INTEREST_IND_CD" data-companycode=""></select>
								<p class="data_side_text" id="MS01_INTEREST_IND_CD_NM"></p>
			                </td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
              			</tr>
            		</tbody>
          		</table>          		
          		<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
         				<h4><s:message code="customer.PaymntTransactions"/></h4>
         			</div>
         		</div>		
	          	<table class="table_line" style="width: 100%">
		            <tbody>
		            	<tr>
		                	<td><p><span>*</span>&nbsp;<s:message code="customer.TermsOfPayment"/></p></td>
							<td><select id="MS01_TERM_PAY_CD" data-dbcolumn="TERM_PAY_CD" data-companycode="" data-validmandatory2="TERM_PAY_CD"></select>
							</td>
			                <td><p><s:message code="customer.PaymentHisRec"/></p></td>
			                <td><label class="checkbox"><input type="checkbox" id="MS01_PAY_HIST_YN" data-companycode="" data-dbcolumn="PAY_HIST_YN" data-validboolean="PAY_HIST_YN" checked="checked"><i></i>&nbsp;</label></td>
			                <td><p>&nbsp;</p></td>
			                <td>&nbsp;</td>
			            </tr>
			            <tr>
			                <td><p><span>*</span>&nbsp;<s:message code="customer.DunningProcedure" /></p></td>
			                <td><select id="MS01_DUN_PROC_CD" data-dbcolumn="DUN_PROC_CD" data-companycode="" data-validmandatory2="DUN_PROC_CD"></select>
							</td>
			                <td><p><span>*</span>&nbsp;<s:message code="customer.DunningLvl"/></p></td>
			                <td><input type="text" id="MS01_DUN_LEVEL_CD" data-dbcolumn="DUN_LEVEL_CD" data-companycode="" data-validmandatory2="DUN_LEVEL_CD" data-validnumeric="DUN_LEVEL_CD" maxlength="1"/>
			                </td>
			                <td><p>&nbsp;</p></td>
			                <td>&nbsp;</td>
		              	</tr>
		            </tbody>
	          	</table>	          	
	          	<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
          				<h4><s:message code="customer.Insurance"/></h4>
          			</div>
          		</div>		
          		<table class="table_line" style="width: 100%">
		            <tbody>
		                <tr>
			                <td><p><s:message code="customer.PolicyNum"/></p></td>
			                <td><input type="text" id="MS01_POLICY_NO" data-dbcolumn="POLICY_NO" disabled data-companycode=""></td>
			                <td><p><s:message code="customer.AmountInsured"/></p></td>
			                <td><input type="text" id="MS01_INSURED_AMT" data-dbcolumn="INSURED_AMT" data-companycode="" data-validcurrency="INSURED_AMT" maxlength="10">
			                	<p class="data_side_text" id="MS01_INSURED_AMT_NM"></p>
			                </td>
			                <td><p>&nbsp;</p></td>
			                <td>&nbsp;</td>
		                </tr>
		                <tr>
			                <td><p><s:message code="customer.ValidTo"/></p></td>
			                <td><input type="text" id="MS01_VAL_TO_DATE" data-type="date" data-dbcolumn="VAL_TO_DATE" data-companycode="" disabled/>
			                </td>
			                <td><p><s:message code="customer.Deductible"/></p></td>
			                <td><input type="text" id="MS01_DEDUCT_RATE" data-dbcolumn="DEDUCT_RATE" data-companycode="" data-validnumeric="DEDUCT_RATE" maxlength="3">
			                	<p class="data_side_text" id="MS01_DEDUCT_RATE_NM"></p>
			                </td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
		                </tr>
		                <tr>
			                <td><p><s:message code="customer.AppFInsu"/></p></td>
			                <td><input type="text" id="MS01_APPLIED_INSURA" data-dbcolumn="APPLIED_INSURA" data-companycode="" data-validcurrency="APPLIED_INSURA" maxlength="10"></td>
			                <td><p><s:message code="customer.EasyNum"/></p></td>
			                <td><input type="text" id="MS01_EASY_NO" data-dbcolumn="EASY_NO" data-companycode="" maxlength="20"></td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
		                </tr>
		                <tr>
			                <td><p><s:message code="customer.ApplyDate"/></p></td>
			                <td><input type="text"  id="MS01_APPLY_DATE" data-type="date" data-companycode="" data-dbcolumn="APPLY_DATE" disabled/>
			                </td>
			                <td><p><s:message code="customer.ExpiryDate"/></p></td>
			                <td><input type="text"  id="MS01_EXPIRE_DATE" data-type="date" data-companycode="" data-dbcolumn="EXPIRE_DATE" disabled/>
			                </td>
			                <td>&nbsp;</td>
			                <td>&nbsp;</td>
		                </tr>

		                <tr>
			                <td><p><s:message code="customer.AddTxt1"/></p></td>
			                <td colspan="5"><input type="text" id="MS01_ADD_TXT1" data-dbcolumn="ADD_TXT1" data-companycode="" maxlength="400" style="width:735px;"></td>
			            </tr>
			            <tr>
			                <td><p><s:message code="customer.AddTxt2"/></p></td>
			                <td colspan="5"><input type="text" id="MS01_ADD_TXT2" data-dbcolumn="ADD_TXT2" data-companycode="" maxlength="400" style="width:735px;"></td>
			            </tr>
		            </tbody>
		        </table>
			</div>
			<!----- tab 3 ----->
			<div id="sales_tab">
				<div style="height:7px;"></div>
				 <!-- 그리드 시작 -->
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<table id="salesGrd"></table>								
				</div>
				<!-- 그리드 끝 -->
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">	
						<h4><s:message code="customer.Sales"/></h4>
					</div>
					<div class="ct_grid_top_right">
						<button type='button' class='btn btn-default' id='salesGrdCancel' disabled="disabled"><i class='fa fa-refresh'></i><s:message code='button.cancel'/></button>
						<button type='button' class='btn btn-default' id='salesGrdSave' disabled="disabled"><i class='fa fa-save'></i><s:message code='button.apply'/></button>
						<button type='button' class='btn btn-default' id='salesGrdAdd' disabled="disabled"><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
						<button type='button' class='btn btn-default' id='salesGrdDel' disabled="disabled" style="display: none;"><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
					</div>
				</div>
				<table id="sales_org_division" class="table_line3" style="width: 100%">
            		<tbody>
            			<tr>
	            			<td><p><span>*</span>&nbsp;<s:message code="customer.SalesOrg"/></p></td>
	                		<td><select id="MS01_SALES_ORG_CD" data-dbcolumn="SALES_ORG_CD" data-sales="SALES_ORG_CD" data-validmandatory3="SALES_ORG_CD"></select>
							</td>
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.DistChannel"/></p></td>
	                		<td><select id="MS01_DISTRB_CH" data-dbcolumn="DISTRB_CH" data-sales="DISTRB_CH" data-validmandatory3="DISTRB_CH"></select>
	                		</td>
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.Division"/></p></td>
	                		<td><select id="MS01_DIV_CD" data-dbcolumn="DIV_CD" data-sales="DIV_CD" data-validmandatory3="DIV_CD"></select>
	                		</td>
	                		<td></td>
	                		<td></td>
              			</tr>
            			<tr>
	            			<td><p><span>*</span>&nbsp;<s:message code="customer.SalesOffice"/></p></td>
	                		<td><select id="MS01_SALES_OFFICE_CD" data-dbcolumn="SALES_OFFICE_CD" data-sales="SALES_OFFICE_CD" data-validmandatory3="SALES_OFFICE_CD"></select>
								<p class="data_side_text" id="MS01_SALES_OFFICE_CD_NM"></p>
							</td>
							<td><p><span>*</span>&nbsp;<s:message code="customer.SalesGrp"/></p></td>
							<td>
	                			<input id="MS01_SALES_GR" disabled="disabled" class="side_front_Sinput" data-dbcolumn=SALES_GR data-sales="SALES_GR" data-validcurrency="SALES_GR">
	                			<button id="MS01_SALES_GR_BUTTON" class="grid_popupbtn"></button>
	                			<p id="MS01_SALES_GR_TEXT" class="data_side_text"></p>
							</td>
	                		<!--
	                		<td><select id="MS01_SALES_GR" data-dbcolumn="SALES_GR" data-sales="SALES_GR" data-validmandatory3="SALES_GR"></select>
	                			<p class="data_side_text" id="MS01_SALES_GR_NM"></p>
	                		</td>
	                		-->
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.CustGrp"/></p></td>
	                		<td><select id="MS01_CUST_GR" data-dbcolumn="CUST_GR" data-sales="CUST_GR" data-validmandatory3="CUST_GR"></select>
								<p class="data_side_text" id="MS01_CUST_GR_NM"></p>
							</td>
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.Currency"/></p></td>
	                		<td><select id="MS01_CURR_CD" data-dbcolumn="CURR_CD" data-sales="CURR_CD" data-validmandatory3="CURR_CD"></select>
	                			<p class="data_side_text" id="MS01_CURR_CD_NM"></p>
	                		</td>
                		</tr>
	                </tbody>
	            </table>
          		<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
          				<h4><s:message code="customer.pricestatic"/></h4>
          			</div>
          		</div>		
          		<table class="table_line3" style="width: 100%">
		            <tbody>
	            		<tr>
	            			<td><p><s:message code="customer.PricingGrp"/></p></td>
	                		<td><select id="MS01_PRICE_GR" data-dbcolumn="PRICE_GR" data-sales="PRICE_GR"></select>
								<p class="data_side_text" id="MS01_PRICE_GR_NM"></p>
							</td>
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.CustPricProc"/></p></td>
	                		<td><select id="MS01_CUST_PRICE_PROC_CD" data-dbcolumn="CUST_PRICE_PROC_CD" data-sales="CUST_PRICE_PROC_CD" data-validmandatory3="CUST_PRICE_PROC_CD"></select>
								<p class="data_side_text" id="MS01_CUST_PRICE_PROC_CD_NM"></p>
							</td>
	                		<td><p><s:message code="customer.PriceList"/></p></td>
	                		<td colspan="2"><select id="MS01_LIST_PRICE" data-dbcolumn="LIST_PRICE" data-sales="LIST_PRICE" data-validcurrency="LIST_PRICE"></select></td>
	                		<td></td>
                		</tr>
                		<tr>
							<td><p><span>*</span>&nbsp;<s:message code="customer.AcctAssmtGrp"/></p></td>
	                		<td><select id="MS01_ACCT_ASSMT_GR" data-dbcolumn="ACCT_ASSMT_GR" data-sales="ACCT_ASSMT_GR" data-validmandatory3="ACCT_ASSMT_GR"></select>
								<p class="data_side_text" id="MS01_ACCT_ASSMT_GR_NM"></p>
							</td>
							<td><p><span>*</span>&nbsp;<s:message code="customer.TermsOfPayment"/></p></td>
							<td colspan="3"><select data-sales="TERM_PAY_CD" data-validmandatory3="TERM_PAY_CD"></select></td>
							<td></td>
							<td></td>
						</tr>	
						<tr>
							<td><p><span>*</span>&nbsp;<s:message code="customer.Incoterms"/></p></td>
	                		<td colspan="4" class="Sbox_in_sel">
	                			<select id="MS01_INCOTERMS_CD" data-dbcolumn="INCOTERMS_CD" data-sales="INCOTERMS_CD" data-validmandatory3="INCOTERMS_CD"  style="float:left;"></select>
	                			<input type="text" id="MS01_INCOTERMS_NM" data-dbcolumn="INCOTERMS_NM" data-sales="INCOTERMS_NM" data-validmandatory3="INCOTERMS_NM"maxlength="28" style="width:65% !important;">
							</td>
							<td></td>
							<td></td>
							<td></td>												
						</tr>
		            </tbody>
		        </table>
		        <div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
         				<h4><s:message code="customer.Shipping"/> & <s:message code="customer.PartialDel"/></h4>
         			</div>
         		</div>		
         		<table class="table_line3" style="width: 100%">
         			<tbody>
	            		<tr>
	            			<td><p><s:message code="customer.DeliveryPriority"/></p></td>
	                		<td><select id="MS01_DELI_PRIOR_CD" data-dbcolumn="DELI_PRIOR_CD" data-sales="DELI_PRIOR_CD"></select>
								<p class="data_side_text" id="MS01_DELI_PRIOR_CD_NM"></p>
							</td>
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.ShippingCondition"/></p></td>
	                		<td><select id="MS01_SHIP_CONDI_CD" data-dbcolumn="SHIP_CONDI_CD" data-sales="SHIP_CONDI_CD" data-validmandatory3="SHIP_CONDI_CD"></select>
								<p class="data_side_text" id="MS01_SHIP_CONDI_CD_NM"></p>
							</td>
	                		<td><p><span>*</span>&nbsp;<s:message code="customer.DeliveryPlant"/></p>
	                		</td>
	                		<td><select id="MS01_DELI_PLANT_CD" data-dbcolumn="DELI_PLANT_CD" data-sales="DELI_PLANT_CD" data-validmandatory3="DELI_PLANT_CD"></select>
	                			<p class="data_side_text" id="MS01_DELI_PLANT_CD_NM"></p></td>
	                		<td><p><s:message code="customer.RelevantForPOD"/></p></td>
	                		<td><label class="checkbox">
	                			<input type="checkbox" id="MS01_REL_POD_YN" data-dbcolumn="REL_POD_YN" data-sales="REL_POD_YN" data-validboolean="REL_POD_YN">
	                			<i></i>&nbsp;</label>
	                		</td>
                		</tr>
						<tr>
							<td><p><s:message code="customer.PartialDelPerItem"/></p>
								</td>
							<td colspan="3"><select id="MS01_PART_DELI_ITEM_CD" data-dbcolumn="PART_DELI_ITEM_CD" data-sales="PART_DELI_ITEM_CD"></select>
								<p class="data_side_text" id="MS01_PART_DELI_ITEM_CD_NM"></p></td>
							<td><p><s:message code="customer.MaxPartialDel"/></p></td>
	                		<td><input type="text" id="MS01_MAX_PART_DELIS" data-dbcolumn="MAX_PART_DELIS" data-sales="MAX_PART_DELIS" data-validnumeric="MAX_PART_DELIS" maxlength="1">
							</td>
							<td><p style="float: left; margin-right:3px;"><s:message code="customer.CompleteDelReq"/></p></td>
							<td><label class="checkbox"><input type="checkbox" name="MS01_COMPLT_DELI_REQ_YN" id="MS01_COMPLT_DELI_REQ_YN" data-dbcolumn="COMPLT_DELI_REQ_YN" data-sales="COMPLT_DELI_REQ_YN" data-validboolean="COMPLT_DELI_REQ_YN"><i></i>&nbsp;</label></td>
						</tr>
					</tbody>
				</table>				
				<!-- 그리드 시작 -->
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4><s:message code="customer.Taxes"/></h4></div>
						<div class="ct_grid_top_right">  
						</div>
					</div>
					<table id="taxesGrd"></table>
				</div>
				<!-- 그리드 끝 -->
			<p>&nbsp;</p>
			</div>	
			<!----- tab 4 ----->
			<div id="partner_tab">
		        <!-- 그리드 시작 -->
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
				
				<table class="customer_sales_pf" style="width: 100%">
					<tr style="background-color:#eee;">
						<td><s:message code="customer.SalesOrg"/></td>
						<td><s:message code="customer.DistChannel"/></td>
						<td><s:message code="customer.Division"/></td>
					</tr>
					<tr style="background-color:#ffff88; height: 22px;">
						<td><span id="pfGrd_SALES_ORG_CD">&nbsp;</span></td>
						<td><span id="pfGrd_DISTRB_CH">&nbsp;</span></td>
						<td><span id="pfGrd_DIV_CD">&nbsp;</span></td>
					</tr>
				</table>
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left"><h4><s:message code="customer.PartnerFunc"/></h4></div>
						<div class="ct_grid_top_right">  
							<button type='button' class='btn btn-default' id='pfGrdAdd' disabled="disabled"><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
							<button type='button' class='btn btn-default' id='pfGrdDel' disabled="disabled"><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
						</div>
					</div>
					<table id="pfGrd"></table>
				    <div id="pfGrd_pager"></div>
				</div>
				<!-- 그리드 끝 -->

		    <p>&nbsp;</p>
			
			</div>
			
			<!----- tab 5 ----->
			<div id="message_tab">
		        <!-- 그리드 시작 -->
		      	<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
         				<h4>internal message</h4>
         			</div>
         		</div>	
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">				
					<textarea style="width: 98.5%; height: 420px; overflow: auto; padding-right: 10px; padding-left: 10px; margin-top: -1px; margin-right: 10px; min-height: 100px;" id="MS01_CUST_TEXT" data-dbcolumn="CUST_TEXT" ></textarea>
				</div>
				<!-- 그리드 끝 -->
		    	<p>&nbsp;</p>			
			</div>
			
			
			
			<!----- tab 4 ----->
			<div id="lead_ContactReport">				
				<div id="ctm_wrap">
					<!-- 그리드 시작 -->
					<div id="ctm_mg_wrap">
						<div class="ct_grid_top_wrap">
							<div class="ct_grid_top_left"><h4><s:message code="lead.ContactReport"/></h4></div>
							<div class="ct_grid_top_right"></div>
						</div>
						<table id="contactReportGrid"></table>
						<div id="contactReportGrid_pager"></div>
					</div>
					<!-- 그리드 끝 -->
				</div>	
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="lead.InteractionLogDetails"/></h4>
					</div>
					<div class="ct_grid_top_right">
						<button class='btn btn-default' id='btnCancel_InteractLog' type='button'><i class='fa fa-refresh'></i><s:message code='button.cancel'/></button>
						<button class='btn btn-default' id='btnAdd_InteractLog' type='button'><i class='fa fa fa-plus-square-o'></i><s:message code='button.add'/></button>
						<button class='btn btn-default' id='btnEdit_InteractLog' type='button'><i class="fa fa-edit"></i><s:message code='button.modify'/></button>
						<button class='btn btn-default' id='btnSave_InteractLog' type='button'><i class="fa fa-save"></i>Apply</button>
					</div>
				</div>	
				<p>&nbsp;</p>
				
				<form id="frmContRpt" action="#">
					<div style="border: 1px solid #ccc; margin-top:-16px;">
						<div class="ctu_gl_wrap ctu_resize" style="width:calc(50% - 10px); height:calc(50%); padding-top:-95px;">
							<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left_subtitle">
									<h4><s:message code="lead.GeneralData"/></h4>	
								</div>
							</div>	
							<table width="100%" class="table_line">
								<tr>
									<td class="small_td"><p><s:message code="lead.Description"/></p></td>
									<td class=""><input type="text" name="SL07-ACT_DESC" id="SL07-ACT_DESC" ></td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.Location"/></p></td>
									<td class=""><select name="SL07-LOCATION" id="SL07-LOCATION" ></select></td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.Date"/></p></td>
									<td class=""><input type="text" name="SL07-ACT_DT" id="SL07-ACT_DT" data-type="date" readonly/></td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.Category"/></p></td>
									<td class=""><select name="SL07-ACT_CTG" id="SL07-ACT_CTG" ></select></td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.Importance"/></p></td>
									<td class=""><select name="SL07-IMPORTANCE" id="SL07-IMPORTANCE" ></select></td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.ActiveStatus"/></p></td>
									<td class=""><select name="SL07-ACTIVE_STS" id="SL07-ACTIVE_STS" ></select></td>
								</tr>
							</table>					
						</div>
						
						<div class="ctu_gr_wrap ctu_resize" style="width:calc(50% - 10px); height:calc(50%); padding-top:0px;">
							<div class="ct_grid_top_wrap">
								<div class="ct_grid_top_left_subtitle">
									<h4><s:message code="lead.Reference"/></h4>	
								</div>
							</div>	
							<table width="100%" class="table_line">
								<tr>
									<td class="small_td"><p><s:message code="lead.account"/></p></td>
									<td class=""><input class="side_front_Sinput" type="text" name=SL07-ACCOUNT_CD id="SL07-ACCOUNT_CD" maxlength="">
										<button class="grid_popupbtn" id="cmm_pop_ACCOUNT_CD" name="cmm_pop_ACCOUNT_CD" type='button'></button>
										<p class="data_side_text" name="SL07-ACCOUNT_NM" id="SL07-ACCOUNT_NM"></p>
									</td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.mainContact"/></p></td>
									<td class=""><input class="side_front_Sinput" type="text" name="SL07-M_PS_NO" id="SL07-M_PS_NO" maxlength="">
										<button class="grid_popupbtn" id="cmm_pop_M_PS_NO" name="cmm_pop_M_PS_NO" type='button'></button>
										<p class="data_side_text" name="SL07-M_PS_NO_NM" id="SL07-M_PS_NO_NM"></p>
									</td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.employeeResponsible"/></p></td>
									<td class=""><input class="side_front_Sinput" type="text" name="SL07-EMP_RESP_NO" id="SL07-EMP_RESP_NO" maxlength="">
										<button class="grid_popupbtn" id="cmm_pop_EMP_RESP_NO" name="cmm_pop_EMP_RESP_NO" type='button'></button>
										<p class="data_side_text" name="SL07-EMP_RESP_NO_NM" id="SL07-EMP_RESP_NO_NM"></p>
									</td>
								</tr>
								<tr>
									<td class="small_td"><p><s:message code="lead.salesOrg"/></p></td>
									<td><select id="SL07-SALES_ORG_CD" name="SL07-SALES_ORG_CD" class=""></select></td>
								</tr>
								<tr>
									<td class="small_td">&nbsp;</td>
									<td class=""><input type="hidden" name="SL07-SEQ" id="SL07-SEQ" /></td>
								</tr>
								<tr>
									<td class="small_td">&nbsp;</td>
									<td class="">&nbsp;</td>
								</tr>
							</table>	
						</div>
					
				</form>
				
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left_subtitle">
						<h4><s:message code="lead.CustomerNotes(printed)"/></h4>
					</div>
				</div>	
				
				<form id="frmContRptNote" action="#">		
					<table width="100%" class="table_line">
						<tr>
							<td><textarea id="SL07-REPORT_NOTE" name="SL07-REPORT_NOTE" style="height:125px; min-height:100px; width:99%; overflow:auto; margin-right:10px; padding-right:10px;"></textarea></td>
						</tr>
					</table>
          		</form>
					

			</div>
				<!-- 그리드 시작 -->			

				
							
		</div>
	<!--  tab end -->
	</div>

<script>
var args;
(function() {
	var ACCOUNT_GROUP_FLAG;
	var SALES_SAVE_FLAG = false;
	var oldReq = 0;
	
	var edtType = ''; 
	var startDay = getToday();
	var endDay = twoWeeks();
	
	function createGrid() {
		createContactPersonGrd();
		createSalesGrd();
		createTaxesGrd();
		createPfGrd();
		
		createContactReportGrid();
		
		////////////////////////////////////////////////////////////////////
		// binding grid data
		////////////////////////////////////////////////////////////////////
		$('#taxesGrd').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				var row = $('#taxesGrd').jqGrid('getRowData', rowId);
				var preValue = row.TAX_CL_CD;
				var clCode = Util.component.getCommomCode('TAX_CL_CD');
				var clData = '';
				var filter = row.COUNTRY_CD + row.TAX_CTG;
				Array.prototype.forEach.call(clCode, function(v) {
					if (v.REFVALUE.indexOf(filter) >= 0) {
						clData += v.CODE + ':' + v.CODE + ' - ' + v.CODE_NM + ';';
					}
				});
				
				clData = clData.substr(0, clData.length - 1);
				$("#taxesGrd").setColProp('TAX_CL_CD', { editoptions: { value: clData } });
				$("#taxesGrd").jqGrid('setCell', rowId, 'TAX_CL_CD', preValue);
				btGrid.gridResizing('taxesGrd');
			}
		});
		$('#salesGrd').bind('jqGridSelectRow', function(e, rowId, status) {
			if ($('#salesGrdSave')[0].getAttribute('disabled') !== 'disabled') {
				$('#salesGrdCancel').click();
			} else {
				setTimeout(function() {
					var row = $('#salesGrd').jqGrid('getRowData', rowId);
					salesOrgCd = row.SALES_ORG_CD;
					distrbCh = row.DISTRB_CH;
					divCd = row.DIV_CD;
					redrawSales();
				}, 100);
			}
		});
		
		$('#pfGrd').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				var rowIndex = $('#' + rowId)[0].rowIndex;
				if (rowIndex > 4 && index === 3) {
					var row = $('#pfGrd').jqGrid('getRowData', rowId);
					var param = {};
					param.window = window;
					if (row.PF_TP === 'AP') {
						var url = "/popup/ContactPersonPopup.do";
						var pid = "ContactPersonPopup";  //팝업 페이지의 취상위 div ID
						var param = { 'CUST_CD':document.querySelector('[data-dbcolumn="CUST_CD"]').value
									, 'CUST_NM':document.querySelector('[data-dbcolumn="CUST_NM"]').value
						};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].FULL_NM);
								$("#pfGrd").jqGrid('setCell', rowId, 'STREET_NM', data[0].STREET_NM || '');
								
								var index = $('#' + rowId)[0].rowIndex;
								var sale = getCurrentSales();
								sale.custPartList[index - 1].PF_TP = row.PF_TP;
								sale.custPartList[index - 1].PF_PS_NO = data[0].CODE;
								sale.custPartList[index - 1].PF_PS_NM = data[0].FULL_NM;
								sale.custPartList[index - 1].STREET_NM = data[0].STREET_NM || '';
							}
							btGrid.gridSaveRow('pfGrd');
						});
					} else if (row.PF_TP === 'ZI' || row.PF_TP === 'ZK' || row.PF_TP === 'SP' || row.PF_TP === 'ER') {
						var url = "/popup/UserPopup2.do";
						var pid = "UserPopup2";
						var param = {
							S_CODE: row.PF_PS_NO,
							SEARCH : 'S_USER_ID'
						};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].USER_ID);
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].NAME_FULL);
								$("#pfGrd").jqGrid('setCell', rowId, 'STREET_NM', data[0].STREET_NM || '');
								
								var index = $('#' + rowId)[0].rowIndex;
								var sale = getCurrentSales();
								sale.custPartList[index - 1].PF_TP = row.PF_TP;
								sale.custPartList[index - 1].PF_PS_NO = data[0].USER_ID;
								sale.custPartList[index - 1].PF_PS_NM = data[0].NAME_FULL;
								sale.custPartList[index - 1].STREET_NM = data[0].STREET_NM || '';
							}
							btGrid.gridSaveRow('pfGrd');
						});
					} else if (row.PF_TP === 'VN') {
						var url = "/popup/VendorPopup.do";
						var pid = "VendorPopup";  //팝업 페이지의 취상위 div ID
						var param = {};
						popupOpen(url, pid, param, function(data){
							if(!fn_empty(data)){
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NM', data[0].FULL_NM);
								$("#pfGrd").jqGrid('setCell', rowId, 'STREET_NM', data[0].STREET_NM || '');
								
								var index = $('#' + rowId)[0].rowIndex;
								var sale = getCurrentSales();
								sale.custPartList[index - 1].PF_TP = row.PF_TP;
								sale.custPartList[index - 1].PF_PS_NO = data[0].CODE;
								sale.custPartList[index - 1].PF_PS_NM = data[0].FULL_NM;
								sale.custPartList[index - 1].STREET_NM = data[0].STREET_NM || '';
							}
							btGrid.gridSaveRow('pfGrd');
						});
					} else {
						param.SALES_ORG_CD = salesOrgCd;
						param.DISTRB_CH = distrbCh;
						param.DIV_CD = divCd;
						popupOpen('/customer/customerSearchPopup.do', 'CustomerSearchPopup', param, function(e, selecedData) {
							if (!!selecedData) {
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NO', selecedData.CUST_CD);
								$("#pfGrd").jqGrid('setCell', rowId, 'PF_PS_NM', selecedData.CUST_NM);
								$("#pfGrd").jqGrid('setCell', rowId, 'STREET_NM', selecedData.STREET_NM || '');
								
								var index = $('#' + rowId)[0].rowIndex;
								var sale = getCurrentSales();
								sale.custPartList[index - 1].PF_TP = row.PF_TP;
								sale.custPartList[index - 1].PF_PS_NO = selecedData.CUST_CD;
								sale.custPartList[index - 1].PF_PS_NM = selecedData.CUST_NM;
								sale.custPartList[index - 1].STREET_NM = selecedData.STREET_NM || '';
							}
							btGrid.gridSaveRow('pfGrd');
						});
					}
				}
				if (rowIndex < 5) {
					if (index === 2 || index === 3) {
						alert('<s:message code="info.editfield"/>');
						throw 'Can not edit field';
					}
				}
			}
		});
		
		
		
		// add Contact Report
		$('#contactReportGrid').bind('jqGridSelectRow', function(e, rowId, status) {
			fn_formDisable(['frmContRpt']);
			fn_formDisable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
			$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
			$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
			
			var rowData = $("#contactReportGrid").getRowData(rowId);
			fn_dataBindByPrefix('frmContRpt', 'SL07-', rowData);
			var note = rowData.REPORT_NOTE;
			note = note.replace(/\\r\\n/g, '\r\n');	
			$('#SL07-REPORT_NOTE').val(note);
			

			$('#btnCancel_InteractLog').attr('disabled','disabled');
			$('#btnAdd_InteractLog').removeAttr('disabled');
			$('#btnEdit_InteractLog').removeAttr('disabled');
			$('#btnSave_InteractLog').attr('disabled','disabled');
		});

		$("#btnSave_InteractLog").click(function() {
			saveInteractLog(edtType);
		});
		
		$("#btnEdit_InteractLog").click(function() {
			edtType = 'E';
			fn_formEnable(['frmContRpt']);
			fn_formEnable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').removeAttr('disabled');
			$('#cmm_pop_M_PS_NO').removeAttr('disabled');
			$('#cmm_pop_EMP_RESP_NO').removeAttr('disabled');

			$('#btnCancel_InteractLog').removeAttr('disabled');
			$('#btnAdd_InteractLog').attr('disabled','disabled');
			$('#btnEdit_InteractLog').attr('disabled','disabled');
			$('#btnSave_InteractLog').removeAttr('disabled');
			
		});
		
		$("#btnAdd_InteractLog").click(function() {
			edtType = 'S';
			$("#frmContRpt")[0].reset();
			$('#SL07-REPORT_NOTE').val('');
			
			$('#SL07-ACT_DT').val(startDay);
			
			$("#SL07-ACCOUNT_CD").val($('#SL07-CUST_CD').val());
			$("#SL07-M_PS_NO").val( $('#SL07-MAIN_CONTACT').val());
			$("#SL07-EMP_RESP_NO").val($('#SL07-EMP_RESP').val());
			
			$("#SL07-ACCOUNT_NM").text($('#SL07-CUST_NM').text());
			$("#SL07-M_PS_NO_NM").text($('#SL07-MAIN_CONTACT_NM').text());
			$("#SL07-EMP_RESP_NO_NM").text($('#SL07-EMP_RESP_NM').text());
				
			fn_formEnable(['frmContRpt']);
			fn_formEnable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').removeAttr('disabled');
			$('#cmm_pop_M_PS_NO').removeAttr('disabled');
			$('#cmm_pop_EMP_RESP_NO').removeAttr('disabled');

			$('#btnCancel_InteractLog').removeAttr('disabled');
			$('#btnAdd_InteractLog').removeAttr('disabled');
			$('#btnEdit_InteractLog').attr('disabled','disabled');
			$('#btnSave_InteractLog').removeAttr('disabled');

		});
		
		$("#btnCancel_InteractLog").click(function() {
			$("#frmContRpt")[0].reset();
			$("#SL07-ACCOUNT_NM").text("");
			$("#SL07-M_PS_NO_NM").text("");
			$("#SL07-EMP_RESP_NO_NM").text("");
				
			fn_formDisable(['frmContRpt']);
			fn_formDisable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').removeAttr('disabled');
			$('#cmm_pop_M_PS_NO').removeAttr('disabled');
			$('#cmm_pop_EMP_RESP_NO').removeAttr('disabled');
			
			edtType = '';

			initContactReportTab();
			btGrid.gridResizing('contactReportGrid');
			selectContactReportTab();			

			$('#btnCancel_InteractLog').attr('disabled','disabled');
			$('#btnAdd_InteractLog').removeAttr('disabled');
			$('#btnEdit_InteractLog').removeAttr('disabled');
			$('#btnSave_InteractLog').attr('disabled','disabled');
		});
		
		$("#cmm_pop_ACCOUNT_CD").click(function() {
			openCustomerPopUp($('#SL07-ACCOUNT_CD').val(), 'ACCOUNT');
		});

		$("#cmm_pop_M_PS_NO").click(function() {
			openContactPersonPopup('SL07-M_PS_NO', 'SL07-M_PS_NO_NM');	
		});
		
		$("#cmm_pop_EMP_RESP_NO").click(function() {
			openEmpPopup('SL07-EMP_RESP_NO', 'SL07-EMP_RESP_NO_NM');
		});
		

		////////////////////////////////////////////////////////////////////
		// add, delete event listener
		////////////////////////////////////////////////////////////////////
		function deleteGridRow(id) {
			var grid = $('#' + id);
			var ids = grid.jqGrid("getDataIDs");
			for (var i = 0; i < ids.length; i++) {
				var rowId = ids[i];
				var index = $('#' + rowId)[0].rowIndex;
				if (id === 'pfGrd' && index < 5) {
					continue;
				}
				if ($('#' + id +'_' + ids[i] + '_CHK').prop('checked')) {
					btGrid.gridDelRow(id, ids[i]);
				}
			}
		}
		
		$("#cpGrdAdd").click(function() {
			btGrid.gridAddRow("contactPersonGrd", "last");
			btGrid.gridSaveRow('contactPersonGrd');
		});
		$("#cpGrdDel").click(function() {
			deleteGridRow('contactPersonGrd');
		});
		/*
		$('#contactPersonGrd').focusout(function(e) {
			if (!e.target.classList.contains('ui-row-ltr')) {
				btGrid.gridSaveRow('contactPersonGrd');
			}
		});
		*/
		
		$("#salesGrdCancel").click(function() {
			SALES_SAVE_FLAG = false;
			setActiveSales(false);
			$("#salesGrdAdd")[0].removeAttribute('disabled');
			$("#salesGrdDel")[0].removeAttribute('disabled');
			$("#salesGrdSave")[0].setAttribute('disabled', 'disabled');
			$("#salesGrdCancel")[0].setAttribute('disabled', 'disabled');
			
			customerInfo.tmpSales = undefined;
			var sales = customerInfo.custSalesList[0];
			salesOrgCd = sales.SALES_ORG_CD;
			distrbCh = sales.DISTRB_CH;
			divCd = sales.DIV_CD;
			redrawSales();
			setTimeout(function() {
				$('#salesGrd').jqGrid("setSelection", '1');
			}, 200);
		});
		$("#salesGrdSave").click(function() {
			var isValid = true;
			Array.prototype.some.call(mandatory3Elms, function(elm) {
				if (!elm.value) {
					alert('<s:message code="info.inputsales"/>');
					elm.focus();
					isValid = false;
					return true;
				}
				return false;
			});
			if (!isValid) {
				return;
			}
			
			// check sales mandatory
			var newSalesOrgCd = document.getElementById('MS01_SALES_ORG_CD').value;
			var newDistrbCh = document.getElementById('MS01_DISTRB_CH').value;
			var newDivCd = document.getElementById('MS01_DIV_CD').value;
			var finder = newSalesOrgCd + newDistrbCh + newDivCd;
			var duplicated = [];
			customerInfo.custSalesList.some(function(v) {
				var item = v.SALES_ORG_CD + v.DISTRB_CH + v.DIV_CD;
				duplicated.push(item);
				if (duplicated.indexOf(finder) !== -1) {
					isValid = false;
					return true;
				}
				return false;
			});
			if (!isValid) {
				alert('<s:message code="info.dupsales"/>');
				return;
			}
			
			// create sales data and partner data
			var custPartList = [];
			var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value || '';
			var custNm = document.querySelector('[data-dbcolumn="CUST_NM"]').value || '';
			var streetNm = document.querySelector('[data-dbcolumn="STREET_NM"]').value || '';
			custPartList.push({ PF_TP: 'AG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
			custPartList.push({ PF_TP: 'RE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
			custPartList.push({ PF_TP: 'RG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
			custPartList.push({ PF_TP: 'WE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
			customerInfo.tmpSales.custPartList = custPartList;
			customerInfo.custSalesList.push(customerInfo.tmpSales);
			
			salesOrgCd = newSalesOrgCd;
			distrbCh = newDistrbCh;
			divCd = newDivCd;
			redrawSales();
			customerInfo.tmpSales = undefined;
			$("#salesGrdAdd")[0].removeAttribute('disabled');
			$("#salesGrdDel")[0].removeAttribute('disabled');
			$("#salesGrdSave")[0].setAttribute('disabled', 'disabled');
			$("#salesGrdCancel")[0].setAttribute('disabled', 'disabled');
			
			// add grid item
			var newRow = {};
			newRow.SALES_ORG_CD = salesOrgCd;
			newRow.DISTRB_CH = distrbCh;
			newRow.DIV_CD = newDivCd;
			btGrid.gridAddRow('salesGrd', 'last', newRow);
			btGrid.gridSaveRow('salesGrd');
			
			SALES_SAVE_FLAG = false;
			setActiveSales(false);
			
			cSave();
			
		});
		$("#salesGrdAdd").click(function() {
			SALES_SAVE_FLAG = true;
			setActiveSales(true);
			$("#salesGrdAdd")[0].setAttribute('disabled', 'disabled');
			$("#salesGrdDel")[0].setAttribute('disabled', 'disabled');
			$("#salesGrdSave")[0].removeAttribute('disabled');
			$("#salesGrdCancel")[0].removeAttribute('disabled');
			customerInfo.tmpSales = {};
			salesOrgCd = undefined;
			distrbCh = undefined;
			divCd = undefined;
			redrawSales();
			
			// set default value
			document.querySelector('[data-sales="CURR_CD"]').value = 'EUR';
			customerInfo.tmpSales.CURR_CD = 'EUR';
			
			document.querySelector('[data-sales="DELI_PLANT_CD"]').value = '1000';
			customerInfo.tmpSales.DELI_PLANT_CD = '1000';
		});
		$("#salesGrdDel").click(function() {
			if (customerInfo.custSalesList.length === 1) {
				alert('<s:message code="info.cannotdel"/>');
				return;
			}
			
			if (!confirm('<s:message code="confirm.delete"/>')) {
				return;
			}
			
			var rowId = $('#salesGrd').jqGrid('getGridParam', 'selrow');
			btGrid.gridDelRow('salesGrd', rowId);
			var rowIndex = parseInt($('#' + rowId)[0].rowIndex);
			customerInfo.custSalesList.splice(rowIndex - 1, 1);
			
			var sales = customerInfo.custSalesList[0];
			salesOrgCd = sales.SALES_ORG_CD;
			distrbCh = sales.DISTRB_CH;
			divCd = sales.DIV_CD;
			redrawSales();
			setTimeout(function() {
				$('#salesGrd').jqGrid("setSelection", '1');
			}, 200);
		});
		$("#pfGrdAdd").click(function() {
			var sale = getCurrentSales();
			if (!sale) {
				alert('<s:message code="info.inputdiv"/>');
				return;
			}
			
			var newRow = {};
			btGrid.gridAddRow('pfGrd', 'last', newRow);
			btGrid.gridSaveRow('pfGrd');
			sale.custPartList.push({ PF_TP: '', DEFAULT_YN: 'N', PF_PS_NO: '', PF_PS_NM: '', STREET_NM: '' });
		});
		$("#pfGrdDel").click(function() {
			var grid = $('#pfGrd');
			var ids = grid.jqGrid("getDataIDs");
			var delList = [];
			for (var i = 0; i < ids.length; i++) {
				if ($('#pfGrd_' + ids[i] + '_CHK').prop('checked')) {
					var index = $('#' + ids[i])[0].rowIndex;
					delList.push(index -1);
				}
			}
			
			var sale = getCurrentSales();
			delList.reverse().forEach(function(v) {
				sale.custPartList.splice(v, 1);
			});
			
			deleteGridRow('pfGrd');
		});
		/*
		document.getElementById('pfGrd').addEventListener('focusout', function(e) {
			if (!!e.sourceCapabilities) {
				btGrid.gridSaveRow('pfGrd');
			}
		});
		*/
	}
	
	
	function initContactReportTab() {

	  	setTimeout(function() {
	  	    var grid = $("#contactReportGrid"),
	  	    ids = grid.jqGrid("getDataIDs");
	  	    if(ids && ids.length > 0){
	  	        grid.jqGrid("setSelection", ids[0]);
	  	    }
	  	}, 100);	
		
	  	var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;
	  	
		if ( custCd == '' ) {
			fn_formEnable(['frmContRpt']);
			fn_formEnable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').removeAttr('disabled');
			$('#cmm_pop_M_PS_NO').removeAttr('disabled');
			$('#cmm_pop_EMP_RESP_NO').removeAttr('disabled');
		}

	}
	
	function selectContactReportTab() {
		
		var url = "/customer/selectContactReportTab.do";
		
		var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;
		
		if ( custCd != '' ) {
			var param = { "param" : {
				"CUST_CD"  : custCd
				}
			};
			
			fn_ajax(url, false, param, function(data, xhr){
				reloadGrid("contactReportGrid", data.resultContactReportGrid);   // 그리드 조회 데이터 출력
				btGrid.gridQueryPaging($('#contactReportGrid'), 'selectContactReportTab', data.resultContactReportGrid);  // 그리드 페이징 설정
				
				if ( data.resultInteractionLog != null ) {
					fn_dataBindByPrefix('frmContRpt', 'SL07-', data.resultInteractionLog);
					
					var note = data.resultInteractionLog.REPORT_NOTE;
					note = note.replace(/\\r\\n/g, '\r\n');
					$("#SL07-REPORT_NOTE").val(note);
					//fn_dataBindByPrefix('frmContRptNote', 'SL07-', data.resultInteractionLog);

					$('#btnCancel_InteractLog').attr('disabled','disabled');
					$('#btnAdd_InteractLog').removeAttr('disabled');
					$('#btnEdit_InteractLog').removeAttr('disabled');
					$('#btnSave_InteractLog').attr('disabled','disabled');

					$('#contactReportGrid').jqGrid('setSelection', $('#contactReportGrid').jqGrid('getDataIDs')[0]);
					
				}
				
			});
		}
	}
	
	function makeGridSelectData(codes) {
		var selectData = ':;';
		Array.prototype.forEach.call(codes, function(code) {
			if (!code.CODE) {
				return;
			}
			selectData += (code.CODE + ':' + code.S_CODE_NM + ';');
		});
		
		return selectData.substr(0, selectData.length - 1);
	}
	
	function createContactPersonGrd() {
		var colName = [
			'<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'contactPersonGrd\')" /> ',
			'',
			'<s:message code="customer.lastName"/>',
			'<s:message code="customer.firstName"/>',
			'<s:message code="customer.grd.Telephone1"/>',
			'<s:message code="customer.grd.Department"/>',
			'<s:message code="customer.grd.Fax"/>',
			'<s:message code="customer.grd.E_Mail"/>'
		];
		
		var codes = Util.component.getCommomCode('DEPT_CD');
		var selectData = makeGridSelectData(codes);
		selectData = ':;' + selectData;
		
		var colModel = [
			{ name : 'CHK',index : 'CHK', sortable: false, width : 20, align : 'center',formatter : gridCboxFormat, sortable: false},
			{ name: 'CODE', hidden:true },
			{ name: 'NAME_2ND', sortable: false, width: 150, align: 'center', editable:true, editoptions:{maxlength:"35"} },
			{ name: 'NAME_1ST', sortable: false, width: 150, align: 'center', editable:true, editoptions:{maxlength:"35"} },
			{ name: 'TEL_NO1', sortable: false, width: 200, align: 'center', editable:true, editoptions:{maxlength:"30"} },
			//{ name: 'STREET_NM', sortable: false, width: 250, align: 'center', editable:true, editoptions:{maxlength:"30"} },
			{ name: 'DEPT_CD', sortable: false, width: 250, align: 'center', editable:true, edittype:"select", formatter : "select", editoptions:{ value: selectData } },
			{ name: 'FAX_NO', sortable: false, width: 200, align: 'center', editable:true, editoptions:{maxlength:"30"} },
			{ name: 'E_MAIL', sortable: false, width: 200, align: 'center', editable:true, editoptions:{maxlength:"150"} }
		];
		
		var gSetting = {
			height: 128,
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
		
		btGrid.createGrid('contactPersonGrd', colName, colModel, gSetting);
	}
	
	function createSalesGrd() {
		var colName =  [
			'<s:message code="customer.SalesOrg"/>',
			'<s:message code="customer.DistChannel"/>',
			'<s:message code="customer.Division"/>'
		];
		
		var codes = Util.component.getCommomCode('SALES_ORG_CD');
		var selectData = makeGridSelectData(codes);
		
		codes = Util.component.getCommomCode('DISTRB_CH');
		var selectCtgData = makeGridSelectData(codes);
		
		codes = Util.component.getCommomCode('DIV_CD');
		var selectClData = makeGridSelectData(codes);
		
		var colModel = [
			{ name: 'SALES_ORG_CD', sortable: false, width: 200, align: 'left', editable: false, edittype:"select", formatter : "select", editoptions: {
				value: selectData,
				dataEvents:[
				{
					type: 'change',
					fn: function(e) {
						btGrid.gridSaveRow('salesGrd');
						var selRow = $('#salesGrd').jqGrid('getGridParam', 'selrow');
						var row = $('#salesGrd').jqGrid('getRowData', selRow);
						var sale = getCurrentSales();
						sale.SALES_ORG_CD = row.SALES_ORG_CD;
					}
				},
				{
					type: 'click',
					fn: function(e) {
					}
				}
				]
			} },
			{ name: 'DISTRB_CH', sortable: false, width: 200, align: 'left', editable: false, edittype:"select", formatter : "select", editoptions: {
				value: selectCtgData,
				dataEvents:[
				{
					type: 'change',
					fn: function(e) {
						btGrid.gridSaveRow('salesGrd');
						var selRow = $('#salesGrd').jqGrid('getGridParam', 'selrow');
						var row = $('#salesGrd').jqGrid('getRowData', selRow);
						var sale = getCurrentSales();
						sale.DISTRB_CH = row.DISTRB_CH;
					}
				},
				{
					type: 'click',
					fn: function(e) {
					}
				}
				]
			} },
			{ name: 'DIV_CD', sortable: false, width: 200, align: 'left', editable: false, edittype:"select", formatter : "select", editoptions: {
				value: selectClData,
				dataEvents:[
				{
					type: 'change',
					fn: function(e) {
						btGrid.gridSaveRow('salesGrd');
						var selRow = $('#salesGrd').jqGrid('getGridParam', 'selrow');
						var row = $('#salesGrd').jqGrid('getRowData', selRow);
						var sale = getCurrentSales();
						sale.DIV_CD = row.DIV_CD; 
					}
				},
				{
					type: 'click',
					fn: function(e) {
					}
				}
				]
			} }
		];
		
		var gSetting = {
			height: 115,
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
		
		btGrid.createGrid('salesGrd', colName, colModel, gSetting);
	}
	
	function createTaxesGrd() {
		var colName = [
			'',
			'<s:message code="customer.grd.Country"/>',
			'<s:message code="customer.grd.TaxCat"/>',
			'<s:message code="customer.grd.TaxClass"/>'
		];
		
		var codes = Util.component.getCommomCode('COUNTRY_CD');
		var selectData = makeGridSelectData(codes);
		
		codes = Util.component.getCommomCode('TAX_CTG');
		var selectCtgData = makeGridSelectData(codes);
		
		codes = Util.component.getCommomCode('TAX_CL_CD');
		var selectClData = makeGridSelectData(codes);
		
		var colModel = [
			{ name: 'SEQ', hidden:true },
			{ name: 'COUNTRY_CD', sortable: false, width: 200, align: 'center', editable: false, edittype:"select", formatter : "select", editoptions: { value: selectData} },
			{ name: 'TAX_CTG', sortable: false, width: 200, align: 'center', editable: false, edittype:"select", formatter : "select", editrules: { required: true }, editoptions: {
				value: selectCtgData,
				dataEvents: [
				{
					type: 'focusout change',
					fn: function(e) {
						btGrid.gridSaveRow('taxesGrd');
					}
				}
				]
			} },
			{ name: 'TAX_CL_CD', sortable: false, width: 150, align: 'center', editable: true, edittype:"select", formatter : "select", editrules: { required: true }, editoptions: {
				value: selectClData,
				dataEvents: [
				{
					type: 'focusout change',
					fn: function(e) {
						btGrid.gridSaveRow('taxesGrd');
					}
				}
				]
			} },
		];
		
		var gSetting = {
			height: 120,
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
		
		btGrid.createGrid('taxesGrd', colName, colModel, gSetting);
	}
	
	function createPfGrd() {
		var colName =  [
			'<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'pfGrd\')" /> ',
			'',
			'<s:message code="customer.grd.PF"/>',
			'<s:message code="customer.grd.Number"/>',
			'<s:message code="customer.grd.Name"/>',
			'<s:message code="customer.StreetHouseNumber"/>',
			'<s:message code="customer.grd.Default"/>'
		];
		
		var codes = Util.component.getCommomCode('PF_TP');
		var selectPfData = makeGridSelectData(codes);
		
		var colModel = [
			{ name : 'CHK',index : 'CHK', sortable: false, width : 20, align : 'center',formatter : gridCboxFormat, sortable: false},
			{ name: 'SEQ', hidden: true },
			{ name: 'PF_TP', sortable: false, width: 150, align: 'left', editable:true, edittype:'select', formatter : 'select', editoptions: {
				value: selectPfData,
				dataEvents:[
				{
					type: 'change',
					fn: function(e) {
						var pfTp = e.currentTarget.value;
						var selRow = $('#pfGrd').jqGrid('getGridParam', 'selrow');
						if (pfTp === 'AG') {
							alert('<s:message code="errors.dup"/>');
							$("#pfGrd").jqGrid('setCell', selRow, 'PF_TP', null);
							btGrid.gridSaveRow('pfGrd');
							return;
						}
						
						var index = $('#' + selRow)[0].rowIndex;
						var row = $('#pfGrd').jqGrid('getRowData', selRow);
						
						$("#pfGrd").jqGrid('setCell', selRow, 'PF_PS_NO', null);
						$("#pfGrd").jqGrid('setCell', selRow, 'PF_PS_NM', null);
						$("#pfGrd").jqGrid('setCell', selRow, 'STREET_NM', null);
						$("#pfGrd").jqGrid('setCell', selRow, 'DEFAULT_YN', row.DEFAULT_YN);
						btGrid.gridSaveRow('pfGrd');
						
						var sale = getCurrentSales();
						sale.custPartList[index - 1].PF_TP = pfTp;
						sale.custPartList[index - 1].PF_PS_NO = '';
						sale.custPartList[index - 1].PF_PS_NM = '';
						sale.custPartList[index - 1].STREET_NM = '';
						sale.custPartList[index - 1].DEFAULT_YN = row.DEFAULT_YN;
					}
				},
				{
					type: 'click',
					fn: function(e) {
						var selRow = $('#pfGrd').jqGrid('getGridParam', 'selrow');
						var index = $('#' + selRow)[0].rowIndex;
						if (index < 5) {
							btGrid.gridSaveRow('pfGrd');
						}
					}
				}
				]
			} },
			{ name: 'PF_PS_NO', sortable: false, width: 150, align: 'center', classes: 'gridbtnsearch', editable: false, editoptions: { maxlength: '8' } },
			{ name: 'PF_PS_NM', sortable: false, width: 200, align: 'left', editable: false, editoptions:{maxlength:'50'} },
			{ name: 'STREET_NM', sortable: false, width: 400, align: 'left', editable: false },
			{ name: 'DEFAULT_YN', sortable: false, width: 100, align: 'center', editable: true, edittype:'select', formatter : 'select', editoptions: {
				value: 'N:No;Y:Yes',
				dataEvents: [
				{
					type: 'change',
					fn: function(e) {
						var selRow = $('#pfGrd').jqGrid('getGridParam', 'selrow');
						btGrid.gridSaveRow('pfGrd');
						
						var index = $('#' + selRow)[0].rowIndex;
						var row = $('#pfGrd').jqGrid('getRowData', selRow);
						var sale = getCurrentSales();
						sale.custPartList[index - 1].PF_TP = row.PF_TP;
						sale.custPartList[index - 1].PF_PS_NO = row.PF_PS_NO;
						sale.custPartList[index - 1].PF_PS_NM = row.PF_PS_NM;
						sale.custPartList[index - 1].DEFAULT_YN = row.DEFAULT_YN;
					}
				}
				]
			} }
		];
		
		var gSetting = {
			height: 493,
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
		
		btGrid.createGrid('pfGrd', colName, colModel, gSetting);
	}
	
	
	// create ContactReport Grid
	function createContactReportGrid() {
		var colName = [
					  'COMP_CD'
					, 'SEQ'
					, 'Seq.'
					, 'Customer No.'
					, 'Prospective'
					, 'Main Contact'
					, '<s:message code="lead.grd.Description"/>'
					, 'Date'
					, 'Category'
					, 'Importance'
					, 'Status'
					, 'Employee'
					, 'Sales Org.'
					, 'Note'
					, '<s:message code="lead.grd.Status"/>'
					, '<s:message code="lead.grd.RelationshipType"/>'
					, '<s:message code="lead.grd.DocumentType"/>'
					, '<s:message code="lead.grd.CreatedOn"/>'
					, '<s:message code="lead.grd.CreatedAt"/>'
					, '<s:message code="lead.grd.CreatedBy"/>'
					, '<s:message code="lead.grd.CreatedByID"/>'
					, 'IMPT_CL'
					, 'Category'
					, 'Sales Org.'
					, 'ACCOUNT_CD'
					, 'LOCATION'
					, 'M_PS_NO'
					, 'EMP_RESP_NO'
					, 'ROW_STATUS'
					];
													

		var colModel = [
					  { name: 'COMP_CD', align: 'center', hidden:true }
					, { name: 'SEQ', align: 'center', hidden:true }
					, { name: 'ROWNUM', width: 50, align: 'center', hidden:false }
					, { name: 'CUST_NO', width: 80,align: 'center', hidden:false }
					, { name: 'ACCOUNT_NM', align: 'left', hidden:false }
					, { name: 'M_PS_NO_NM', align: 'left', hidden:false }
					, { name: 'ACT_DESC', width: 150, align: 'left', hidden:false, editable:false }
					, { name: 'ACT_DT', align: 'center', hidden:false }
					, { name: 'ACT_CTG_NM', align: 'center', hidden:false }
					, { name: 'IMPT_CL', align: 'center', hidden:false }
					, { name: 'ACT_STS', align: 'center', hidden:false }
					, { name: 'EMP_RESP_NO_NM', align: 'left', hidden:false }
					, { name: 'SALES_ORG_CD_NM', align: 'left', hidden:false }
					, { name: 'REPORT_NOTE', align: 'left', hidden:false }
					, { name: 'ACTIVE_STS', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'REL_TYPE', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'DOC_TYPE', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_ON', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_AT', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_BY', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_BY_ID', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'IMPORTANCE', align: 'left', hidden:true }
					, { name: 'ACT_CTG', align: 'center', hidden:true }
					, { name: 'SALES_ORG_CD', align: 'left', hidden:true }
					, { name: 'ACCOUNT_CD', align: 'center', hidden:true }
					, { name: 'LOCATION', align: 'center', hidden:true }
					, { name: 'M_PS_NO', align: 'center', hidden:true }
					, { name: 'EMP_RESP_NO', align: 'center', hidden:true }
					, { name: 'ROW_STATUS', align: 'center', hidden:true }
					];
		
		var gSetting = {
			height:151,
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
		btGrid.createGrid('contactReportGrid', colName, colModel, gSetting);		
	}
		
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
		
		var initIndex = 0;
		if (gid === 'pfGrd') {
			initIndex = 4;
		}
		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = initIndex, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
	}
	
	function grid_cbox_onclick(grid, rowId, colkey) {
		if (grid !== 'pfGrd') {
			return;
		}
		
		var index = $('#' + rowId)[0].rowIndex;
		if (index < 5) {
			var check = $('#' + grid + '_' + rowId + '_CHK');
			check.prop('checked', false);
			alert('<s:message code="info.catnotcheck"/>');
		}
	}

	////////////////////////////////////////////////////////////////////
	// Customer
	////////////////////////////////////////////////////////////////////
	// for cache
	var columnElms = document.querySelectorAll('[data-dbcolumn]');
	var searchElms = document.querySelectorAll('[data-searchcolumn]');
	var numericElms = document.querySelectorAll('[data-validnumeric]');
	var currencyElms = document.querySelectorAll('[data-validcurrency]');
	var booleanElms = document.querySelectorAll('[data-validboolean]');
	var mandatoryElms = document.querySelectorAll('[data-validmandatory]');
	var emailElms = document.querySelectorAll('[data-validemail]');
	var mandatory2Elms = document.querySelectorAll('[data-validmandatory2]');
	var companyCodeElms = document.querySelectorAll('[data-companycode]');
	
	var mandatory3Elms = document.querySelectorAll('[data-validmandatory3]');
	var salesElms = document.querySelectorAll('[data-sales]');
	
	var customerInfo;
	var salesOrgCd;
	var distrbCh;
	var divCd;
	
	function initialize() {
		// apply validation
		Util.validator.applyNumber(numericElms);
		Util.validator.applyCurrency(currencyElms);
		Util.validator.applyEmail(emailElms);
		
		// resize grid for (tab area)
		$("#tabs a").click(function(e) {
			setTimeout(function() {
				btGrid.gridResizing('contactPersonGrd');
				btGrid.gridResizing('salesGrd');
				btGrid.gridResizing('taxesGrd');
				btGrid.gridResizing('pfGrd');
				btGrid.gridResizing('contactReportGrid');
				if (SALES_SAVE_FLAG) {
					$('#salesGrdCancel').click();
				}
			});
		});
		
		$.when(Util.component.createCombobox(searchElms, true), Util.component.createCombobox(columnElms), Util.component.createCombobox(salesElms))
		.done(function() {
			columnElms = document.querySelectorAll('[data-dbcolumn]');
			mandatoryElms = document.querySelectorAll('[data-validmandatory]');
			mandatory2Elms = document.querySelectorAll('[data-validmandatory2]');
			mandatory3Elms = document.querySelectorAll('[data-validmandatory3]');
			companyCodeElms = document.querySelectorAll('[data-companycode]');
			salesElms = document.querySelectorAll('[data-sales]');
			
			// create grid
			createGrid();
			
			// init company data
			var event = document.createEvent("Event");
			event.initEvent("change", false, true); 
// 			custCompCdElm.dispatchEvent(event);
			
			customerInfo = {};
			
			// init tax
			customerInfo.custTaxList = [];
			customerInfo.custTaxList.push({ COUNTRY_CD: 'AT', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'CA', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'CN', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'DE', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'FR', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'FR', TAX_CTG: 'LCFR', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'GB', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'JP', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'KR', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'MY', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'NL', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'PL', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'PT', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			customerInfo.custTaxList.push({ COUNTRY_CD: 'US', TAX_CTG: 'MWST', TAX_CL_CD: '1' });
			reloadGrid('taxesGrd', customerInfo.custTaxList);
			
			// init state
			customerInfo.custSalesList = [];
			var newSale = {};
			newSale.custPartList = [];
			newSale.custPartList.push({ PF_TP: 'AG', PF_PS_NO: '', PF_PS_NM: '', STREET_NM: '', DEFAULT_YN: 'Y' });
			newSale.custPartList.push({ PF_TP: 'RE', PF_PS_NO: '', PF_PS_NM: '', STREET_NM: '', DEFAULT_YN: 'Y' });
			newSale.custPartList.push({ PF_TP: 'RG', PF_PS_NO: '', PF_PS_NM: '', STREET_NM: '', DEFAULT_YN: 'Y' });
			newSale.custPartList.push({ PF_TP: 'WE', PF_PS_NO: '', PF_PS_NM: '', STREET_NM: '', DEFAULT_YN: 'Y' });
			customerInfo.custSalesList.push(newSale);
			reloadGrid('pfGrd', newSale.custPartList);
			
			var elms = document.querySelectorAll('#pfGrd tr:nth-child(n+2):nth-child(-n+5)');
			Array.prototype.forEach.call(elms, function(elm) {
				elm.style.opacity = '0.7';
			});
			
			bindSalesElms();
			
			$('[data-dbcolumn="COUNTRY_CD"]').on('setinput', function(e) {
				var elm1 = document.getElementById('MS01_TRANSP_ZONE');
				var elm2 = document.getElementById('MS01_REGION_CD');
				setTimeout(function() {
					var param = {
						HEAD_ID: 'TRANSP_ZONE',
						CODE: $('[data-dbcolumn="COUNTRY_CD"]').val()
					};
					
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var value = elm1.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
						});
						elm1.innerHTML = context;
						setTimeout(function() {
							elm1.value = value;
						}, 100);
					});
					
					var param = {
						HEAD_ID: 'REGION_CD',
						CODE: $('[data-dbcolumn="COUNTRY_CD"]').val()
					};
					
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var value = elm2.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
						});
						elm2.innerHTML = context;
						setTimeout(function() {
							elm2.value = value;
						}, 100);
					});
				});
			});
			
			$('[data-dbcolumn="COUNTRY_CD"]').on('change', function(e) {
				setTimeout(function() {
					var param = {
						HEAD_ID: 'TRANSP_ZONE',
						CODE: $('[data-dbcolumn="COUNTRY_CD"]').val()
					};
					
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var elm = document.getElementById('MS01_TRANSP_ZONE');
						var value = elm.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
						});
						elm.innerHTML = context;
						setTimeout(function() {
							elm.value = value;
						}, 100);
					});
					
					var param = {
						HEAD_ID: 'REGION_CD',
						CODE: $('[data-dbcolumn="COUNTRY_CD"]').val()
					};
					
					fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
						var elm = document.getElementById('MS01_REGION_CD');
						var value = elm.value;
						var context = '<option value=""></option>';
						Array.prototype.forEach.call(data.RESULT, function(v) {
							context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
						});
						elm.innerHTML = context;
						setTimeout(function() {
							elm.value = value;
						}, 100);
					});
				});
			});
			
			// set default
			// document.querySelector('[data-sales="CURR_CD"]').value = 'EUR';
			// document.querySelector('[data-sales="DELI_PLANT_CD"]').value = '1000';
		});
		
		$('[data-searchcolumn]').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } }); 
		
		var codeBoxArray = [  'SL07-IMPORTANCE'
							, 'SL07-ACTIVE_STS'
							, 'SL07-ACT_CTG'
							, 'SL07-LOCATION'
							, 'SL07-SALES_ORG_CD'
						   ];
					
		createCodeBoxByEdit(codeBoxArray, true);
		
		
		
	}
	
	function redrawSales() {
		// redraw
		function draw(sale) {
			var sale = getCurrentSales();
			Array.prototype.forEach.call(salesElms, function(elm) {
				var flag = false;
				$.each(sale, function(k, v) {
					if (elm.type === 'checkbox' && elm.dataset.sales === k) {
						if (v === 'Y') {
							$(elm).prop('checked', true);
						} else {
							$(elm).prop('checked', false);
						}
						flag = true;
						return;
					} else if (elm.dataset.sales === k) {
						elm.value = v;
						flag = true;
						return;
					}
				});
				if (!flag) {
					if (elm.type === 'checkbox') {
						$(elm).prop('checked', false);
					} else {
						elm.value = '';
					}
				}
			});
			
			if (!!sale.LIST_PRICE_NM) {
				$('[data-sales="LIST_PRICE"]')[0].nextSibling.nextSibling.textContent = sale.LIST_PRICE_NM;
			}
			if (!!sale.TERM_PAY_NM) {
				$('[data-sales="TERM_PAY_CD"]')[0].nextSibling.nextSibling.textContent = sale.TERM_PAY_NM;
			}
			if (!!sale.SALES_GR_NM) {
				$('[data-sales="SALES_GR"]').next().next().text(sale.SALES_GR_NM);
			}
			
			reloadGrid('pfGrd', sale.custPartList || []);
			if (!!sale.custPartList && sale.custPartList.length > 0) {
				$('#pfGrdAdd')[0].removeAttribute('disabled');
				$('#pfGrdDel')[0].removeAttribute('disabled');
			} else {
				$('#pfGrdAdd')[0].setAttribute('disabled', 'disabled');
				$('#pfGrdDel')[0].setAttribute('disabled', 'disabled');
			}
			
			if (!sale.custPartList || sale.custPartList.length === 0) {
				var custPartList = [];
				var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;
				var custNm = document.querySelector('[data-dbcolumn="CUST_NM"]').value;
				var streetNm = document.querySelector('[data-dbcolumn="STREET_NM"]').value;
				custPartList.push({ PF_TP: 'AG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				custPartList.push({ PF_TP: 'RE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				custPartList.push({ PF_TP: 'RG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				custPartList.push({ PF_TP: 'WE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				reloadGrid('pfGrd', custPartList);
				sale.custPartList = custPartList;
			} else {
				reloadGrid('pfGrd', sale.custPartList);
			}
			
			var target = document.getElementById('MS01_SALES_ORG_CD');
			document.getElementById('pfGrd_SALES_ORG_CD').innerHTML = target.options[target.selectedIndex].text;
			target = document.getElementById('MS01_DISTRB_CH');
			document.getElementById('pfGrd_DISTRB_CH').innerHTML = target.options[target.selectedIndex].text;
			target = document.getElementById('MS01_DIV_CD');
			document.getElementById('pfGrd_DIV_CD').innerHTML = target.options[target.selectedIndex].text;
		}
		
		function getSalesOfficeCode(sale) {
			var param = {
				HEAD_ID: 'SALES_OFFICE_CD',
				CODE: sale.SALES_ORG_CD + sale.DISTRB_CH + sale.DIV_CD
			};
			
			var deferred = $.Deferred();
			fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
				var elm = document.getElementById('MS01_SALES_OFFICE_CD');
				var context = '<option value=""></option>';
				Array.prototype.forEach.call(data.RESULT, function(v) {
					context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
				
				return deferred.resolve();
			});
			
			return deferred.promise();
		}
		
		function getSalesGroupCode(sale) {
			var param = {
				HEAD_ID: 'SALES_GR',
				CODE: sale.SALES_OFFICE_CD
			};
			
			var deferred = $.Deferred();
			fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
				var elm = document.getElementById('MS01_SALES_GR');
				var context = '<option value=""></option>';
				Array.prototype.forEach.call(data.RESULT, function(v) {
					context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
				
				return deferred.resolve();
			});
			
			return deferred.promise();
		}
		
		function getDeliveryPlantCode(sale) {
			var param = {
				HEAD_ID: 'DELI_PLANT_CD',
				CODE: sale.SALES_ORG_CD + sale.DISTRB_CH
			};
			
			var deferred = $.Deferred();
			fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
				var elm = document.getElementById('MS01_DELI_PLANT_CD');
				var context = '<option value=""></option>';
				Array.prototype.forEach.call(data.RESULT, function(v) {
					context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
				
				return deferred.resolve();
			});
			
			return deferred.promise();
		}
		
		// clear
		Array.prototype.forEach.call(salesElms, function(elm) {
			elm.value = '';
		});
		
		$('[data-sales="LIST_PRICE"]')[0].nextSibling.nextSibling.textContent = '';
		$('[data-sales="TERM_PAY_CD"]')[0].nextSibling.nextSibling.textContent = '';
		$('[data-sales="SALES_GR"]')[0].nextSibling.nextSibling.textContent = '';
		$('#MS01_SALES_GR_TEXT').text("");
		
		var sale = getCurrentSales();
		if (!!sale && !customerInfo.tmpSales) {
			$.when(getSalesOfficeCode(sale), getDeliveryPlantCode(sale))
			.done(function() {
				draw(sale);
			});
		}
		
		if (!!customerInfo.custSalesList && !!customerInfo.custSalesList[0] && !customerInfo.custSalesList[0].SALES_ORG_CD && !customerInfo.custSalesList[0].DISTRB_CH && !customerInfo.custSalesList[0].DIV_CD) {
			var accountGr = document.getElementById('MS01_ACCOUNT_GR');
			if (accountGr.value !== 'Z005' && !customerInfo.custSalesList[0].custPartList) {
				var custPartList = [];
				var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;
				var custNm = document.querySelector('[data-dbcolumn="CUST_NM"]').value;
				var streetNm = document.querySelector('[data-dbcolumn="STREET_NM"]').value;
				custPartList.push({ PF_TP: 'AG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				custPartList.push({ PF_TP: 'RE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				custPartList.push({ PF_TP: 'RG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				custPartList.push({ PF_TP: 'WE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				reloadGrid('pfGrd', custPartList);
				customerInfo.custSalesList[0].custPartList = custPartList;
				
				document.getElementById('pfGrd_SALES_ORG_CD').innerHTML = '';
				document.getElementById('pfGrd_DISTRB_CH').innerHTML = '';
				document.getElementById('pfGrd_DIV_CD').innerHTML = '';
				document.getElementById('pfGrdAdd').removeAttribute('disabled');
				document.getElementById('pfGrdDel').removeAttribute('disabled');
			}
		}
		
		var elms = document.querySelectorAll('#pfGrd tr:nth-child(n+2):nth-child(-n+5)');
		Array.prototype.forEach.call(elms, function(elm) {
			elm.style.opacity = '0.7';
		});
	}
	
	function redrawData() {
		reloadGrid('salesGrd', []);
		
		var sales = getCurrentSales();
		if (!!sales && !!sales.SALES_ORG_CD && !!sales.DISTRB_CH && !!sales.DIV_CD) {
			$("#salesGrdAdd")[0].removeAttribute('disabled');
			$("#salesGrdDel")[0].removeAttribute('disabled');
			//$('#pfGrdAdd')[0].removeAttribute('disabled');
			//$('#pfGrdDel')[0].removeAttribute('disabled');
		} else {
			$("#salesGrdAdd")[0].setAttribute('disabled', 'disabled');
			$("#salesGrdDel")[0].setAttribute('disabled', 'disabled');
			//$('#pfGrdAdd')[0].setAttribute('disabled', 'disabled');
			//$('#pfGrdDel')[0].setAttribute('disabled', 'disabled');
		}
		
		if (!customerInfo.VAT_NO_CHK_YN) {
			customerInfo.VAT_NO_CHK_YN = 'N';
		}
		
		document.querySelector('[data-dbcolumn="COUNTRY_CD"]').value = customerInfo.COUNTRY_CD;
		
		Array.prototype.forEach.call(columnElms, function(elm) {
			if (elm.type === 'checkbox' && !elm.dataset.searchcolumn) {
				if (customerInfo[elm.dataset.dbcolumn] === 'Y') {
					$(elm).prop('checked', true);
				} else {
					$(elm).prop('checked', false);
				}
			} else if (!elm.dataset.searchcolumn) {
				var value = customerInfo[elm.dataset.dbcolumn];
				if (value === undefined) {
					value = '';
				}
				elm.value = value;
				$(elm).trigger('setinput');
			}
		});
		
		var custCompCd = document.getElementById('MS01_CUST_COMP_CD');
		if (!!custCompCd.value) {
			$(custCompCd).trigger('change');
		}
		
		reloadGrid('contactPersonGrd', customerInfo.custPersonList || []);
		reloadGrid('taxesGrd', customerInfo.custTaxList || []);
		
		var sales = getCurrentSales();
		if (!!sales && !!sales.SALES_ORG_CD && !!sales.DISTRB_CH && !!sales.DIV_CD) {
			reloadGrid('salesGrd', customerInfo.custSalesList || []);
		} else {
			reloadGrid('salesGrd', []);
			reloadGrid('pfGrd', []);
			document.getElementById('pfGrd_SALES_ORG_CD').innerHTML = '';
			document.getElementById('pfGrd_DISTRB_CH').innerHTML = '';
			document.getElementById('pfGrd_DIV_CD').innerHTML = '';
		}
		
		if (document.getElementById('MS01_VAT_NO_CHK_YN').value === 'Y') {
			//vatElm.setAttribute('disabled', 'disabled');
			document.getElementById('MS01_VAT_NO_CHK_YN_NM').textContent = 'OK';
			//document.getElementById('MS01_VAT_REG_NO').setAttribute('disabled', 'disabled');
		} else {
			//vatElm.removeAttribute('disabled');
			document.getElementById('MS01_VAT_NO_CHK_YN_NM').textContent = '';
			//document.getElementById('MS01_VAT_REG_NO').removeAttribute('disabled');
		}
		
		redrawSales();
	}
	
	function value2request() {
		var param = {};
		
		Array.prototype.forEach.call(currencyElms, function(elm) {
			var value = elm.value || '0';
			value = value.replace(/\./g, '').replace(",", '.');
			var column = elm.dataset.dbcolumn;
			param[column] = param[column] || value;
		});
		
		Array.prototype.forEach.call(booleanElms, function(elm) {
			var value = elm.value === 'on' ? 'Y' : 'N';
			var column = elm.dataset.dbcolumn;
			param[column] = param[column] || value;
		});
		
		Array.prototype.forEach.call(columnElms, function(elm) {
			var value = elm.value;
			var column = elm.dataset.dbcolumn;
			param[column] = param[column] || value;
		});
		
		// for grid contact, tax, partner data
		param.custPersonList = $('#contactPersonGrd').jqGrid('getGridParam', 'data') || [];
		param.custPersonList.forEach(function(v) {
			var last = v.NAME_2ND;
			var first = v.NAME_1ST;
			v.FULL_NM = last + ' ' + first;
		});
		
		param.custTaxList = $('#taxesGrd').jqGrid('getGridParam', 'data') || [];
		param.custSalesList = customerInfo.custSalesList || [];
		param.custVatList = customerInfo.custVatList || [];
		
		var accountGr = document.getElementById('MS01_ACCOUNT_GR');
		if (accountGr.value === 'Z005' && param.custSalesList.length > 0) {
			if (!param.custSalesList[0].SALES_ORG_CD && !param.custSalesList[0].DISTRB_CH && !param.custSalesList[0].DIV_CD) {
				param.custSalesList = [];
			}
		}
		
		if (ACCOUNT_GROUP_FLAG) {
			if (!!param.custSalesList[0] && !param.custSalesList[0].custPartList) {
				var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value || '';
				var custNm = document.querySelector('[data-dbcolumn="CUST_NM"]').value || '';
				var streetNm = document.querySelector('[data-dbcolumn="STREET_NM"]').value || '';
				param.custSalesList[0].custPartList = [];
				param.custSalesList[0].custPartList.push({ PF_TP: 'AG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				param.custSalesList[0].custPartList.push({ PF_TP: 'RE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				param.custSalesList[0].custPartList.push({ PF_TP: 'RG', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
				param.custSalesList[0].custPartList.push({ PF_TP: 'WE', PF_PS_NO: custCd, PF_PS_NM: custNm, STREET_NM: streetNm, DEFAULT_YN: 'Y' });
			}
		}
		
		param.SALES_GR = null;
		param.CUST_GR = null;
		param.SALES_ORG_CD = null;
		param.DISTRB_CH = null;
		param.DIV_CD = null;
		
		return param;
	}
	
	function valid() {
		var isValid = true;
		var inValidElm;
		// check general data mandatory
		Array.prototype.some.call(mandatoryElms, function(elm) {	
			if (!elm.value) {
				elm.focus();
				isValid = false;
				if (!!elm.parentElement.previousSibling) {
					if (inValidElm != undefined) {
						inValidElm = elm.parentElement.previousSibling.previousSibling.querySelector('p').textContent.replace('*', '');
					}
				} else {
					inValidElm = 'Country';
				}
				
				return true;
			}			
		});
		if (!isValid) {
			args = inValidElm + ' [' + '<s:message code='material.generalData'/>' + ']';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			$('#MS01_general_tab a').click()
			return isValid;
		}
		
		// check postal code
		var postalCode = document.getElementById('MS01_POST_CD').value;
		var countryCode = document.querySelector('[data-dbcolumn="COUNTRY_CD"]').value;
// 		if (!checkPostal(postalCode, countryCode)) {
// 			alert('<s:message code="info.checkpost"/>');
// 			return false;
// 		}
		
		// check company mandatory
// 		if (!!custCompCdElm.value) {
// 			Array.prototype.some.call(mandatory2Elms, function(elm) {
// 				if (!elm.value) {
// 					elm.focus();
// 					isValid = false;
// 					if (!!elm.parentElement.previousSibling) {
// 						inValidElm = elm.parentElement.previousSibling.previousSibling.querySelector('p').textContent.replace('*', '');
// 					} else {
// 						inValidElm = '';
// 					}
// 					return true;
// 				}
// 			});
// 			if (!isValid) {
// 				args = inValidElm + ' [' + '<s:message code='customer.CompanyData'/>' + ']';
// 				alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

// 				$('#MS01_company_tab a').click();
// 				return isValid;
// 			}
// 			if (document.getElementById('MS01_DUN_LEVEL_CD').value === '0') {
// 				alert('<s:message code="info.geaterzero"/>');
// 				$('#MS01_company_tab a').click();
// 				return false;
// 			}
// 		}
		
		// check sales mandatory
		var accountGr = document.getElementById('MS01_ACCOUNT_GR');
		if (accountGr.value === 'Z005' && customerInfo.custSalesList.length > 0) {
			if (!customerInfo.custSalesList[0].SALES_ORG_CD && !customerInfo.custSalesList[0].DISTRB_CH && !customerInfo.custSalesList[0].DIV_CD) {
				return true;
			}
		}
		
		customerInfo.custSalesList.some(function(v) {
			var flag = false;
			Array.prototype.some.call(mandatory3Elms, function(elm) {
				if (!v[elm.dataset.sales]) {
					var saleorg = v.SALES_ORG_CD;
					var distrbch = v.DISTRB_CH;
					var divcd = v.DIV_CD;
					
					var ids = $("#salesGrd").jqGrid("getDataIDs");
					var rowid = -1;
					for (var i = 0; i < ids.length; i++) {
						var rowdata = $('#salesGrd').jqGrid('getRowData', ids[i]);						
						if (rowdata.SALES_ORG_CD == saleorg 
							&& rowdata.DISTRB_CH == distrbch 
							&& rowdata.DIV_CD    == divcd) {
							rowid = ids[i];		
							break;
						}
					}	
					$.when($('#salesGrd').jqGrid("setSelection", rowid))
					.done(function () {
						elm.focus();
						flag = true;
						if (!!elm.parentElement.previousSibling) {
							inValidElm = elm.parentElement.previousSibling.previousSibling.querySelector('p').textContent.replace('*', '');
						} else {
							inValidElm = 'Terms of Payment';
						}
						return true;
					});	
				}
				return false;
			});
			if (flag) {
				isValid = false;
				return true;
			}
			return false;
		});
		if (!isValid) {
			args = inValidElm + ' [' + '<s:message code='customer.SalesAreaData'/>' + ']';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
			
			$('#MS01_sales_tab a').click();
			return isValid;
		}
		
		var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;
		if (!custCd) {
			return isValid;
		}
		
		// check duplicated valid
		var duplicated = [];
		customerInfo.custSalesList.some(function(v) {
			var item = v.SALES_ORG_CD + v.DISTRB_CH + v.DIV_CD;
			if (duplicated.indexOf(item) !== -1) {
				isValid = false;
				return true;
			}
			duplicated.push(item);
			return false;
		});
		if (!isValid) {
			alert('<s:message code="info.dupsales"/>');
			$('#MS01_sales_tab a').click();
			return isValid;
		}
		
		// check invalid data
		var duplicatedPfTp;
		customerInfo.custSalesList.some(function(v) {
			v.custPartList.some(function(k) {
				if (!k.PF_TP || !k.PF_PS_NO) {
					duplicatedPfTp = v.SALES_ORG_CD + ' ' + v.DISTRB_CH + ' ' + v.DIV_CD +  ' ' + k.PF_TP;
					isValid = false;
					return true;
				}
				return false;
			});
			if (!isValid) {
				return true;
			} else {
				return false;
			}
		});
		if (!isValid) {
			args = duplicatedPfTp + ' [' + '<s:message code='customer.PtnData'/>' + ']';
			alert("<s:message code='errors.invalid' arguments='" + args + "' javaScriptEscape='false'/>");

			$('#MS01_partner_tab a').click();
			return isValid;
		}
		
		// check duplicated partner functions
		customerInfo.custSalesList.some(function(v) {
			var duplicated = [];
			v.custPartList.some(function(k) {
				if (k.PF_TP === 'AG') {
					if (duplicated.indexOf(k.PF_TP) !== -1) {
						duplicatedPfTp = v.SALES_ORG_CD + ' ' + v.DISTRB_CH + ' ' + v.DIV_CD;;
						isValid = false;
						return true;
					}
					duplicated.push(k.PF_TP);
				}
			});
			if (!isValid) {
				return true;
			} else {
				return false;
			}
		});
		if (!isValid) {
			alert('<s:message code="info.dupinvalid"/>');
			$('#MS01_partner_tab a').click();
			return isValid;
		}
		
		// check duplicated partner functions
		customerInfo.custSalesList.some(function(v) {
			var duplicated = [];
			v.custPartList.some(function(k) {
				if (k.DEFAULT_YN === 'Y') {
					if (duplicated.indexOf(k.PF_TP) !== -1) {
						duplicatedPfTp = v.SALES_ORG_CD + ' ' + v.DISTRB_CH + ' ' + v.DIV_CD +  ' ' + k.PF_TP;
						isValid = false;
						return true;
					}
					duplicated.push(k.PF_TP);
				}
				return false;
			});
			if (!isValid) {
				return true;
			} else {
				return false;
			}
		});
		if (!isValid) {
			alert('<s:message code="info.dupinvalid"/>');
			$('#MS01_partner_tab a').click();
			return isValid;
		}

		var vatNoElm = document.getElementById('MS01_VAT_REG_NO');
		if (!!vatNoElm.value) {
			
			var vatCountry = vatNoElm.value.toUpperCase();
						
			var euCountry = ["AT","BE","BG","CY","CZ","DE","DK","EE","EL","ES","EU","FI","FR","GB","HR","HU","IE","IT","LT","LU","LV","MT","NL","PL","PT","RO","SE","SI","SK"];

			var test = $.inArray(vatCountry.substr(0, 2), euCountry);
			
			document.getElementById('MS01_VAT_REG_NO').value = vatCountry;

			if(test >= 0) {
				if (document.getElementById('MS01_VAT_NO_CHK_YN').value !== 'Y') {
					$('#MS01_general_tab a').click();
					vatNoElm.focus();
					alert('<s:message code="info.checkvat"/>');

					return false; 
				}
			} else {
				document.getElementById('MS01_VAT_NO_CHK_YN').value = 'Y';
			}
// 			alert(document.getElementById('MS01_VAT_NO_CHK_YN').value);
// 			return false;
		}
		
		return isValid;
	}
	
	////////////////////////////////////////////////////////////////////
	// hardcoding
	var qparterGradeElm = document.getElementById('MS01_QPARTNERGRADE');
	qparterGradeElm.addEventListener('change', function(e) {
		if (!!qparterGradeElm.value) {
			qparterElm.value = 'Y';
		}
	});
	
	var qparterElm = document.getElementById('MS01_QPARTNER');
	qparterElm.addEventListener('change', function(e) {
		if (qparterElm.value === 'N') {
			qparterGradeElm.value = '';
		}
	});
	
// 	var custCompCdElm = document.getElementById('MS01_CUST_COMP_CD');
// 	$(custCompCdElm).on('change', function(e) {
// 		Array.prototype.forEach.call(companyCodeElms, function(elm) {
// 			if (!!custCompCdElm.value) {
// 				if (elm.dataset.dbcolumn === 'TERM_PAY_CD' || elm.dataset.dbcolumn === 'VAL_TO_DATE' || elm.dataset.dbcolumn === 'APPLY_DATE' || elm.dataset.dbcolumn === 'EXPIRE_DATE') {
// 					elm.nextSibling.removeAttribute('disabled');
// 				} else {
// 					elm.removeAttribute('disabled');
// 				}
// 			} else {
// 				if (elm.dataset.dbcolumn === 'TERM_PAY_CD' || elm.dataset.dbcolumn === 'VAL_TO_DATE' || elm.dataset.dbcolumn === 'APPLY_DATE' || elm.dataset.dbcolumn === 'EXPIRE_DATE') {
// 					elm.nextSibling.setAttribute('disabled', 'disabled');
// 				} else {
// 					elm.setAttribute('disabled', 'disabled');
// 				}
// 				elm.value = '';
// 			}
// 		});
		
// 		if (!custCompCdElm.value) {
// 			$('[data-dbcolumn="TERM_PAY_CD"]')[0].nextSibling.nextSibling.textContent = '';
// 			$('#MS01_PAY_HIST_YN').prop('checked', true);
// 		}
// 	});
	
	function getCurrentSales() {
		if (!!customerInfo.tmpSales) {
			return customerInfo.tmpSales;
		}
		
		var selRow = $('#salesGrd').jqGrid('getGridParam', 'selrow');
		if (!!selRow) {
			var index = $('#' + selRow)[0].rowIndex;
			return customerInfo.custSalesList[index - 1];
		} else {
			if (customerInfo.custSalesList.length > 0) {
				salesOrgCd = customerInfo.custSalesList[0].SALES_ORG_CD;
				distrbCh = customerInfo.custSalesList[0].DISTRB_CH;
				divCd = customerInfo.custSalesList[0].DIV_CD;
				return customerInfo.custSalesList[0];
			}
		}
	}
	
	function bindSalesElms() {
		Array.prototype.forEach.call(salesElms, function(elm) {
			if (elm.type === 'text') {
				$(elm).on('input', function(e) {
					var sales = getCurrentSales();
					sales[elm.dataset.sales] = elm.value;
					
					if (elm.dataset.sales === 'LIST_PRICE') {
						sales.LIST_PRICE_NM = e.currentTarget.nextSibling.nextSibling.textContent;
					}
					if (elm.dataset.sales === 'TERM_PAY_CD') {
						sales.TERM_PAY_NM = e.currentTarget.nextSibling.nextSibling.textContent;
					}
					if (elm.dataset.sales === 'SALES_GR') {
						sales.SALES_GR_NM = e.currentTarget.nextSibling.nextSibling.textContent;
					}
				});
				$(elm).on('change', function(e) {
					var sales = getCurrentSales();
					sales[elm.dataset.sales] = elm.value;
					
					if (elm.dataset.sales === 'LIST_PRICE') {
						sales.LIST_PRICE_NM = e.currentTarget.nextSibling.nextSibling.textContent;
					}
					if (elm.dataset.sales === 'TERM_PAY_CD') {
						sales.TERM_PAY_NM = e.currentTarget.nextSibling.nextSibling.textContent;
					}
					if (elm.dataset.sales === 'SALES_GR') {
						sales.SALES_GR_NM = e.currentTarget.nextSibling.nextSibling.textContent;
					}
				});
			} else {
				$(elm).on('change', function(e) {
					var sales = getCurrentSales();
					if (elm.type === 'checkbox') {
						sales[elm.dataset.sales] = $(elm).prop('checked') ? 'Y' : 'N';
					} else {
						sales[elm.dataset.sales] = elm.value;
					}
				});
			}
			
			/*
			if (elm.dataset.sales === 'SALES_GR') {
				elm.addEventListener('click', function(e) {
					var sales = getCurrentSales();
					sales[elm.dataset.sales] = elm.value;
				});
			}
			*/
		});
	}
	
	var vatElm = document.getElementById('MS01_CreditCustomer_checkVat');
	vatElm.addEventListener('click', function(e) {
		
		var vatNo = document.getElementById('MS01_VAT_REG_NO').value.toUpperCase();
		if (!vatNo) {
			alert('<s:message code="error.inputvat"/>');
			return;
		}
		document.getElementById('MS01_VAT_REG_NO').value = vatNo.toUpperCase();
		var param = {
			VAT_REG_NO: vatNo
		};
		
		var euCountry = ["AT","BE","BG","CY","CZ","DE","DK","EE","EL","ES","EU","FI","FR","GB","HR","HU","IE","IT","LT","LU","LV","MT","NL","PL","PT","RO","SE","SI","SK"];

		var test = $.inArray(vatNo.substr(0, 2), euCountry);

		if(test < 0) {
			return false;
		}
				
		fn_ajax('/remote/checkEuropeanCommission.do', true, param, function(data) {
			var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
			var elm = xml.querySelector('valid');
			if (!!elm) {
				if (elm.textContent === 'false') {
					alert('<s:message code="info.invalidvat"/>');
				} else {
					//vatElm.setAttribute('disabled', 'disabled');
					//document.getElementById('MS01_VAT_REG_NO').setAttribute('disabled', 'disabled');
					document.getElementById('MS01_VAT_NO_CHK_YN').value = 'Y';
					document.getElementById('MS01_VAT_NO_CHK_YN_NM').textContent = 'OK';	
					
					var country = xml.querySelector('countryCode').textContent;
					var vatNumber = xml.querySelector('vatNumber').textContent;
					var reqDate = xml.querySelector('requestDate').textContent;
					var name = xml.querySelector('name').textContent;
					var address = xml.querySelector('address').textContent;					
					$("#MS01_VAT_NO_CHK_YN").data("commissioninfo", {CUST_NM: name, ADDRESS: address, REQDT: reqDate});
					
					alert('<s:message code="info.vatnum"/>');
				}
			} else {
				elm = xml.querySelector('faultstring');
				if (!!elm) {
					alert(elm.textContent);
				}
			}
		});	
		
	});
	
	function openVatPopup() {		
	
		var sEnter = "\r\n", sTab="\t";
		var vatregno="", custcd="", custnm="";
		var stree1="", stree2="", housenumber="", postalcode="", cityname="";
		var ecustnm="", eaddress="", erequestday="";
		
		vatregno = $("#MS01_VAT_REG_NO").val();
		custcd = $("input[data-dbcolumn=CUST_CD]").val();
		custnm = $("input[data-dbcolumn=CUST_NM]").val();		
		stree1 = $("#MS01_STREET_NM").val();
		stree2 = $("#MS01_STREET_NM2").val();
		housenumber = $("#MS01_HAUS_NO").val();
		postalcode = $("#MS01_POST_CD").val();
		cityname = $("#MS01_CITY_NM").val();
				
		var commissioninfo = $("#MS01_VAT_NO_CHK_YN").data("commissioninfo");
		if (commissioninfo != null && commissioninfo != undefined) {
			ecustnm = commissioninfo.CUST_NM;
			eaddress = commissioninfo.ADDRESS;
			erequestday = commissioninfo.REQDT;
		}
		
		var content = "";
		content += "VAT Reg No. : " + vatregno + sEnter;
		content += "Customer Code : " + custcd + sEnter;
		content += "Customer name : " + custnm + sEnter;
		content += "Customer Address : " + sEnter;
		content += "Street1 : " + stree1 + sEnter;
		content += "Street2 : " + stree2 + sEnter;
		content += "House Number : " + housenumber + sEnter;
		content += "Postal Code : " + postalcode + sEnter;
		content += "City Name : " + cityname;					
		content += sEnter;			
		
		content += "----------------------------------------------------------------------------------------"+ sEnter;
	    customerInfo.custSalesList.some(function(v) {
			var saleorg = v.SALES_ORG_CD;
			var distrbch = v.DISTRB_CH;
			var divcd = v.DIV_CD;
			var terms = v.TERM_PAY_CD;
			
			content += "Sales Organization : " + saleorg + sTab;	
			content += "Distribution Channel : " + distrbch + sTab;
			content += "Division : " + divcd + sTab;
			content += "Terms of Payment : " + terms + sEnter;
	    });	    
	    content += "----------------------------------------------------------------------------------------"+ sEnter;		    
	    content += sEnter;
	    content += "Euro commission info" + sEnter;
	    content += "----------------------------------------------------------------------------------------"+ sEnter;
	    content += "Customer name : " + ecustnm + sEnter;
	    content += "Address : " + sEnter;
	    content += eaddress + sEnter;
	    content += "Request day , time : " + erequestday + sEnter;
	    content += "----------------------------------------------------------------------------------------"+ sEnter;
	
		var url = "/popup/mailPreview.do";
		var pid = "MailPreviewPopup";
		var param = { 
				'MAIL_CD': 'CM'
			  , 'MAIL_LANG': getCookie("Language")
			  , 'BTN_YN': 'Y'	
			  , 'MAILCONTENT': content
			  , 'CUST_CD' : custcd
			  , 'CUST_NM' : custnm
			  , 'VAT_REG_NO' : vatregno
		};		
		param.window = window;
		popupOpen(url, pid, param);	
	};
	
	
	var extVatElm = document.getElementById('MS01_CreditCustomer_extVat');
	extVatElm.addEventListener('click', function(e) {
		var param = {};
		param.custVatList = customerInfo.custVatList;
		param.window = window;
		popupOpen('/customer/vatSearchPopup.do', 'VatSearchPopup', param, function(e, result) {
			if (!!result) {
				customerInfo.custVatList = result.custVatList;
			}
		});
	});
	
	function setActiveSales(actived) {
		if (actived) {
			document.getElementById('MS01_SALES_ORG_CD').removeAttribute('disabled');
			document.getElementById('MS01_DISTRB_CH').removeAttribute('disabled');
			document.getElementById('MS01_DIV_CD').removeAttribute('disabled');
		} else {
			document.getElementById('MS01_SALES_ORG_CD').setAttribute('disabled', 'disabled');
			document.getElementById('MS01_DISTRB_CH').setAttribute('disabled', 'disabled');
			document.getElementById('MS01_DIV_CD').setAttribute('disabled', 'disabled');
		}
	}
	
	function redrawSaleOffice() {
		var salesOrgCd = document.getElementById('MS01_SALES_ORG_CD').value;
		var distrbCh = document.getElementById('MS01_DISTRB_CH').value;
		var divCd = document.getElementById('MS01_DIV_CD').value;
		
		if (!salesOrgCd || !distrbCh || !divCd) {
			return;
		}
		setTimeout(function() {
			var param = {
				HEAD_ID: 'SALES_OFFICE_CD',
				CODE: salesOrgCd + distrbCh + divCd
			};
			fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
				var elm = document.getElementById('MS01_SALES_OFFICE_CD');
				var context = '<option value=""></option>';
				Array.prototype.forEach.call(data.RESULT, function(v) {
					context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
			});
		});
	}
	
	function redrawDeliveryPlant() {
		var salesOrgCd = document.getElementById('MS01_SALES_ORG_CD').value;
		var distrbCh = document.getElementById('MS01_DISTRB_CH').value;
		
		if (!salesOrgCd || !distrbCh) {
			return;
		}
		setTimeout(function() {
			var param = {
				HEAD_ID: 'DELI_PLANT_CD',
				CODE: salesOrgCd + distrbCh
			};
			fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
				var elm = document.getElementById('MS01_DELI_PLANT_CD');
				var context = '<option value=""></option>';
				Array.prototype.forEach.call(data.RESULT, function(v) {
					context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
			});
		});
	}
	
	$('#MS01_SALES_ORG_CD').on('change', function(e) {
		redrawSaleOffice();
		redrawDeliveryPlant();
	});
	$('#MS01_DISTRB_CH').on('change', function(e) {
		redrawSaleOffice();
		redrawDeliveryPlant();
	});	
	$('#MS01_DIV_CD').on('change', function(e) {
		redrawSaleOffice();
	});
	/*
	$('#MS01_SALES_OFFICE_CD').on('change', function(e) {
		setTimeout(function() {
			var param = {
				HEAD_ID: 'SALES_GR',
				CODE: $('#MS01_SALES_OFFICE_CD').val()
			};
			fn_ajax('/common/retrieveCommonCodeByRef.do', true, param, function(data) {
				var elm = document.getElementById('MS01_SALES_GR');
				var context = '<option value=""></option>';
				Array.prototype.forEach.call(data.RESULT, function(v) {
					context += '<option value="' + v.CODE + '">' + v.CODE + ' - ' + v.CODE_NM + '</option>';
				});
				elm.innerHTML = context;
			});
		});
	});
	*/
	
	var accountGr = document.getElementById('MS01_ACCOUNT_GR');
	accountGr.addEventListener('change', function(e) {
		//redrawSales();
		//setProspective(accountGr.value);
	});
	
	function setProspective(value) {
		return;
		if (!!document.querySelector('[data-dbcolumn="CUST_CD"]').value) {
			//accountGr.setAttribute('disabled', 'disabled');
		}
		
		$('#MS01_general_tab a').trigger('click');
		if (value === 'Z005') {
			//document.getElementById('MS01_company_tab').style.display = 'none';
			document.getElementById('MS01_sales_tab').style.display = 'none';
			document.getElementById('MS01_partner_tab').style.display = 'none';
		} else {
			//document.getElementById('MS01_company_tab').style.display = 'block';
			document.getElementById('MS01_sales_tab').style.display = 'block';
			document.getElementById('MS01_partner_tab').style.display = 'block';
		}
	}
	$('#MS01_INCOTERMS_CD').on('change', function(e) {
// 		var text = $('#MS01_INCOTERMS_CD>option:selected').text();
// 		var index = text.indexOf(']');
// 		index += 2;
		
		if ( $('#MS01_INCOTERMS_NM').val() == '') {
			$('#MS01_INCOTERMS_NM').val("");
		}
		$('#MS01_INCOTERMS_NM').trigger('input');
	});
	$('#MS01_SALES_GR_BUTTON').on('click', function(e) {
		var refCode =$('#MS01_SALES_OFFICE_CD').val();
		fn_popComm('SALES_GR', '', '', function(data) {
			if (!!data && !!data[0]) {
				$('#MS01_SALES_GR').val(data[0].CODE);
				$('#MS01_SALES_GR_TEXT').text(data[0].NAME);
				$('#MS01_SALES_GR').trigger('change');
			}
		}, refCode);
	});
	////////////////////////////////////////////////////////////////////
	
	
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	function cSearch() {
		var param = {};
		Array.prototype.forEach.call(searchElms, function(elm) {
			var value = elm.value;
			if (!!value) {
				param = param || {};
				var column = elm.dataset.searchcolumn;
				value = value.replace(/\*/g , '%');
				param[column] = value;
			}
		});
		param.QPARTNER = document.getElementById('MS01_QPARTNER').value;
		
		ACCOUNT_GROUP_FLAG = false;

		if (!param.CUST_CD && !param.CUST_NM && !param.SEARCH_NM1 && !param.SEARCH_NM2) {
			param.window = window;
			popupOpen('/customer/customerSearchPopup.do', 'CustomerSearchPopup', param, function(e, selecedData) {
				if (!!selecedData) {
					$('#MS01_general_tab a').click();
					customerInfo = selecedData;
					if (customerInfo.ACCOUNT_GR === 'Z005') {
						ACCOUNT_GROUP_FLAG = true;
					}
					
					if (!!customerInfo.custSalesList[0]) {
						setActiveSales(false);
						salesOrgCd = selecedData.SALES_ORG_CD || '';
						distrbCh = selecedData.DISTRB_CH || '';
						divCd = selecedData.DIV_CD || '';
						redrawData();
						setTimeout(function() {
							$('#salesGrd').jqGrid("setSelection", '1');
						}, 200);
					} else {
						setActiveSales(true);
						customerInfo.custSalesList.push({});
						redrawData();
					}
					
					setProspective(customerInfo.ACCOUNT_GR);
					document.getElementById('MS01_DUN_PROC_CD').setAttribute('disabled', 'disabled');
					document.getElementById('MS01_DUN_LEVEL_CD').setAttribute('disabled', 'disabled');
					//$("#OLD_REQ_CREDIT").val(customerInfo.REQ_CREDIT || '0');
					
					oldReq = customerInfo.REQ_CREDIT;
					
					// if account group equal 'Z001' then disable 'Z005' option element
					var agroup = $("#MS01_ACCOUNT_GR").val();
					if (agroup  == "Z001") {
						$("#MS01_ACCOUNT_GR option[value='Z005']").prop("disabled", true);  
					} else {
						$("#MS01_ACCOUNT_GR option[value='Z005']").prop("disabled", false); 
					}
				}

				edtType = '';
				selectContactReportTab();initContactReportTab();
				btGrid.gridResizing('contactReportGrid');
				selectContactReportTab();
			});
			return;
		}
		
		fn_ajax('/customer/retrieveGeneral.do', true, param, function(data) {
			if (!data.RESULT) {
				return;
			}
			
			if (data.RESULT.length > 1) {
				if (!!data.RESULT[0].ACCOUNT_GR) {
					data.RESULT = data.RESULT.slice(0, 1);
				}
			}
			
			if (data.RESULT.length > 1) {
				param.result = data.RESULT;
				param.window = window;
				popupOpen('/customer/customerSearchPopup.do', 'CustomerSearchPopup', param, function(e, selecedData) {
					if (!!selecedData) {
						$('#MS01_general_tab a').click();
						customerInfo = selecedData;
						if (customerInfo.ACCOUNT_GR === 'Z005') {
							ACCOUNT_GROUP_FLAG = true;
						}
						
						if (!!customerInfo.custSalesList[0]) {
							setActiveSales(false);
							salesOrgCd = selecedData.SALES_ORG_CD || '';
							distrbCh = selecedData.DISTRB_CH || '';
							divCd = selecedData.DIV_CD || '';
							redrawData();
							setTimeout(function() {
								$('#salesGrd').jqGrid("setSelection", '1');
							}, 200);
						} else {
							setActiveSales(true);
							customerInfo.custSalesList.push({});
							redrawData();
							/*
							setTimeout(function() {
								document.querySelector('[data-sales="CURR_CD"]').value = 'EUR';
								document.querySelector('[data-sales="DELI_PLANT_CD"]').value = '1000';
							}, 100);
							*/
						}
						
						setProspective(customerInfo.ACCOUNT_GR);
						document.getElementById('MS01_DUN_PROC_CD').setAttribute('disabled', 'disabled');
						document.getElementById('MS01_DUN_LEVEL_CD').setAttribute('disabled', 'disabled');
						//$("#OLD_REQ_CREDIT").val(customerInfo.REQ_CREDIT || '0');
						oldReq = customerInfo.REQ_CREDIT;
					}

					edtType = '';
					selectContactReportTab();initContactReportTab();
					btGrid.gridResizing('contactReportGrid');
					selectContactReportTab();
				});
				
			} else if (data.RESULT.length === 1) {
				$('#MS01_general_tab a').click();
				customerInfo = data.RESULT[0];
				if (customerInfo.ACCOUNT_GR === 'Z005') {
					ACCOUNT_GROUP_FLAG = true;
				}
				
				if (!!customerInfo.custSalesList[0]) {
					setActiveSales(false);
					salesOrgCd = customerInfo.custSalesList[0].SALES_ORG_CD;
					distrbCh = customerInfo.custSalesList[0].DISTRB_CH;
					divCd = customerInfo.custSalesList[0].DIV_CD;
					setTimeout(function() {
						$('#salesGrd').jqGrid("setSelection", '1');
					}, 200);
					redrawData();
				} else {
					setActiveSales(true);
					customerInfo.custSalesList.push({});
					redrawData();
					/*
					setTimeout(function() {
						document.querySelector('[data-sales="CURR_CD"]').value = 'EUR';
						document.querySelector('[data-sales="DELI_PLANT_CD"]').value = '1000';
					}, 100);
					*/
				}
				
				setProspective(customerInfo.ACCOUNT_GR);
				document.getElementById('MS01_DUN_PROC_CD').setAttribute('disabled', 'disabled');
				document.getElementById('MS01_DUN_LEVEL_CD').setAttribute('disabled', 'disabled');
				//$("#OLD_REQ_CREDIT").val(customerInfo.REQ_CREDIT || '0');
				oldReq = customerInfo.REQ_CREDIT;
				
				edtType = '';
				selectContactReportTab();initContactReportTab();
				btGrid.gridResizing('contactReportGrid');
				selectContactReportTab();
			} else if (data.RESULT.length === 0) {
				alert('<s:message code="validator.notfound"/>');
			}
				
		});
	}
	
	////////////////////////////////////////////////////////////////////
	// Create
	////////////////////////////////////////////////////////////////////
	function cAdd() {
		if (!confirm("<s:message code='info.newtab'/>")) {
			return;
		}
		addNewTab('/customer/Customer.do', 'New Customer');
	}
	
	function create() {
		btGrid.gridSaveRow('contactPersonGrd');
		btGrid.gridSaveRow('salesGrd');
		btGrid.gridSaveRow('taxesGrd');
		btGrid.gridSaveRow('pfGrd');

		btGrid.gridSaveRow('contactReportGrid');
		
		if (valid()) {
			if (!confirm("<s:message code='confirm.save'/>")) {
				return;
			}
			
			var param = value2request()
			fn_ajax('/customer/insertGeneral.do', true, param, function(data) {
				alert('<s:message code="success.insert"/>');
				$('#MS01_general_tab a').click();
				ACCOUNT_GROUP_FLAG = false;
				if (!!data.RESULT) {
					var accountGr = document.getElementById('MS01_ACCOUNT_GR');
					if (accountGr.value === 'Z005') {
						ACCOUNT_GROUP_FLAG = true;
						document.querySelector('[data-dbcolumn="CUST_CD"]').value = data.RESULT[0].CUST_CD;
					}
					
					customerInfo = data.RESULT[0];
					if (!!customerInfo.custSalesList[0]) {
						setActiveSales(false);
						salesOrgCd = customerInfo.custSalesList[0].SALES_ORG_CD;
						distrbCh = customerInfo.custSalesList[0].DISTRB_CH;
						divCd = customerInfo.custSalesList[0].DIV_CD;
						redrawData();
						setTimeout(function() {
							$('#salesGrd').jqGrid("setSelection", '1');
						}, 200);
					} else {
						setActiveSales(true);
						customerInfo.custSalesList.push({});
						redrawData();
						/*
						setTimeout(function() {
							document.querySelector('[data-sales="CURR_CD"]').value = 'EUR';
							document.querySelector('[data-sales="DELI_PLANT_CD"]').value = '1000';
						}, 100);
						*/
					}
					
					setProspective(customerInfo.ACCOUNT_GR);
					document.getElementById('MS01_DUN_PROC_CD').setAttribute('disabled', 'disabled');
					document.getElementById('MS01_DUN_LEVEL_CD').setAttribute('disabled', 'disabled');
					//$("#OLD_REQ_CREDIT").val(customerInfo.REQ_CREDIT || '0');
				}

				///$("#OLD_REQ_CREDIT").val($("#OLD_REQ_CREDIT").val() || '0');
				$("#OLD_REQ_CREDIT").val(oldReq || '0');

				if($("#OLD_REQ_CREDIT").val().split('.').join('') != $("#MS01_REQ_CREDIT").val().split('.').join('') 
					&& $("#MS01_REQ_CREDIT").val().split('.').join('') > 0
					&& $('#MS01_ACCOUNT_GR').val() === 'Z001'){
					Send_Email('RC');
				}
			
				if ($('#MS01_ACCOUNT_GR').val() === 'Z001' && document.getElementById('MS01_VAT_NO_CHK_YN').value == 'Y' ) {
				//if (!$("#MS01_CUST_COMP_CD option:selected").val() && $('#MS01_ACCOUNT_GR').val() === 'Z001') {
					Send_Email('CM');
					//openVatPopup();
				}
			});
		}
	}
	
	////////////////////////////////////////////////////////////////////
	// Modify
	////////////////////////////////////////////////////////////////////
	function cSave() {
		
		btGrid.gridSaveRow('contactPersonGrd');
		btGrid.gridSaveRow('salesGrd');
		btGrid.gridSaveRow('taxesGrd');
		btGrid.gridSaveRow('pfGrd');
		

		btGrid.gridSaveRow('contactReportGrid');
		
		if (!document.querySelector('[data-dbcolumn="CUST_CD"]').value) {
			create();
			return;
		}
		
		/*
		var accountGr = document.getElementById('MS01_ACCOUNT_GR');
		if (ACCOUNT_GROUP_FLAG && accountGr.value !== 'Z005') {
			create();
			return;
		}
		*/
		
		if (valid()) {
			var param = value2request();
			fn_ajax('/customer/updateGeneral.do', true, param, function(data) {
				alert('<s:message code="success.update"/>');
				$('#MS01_general_tab a').click();
				ACCOUNT_GROUP_FLAG = false;
				if (!!data.RESULT) {
					var accountGr = document.getElementById('MS01_ACCOUNT_GR');
					if (accountGr.value === 'Z005') {
						ACCOUNT_GROUP_FLAG = true;
						document.querySelector('[data-dbcolumn="CUST_CD"]').value = data.RESULT[0].CUST_CD;
					}
					
					customerInfo = data.RESULT[0];
					if (!!customerInfo.custSalesList[0]) {
						salesOrgCd = customerInfo.custSalesList[0].SALES_ORG_CD;
						distrbCh = customerInfo.custSalesList[0].DISTRB_CH;
						divCd = customerInfo.custSalesList[0].DIV_CD;
						redrawData();
						setTimeout(function() {
							$('#salesGrd').jqGrid("setSelection", '1');
						}, 200);
					} else {
						setActiveSales(true);
						customerInfo.custSalesList.push({});
						redrawData();
						/*
						setTimeout(function() {
							document.querySelector('[data-sales="CURR_CD"]').value = 'EUR';
							document.querySelector('[data-sales="DELI_PLANT_CD"]').value = '1000';
						}, 100);
						*/
					}
					
					setProspective(customerInfo.ACCOUNT_GR);
					document.getElementById('MS01_DUN_PROC_CD').setAttribute('disabled', 'disabled');
					document.getElementById('MS01_DUN_LEVEL_CD').setAttribute('disabled', 'disabled');
				}
				

				$("#OLD_REQ_CREDIT").val(oldReq || '0');
				
				if($("#OLD_REQ_CREDIT").val().split('.').join('') != $("#MS01_REQ_CREDIT").val().split('.').join('') 
					&& $("#MS01_REQ_CREDIT").val().split('.').join('') > 0
					&& $('#MS01_ACCOUNT_GR').val() === 'Z001'){
					Send_Email('RC');
				}
				if ($('#MS01_ACCOUNT_GR').val() === 'Z001' && document.getElementById('MS01_VAT_NO_CHK_YN').value == 'Y' ) {
				//if (!$("#MS01_CUST_COMP_CD option:selected").val() && $('#MS01_ACCOUNT_GR').val() === 'Z001') {
					Send_Email('CM');
					//openVatPopup();
				}
			});
		}
	}
	
	////////////////////////////////////////////////////////////////////
	// Copy
	////////////////////////////////////////////////////////////////////
	function cUser1() {
		create();
	}
	
	function Send_Email(type){
		function sendEmail() {
			var url = '/common/sendEmailCust.do';
			var param = {
				MAIL_CD : type,
				CUST_CD: document.querySelector('[data-dbcolumn="CUST_CD"]').value,
				CUST_NM :document.querySelector('[data-dbcolumn="CUST_NM"]').value,
				AMOUNT : document.querySelector('[data-dbcolumn="REQ_CREDIT"]').value
			};

			fn_ajax(url, true, param, function(data, xhr){
				if(!fn_empty(data)) {
					if(type =='RC') {
						$("#OLD_REQ_CREDIT").val($("#MS01_REQ_CREDIT").val().split('.').join('') || '0');
						oldReq = $("#MS01_REQ_CREDIT").val().split('.').join('') || '0';
						
						alert('<s:message code="success.rmmail"/>');
					}
					if(type == 'CM') {
						//alert('<s:message code="success.cmmail"/>');
						return true;
					}
				}
			});
		}

		if (type === 'CM') {
			var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;

			if (!!custCd) {
				custCd = new Array(10 - custCd.length + 1).join('0') + custCd;
				fn_ajax('/common/retrieveCustomer.do', true, { CUST_CD: custCd }, function(data) {
					if (!!data.RESULT) {
						Array.prototype.some.call(data.RESULT, function(v) {
							if (v.tableName === 'ET_ZZKNB1' && v.rows.length === 0) {
								//if (confirm('<s:message code="customer.cmmail"/>') == true) {
									//sendEmail();
									openVatPopup();
									//return true;
								//} else {
									//return false;
								//}
							}
							return false;
						});
					}
				});
			}				
		} else {
			sendEmail();
		}
	}
	
	function saveInteractLog(edtType) {
		
		if(!fn_inputCheckByPrefix('frmGeneral', 'SL07-')){
			return;
		}
		var custCd = document.querySelector('[data-dbcolumn="CUST_CD"]').value;
		
// 		if ( $('#SL07-ACCOUNT_CD').val() == '' ) {
// 			args = '<s:message code='lead.account'/>';
// 			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

// 			return;
// 		}
		
		if(confirm("<s:message code='confirm.save'/>")){

			var contRpt = formIdAllToMap('frmContRpt');
			var contRptNote = {"REPORT_NOTE" : $('#SL07-REPORT_NOTE').val()};
			
			var param = {"param" : {  "CUST_CD" : custCd
									, "contRpt" : contRpt
									, "contRptNote" : contRptNote
									, "GBN" : edtType  }
						};

			
			var url = '/customer/saveContactReport.do';
			
			fn_ajax(url, false, param, function(data, xhr){

				alert("<s:message code='info.save'/>");
				
				initContactReportTab();
				btGrid.gridResizing('contactReportGrid');
				selectContactReportTab();
			});
			
		}
	}
	
	function twoWeeks() {		
		var now = new Date();
		now.setDate(now.getDate()+14);
		
		var dd = now.getDate();
		var mm = now.getMonth()+1;
		var yyyy = now.getFullYear();

		if(dd < 10) {
			dd='0'+dd
		}
		
		if(mm < 10) {
			mm='0'+mm
		}
		
		var twoWeeks = dd + '.' + mm + '.' + yyyy;
		
		return 	twoWeeks;
	}
	

	function openCustomerPopUp(custVal, type){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		var objCd = '';
		var objNm = '';
		
		if('CUST' == type) {
			obj = $('#SL07-CUST_CD');
			objNm = $('#SL07-CUST_NM');
		} else if('CONTACT' == type) {
			obj = $('#SL07-MAIN_CONTACT');
			objNm = $('#SL07-MAIN_CONTACT_NM');
		} else if('EMP' == type) {
			obj = $('#SL07-EMP_RESP');
			objNm = $('#SL07-EMP_RESP_NM');
		} else if('ACCOUNT' == type) {
			obj = $('#SL07-ACCOUNT_CD');
			objNm = $('#SL07-ACCOUNT_NM');
		}
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if (!selecedData) {
				return;
			}
			
			$.each(selecedData, function(k, v) {
				// STREET_NM + ' ' + HAUS_NO + ' / ' + COUNTRY + '-' + POST_CD + ' ' + CITY_NM
				('CUST_CD' == k) ? obj.val(v) : '';
				('CUST_NM' == k) ? objNm.text(v) : '';

				if('CUST' == type){
					if('CUST_CD' == k){
						var obj2 = $('#S-ACCOUNT');
						obj2.val(v);
					}else if('CUST_NM' == k){
						var objNm2 = $('#S-CUST_NM');
						objNm2.text(v);
					}else if('SALES_ORG_CD' == k){
						var obj2 = $('#SL07-SALES_ORG_CD');
						obj2.val(v);
					}else if('DISTRB_CH' == k){
						var obj2 = $('#SL07-DISTRB_CH');
						obj2.val(v);
					}else if('DIV_CD' == k){
						var obj2 = $('#SL07-DIV_CD');
						obj2.val(v);
					}else  if('STREET_NM' == k){
						var stnm = selecedData.STREET_NM;
						var hno = selecedData.HAUS_NO;
						var crnm = selecedData.COUNTRY;
						var pstcd = selecedData.POST_CD;
						var ctnm = selecedData.CITY_NM;
						var addr = '';
						
						if ( stnm != undefined ) addr = addr + stnm + ' ';
						if ( hno != undefined ) addr = addr + hno + ' / ';
						if ( crnm != undefined ) addr = addr + crnm + '-';
						if ( pstcd != undefined ) addr = addr + pstcd + ' ';
						if ( ctnm != undefined ) addr = addr + ctnm;

						var obj2 = $('#SL07-ADDRESS');
						obj2.val(addr);
					}else if('SALES_OFFICE_CD' == k){
						
						if ( v != '' ) soff = v;
						if ( soff != '' ) {
							$('#SL07-SALES_OFFICE_CD').removeAttr('disabled');
							
							var url = "/lead/selectSalesOffice.do";
							var param = {"param" : { "SALES_ORG_CD" : $('#SL07-SALES_ORG_CD').val()
								                   , "DISTRB_CH" : $('#SL07-DISTRB_CH').val()
								                   , "DIV_CD" : $('#SL07-DIV_CD').val()
								                   }
							            };
							
							fn_ajax(url, false, param, function(data, xhr){
								var retVal = data.result.split(';');
								
								$("#SL07-SALES_OFFICE_CD").empty().data('options');
								
								if(flag){
									$("#SL07-SALES_OFFICE_CD").append('<option value=' + "" + '></option>');
								}					
								
								if(!fn_empty(data.result)){
									for(j = 0; j < retVal.length; j++){
										var tempVal = retVal[j].split(':');
										$("#SL07-SALES_OFFICE_CD").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
									}
								}else{
									$('#SL07-SALES_OFFICE_CD').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
								}
							});
						}
						
						$('#SL07-SALES_OFFICE_CD').val(v);
					}else if('SALES_GR' == k){
						
						if ( v != '' ) sgr = v;
						if ( sgr != '' ) {

							$('#SL07-SALES_GR').removeAttr('disabled');
							
							var url = "/salesOrder/selectSalesGrp.do";
							var param = {"param" : {"SALES_ORG" : $('#SL07-SALES_OFFICE_CD').val()}};
							
							fn_ajax(url, false, param, function(data, xhr){
								var retVal = data.result.split(';');
								
								$("#SL07-SALES_GR").empty().data('options');
								
								if(flag){
									$("#SL07-SALES_GR").append('<option value=' + "" + '></option>');
								}					
								
								if(!fn_empty(data.result)){
									for(j = 0; j < retVal.length; j++){
										var tempVal = retVal[j].split(':');
										$("#SL07-SALES_GR").append('<option value=' + tempVal[0] + '>' +  tempVal[1] + '</option>');
									}
								}else{
									$('#SL07-SALES_GR').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
								}
							});
						}
						$('#SL07-SALES_GR').val(v);
					}
				} else if('ACCOUNT' == type) {
					if('CUST_CD' == k){
						var obj3 = $('#SL07-ACCOUNT_CD');
						obj3.val(v);
					}else if('CUST_NM' == k){
						var objNm3 = $('#SL07-ACCOUNT_NM');
						objNm3.text(v);
					}
				}
			
			
			});
			
		});		
	}
	
	function openEmpPopup(code, name) {
		var gridData, resultData = [];
		var popflg = true;
		var compCdVal = parent.$('#G_COMP_CD').val();

		var sendData = {
				  'S_CODE':$('[name="' + code + '"]').val()
				, 'S_COMP_CD':compCdVal
				};
		
		var url = '/popup/UserPopup2.do';
		var pid = 'UserPopup2';
		
		popupOpen(url, pid, sendData, function(data) {
			if(!fn_empty(data)){
				$('[name="' + code + '"]').val(data[0].USER_ID);
				$('[name="' + name + '"]').text(data[0].NAME_FULL);
			}
		});
	}

	function openContactPersonPopup(code, name) {
		var url = "/popup/ContactPersonPopup2.do";
		var pid = "ContactPersonPopup2";  //팝업 페이지의 취상위 div ID
		var param = {CUST_CD : $("#S-ACCOUNT").val()};
		
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				$('[name="' + code + '"]').val(data[0].CODE);
				$('[name="' + name + '"]').text(data[0].FULL_NM);
				
			}
		});
	}
	
	window.cSearch = cSearch;
	window.cAdd = cAdd;
	window.cSave = cSave;
	window.cUser1 = cUser1;
	window.grid_cbox_onclick = grid_cbox_onclick;
	window.hdCheckboxAll = hdCheckboxAll;
	
	// loaded
	setTimeout(function() {
		initialize();
		document.getElementById('cBtnAdd').innerHTML = 'New';
		
		var copyBtnElm = document.getElementById('cBtnUser1');
		copyBtnElm.innerHTML = 'Copy';
		copyBtnElm.classList.add('cBtnCopy_style');
	}, 500);
})()
</script>

<c:import url="../import/frameBottom.jsp" />