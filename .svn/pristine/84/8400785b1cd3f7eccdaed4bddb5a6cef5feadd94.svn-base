<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Lead
	 * @Description : Lead Entry
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="SL07" />
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
	<form id="frmSearch" action="#">
	<input type="hidden"  name="noteGrid_CURRENT_PAGE"  id="noteGrid_CURRENT_PAGE" />
	<input type="hidden"  name="noteGrid_ROWS_PER_PAGE" id="noteGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="productsGrid_CURRENT_PAGE"  id="productsGrid_CURRENT_PAGE" />
	<input type="hidden"  name="productsGrid_ROWS_PER_PAGE" id="productsGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="partInvGrid_CURRENT_PAGE"  id="partInvGrid_CURRENT_PAGE" />
	<input type="hidden"  name="partInvGrid_ROWS_PER_PAGE" id="partInvGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="contactReportGrid_CURRENT_PAGE"  id="contactReportGrid_CURRENT_PAGE" />
	<input type="hidden"  name="contactReportGrid_ROWS_PER_PAGE" id="contactReportGrid_ROWS_PER_PAGE" />
	<input type="hidden"  name="chgHisGrid_CURRENT_PAGE"  id="chgHisGrid_CURRENT_PAGE" />
	<input type="hidden"  name="chgHisGrid_ROWS_PER_PAGE" id="chgHisGrid_ROWS_PER_PAGE" />
	<!-- operator top end -->
	<div class="tab_top_search">
		<table>
			<tbody>
				<tr>
					<td class="small_td"><p><s:message code="lead.leadID"/></p></td>
					<td class="medium_td"><input type="text" id="S-LEAD_ID" name="S-LEAD_ID" style="margin-right:10px;"></td>
					<td  style="padding-left:80px;padding-right:10px;"><p><s:message code="customer.partnerf"/></p></td>
					<td class="medium_td" style="width:350px;"><input type="text" class="side_front_Sinput" id="S-ACCOUNT" name="S-ACCOUNT" readonly disabled="" style="margin-right:5px;">
						<p class="data_side_text" style="margin-top:5px;" name="S-CUST_NM" id="S-CUST_NM"></p>
					</td>
					<td class="small_td"><p><s:message code="lead.description"/></p></td>
					<td class="medium_td"><input type="text" id="S-DESCRIPTION" name="S-DESCRIPTION" readonly disabled=""></td>
				</tr>
			</tbody>
		</table>
	</div>  
	</form>
	      <!--  tab start -->
	      <div id="tabs">
	      	<ul>
	      		<li class="matrix_tab"><a href="#lead_General"><s:message code="lead.General"/></a></li>
	      		<li class="matrix_tab"><a href="#lead_Notes"><s:message code="lead.Notes"/></a></li>
				<li class="matrix_tab"><a href="#lead_MatnPartInv"><s:message code="lead.MatnPartInv"/></a></li>
				<li class="matrix_tab"><a href="#lead_ContactReport"><s:message code="lead.ContactReport"/></a></li>
				<li class="matrix_tab"><a href="#lead_ChangeHistory"><s:message code="lead.ChangeHistory"/></a></li>
			</ul>

			<form id="frmGeneral" action="#">
			<!----- tab 1 ----->
			<div id="lead_General">
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="lead.info"/></h4>
					</div>
				</div>		
				<table class="table_line" width="100%">
					<tr>
						<td class="lead_1"><p><s:message code="lead.leadID"/></p></td>
						<td class="lead_2"><input type="text" name="SL07-LEAD_NO" id="SL07-LEAD_NO" readonly disabled=""></td>
						<td class="lead_3"><p><span>*</span>&nbsp;<s:message code="customer.partnerf"/></p></td>
						<td class="lead_4"><input class="side_front_Sinput" type="text" name="SL07-CUST_CD" id="SL07-CUST_CD" ess="ess" maxlength="15"  disabled="">
							<button class="grid_popupbtn" id="cmm_pop_CUST_CD" name="cmm_pop_CUST_CD" type='button'></button>
							<p class="data_side_text" name="SL07-CUST_NM" id="SL07-CUST_NM"></p>
						</td>
<!--						<td>&nbsp;</td> -->
<!-- 						<td>&nbsp;</td> -->
<%-- 						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="lead.description"/></p></td> --%>
<!-- 						<td><input type="text" name="SL07-DESCRIPTION" id="SL07-DESCRIPTION" ess="ess" ></td> -->
<%-- 						<td class="small_td"><s:message code="lead.leadType"/></td> --%>
<%-- 						<td><select id="SL07-LEAD_TP" name="SL07-LEAD_TP" class=""></select></td> --%>						
					</tr>
				</table>							
				<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="lead.General"/></h4>
					</div>
				</div>		
				<table class="table_line" width="100%">
					<tr>
						<td class="small_td"><p><s:message code="lead.address"/></p></td>
						<td colspan="2"><input style="width:100%;" type="text" name="SL07-ADDRESS" id="SL07-ADDRESS" maxlength="150" ></td>
						<td></td>
						<td style="width:160px;"><p><s:message code="customer.Country"/></p></td>
						<td><select id="SL07-COUNTRY_CD" name="SL07-COUNTRY_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="lead.orgin"/></p></td>
						<td><select id="SL07-ORIGIN_TP" name="SL07-ORIGIN_TP" class="" ess="ess" ></select></td>
						<td class="small_td"><p><s:message code="lead.description"/></p></td>
						<td><input type="text" name="SL07-DESCRIPTION" id="SL07-DESCRIPTION"  maxlength="200"></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.salesOrg"/></p></td>
						<td><select id="SL07-SALES_ORG_CD" name="SL07-SALES_ORG_CD" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.distributionCh"/></p></td>
						<td><select id="SL07-DISTRB_CH" name="SL07-DISTRB_CH" class=""></select></td>
						<td class="small_td"><p><s:message code="lead.division"/></p></td>
						<td><select id="SL07-DIV_CD" name="SL07-DIV_CD" class=""></select></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="quotation.salesOfc"/></p></td>
						<td><select name="SL07-SALES_OFFICE_CD" id="SL07-SALES_OFFICE_CD"></select></td>
						<td class="small_td"><p><s:message code="quotation.salesGrp"/></p></td>
						<td><select name="SL07-SALES_GR" id="SL07-SALES_GR"></select></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.mainContact"/></p></td>
						<td><input class="side_front_Sinput" type="text" id="SL07-MAIN_CONTACT" name="SL07-MAIN_CONTACT" maxlength="15" >
							<button class="grid_popupbtn" id="cmm_pop_MAIN_CONTACT" name="cmm_pop_MAIN_CONTACT" type='button'></button>
							<p class="data_side_text" name="SL07-MAIN_CONTACT_NM" id="SL07-MAIN_CONTACT_NM"></p>
						<td class="small_td"><p><s:message code="lead.employeeResponsible"/></p></td>
						<td><input class="side_front_Sinput" type="text" id="SL07-EMP_RESP" name="SL07-EMP_RESP" maxlength="15" >
							<button class="grid_popupbtn" id="cmm_pop_EMP_RESP" name="cmm_pop_EMP_RESP" type='button'></button>
							<p class="data_side_text" name="SL07-EMP_RESP_NM" id="SL07-EMP_RESP_NM"></p>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="lead.startDate"/></p></td>
						<td><input type="text" name="SL07-START_DT" id="SL07-START_DT" data-type="date" readonly/></td>
						<td class="small_td"><p><span>*</span>&nbsp;<s:message code="lead.endDate"/></p></td>
						<td><input type="text" id="SL07-END_DT" name="SL07-END_DT" data-type="date" readonly/></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="lead.status"/></p></td>
						<td><select id="SL07-LEAD_STS" name="SL07-LEAD_STS" class="SL07-LEAD_STS" ></select></td>
						<td class="small_td"><p><s:message code="lead.reason"/></p></td>
						<td><select id="SL07-LEAD_REASON" name="SL07-LEAD_REASON" class="" ></select></td>
<!-- 						<td><input type="text" id="SL07-LEAD_REASON" name="SL07-LEAD_REASON" class="" ></td> -->
						<td class="small_td"><p><s:message code="lead.qualLevel"/></p></td>
						<td><select id="SL07-QUAL_LVL" name="SL07-QUAL_LVL" class="" ></select></td>
					</tr>
				</table>				
			</div>
			<input type="hidden" name="SL07-isStatus" id="SL07-isStatus" />
			<input type="hidden" name="SL07-LEAD_NO" id="SL07-LEAD_NO" />
			<input type="hidden" name="SL07-DOC_STATUS" id="SL07-DOC_STATUS" />
			<input type="hidden" name="SL07-TEMP_LEAD_NO" id="SL07-TEMP_LEAD_NO" />
			<input type="hidden" name="SL07-REF_QT_NO" id="SL07-REF_QT_NO" />
			<input type="hidden" name="SL07-MODI_TMS" id="SL07-MODI_TMS" />
			</form>
			
			<form id="frmNote" action="#">
			<!----- tab 2 ----->
			<div id="lead_Notes">
<!-- 				<div> -->
<!-- 					<button style="float:right;"class='btn btn-default' id='' name='' type='button'><i class='fa fa-edit'></i>edit</button> -->
<!-- 					<div class="ct_grid_top_wrap"> -->
<!-- 						<div class="ct_grid_top_left"> -->
<%-- 							<h4><s:message code="lead.CustomerNotes(printed)"/></h4> --%>
<!-- 						</div> -->
<!-- 					</div>		 -->
<!-- 				</div>								 -->
				<textarea id="SL07-CUST_NOTE" name="SL07-CUST_NOTE" style="padding-left:10px; height:300px; margin-top:-1px; min-height:100px; width:99%; overflow:auto; margin-right:10px; padding-right:10px;" hidden="true"></textarea>
				<!-- 그리드 시작 -->
<!-- 				<div class="ctu_gl_wrap ctu_resize"  style="width:calc(70% - 10px);  float:left; padding-top:0px;"> -->
				<div>
								<div class="ct_grid_top_wrap">
					<div class="ct_grid_top_left">
						<h4><s:message code="lead.Notes"/></h4>
					</div>
				</div>
						<table id="noteGrid"></table>
						<div id="noteGrid_pager"></div>
					</div>
					<!-- 그리드 끝 -->
<!-- 					<button style="float:right;"class='btn btn-default' id='' name='' type='button'><i class='fa fa-edit'></i>edit</button> -->
<!-- 				<div class="ctu_gr_wrap ctu_resize" style="width:calc(30% - 10px); padding-top:0px;"> -->
				<div>
					<div class="ct_grid_top_wrap">
						<div class="ct_grid_top_left">
							<h4><s:message code="lead.NotesText"/></h4>
						</div>
					</div>	
<!-- 					<textarea id="SL07-NOTE_TEXT" name="SL07-NOTE_TEXT"  style="padding-left:10px; height:300px; margin-top:-1px; min-height:100px; width:96.5%; overflow:auto; padding-right:10px;"></textarea>	 -->
					<textarea id="SL07-NOTE_TEXT" name="SL07-NOTE_TEXT"  style="padding-left:10px; height:420px; margin-top:-1px; min-height:100px; width:98.5%; overflow:auto; margin-right:10px; padding-right:10px;"></textarea>
				</div>
				</div>
			</form>		    
		<!----- tab 3 ----->
			<div id="lead_MatnPartInv">
				
				<div id="ctm_wrap">
					<!-- 그리드 시작 -->
					<div id="ctm_mg_wrap">
						<div class="ct_grid_top_wrap">
							<div class="ct_grid_top_left"><h4><s:message code="lead.products"/></h4></div>
							<div class="ct_grid_top_right">
								<button class='btn btn-default' id='products_btnAdd' name='products_btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
								<button class='btn btn-default' id='products_btnDel' name='products_btnDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
							</div>
						</div>
						<table id="productsGrid"></table>
						<div id="productsGrid_pager"></div>
					</div>
					<!-- 그리드 끝 -->
				</div>	 
				
				<div id="ctm_wrap">
					<!-- 그리드 시작 -->
					<div id="ctm_mg_wrap">
						<div class="ct_grid_top_wrap">
							<div class="ct_grid_top_left"><h4><s:message code="lead.PartiesInvolved"/></h4></div>
							<div class="ct_grid_top_right">
								<button class='btn btn-default' id='partner_btnAdd' name='partner_btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
								<button class='btn btn-default' id='partner_btnDel' name='partner_btnDel' type='button'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
							</div>
						</div>
						<table id="partInvGrid"></table>
						<div id="partInvGrid_pager"></div>
					</div>
					<!-- 그리드 끝 -->
				</div>	     		  		
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
					<input type="hidden" name="SL07-CR_EDIT" id="SL07-CR_EDIT" />
					<input type="hidden" name="SL07-SEQ" id="SL07-SEQ" />
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
									<td><select id="SL071-SALES_ORG_CD" name="SL071-SALES_ORG_CD" class=""></select></td>
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

				<!-- 그리드 끝 -->
		    
		    <p>&nbsp;</p>				          		
          	</div>

		<!----- tab 5 ----->			
			<div id="lead_ChangeHistory">
			
				<div id="ctm_wrap">
					<!-- 그리드 시작 -->
					<div id="ctm_mg_wrap">
						<div class="ct_grid_top_wrap">
							<div class="ct_grid_top_left"><h4><s:message code="lead.ChangeHistory"/></h4></div>
							<div class="ct_grid_top_right"></div>
						</div>
						<table id="chgHisGrid"></table>
						<div id="chgHisGrid_pager"></div>
					</div>
					<!-- 그리드 끝 -->
				</div>
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
  	var currencyElms = document.querySelectorAll('[data-validcurrency]');

  	var generalTabFlag = false;
  	var noteTabFlag = false;
  	var matnPartInvTabFlag = false;
  	var contactReportTabFlag = false;
  	var changeHistoryTabFlag = false;
 	
	var startDay = getToday();
	var endDay = twoWeeks();
	
	var edtType = ''; 
	var rassId; 
	
	var tabName = '';
	var beforeTabName = 'GENERAL';
	
	var leadSts = '';
	var rsn = '';
	
	var saleOrg = '';
	var disChl = '';
	var div = ''; 
	var soff ='';
	var sgr = '';
	
	//초기 로드
	$(function() {
		initScreen();
		
		$('#cBtnUser1').text("<s:message code='button.copy'/>");
		$('#cBtnUser1').addClass("cls");
		$('#cBtnUser1').addClass("cBtnCopy_style");
		
		$('#cBtnUser4').text("Trans. QT");
		$('#cBtnUser4').addClass("cls");
		$('#cBtnUser4').addClass("cBtnPut_style");
		
		$('#cBtnAdd').text("New");
		
		$('#S-LEAD_ID').on('keypress', function (e) {
			if(e.which == 13){
				(this.value != "") ? cSearch(null) : '';
			}
		});
		
		$('#S-ACCOUNT').on('keypress', function (e) {
			if(e.which == 13){
				(this.value != "") ? cSearch(null) : '';
			}
		});

		$('#SL07-CUST_CD').on('keypress', function (e) {
			if(e.which == 13){
				openCustomerPopUp(this.value, 'CUST');
			}
		});

		$('#SL07-CUST_CD').on('change, blur', function (e) {
			//openCustomerPopUp(this.value, 'CUST');
		});
		
		$('#cmm_pop_CUST_CD').on('click', function (e) {
			openCustomerPopUp($('#SL07-CUST_CD').val(), 'CUST');
		});
		
		$('#SL07-ACCOUNT_CD').on('keypress', function (e) {
			if(e.which == 13){
				openCustomerPopUp(this.value, 'ACCOUNT');
			}
		});
		
		$('#SL07-ACCOUNT_CD').on('change, blur', function (e) {
			//openCustomerPopUp(this.value, 'ACCOUNT');
		});		
		
		$('#cmm_pop_ACCOUNT_CD').on('click', function (e) {
			openCustomerPopUp($('#SL07-ACCOUNT_CD').val(), 'ACCOUNT');
		});		
		
		$('#SL07-MAIN_CONTACT').on('keypress', function (e) {
			if(e.which == 13){
				openContactPersonPopup('SL07-MAIN_CONTACT','SL07-MAIN_CONTACT_NM');		
			}
		});		
		
		$('#SL07-MAIN_CONTACT').on('change, blur', function (e) {
			//openContactPersonPopup('SL07-MAIN_CONTACT','SL07-MAIN_CONTACT_NM');		
		});
		
		$('#cmm_pop_MAIN_CONTACT').on('click', function (e) {
			openContactPersonPopup('SL07-MAIN_CONTACT','SL07-MAIN_CONTACT_NM');		
		});
		
		$('#SL07-M_PS_NO').on('keypress', function (e) {
			if(e.which == 13){
				//openCustomerPopUp(this.value, 'CONTACT');
				openContactPersonPopup('SL07-M_PS_NO', 'SL07-M_PS_NO_NM');
			}
		});
		
		$('#SL07-M_PS_NO').on('change, blur', function (e) {
			//openContactPersonPopup('SL07-M_PS_NO', 'SL07-M_PS_NO_NM');
		});
		
		$('#cmm_pop_M_PS_NO').on('click', function (e) {
			//openCustomerPopUp($('#SL07-M_PS_NO').val(), 'CONTACT');
			openContactPersonPopup('SL07-M_PS_NO', 'SL07-M_PS_NO_NM');
		});
		
		$('#SL07-EMP_RESP').on('keypress', function (e) {
			if(e.which == 13){
				//openCustomerPopUp(this.value, 'EMP');
				openEmpPopup('SL07-EMP_RESP', 'SL07-EMP_RESP_NM');
			}
		});
		
		$('#SL07-EMP_RESP').on('change, blur', function (e) {
			//openEmpPopup('SL07-EMP_RESP', 'SL07-EMP_RESP_NM');
		});
		
		$('#cmm_pop_EMP_RESP').on('click', function (e) {
			//openCustomerPopUp($('#SL07-EMP_RESP').val(), 'EMP');
			openEmpPopup('SL07-EMP_RESP', 'SL07-EMP_RESP_NM');
		});
		
		$('#SL07-EMP_RESP_NO').on('keypress', function (e) {
			if(e.which == 13){
				//openCustomerPopUp(this.value, 'EMP');
				openEmpPopup('SL07-EMP_RESP_NO', 'SL07-EMP_RESP_NO_NM');
			}
		});
		
		$('#SL07-EMP_RESP_NO').on('change, blur', function (e) {
			//openEmpPopup('SL07-EMP_RESP_NO', 'SL07-EMP_RESP_NO_NM');
		});
		
		$('#cmm_pop_EMP_RESP_NO').on('click', function (e) {
			//openCustomerPopUp($('#SL07-EMP_RESP_NO').val(), 'EMP');
			openEmpPopup('SL07-EMP_RESP_NO', 'SL07-EMP_RESP_NO_NM');
		});
		

		$("#products_btnDel").click(function() {
			deleteGridRow('productsGrid');
		});

		$("#partner_btnDel").click(function() {
			deleteGridRow('partInvGrid');
		});
		
		//fn_codeval({type:'USER',btn_id:'cmm_pop_EMP_RESP',code:'SL07-EMP_RESP', name:'SL07-EMP_RESP_NM'});
		
		
		$('#SL07-ORIGIN_TP').on('change', function (e) {
			
			if ( $("#SL07-ORIGIN_TP").val() != '' ) {
				var orgText = $("#SL07-ORIGIN_TP option:selected").text();			
				var orginTxt = orgText.split(' - ');
				
				$('#SL07-DESCRIPTION').val(orginTxt[1] + '-');
				$('#S-DESCRIPTION').val(orginTxt[1] + '-');
				//$('#SL07-ACT_DESC').val(orginTxt[1] + '-');
				
			} else {
				$('#SL07-DESCRIPTION').val('');
				$('#S-DESCRIPTION').val('');
				//$('#SL07-ACT_DESC').val('');
				
			}
		});
		
		$('#SL07-LEAD_STS').on('change', function (e) {
			var sts = $(this).val();
			$('#SL07-LEAD_REASON').empty();
			
			if ( sts == '02' || sts == '06' ) {
				$('#SL07-LEAD_REASON').removeAttr('disabled');
				sts = 'P';
				getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);				
			} else if ( sts == '05'	) {
				$('#SL07-LEAD_REASON').removeAttr('disabled');
				sts = 'C';
				getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);
			} else {
				$('#SL07-LEAD_REASON').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}
		});

		$('#SL07-DESCRIPTION').on('change', function (e) {
			$('#S-DESCRIPTION').val($('#SL07-DESCRIPTION').val());
		});

		$('#SL07-START_DT').on('change', function (e) {
			//$('#SL07-DATE').val($('#SL07-START_DT').val());
		});
		
		$('#SL07-CUST_NOTE').on('keyup', function (e) {
			//$('#SL07-REPORT_NOTE').val($('#SL07-CUST_NOTE').val());
		});

		$('#SL07-LEAD_STS').on('change', function (e) {
			//$('#SL07-ACTIVE_STS').val($('#SL07-LEAD_STS').val());
		});
		
		$('#noteGrid').bind('jqGridSelectRow', function(e, rowid, status) {
			
			var noteText = $('#noteGrid').jqGrid('getCell', rowid, 'NOTE_TEXT');
			
			noteText = noteText.replace(/\\r\\n/g, '\r\n');	
			noteText = noteText.replace(/(\n|<br\/>|<br \/>)/g, '\r\n');		
			
// 			if ( noteText == '' ) $('#SL07-NOTE_TEXT').val('');
// 			else $('#SL07-NOTE_TEXT').val(noteText);

			
			$('#SL07-NOTE_TEXT').val(noteText);
			
			$('#SL07-NOTE_TEXT').focus();
			
			rassId= rowid;
			
			//$("#noteGrid").jqGrid('setCell', rowid, 'NOTE_TEXT', $('#SL07-NOTE_TEXT').val());

		});
				

		$('#SL07-NOTE_TEXT').on('keyup', function (e) {
			$("#noteGrid").jqGrid('setCell', $('#noteGrid').jqGrid('getGridParam', 'selrow'), 'NOTE_TEXT', $(this).val().replace(/(\n|\r\n\r\n)/g, '\n'));
			if ( $(this).val() == '' ) {
				$("#noteGrid").jqGrid('setCell', $('#noteGrid').jqGrid('getGridParam', 'selrow'), 'NOTE_TEXT', null);
			}
		});
		
		$('#SL07-NOTE_TEXT').on('blur', function (e) {
			$(this).val('');
		});
		
		
		
		$('#contactReportGrid').bind('jqGridSelectRow', function(e, rowid, status) {
			fn_formDisable(['frmContRpt']);
			fn_formDisable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
			$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
			$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
			
			var rowData = $("#contactReportGrid").getRowData(rowid);
			fn_dataBindByPrefix('frmContRpt', 'SL07-', rowData);
			fn_dataBindByPrefix('frmContRpt', 'SL071-', rowData);
			var note = rowData.REPORT_NOTE;
			note = note.replace(/\\r\\n/g, '\r\n');	
			$('#SL07-REPORT_NOTE').val(note);
			

			$('#btnCancel_InteractLog').attr('disabled','disabled');
			$('#btnAdd_InteractLog').removeAttr('disabled');
			$('#btnEdit_InteractLog').removeAttr('disabled');
			$('#btnSave_InteractLog').attr('disabled','disabled');
		});
		
		$('#btnSave_InteractLog').on('click', function(e){
// 			edtType = 'S';
			saveInteractLog(edtType);
		});
		
		$('#btnEdit_InteractLog').on('click', function(e){
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
		
		$('#btnAdd_InteractLog').on('click', function(e){
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
			
// 			if ( $("#SL07-LEAD_NO").val() != '' ) {
				
// 				var ids = $("#contactReportGrid").jqGrid("getDataIDs");
// 				if ( ids.length > 0 ) {
					$('#btnCancel_InteractLog').removeAttr('disabled');
					$('#btnAdd_InteractLog').removeAttr('disabled');
					$('#btnEdit_InteractLog').attr('disabled','disabled');
					$('#btnSave_InteractLog').removeAttr('disabled');
// 				} else {
// 					$('#btnEdit_InteractLog').attr('disabled','disabled');
// 					$('#btnSave_InteractLog').attr('disabled','disabled');
// 				}
// 			} 		
			
		});
		

		
		$('#btnCancel_InteractLog').on('click', function(e) {
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
		
		
		$('#SL07-DIV_CD').on('change', function (e) {
			$("#SL07-SALES_OFFICE_CD").empty();
			
			if('' == $(this).val()){
				$('#SL07-SALES_OFFICE_CD').val('');
				$('#SL07-SALES_OFFICE_CD').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
				$('#SL07-SALES_OFFICE_CD').removeAttr('disabled');
				
				var url = "/lead/selectSalesOffice.do";
				var param = {"param" : { "SALES_ORG_CD" : $('#SL07-SALES_ORG_CD').val()
					                   , "DISTRB_CH" : $('#SL07-DISTRB_CH').val()
					                   , "DIV_CD" : $(this).val()
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
			

			$("#SL07-SALES_GR").empty();
			
			if('' == $('#SL07-SALES_OFFICE_CD').val()){
				$('#SL07-SALES_GR').val('');
				$('#SL07-SALES_GR').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
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
						
		});
		
		$('#SL07-SALES_ORG_CD').on('change', function (e) {
			$("#SL07-SALES_OFFICE_CD").empty();
			
			if('' == $(this).val()){
				$('#SL07-SALES_OFFICE_CD').val('');
				$('#SL07-SALES_OFFICE_CD').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
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
			

			$("#SL07-SALES_GR").empty();
			
			if('' == $('#SL07-SALES_OFFICE_CD').val()){
				$('#SL07-SALES_GR').val('');
				$('#SL07-SALES_GR').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
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
						
		});
		
		$( '#SL07-DISTRB_CH').on('change', function (e) {
			$("#SL07-SALES_OFFICE_CD").empty();
			
			if('' == $(this).val()){
				$('#SL07-SALES_OFFICE_CD').val('');
				$('#SL07-SALES_OFFICE_CD').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
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
			

			$("#SL07-SALES_GR").empty();
			
			if('' == $('#SL07-SALES_OFFICE_CD').val()){
				$('#SL07-SALES_GR').val('');
				$('#SL07-SALES_GR').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
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
						
		});
		
		$('#SL07-SALES_OFFICE_CD').on('change', function (e) {
			$("#SL07-SALES_GR").empty();
			
			if('' == $(this).val()){
				$('#SL07-SALES_GR').val('');
				$('#SL07-SALES_GR').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
			}else{
				$('#SL07-SALES_GR').removeAttr('disabled');
				
				var url = "/salesOrder/selectSalesGrp.do";
				var param = {"param" : {"SALES_ORG" : $(this).val()}};
				
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
						
		});
		
		$('li').click(function() {
			
			var selectedTab = $(this).attr('aria-controls');
			
			if('lead_General' == selectedTab){
				(!generalTabFlag) ? initGeneralTab() : '' ;

				//tempDataSave();
// 				tabName = "GENERAL";
				beforeTabName = 'GENERAL';
			} else if('lead_Notes' == selectedTab){
				(!noteTabFlag) ? initNoteTab() : '' ;
				
				btGrid.gridResizing('noteGrid');
				
				//tempDataSave();
// 				tabName = "NOTE";
				beforeTabName = 'NOTE';
			} else if('lead_MatnPartInv' == selectedTab){
				(!matnPartInvTabFlag) ? initMatnPartInvTab() : '' ;

				btGrid.gridResizing('productsGrid');
				btGrid.gridResizing('partInvGrid');	
				
				//tempDataSave();
// 				tabName = "PART";
				beforeTabName = "PART";
			} else if('lead_ContactReport' == selectedTab){
				(!contactReportTabFlag) ? initContactReportTab() : '' ;

				btGrid.gridResizing('contactReportGrid');
				
				//tempDataSave();
// 				tabName = "CONTACT";
				beforeTabName = "CONTACT";
			} else if('lead_ChangeHistory' == selectedTab){
				(!changeHistoryTabFlag) ? initChangeHistoryTab() : '' ;

				btGrid.gridResizing('chgHisGrid');
				
				//tempDataSave();
// 				tabName = "HIS";
				beforeTabName = "HIS";
			}

			
		});
		
		$('#products_btnAdd').click(function() {
			var ids = $("#productsGrid").jqGrid("getDataIDs");
			var itemSeq = 0;
			
			if('' != $('#SL07-CUST_CD').val()){
				
				if(ids.length < 1){
					itemSeq = 100;
				}else{
					for(var i = 0; i < ids.length; i++){
						var rowData = $("#productsGrid").getRowData(ids[i]);
						if(i == 0){
							itemSeq = Number(rowData["ITEM_SEQ"]) + 100;
						}else{
							if(itemSeq <= Number(rowData["ITEM_SEQ"])){
								itemSeq = Number(rowData["ITEM_SEQ"]) + 100;
							}
						}
					}
				}
				
				var data = {"ROW_STATUS" : "I", "ITEM_SEQ" : itemSeq, "MATL_CD" : "", "ITEM_CTG" : "ZLD"};
				btGrid.gridAddRow("productsGrid", "last", data);
				
				openProductPop('', '', '', '', 'N');
			} else{
				var msg = 'Account';
				alert("<s:message code='errors.select' arguments='" + msg + "' javaScriptEscape='false'/>");
			}
		
		});
		
		$('#partner_btnAdd').click(function() {
			if('' != $('#SL07-CUST_CD').val()){
				var data = {"ROW_STATUS" : "I"};
				btGrid.gridAddRow("partInvGrid", "last", data);				
			}
		});
		
// 		$('#productsGrid').on('keypress', function (e) {
			
// 			var thisId = document.activeElement.id;
			
// 			if (thisId.indexOf('MATL_CD') != -1) {
// 				$('#' + thisId).on('blur', function (e) {
// 					openProductPop(this);
// 				});
// 			}
// 		});
	});
	
	function initScreen(){
		$("#SL07-LEAD_NO").val($.QueryString['LEAD_NO']);
		$("#SL07-isStatus").val($.QueryString['isStatus']);
		
		fn_setModify('frmGeneral', 'SL07-');

		$('#SL07-SALES_OFFICE_CD').attr('disabled', true);
		$('#SL07-SALES_GR').attr('disabled', true);
		
		
		Util.validator.applyCurrency(currencyElms);
		
		var codeBoxArray = [  'SL07-SALES_ORG_CD'
							, 'SL07-DISTRB_CH'
							, 'SL07-DIV_CD'
							, 'SL07-QUAL_LVL'
							, 'SL07-ORIGIN_TP'
							, 'SL07-LEAD_TP'
							, 'SL07-LEAD_STS'
							, 'SL07-SALES_OFFICE_CD'
							, 'SL07-SALES_GR'
							, 'SL07-COUNTRY_CD'
						   ];
				
		createCodeBoxByEdit(codeBoxArray, true);

		
		if ( $("#SL07-LEAD_NO").val() != '' ) {
			$("#S-LEAD_ID").val($("#SL07-LEAD_NO").val());
			cSearch();
		}
		
		resetScreen();
		
	}
	
	function resetScreen() {	

// 		Util.validator.applyCurrency(currencyElms);
		
		var codeBoxArray = [  'SL07-IMPORTANCE'
							, 'SL07-ACTIVE_STS'
							, 'SL07-ACT_CTG'
							, 'SL07-LOCATION'
							, 'SL071-SALES_ORG_CD'
						   ];
				
		createCodeBoxByEdit(codeBoxArray, true);
		
		createNoteGrid();
		selectNoteGrid();		
		createProductsGrid();
		createPartInvGrid();
		selectMatnPartInvTab();
		createContactReportGrid();
		selectContactReportTab();
		createChangeHistoryGrid();
		selectChangeHistoryTab();
		
		('' == $('#SL07-START_DT').val()) ? $('#SL07-START_DT').val(startDay) : '';
		('' == $('#SL07-ACT_DT').val()) ? $('#SL07-ACT_DT').val(startDay) : '';
		('' == $('#SL07-END_DT').val()) ? $('#SL07-END_DT').val(endDay) : '';		
// 		('' == $('#SL07-DESCRIPTION').val()) ? $('#SL07-DESCRIPTION').val($("#SL07-ORIGIN_TP option:selected").text()+'-') : '' ;
// 		('' == $('#S-DESCRIPTION').val()) ? $('#S-DESCRIPTION').val($("#SL07-ORIGIN_TP option:selected").text()+'-') : '';
// 		('' == $('#SL07-ACT_DESC').val()) ? $('#SL07-ACT_DESC').val($("#SL07-ORIGIN_TP option:selected").text()+'-') : '';

		if ( $("#SL07-isStatus").val() == 'N' || $("#SL07-isStatus").val() == '' ) {
			$("#SL07-EMP_RESP").val('${loginVO.userId}');
			$('#SL07-EMP_RESP_NO').val('${loginVO.userId}');
			$("#SL07-EMP_RESP_NM").text('${loginVO.nameFull}');
			$("#SL07-EMP_RESP_NO_NM").text('${loginVO.nameFull}');

// 			fn_formDisable(['frmContRpt']);
// 			fn_formDisable(['frmContRptNote']);
			
// 			$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
// 			$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
// 			$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
		}
		
		$('#SL07-LEAD_REASON').attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
		
		if ( $('#SL07-LEAD_STS').val() == '' )  {
			$('#SL07-LEAD_STS').val('01');
		}
		
		if ( $('#SL07-LEAD_STS').val() == '02' || $('#SL07-LEAD_STS').val() == '06' ) {
			var sts = 'P';
			$('#SL07-LEAD_REASON').removeAttr('disabled');
			getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);				
		} else if ( $('#SL07-LEAD_STS').val() == '05'	) {
			var sts = 'C';
			$('#SL07-LEAD_REASON').removeAttr('disabled');
			getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);
		}		
		$('#SL07-LEAD_REASON').val(rsn);
		
		if ( soff != '' ) {
			$('#SL07-SALES_OFFICE_CD').removeAttr('disabled');
		}
		$('#SL07-SALES_OFFICE_CD').val(soff);
		
		if ( sgr != '' ) {
			$('#SL07-SALES_GR').removeAttr('disabled');
		}
		$('#SL07-SALES_GR').val(sgr);

		selectContactReportTab();
		


		edtType = '';
		$("#frmContRpt")[0].reset();
		$('#SL07-REPORT_NOTE').val('');
		
		$('#SL07-ACT_DT').val(startDay);
		
		$("#SL07-ACCOUNT_CD").val($('#SL07-CUST_CD').val());
		$("#SL07-M_PS_NO").val( $('#SL07-MAIN_CONTACT').val());
		$("#SL07-EMP_RESP_NO").val($('#SL07-EMP_RESP').val());
		
		$("#SL07-ACCOUNT_NM").text($('#SL07-CUST_NM').text());
		$("#SL07-M_PS_NO_NM").text($('#SL07-MAIN_CONTACT_NM').text());
		$("#SL07-EMP_RESP_NO_NM").text($('#SL07-EMP_RESP_NM').text());
			

		
		$('#btnCancel_InteractLog').attr('disabled','disabled');
		$('#btnAdd_InteractLog').removeAttr('disabled');
		$('#btnSave_InteractLog').attr('disabled','disabled');
		
		var ids = $("#contactReportGrid").jqGrid("getDataIDs");
		if ( ids.length > 0 ) {

			$('#btnEdit_InteractLog').removeAttr('disabled');
			fn_formDisable(['frmContRpt']);
			fn_formDisable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
			$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
			$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
		} else {

			$('#btnEdit_InteractLog').attr('disabled','disabled');
			fn_formEnable(['frmContRpt']);
			fn_formEnable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').removeAttr('disabled');
			$('#cmm_pop_M_PS_NO').removeAttr('disabled');
			$('#cmm_pop_EMP_RESP_NO').removeAttr('disabled');
		}
		

// 		$('#SL07-NOTE_TEXT').val('');
// 		$('#SL07-REPORT_NOTE').val('');
		
// 		$("#frmContRpt")[0].reset();
// 		$("#SL07-ACCOUNT_NM").text("");
// 		$("#SL07-M_PS_NO_NM").text("");
// 		$("#SL07-EMP_RESP_NO_NM").text("");
			

		if ( leadSts == '03' ) {
			controlBtn('03', false);
		} else if ( leadSts == '05') {
			controlBtn('05', false);
		} else {
			controlBtn(leadSts, true);
		}
		
	}
	
	function cSearch(){
		
		if($("#S-LEAD_ID").val() == "" ){
			alert('<s:message code="info.inputlead"/>');
			return;
		}
		
		var url = "/lead/selectLeadInfo.do";
		
		var param = { "param" : {
				  "LEAD_ID"  : $("#S-LEAD_ID").val()
				, "ACCOUNT"  : $("#S-ACCOUNT").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
						
			//초기화
			$("#frmGeneral")[0].reset();
			$("#frmSearch")[0].reset();
			
			if(data.resultLeadInfo != null){
				
				//bind
				fn_dataBindByPrefix('frmGeneral', 'SL07-', data.resultLeadInfo);
				fn_dataBindByPrefix('frmSearch', 'S-', data.resultLeadInfo);
				fn_dataBindByPrefix('frmNote', 'SL07-', data.resultLeadInfo);

				if ( $("#SL07-isStatus").val() == 'C' ) {
					$("#S-LEAD_ID").val("");
					$("#SL07-LEAD_NO").val("");
				} else {
					//셋팅
					$("#SL07-isStatus").val('M');
					$("#S-LEAD_ID").attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				}		
				
				
				
 				
// 				if ( $('#SL07-LEAD_STS').val() == '02' || $('#SL07-LEAD_STS').val() == '06' ) {
// 					var sts = 'P';
// 					$('#SL07-LEAD_REASON').removeAttr('disabled');
// 					getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);				
// 				} else if ( $('#SL07-LEAD_STS').val() == '05'	) {
// 					var sts = 'C';
// 					$('#SL07-LEAD_REASON').removeAttr('disabled');
// 					getLeadStatusReasonCode('SL07-LEAD_REASON', sts, true);
// 				}	


				if( data.resultLeadInfo.SALES_ORG_CD == '' ) {
					setSalesData(data.resultLeadInfo.CUST_CD);									
				} else {
					soff = data.resultLeadInfo.SALES_OFFICE_CD;
					sgr = data.resultLeadInfo.SALES_GR;					
				}
				
				rsn = data.resultLeadInfo.LEAD_REASON;
				
// 				$('#SL07-LEAD_REASON').val(rsn);
// 				$('#SL07-SALES_GR').val(sgr);
				if ( $("#SL07-isStatus").val() == 'C' ) {
					$('#SL07-LEAD_STS').val('01');
				} else {
					leadSts = data.resultLeadInfo.LEAD_STS;
				}
				
// 				if ( leadSts == '03' ) {
// 					controlBtn('03', false);
// 				} else if ( leadSts == '05') {
// 					controlBtn('05', false);
// 				}
				
				resetScreen();
								
			}else{
				alert('<s:message code="info.nodata.msg"/>');
				$("#S-LEAD_ID").val("");
				$("#S-LEAD_ID").focus();
			}
			
			//탭 초기화 셋팅
			$('#ui-id-1').trigger('click'); // 첫번째 탭
		  	generalTabFlag = true;
		  	noteTabFlag = false;
		  	matnPartInvTabFlag = false;
		  	contactReportTabFlag = false;
		  	changeHistoryTabFlag = false;
		  	beforeTabName = '';
		});
	}
	
	function setSalesData(custCd) {
		
		var url = "/lead/checkCustSalesData.do";
		
		var param = { "param" : {
			"CUST_CD"  : custCd
			}
		};
		
		var custSales = '';
		fn_ajax(url, false, param, function(data, xhr){
			custSales = data.result.SALES_CNT;		
		});
		
		if ( custSales > 0 ) {
			fn_ajax("/lead/setCustSalesData.do", false, param, function(data, xhr){
				saleOrg = data.setSalesData.SALES_ORG_CD;
				disChl = data.setSalesData.DISTRB_CH;
				div = data.setSalesData.DIV_CD;
				soff = data.setSalesData.SALES_OFFICE_CD;
				sgr = data.setSalesData.SALES_GR; 
				
				$('#SL07-SALES_ORG_CD').val(saleOrg);
				$('#SL07-DISTRB_CH').val(disChl);
				$('#SL07-DIV_CD').val(div);
			});	
		}		
		
	}
		
	function saveValdChk() {
		var rtnFlag = true;
		
		if('' != $('#SL07-LEAD_NO').val() ){
			var url = '/lead/getModiTms.do';
			var param = {"param" : { "LEAD_NO" : $('#SL07-LEAD_NO').val() }};
			
			fn_ajax(url, false, param, function(data, xhr){
				
				if(data.result != $('#SL07-MODI_TMS').val()){
					alert("<s:message code='error.alreadyUpd'/>");
					rtnFlag = false;
				}
			});
		}
		
		return rtnFlag;		
	}
	
	function cSave(){
		
		if ( !saveValdChk() ) {
			return;
		}
		
		if(!fn_inputCheckByPrefix('frmGeneral', 'SL07-')){
			return;
		}
		
		if(!checkBetweenDate($('#SL07-START_DT').val(), $('#SL07-END_DT').val())){
			$('#ui-id-1').trigger('click');
			$('#SL07-END_DT').focus();
			return false;
		}
		if ( $('#SL07-LEAD_STS').val() == '03' ) {
			var url = "/lead/checkCustSalesData.do";
			
			var param = { "param" : {
				"CUST_CD"  : $("#SL07-CUST_CD").val()
				}
			};
			
			var custSales = '';
			fn_ajax(url, false, param, function(data, xhr){
				custSales = data.result.SALES_CNT;		
			});

			if ( custSales < 1 ) {
				alert('<s:message code="info.savedcust"/>');
				return;
			}
		}
		
		if(confirm("<s:message code='confirm.save'/>")){
			
			$('#SL07-DOC_STATUS').val("A");
			
			var leadData = formIdAllToMap('frmGeneral');
			var noteData = {"CUST_NOTE" : $('#SL07-CUST_NOTE').val()};
			var noteGrid = setNoteData();
			var productsGrid = setProductsData();
			var partInvGrid = setPartnerData();
			var contRpt = formIdAllToMap('frmContRpt');
			var contRptNote = {"REPORT_NOTE" : $('#SL07-REPORT_NOTE').val()};
			
			var param = {"param" : {
									  "leadData" : leadData
									, "noteData" : noteData
									, "noteGrid" : noteGrid
									, "productsGrid" : productsGrid
									, "partInvGrid" : partInvGrid
									, "contRpt" : contRpt
									, "contRptNote" : contRptNote
									, "GBN" : edtType  }
						};
			
			var url = '/lead/saveLead.do';
			
			fn_ajax(url, false, param, function(data, xhr){
				$("#SL07-LEAD_NO").val(data.docNo);
				$("#S-LEAD_ID").val(data.docNo);
				$("#SL07-TEMP_LEAD_NO").val('');
				$("#SL07-isStatus").val('M');
				$("#SL07-TEMP_LEAD_NO").val('');
// 				$("#S-LEAD_ID").attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				
				alert("<s:message code='info.save'/>");
				
				cSearch();


				
// 				setTimeout(function() {
// 					window.top.$('.ui-tabs-nav .ui-tabs-active span').trigger('click') ;
// 				});
				
				
			});
			
			
		}
	}
	
	function tempDataSave(){

		if ( $('#SL07-LEAD_STS').val() == '03' ) {
			var url = "/lead/checkCustSalesData.do";
			
			var param = { "param" : {
				"CUST_CD"  : $("#SL07-CUST_CD").val()
				}
			};
			
			var custSales = '';
			fn_ajax(url, false, param, function(data, xhr){
				custSales = data.result.SALES_CNT;		
			});

			if ( custSales < 1 ) {
				alert('<s:message code="info.savedcust"/>');
				return;
			}
		}
		
		if('' == $('#SL07-LEAD_NO').val() && '' != $('#S-LEAD_ID').val()){
			$('#SL07-DOC_STATUS').val("T");	
				
			var leadData = formIdAllToMap('frmGeneral');
			var noteData = {"CUST_NOTE" : $('#SL07-CUST_NOTE').val()};
			var noteGrid = setNoteData();
			var productsGrid = setProductsData();
			var partInvGrid = setPartnerData();
			var contRpt = formIdAllToMap('frmContRpt');
			var contRptNote = {"REPORT_NOTE" : $('#SL0REPORT_NOTEES').val()};
			

			var leadData = formIdAllToMap('frmGeneral');
			var noteData = {"CUST_NOTE" : $('#SL07-CUST_NOTE').val()};
			var noteGrid = setNoteData();
			var productsGrid = setProductsData();
			var partInvGrid = setPartnerData();
			var contRpt = formIdAllToMap('frmContRpt');
			var contRptNote = {"REPORT_NOTE" : $('#SL07-REPORT_NOTE').val()};
			
			var param = {"param" : {
									  "leadData" : leadData
									, "noteData" : noteData
									, "noteGrid" : noteGrid
									, "productsGrid" : productsGrid
									, "partInvGrid" : partInvGrid
									, "contRpt" : contRpt
									, "contRptNote" : contRptNote
									, "GBN" : edtType  }
						};
			
			var url = '/lead/saveTempLead.do';
			
			fn_ajax(url, false, param, function(data, xhr){
				$("#SL07-TEMP_LEAD_NO").val(data.tempLeadNo);
				$("#SL07-isStatus").val('T');
			});	
 		}	
	}
	
	function saveInteractLog(edtType) {
		
		if ( !saveValdChk() ) {
			return;
		}
		
		if(!fn_inputCheckByPrefix('frmGeneral', 'SL07-')){
			return;
		}
		
		if ( $('#SL07-LEAD_STS').val() == '03' ) {
			var url = "/lead/checkCustSalesData.do";
			
			var param = { "param" : {
				"CUST_CD"  : $("#SL07-CUST_CD").val()
				}
			};
			
			var custSales = '';
			fn_ajax(url, false, param, function(data, xhr){
				custSales = data.result.SALES_CNT;		
			});

			if ( custSales < 1 ) {
				alert('<s:message code="info.savedcust"/>');
				return;
			}
		}

		//if (fn_inputCheck('frmGeneral') == false) return;
		
		if ( $('#SL07-ACCOUNT_CD').val() == '' ) {
			args = '<s:message code='lead.account'/>';
			alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");

			return;
		}

// 		if ( $('#SL07-M_PS_NO').val() == '' ) return;
		
// 		if ( $('#SL07-EMP_RESP_NO').val() == '' ) return;
		
		if(confirm("<s:message code='confirm.save'/>")){
			
			$('#SL07-DOC_STATUS').val("A");

		
			var leadData = formIdAllToMap('frmGeneral');
			var noteData = {"CUST_NOTE" : $('#SL07-CUST_NOTE').val()};
			var noteGrid = setNoteData();
			var productsGrid = setProductsData();
			var partInvGrid = setPartnerData();
			var contRpt = formIdAllToMap('frmContRpt');
			var contRptNote = {"REPORT_NOTE" : $('#SL07-REPORT_NOTE').val()};
			
			var param = {"param" : {
								      "leadData" : leadData
									, "noteData" : noteData
									, "noteGrid" : noteGrid
									, "productsGrid" : productsGrid
									, "partInvGrid" : partInvGrid
									, "contRpt" : contRpt
									, "contRptNote" : contRptNote
									, "GBN" : edtType  }
						};

			
			var url = '/lead/saveLead.do';
			
			fn_ajax(url, false, param, function(data, xhr){
				
				$("#SL07-LEAD_NO").val(data.docNo);
				$("#S-LEAD_ID").val(data.docNo);
				$("#SL07-TEMP_LEAD_NO").val('');
				$("#SL07-isStatus").val('M');
				$("#SL07-TEMP_LEAD_NO").val('');
				//$("#S-LEAD_ID").attr('disabled','disabled').attr('tabindex', '-1').addClass('disabled');
				

				alert("<s:message code='info.save'/>");
				
				cSearch();

				initContactReportTab();
				btGrid.gridResizing('contactReportGrid');
				selectContactReportTab();
			});
			
		}
	}
	
	function initGeneralTab() {
	  	generalTabFlag = true;
	  	noteTabFlag = false;
	  	matnPartInvTabFlag = false;
	  	contactReportTabFlag = false;
	  	changeHistoryTabFlag = false;

// 		fn_formDisable(['frmContRpt']);
// 		fn_formDisable(['frmContRptNote']);
// 		$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
// 		$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
// 		$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');

		//tempDataSave();
		tabName = "GENERAL";
// 		beforeTabName = "GENERAL";
	}
	
	function initNoteTab(){
	  	generalTabFlag = false;
	  	noteTabFlag = true;
	  	matnPartInvTabFlag = false;
	  	contactReportTabFlag = false;
	  	changeHistoryTabFlag = false;
	  	
	  	setTimeout(function() {
	  	    var grid = $("#noteGrid"),
	  	    ids = grid.jqGrid("getDataIDs");
	  	    if(ids && ids.length > 0){
	  	        grid.jqGrid("setSelection", ids[0]);
	  	    }
	  	}, 100);



// 		fn_formDisable(['frmContRpt']);
// 		fn_formDisable(['frmContRptNote']);
		
// 		$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
// 		$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
// 		$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
		
// 		createNoteGrid();

// 		selectNoteGrid();

		//tempDataSave();		
		tabName = "NOTE";
// 		beforeTabName = "NOTE";
	}
	
	function initMatnPartInvTab() {
	  	generalTabFlag = false;
	  	noteTabFlag = false;
	  	matnPartInvTabFlag = true;
	  	contactReportTabFlag = false;
	  	changeHistoryTabFlag = false;

// 		fn_formDisable(['frmContRpt']);
// 		fn_formDisable(['frmContRptNote']);
// 		$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
// 		$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
// 		$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
	  	
// 		createProductsGrid();
// 		createPartInvGrid();

// 		selectMatnPartInvTab();
		
		$('#productsGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				//alert(index);
				if(index == 5){
					openProductPop('', '', '', '', 'N');
				}
				
// 				var row = $('#productsGrid').jqGrid('getRowData', rowId);
// 			    var colName = $("#productsGrid").jqGrid('getGridParam','colModel'); 
// 			    var ids = $("#productsGrid").jqGrid("getDataIDs");
			    
// 				var param = { };
// 				param.window = window;
				
// 			    if(colName[index].name == "MAT_CD") {
			    	
// 					popupOpen('/popup/productPopUp.do', 'productPopUp', param, function(selecedData) {	
// 						if (!!selecedData && !!selecedData) {
// 							var cnt = 0;
							
// 							for(var i = 0; i < ids.length; i++){
								
// 								var rowData = $("#productsGrid").getRowData(ids[i]);
								
// 								if( rowData["MATL_CD"] == selecedData[0]["MATL_CD"] ) {
// 									cnt++;
// 								}  
// 							}
							
// 							if ( ids.length > 1 ) {
// 								if ( cnt == 0 ) {
// 									$("#productsGrid").jqGrid('setCell', rowId, 'MAT_CD', selecedData[0]["MATL_CD"]);
// 									$("#productsGrid").jqGrid('setCell', rowId, 'MAT_DESC', selecedData[0]["MATL_DESC"]);
// 									$("#productsGrid").jqGrid('setCell', rowId, 'UNIT', selecedData[0]["BUM"]);
// 									setRowStatus('productsGrid');
// 								} else {
// 									btGrid.gridDelRow('productsGrid',  rowId);
// 								}								
// 							} else {
// 								$("#productsGrid").jqGrid('setCell', rowId, 'MAT_CD', selecedData[0]["MATL_CD"]);
// 								$("#productsGrid").jqGrid('setCell', rowId, 'MAT_DESC', selecedData[0]["MATL_DESC"]);
// 								$("#productsGrid").jqGrid('setCell', rowId, 'UNIT', selecedData[0]["BUM"]);
// 								setRowStatus('productsGrid');
// 							}
// 						}
// 						btGrid.gridSaveRow('productsGrid');
// 					});
// 				}
			}
		});
		
		$('#partInvGrid').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				btGrid.gridSaveRow('partInvGrid');
				var row = $('#partInvGrid').jqGrid('getRowData', rowId);
				var colName = $("#partInvGrid").jqGrid('getGridParam','colModel');
			    var ids = $("#partInvGrid").jqGrid("getDataIDs");
			    
				var param = {};
				param.window = window;
				
				if ( row.LEAD_PF_TP == '' ) row.LEAD_PF_TP = 'ER';
				
			    if(colName[index].name == "PF_PS_NO") {
					param.LEAD_PF_TP = row.LEAD_PF_TP;
					var LEAD_PF_TP = $("#partInvGrid").jqGrid('getCell', rowId, 'LEAD_PF_TP');

					if ( param.LEAD_PF_TP == 'PR' ||  param.LEAD_PF_TP == 'AG' ) {

						var param = { 'CUST_CD': '' };
						
						var url = "/customer/customerSearchPopup.do";
						var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
						var param = { 'CUST_CD':''
								    , 'SALES_ORG_CD' : $('#SL07-SALES_ORG_CD').val()
						            , 'DISTRB_CH' : $('#SL07-DISTRB_CH').val()
						            , 'DIV_CD' : $('#SL07-DIV_CD').val()
						             };
						param.window = window;
						
						popupOpen(url, pid, param, function(e, data) {

							if(!fn_empty(data)){
								var cnt = 0;
								var scnt = 0;
								
								for(var i = 0; i < ids.length; i++){									
									var rowData = $("#partInvGrid").getRowData(ids[i]);
									
									if( rowData["PF_PS_NO"] == data.CUST_CD && rowData["LEAD_PF_TP"] == LEAD_PF_TP ) {
										cnt++;
									}									
									if ( rowData["LEAD_PF_TP"] ==  LEAD_PF_TP ) scnt++;
								}
								
								var defYN = 'Y';
								if ( scnt > 0 ) defYN = 'N';
								if ( ids.length > 1 ) {
									if ( cnt == 0 ) {
										$("#partInvGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data.CUST_CD);
										$("#partInvGrid").jqGrid('setCell', rowId, 'PF_NM', data.CUST_NM);
										$("#partInvGrid").jqGrid('setCell', rowId, 'ADDR', data.STREET_NM);
										$("#partInvGrid").jqGrid('setCell', rowId, 'M_PART_YN', defYN);
										$("#partInvGrid").jqGrid('setCell', rowId, 'TEL_NO', data.TEL_NO);
										$("#partInvGrid").jqGrid('setCell', rowId, 'E_MAIL', data.E_MAIL);
										setRowStatus('partInvGrid');
									} else {
										btGrid.gridDelRow('partInvGrid',  rowId);
									}							
								} else {
									$("#partInvGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data.CUST_CD);
									$("#partInvGrid").jqGrid('setCell', rowId, 'PF_NM', data.CUST_NM);
									$("#partInvGrid").jqGrid('setCell', rowId, 'ADDR', data.STREET_NM);
									$("#partInvGrid").jqGrid('setCell', rowId, 'M_PART_YN', defYN);
									$("#partInvGrid").jqGrid('setCell', rowId, 'TEL_NO', data.TEL_NO);
									$("#partInvGrid").jqGrid('setCell', rowId, 'E_MAIL', data.E_MAIL);
									setRowStatus('partInvGrid');
								}								
							}
							setRowStatus('partInvGrid');
							btGrid.gridSaveRow('partInvGrid');
						});
						
					} else if (param.LEAD_PF_TP == 'AP' ) {

						var url = "/popup/ContactPersonPopup2.do";
						var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
						var param = {CUST_CD : $("#S-ACCOUNT").val()};
						param.window = window;
											
						popupOpen(url, pid, param, function(data) {
							
							if(!fn_empty(data)){
								var cnt = 0;
								var scnt = 0;
								
								for(var i = 0; i < ids.length; i++){									
									var rowData = $("#partInvGrid").getRowData(ids[i]);									
									if( rowData["PF_PS_NO"] == data[0].CODE && rowData["LEAD_PF_TP"] == LEAD_PF_TP ) {
										cnt++;
									}									
									if ( rowData["LEAD_PF_TP"] ==  LEAD_PF_TP ) scnt++;
								}
								
								var defYN = 'Y';
								if ( scnt > 0 ) defYN = 'N';
								if ( ids.length > 1 ) {
									if ( cnt == 0 ) {
										$("#partInvGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
										$("#partInvGrid").jqGrid('setCell', rowId, 'PF_NM', data[0].FULL_NM);
										$("#partInvGrid").jqGrid('setCell', rowId, 'ADDR', data[0].H_STREET_NM);
										$("#partInvGrid").jqGrid('setCell', rowId, 'M_PART_YN', defYN);
										$("#partInvGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].H_TEL_NO1 + ' ' + data[0].H_TEL_NO1_EXT);
										$("#partInvGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].E_MAIL);
										setRowStatus('partInvGrid');
									} else {
										btGrid.gridDelRow('partInvGrid',  rowId);
									}							
								} else {
									$("#partInvGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].CODE);
									$("#partInvGrid").jqGrid('setCell', rowId, 'PF_NM', data[0].FULL_NM);
									$("#partInvGrid").jqGrid('setCell', rowId, 'ADDR', data[0].H_STREET_NM);
									$("#partInvGrid").jqGrid('setCell', rowId, 'M_PART_YN', defYN);
									$("#partInvGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].H_TEL_NO1 + ' ' + data[0].H_TEL_NO1_EXT);
									$("#partInvGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].E_MAIL);
									setRowStatus('partInvGrid');
								}								
							}
							setRowStatus('partInvGrid');
							btGrid.gridSaveRow('partInvGrid');
						});
					} else {
						if ( param.LEAD_PF_TP == '' ) param.LEAD_PF_TP ='ER';
						var param = { 'LEAD_PF_TP':param.LEAD_PF_TP };
						
						var sendData = {
								  'S_CODE': ''
								, 'S_COMP_CD': '1000'
								};
						
						var url = '/popup/UserPopup2.do';
						var pid = 'UserPopup2';
						
						popupOpen(url, pid, sendData, function(data) {
							if (!fn_empty(data)) {
								var cnt = 0;
								var scnt = 0;
								
								for(var i = 0; i < ids.length; i++){
									
									var rowData = $("#partInvGrid").getRowData(ids[i]);
									
									if( rowData["PF_PS_NO"] == data[0].USER_ID && rowData["LEAD_PF_TP"] == LEAD_PF_TP ) {
										cnt++;
									}  
									if ( rowData["LEAD_PF_TP"] == LEAD_PF_TP ) scnt++;
								}
								var defYN = 'Y';
								if ( scnt > 0 ) defYN = 'N';
								
								if ( ids.length > 1 ) {
									if ( cnt == 0 ) {
										$("#partInvGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].USER_ID );
										$("#partInvGrid").jqGrid('setCell', rowId, 'PF_NM', data[0].NAME_FULL );
										$("#partInvGrid").jqGrid('setCell', rowId, 'ADDR', data[0].ADDR );
										$("#partInvGrid").jqGrid('setCell', rowId, 'M_PART_YN', defYN);
										$("#partInvGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].TEL_NO );
										$("#partInvGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].E_MAIL );
										setRowStatus('partInvGrid');
									} else {
										btGrid.gridDelRow('partInvGrid',  rowId);
									}							
								} else {
									$("#partInvGrid").jqGrid('setCell', rowId, 'PF_PS_NO', data[0].USER_ID );
									$("#partInvGrid").jqGrid('setCell', rowId, 'PF_NM', data[0].NAME_FULL );
									$("#partInvGrid").jqGrid('setCell', rowId, 'ADDR', data[0].ADDR );
									$("#partInvGrid").jqGrid('setCell', rowId, 'M_PART_YN', defYN);
									$("#partInvGrid").jqGrid('setCell', rowId, 'TEL_NO', data[0].TEL_NO );
									$("#partInvGrid").jqGrid('setCell', rowId, 'E_MAIL', data[0].E_MAIL );
									setRowStatus('partInvGrid');
								}
															
							}
							btGrid.gridSaveRow('partInvGrid');
						});
						
					} 
					
				}
			}
		});
		
		//tempDataSave();
		tabName = "PART";
// 		beforeTabName = "PART";
	}
	
	function initContactReportTab() {
	  	generalTabFlag = false;
	  	noteTabFlag = false;
	  	matnPartInvTabFlag = false;
	  	contactReportTabFlag = true;
	  	changeHistoryTabFlag = false;	
	  	
	  	setTimeout(function() {
	  	    var grid = $("#contactReportGrid"),
	  	    ids = grid.jqGrid("getDataIDs");
	  	    if(ids && ids.length > 0){
	  	        grid.jqGrid("setSelection", ids[0]);
	  	    }
	  	}, 100);
	
// 		fn_formDisable(['frmContRpt']);
// 		fn_formDisable(['frmContRptNote']);
		
		if ( $("#SL07-isStatus").val() == 'N' || $("#SL07-isStatus").val() == '' ) {

			fn_formEnable(['frmContRpt']);
			fn_formEnable(['frmContRptNote']);
			$('#cmm_pop_ACCOUNT_CD').removeAttr('disabled');
			$('#cmm_pop_M_PS_NO').removeAttr('disabled');
			$('#cmm_pop_EMP_RESP_NO').removeAttr('disabled');
		}
	  	
// 	  	createContactReportGrid();

// 		selectContactReportTab();
		
		//tempDataSave();
		tabName = "CONTACT";
// 		beforeTabName = "CONTACT";
	}
	
	function initChangeHistoryTab() {
	  	generalTabFlag = false;
	  	noteTabFlag = false;
	  	matnPartInvTabFlag = false;
	  	contactReportTabFlag = false;
	  	changeHistoryTabFlag = true;

// 		fn_formDisable(['frmContRpt']);
// 		fn_formDisable(['frmContRptNote']);
// 		$('#cmm_pop_ACCOUNT_CD').attr('disabled','disabled');
// 		$('#cmm_pop_M_PS_NO').attr('disabled','disabled');
// 		$('#cmm_pop_EMP_RESP_NO').attr('disabled','disabled');
		
	  	//createChangeHistoryGrid();

		//selectChangeHistoryTab();
		
		//tempDataSave();
		tabName = "HIS";
// 		beforeTabName = "HIS";
	}
	
	function createNoteGrid() {
		var colName = [
					  'COMP_CD'
					, 'LEAD_NO'
					, 'SEQ'
					, '<s:message code="lead.grd.TextType"/>'
					, '<s:message code="lead.grd.TextType"/>'
					, '<s:message code="lead.grd.Text"/>'
					, '<s:message code="lead.grd.Language"/>'
					, 'STATUS'
					, 'ROW_STATUS'
					];
		
		var colModel = [
					  { name: 'COMP_CD', align: 'center', hidden:true }
					, { name: 'LEAD_NO', align: 'center', hidden:true }
					, { name: 'SEQ', align: 'center', hidden:true }
					, { name: 'TEXT_TP', width: 30, align: 'center', hidden:true }
					, { name: 'CODE_NM', width: 50, align: 'center', hidden:false }
					, { name: 'NOTE_TEXT', width: 450, align: 'left', hidden:false, editable:false}
					, { name: 'LANG_CD', width: 60, align: 'center', hidden:true, editable:false}
// 					, editable:true, edittype:"select", formatter : "select", editoptions:{
// 						  value:'${LANG_CD}'
// 								, dataEvents:[{
// 									type:"change",
// 									fn:function(e){
// 										var selRow = $('#noteGrid').jqGrid('getGridParam', 'selrow');
// 										$("#noteGrid").jqGrid('setCell', selRow, 'LANG_CD', $(this).val());
// 									   }
// 								   }]
// 								}
// 					  }
					, { name: 'STATUS', width: 30, align: 'center', hidden:true }
					, { name: 'ROW_STATUS', align: 'center', hidden:true }
					];
		
		var gSetting = {
			height:100,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:false // 쿼리 페이징 처리 여부
		};
		
		// 그리드 생성 및 초기화
		btGrid.createGrid('noteGrid', colName, colModel, gSetting);
	}

	function createProductsGrid() {
		var colName = [
					  'COMP_CD'
					, 'LEAD_NO'
					, 'SEQ'
					, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'productsGrid\')" />'
					, '<s:message code="lead.grd.itemSeq"/>'
					, '<s:message code="lead.grd.matCd"/>'
					, '<s:message code="lead.grd.matDesc"/>'
					, '<s:message code="lead.grd.qty"/>'
					, '<s:message code="lead.grd.unit"/>'
					, '<s:message code="lead.grd.itemCat"/>'
					, '<s:message code="lead.grd.deliNm"/>'
					, 'ROW_STATUS'
					];
		var colModel = [
					  { name: 'COMP_CD', align: 'center', hidden:true }
					, { name: 'LEAD_NO', align: 'center', hidden:true }
					, { name: 'SEQ', align: 'center', hidden:true }
					, { name: 'CHK', width : 20, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}
					, { name: 'ITEM_SEQ', width: 30, align: 'center', hidden:false }
					, { name: 'MAT_CD', width: 100, align: 'center', classes: 'gridbtnsearch', editable:false, editoptions:{maxlength:'8', 
			              dataEvents:[{
			            	  type:"change",
							  fn:function(e){
								  setRowStatus('productsGrid');
							  }
						  }]} }							
					, { name: 'MAT_DESC', width: 150, align: 'left', hidden:false, ditable:false }
					, { name: 'QTY', width: 50, align: 'right', hidden:false, editable:true, 
						formatter:'number', formatoptions:{decimalSeparator:",", thousandsSeparator: ".", decimalPlaces: 2}	,
						editoptions: { maxlength:13 
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
													}
												}else{
													$(this).val("");
												}
											})
										}
						             , dataEvents:[{
				            	  					type:"change",
								  					fn:function(e){ setRowStatus('productsGrid'); }
							  					}]
				          			}
					    } 
					, { name: 'UNIT', width: 50, align: 'center', hidden:false, editable:false 
// 						editable:true,
// 						editoptions: { maxlength:3
// 							         , dataEvents:[{
// 							    	  					type:"change",
// 									  					fn:function(e){ setRowStatus('productsGrid'); }
// 								  					}]
// 							  			}
							} 
					, { name: 'ITEM_CTG', width: 60, align: 'center', hidden:false, editable:false
// 						editable:true,
// 						editoptions: { maxlength:4
// 					                 , dataEvents:[{
// 						    	  					type:"change",
// 								  					fn:function(e){ setRowStatus('productsGrid'); }
// 							  					}]
// 						  			}
						} 
					, { name: 'DELI_MON', width: 60, align: 'center', hidden:false, editable: true, 
			              reformatAfterEdit : false , formatter: 'date',
				          formatoptions: {
				              srcformat: 'm.Y',
				              newformat: 'm.Y',
				              defaultValue:null
				          },
				          editoptions: {
				              size: 12,
				              maxlengh: 12,
				              dataInit: function (element) {
				                  $(element).datepicker({ dateFormat: 'mm.yy' })
				              },
				              defaultValue: function(){ 
				                    var currentTime = new Date(); 
				                    var month = parseInt(currentTime.getMonth() + 1); 
				                    month = month <= 9 ? "0"+month : month; 
				                    var year = currentTime.getFullYear(); 
				                    return month + '.' + year; 
				                  },
				              dataEvents:[{
				            	  type:"change",
								  fn:function(e){
									  setRowStatus('productsGrid');
								  }
							  }]
				          }
				       }			          
					, { name: 'ROW_STATUS', align: 'center', hidden:true }
					];
		
		var gSetting = {
			height:250,
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
		btGrid.createGrid('productsGrid', colName, colModel, gSetting);
	}
	
	function createPartInvGrid() {
		var colName = [
					  'COMP_CD'
					, 'LEAD_NO'
					, 'SEQ'
					, '<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'partInvGrid\')" />'
					, '<s:message code="lead.grd.pf"/>'
					, '<s:message code="lead.grd.partnerID"/>'
					, '<s:message code="lead.grd.name"/>'
					, '<s:message code="lead.grd.address"/>'
					, '<s:message code="lead.grd.mainPartner"/>'
					, '<s:message code="lead.grd.phone"/>'
					, '<s:message code="lead.grd.email"/>'
					, 'ROW_STATUS'
					];
		
		var colModel = [
					  { name: 'COMP_CD', align: 'center', hidden:true }
					, { name: 'LEAD_NO', align: 'center', hidden:true }
					, { name: 'SEQ', align: 'center', hidden:true }
					, { name: 'CHK', width : 20, align : 'center', hidden: false, formatter : gridCboxFormat, sortable: false, index : 'CHK'}			
					, { name: 'LEAD_PF_TP', width: 80, align: 'center', editable:true, edittype:'select', formatter : 'select', editoptions: {
							value:'${LEAD_PF_TP}'
						  , dataEvents:[{
								type: 'change',
								fn: function(e) {
									var selRow = $('#partInvGrid').jqGrid('getGridParam', 'selrow');
									$("#partInvGrid").jqGrid('setCell', selRow, 'PF_PS_NO');
									$("#partInvGrid").jqGrid('setCell', selRow, 'PF_NM', null);
									$("#partInvGrid").jqGrid('setCell', selRow, 'PF_DESC', null);
									$("#partInvGrid").jqGrid('setCell', selRow, 'ADDR', null);
									$("#partInvGrid").jqGrid('setCell', selRow, 'M_PART_YN', 'N');
									$("#partInvGrid").jqGrid('setCell', selRow, 'TEL_NO', null);
									$("#partInvGrid").jqGrid('setCell', selRow, 'E_MAIL', null);
									btGrid.gridSaveRow('partInvGrid');
									setRowStatus('partInvGrid');
								}
							 }]
					  } }
					, { name: 'PF_PS_NO', width: 50, align: 'center', classes: 'gridbtnsearch', editable:false, editoptions:{maxlength:'8', 
			              dataEvents:[{
			            	  type:"change",
							  fn:function(e){
								  setRowStatus('partInvGrid');
							  }
						  }]} }
					, { name: 'PF_NM', width: 80 ,align: 'center', editable:false}
					, { name: 'ADDR', width: 200, align: 'left', hidden:false, editable:false}	
					, { name: 'M_PART_YN', width: 40,align: 'center', editable:true, edittype:'select', formatter : 'select', editoptions:{value: 'N:N;Y:Y', 
			              dataEvents:[{
			            	  type:"change",
							  fn:function(e){
								  setRowStatus('partInvGrid');
							  }
						  }]} }
					, { name: 'TEL_NO', width: 60, align: 'center', hidden:false, editable:false}	
					, { name: 'E_MAIL', width: 80, align: 'center', hidden:false, editable:false }
					, { name: 'ROW_STATUS', align: 'center', hidden:true }
					];
		
		var gSetting = {
			height:250,
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
		btGrid.createGrid('partInvGrid', colName, colModel, gSetting);
		
	}	
	
	function createContactReportGrid() {
		var colName = [
					  'COMP_CD'
					, 'SEQ'
					, 'Seq.'
					, 'Lead No.'
					, 'Prospective'
					, 'Main Contact'
					, '<s:message code="lead.grd.Description"/>'
					, 'Date'
					, 'Category'
					, 'IMPORTANCE'
					, 'Status'
					, 'Employee'
					, 'Sales Org.'
					, 'Note'
					, '<s:message code="lead.grd.TransactionType"/>'
					, '<s:message code="lead.grd.TransactionDate"/>'
					, '<s:message code="lead.grd.Status"/>'
					, '<s:message code="lead.grd.RelationshipType"/>'
					, '<s:message code="lead.grd.DocumentType"/>'
					, '<s:message code="lead.grd.CreatedOn"/>'
					, '<s:message code="lead.grd.CreatedAt"/>'
					, '<s:message code="lead.grd.CreatedBy"/>'
					, '<s:message code="lead.grd.TransactionID"/>'
					, '<s:message code="lead.grd.TransactionTypeID"/>'
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
					, { name: 'LEAD_NO', width: 80,align: 'center', hidden:false }
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
					, { name: 'TRAN_TP', width: 50, align: 'center', hidden:true}
					, { name: 'TRAN_DT', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'ACTIVE_STS', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'REL_TYPE', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'DOC_TYPE', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_ON', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_AT', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'CREATE_BY', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'TRAN_ID', width: 50, align: 'center', hidden:true, editable:false }
					, { name: 'TRAN_TP_ID', width: 50, align: 'center', hidden:true, editable:false }
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
	
	function createChangeHistoryGrid() {
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
					, { name: 'ACT', width: 100, align: 'center', hidden:false}
					, { name: 'FIELD', width: 100, align: 'left', hidden:false}
					, { name: 'OLD_VAL', width: 100, align: 'left', hidden:false}
					, { name: 'NEW_VAL', width: 100, align: 'left', hidden:false}
					, { name: 'CHG_DT', width: 100, align: 'center', hidden:false}
					, { name: 'CHG_TM', width: 100, align: 'center', hidden:true}
					, { name: 'CHG_ID', width: 100, align: 'center', hidden:true}
					, { name: 'CHG_NM', width: 100, align: 'left', hidden:false}
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
		btGrid.createGrid('chgHisGrid', colName, colModel, gSetting);
	}
	
	function setNoteData(){
		var ids = $("#noteGrid").jqGrid("getDataIDs");
		var gridData = [];
		btGrid.gridSaveRow('noteGrid');
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#noteGrid").getRowData(ids[i]);
			var auth = "";
			var rStatus = "";
			
			if ( $('#SL07-DOC_STATUS').val() != 'T' ) {
				if ( rowData["SEQ"] != "" && rowData["NOTE_TEXT"] != "" ) rStatus = "U";
				else if ( rowData["SEQ"] == "" && rowData["NOTE_TEXT"] != "" ) rStatus = "I";
			}
			
								
			var data = {
					  "COMP_CD" : rowData["COMP_CD"]
					, "LEAD_NO" : rowData["LEAD_NO"]
			        , "SEQ" : rowData["SEQ"]
					, "TEXT_TP" : rowData["TEXT_TP"]
					, "CODE_NM" : rowData["CODE_NM"]
					, "NOTE_TEXT" : rowData["NOTE_TEXT"]
					, "LANG_CD" : rowData["LANG_CD"]
					, "STATUS" : rowData["STATUS"]
					, "ROW_STATUS" : rStatus
					}

			gridData.push(data);
		}
		
		return gridData;
	
	}
	
	function setProductsData(){
		var ids = $("#productsGrid").jqGrid("getDataIDs");
		var gridData = [];
		btGrid.gridSaveRow('productsGrid');
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#productsGrid").getRowData(ids[i]);
			var auth = "";
			
			if($('#productsGrid_' + ids[i] + '_DEFAULT_YN').prop('checked')){
				auth += "Y";
			}else{
				auth += "N";
			}
				
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "LEAD_NO" : rowData["LEAD_NO"]
					, "SEQ" : rowData["SEQ"]
					, "ITEM_SEQ" : rowData["ITEM_SEQ"]
					, "MAT_CD" : rowData["MAT_CD"]
					, "MAT_DESC" : rowData["MAT_DESC"]
					, "QTY" : rowData["QTY"]
					, "UNIT" : rowData["UNIT"]
					, "ITEM_CTG" : rowData["ITEM_CTG"]
					, "DELI_MON" : rowData["DELI_MON"]
					, "ROW_STATUS" : rowData["ROW_STATUS"]
					}
			
			if( rowData["MAT_CD"] != '' ) gridData.push(data);
		}
	
		return gridData;
	}
		
	function setPartnerData(){
		var ids = $("#partInvGrid").jqGrid("getDataIDs");
		var gridData = [];
		btGrid.gridSaveRow('partInvGrid');
		for(var i = 0; i < ids.length; i++){
			var rowData = $("#partInvGrid").getRowData(ids[i]);
			var auth = "";
			
			if($('#partInvGrid_' + ids[i] + '_DEFAULT_YN').prop('checked')){
				auth += "Y";
			}else{
				auth += "N";
			}
				
			var data = {
					  "COMP_CD" :  rowData["COMP_CD"]
					, "LEAD_NO" : rowData["LEAD_NO"]
			        , "SEQ" : rowData["SEQ"]
					, "LEAD_PF_TP" : rowData["LEAD_PF_TP"]
					, "PF_PS_NO" : rowData["PF_PS_NO"]
					, "PF_NM" : rowData["PF_NM"]
					, "ADDR" : rowData["ADDR"]
					, "M_PART_YN" : rowData["M_PART_YN"]
					, "TEL_NO" : rowData["TEL_NO"]
					, "E_MAIL" : rowData["E_MAIL"]
					, "ROW_STATUS" : rowData["ROW_STATUS"]
					}
			
			if( rowData["PF_PS_NO"] != '' ) gridData.push(data);
		}
		return gridData;
	}
	
	function selectNoteGrid() {
		
		var url = "/lead/selectNoteTab.do";
		
		var leadNo = "";
		
		if ( $('#S-LEAD_ID').val() != '') {
			leadNo = $('#S-LEAD_ID').val();
		} else {
			leadNo = $("#SL07-TEMP_LEAD_NO").val();
		}
		
		var param = { "param" : {
				  "LEAD_NO"  : leadNo
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			
			if ( data.resultCustomNote != null ) {
				fn_dataBindByPrefix('frmNote', 'SL07-', data.resultCustomNote);
			}
			
			reloadGrid("noteGrid", data.resultNoteGrid);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#noteGrid'), 'selectNoteTab', data.resultNoteGrid);  // 그리드 페이징 설정

		});
	}
	
	function selectMatnPartInvTab() {
		var url = "/lead/selectMatnPartInvTab.do";
		
		var leadNo = "";
		
		if ( $('#S-LEAD_ID').val() != '') {
			leadNo = $('#S-LEAD_ID').val();
		} else {
			leadNo = $.QueryString['LEAD_NO'];
		}
		
		var param = { "param" : {
			"LEAD_NO"  : leadNo
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("productsGrid", data.resultProductsGrid);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#productsGrid'), 'selectMatnPartInvTab', data.resultProductsGrid);  // 그리드 페이징 설정
			
			reloadGrid("partInvGrid", data.resultPartInvGrid);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#partInvGrid'), 'selectMatnPartInvTab', data.resultPartInvGrid);  // 그리드 페이징 설정
			
		});
	}
	
	function selectContactReportTab() {
		var url = "/lead/selectContactReportTab.do";
		
		var leadNo = "";
		
		if ( $('#S-LEAD_ID').val() != '') {
			leadNo = $('#S-LEAD_ID').val();
		} else {
			leadNo = $("#SL07-TEMP_LEAD_NO").val();
		}
		
		var param = { "param" : {
			"LEAD_NO"  : leadNo
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("contactReportGrid", data.resultContactReportGrid);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#contactReportGrid'), 'selectContactReportTab', data.resultContactReportGrid);  // 그리드 페이징 설정
			
			if ( data.resultInteractionLog != null ) {
				//console.log(data.resultInteractionLog);
				
				fn_dataBindByPrefix('frmContRpt', 'SL07-', data.resultInteractionLog);
				fn_dataBindByPrefix('frmContRpt', 'SL071-', data.resultInteractionLog);
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
	
	function selectChangeHistoryTab() {
		var url = "/lead/selectChangeHistoryTab.do";
		
		var leadNo = "";
		
		if ( $("#SL07-LEAD_NO").val() == '') {
			return;
		}
		
		var param = { "param" : {
			"LEAD_NO"  : $("#SL07-LEAD_NO").val()
			}
		};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("chgHisGrid", data.resultChangeHistoryGrid);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#chgHisGrid'), 'selectChangeHistoryTab', data.resultChangeHistoryGrid);  // 그리드 페이징 설정			
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
				//console.log(selecedData);
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
	
	function setProductToGrid(){
		
		var selRow = $('#productsGrid').jqGrid('getGridParam', 'selrow');
		
// 		console.log(rtnProPopArr);
		
		$("#productsGrid").jqGrid('setCell', selRow, 'MAT_CD', rtnProPopArr[0]);
		$("#productsGrid").jqGrid('setCell', selRow, 'MAT_DESC', rtnProPopArr[1]);
		$("#productsGrid").jqGrid('setCell', selRow, 'UNIT', rtnProPopArr[8]);
// 		$("#productsGrid").jqGrid('setCell', selRow, 'ROW_STATUS', 'I');
		
		btGrid.gridSaveRow('productsGrid');
		setRowStatus('productsGrid');
		
	}
	
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
	
	function setRowStatus(grid){
		var selRow = $('#' + grid).jqGrid('getGridParam', 'selrow');
		
		var rowSts = "";
		('I' != $('#' + grid).jqGrid('getCell', selRow, 'ROW_STATUS')) ? rowSts = 'U' : rowSts = 'I';
		$('#' + grid).jqGrid('setCell', selRow, 'ROW_STATUS', rowSts);
		
	}
	
	function cUser1(){
		if('' != $('#SL07-LEAD_NO').val()){
			if(confirm("<s:message code='confirm.copy'/>")){
				var param = "?isStatus=C" + "&LEAD_NO=" + $('#SL07-LEAD_NO').val();
				window.top.addTab('LE_' + $('#SL07-LEAD_NO').val() + 'C', '/lead/LeadEntry.do' + param, 'LD_Copy');
			}
		}
	}
	
	function cUser4(){
		
		var url = "/lead/checkCustSalesData.do";
		
		var param = { "param" : {
			"CUST_CD"  : $("#SL07-CUST_CD").val()
			}
		};
		
		var custSales = '';
		fn_ajax(url, false, param, function(data, xhr){
			custSales = data.result.SALES_CNT;		
		});
		
		
		
		if ( custSales > 0 ) {

			var leadData = [];
			var leadItem = [];
			var leadPF = [];
			
			leadData.push($('#SL07-CUST_CD').val());
			leadData.push($('#SL07-SALES_ORG_CD').val());
			leadData.push($('#SL07-DISTRB_CH').val());
			leadData.push($('#SL07-DIV_CD').val());
			leadData.push($('#SL07-SALES_OFFICE_CD').val());
			leadData.push($('#SL07-SALES_GR').val());
			leadData.push($('#SL07-LEAD_NO').val());
			
			btGrid.gridSaveRow('partInvGrid');
			btGrid.gridSaveRow('productsGrid');
			
			var ids = $("#partInvGrid").jqGrid("getDataIDs");
			for(var i = 0; i < ids.length; i++){
				var rowData = $("#partInvGrid").getRowData(ids[i]);
				var gridData = [];	
				if ( rowData["M_PART_YN"] == 'Y' ) {
					gridData.push(rowData["LEAD_PF_TP"]);
					gridData.push(rowData["PF_PS_NO"]);
					leadPF[i] = gridData;
				}
			}
			

			var ids = $("#productsGrid").jqGrid("getDataIDs");
			var leadItem = "";
			for(var i = 0; i < ids.length; i++){
				var rowData = $("#productsGrid").getRowData(ids[i]);
				
				leadItem = leadItem + rowData["MAT_CD"] + '[';
				leadItem =  leadItem + rmNum(rowData["QTY"]) + '[';
//	 			leadItem[i] = gridData;
			}

			var param = "?isStatus=LD" + "&LEAD_NO=" + $('#SL07-LEAD_NO').val() + "&leadData=" + leadData + "&item=" + leadItem + "&partner=" + leadPF;

			if ( leadSts != '03' ) {
				alert('<s:message code="info.leadstatus"/>');
			}

			if ( leadSts == '03' ) {
				if(confirm('<s:message code="info.transqt"/>')){
					window.top.addTab('QE_' +  $('#SL07-LEAD_NO').val() + 'LD', '/quotation/QuotationEntry.do' + param, 'Q.E-Trans.');
				}
			}
		} else {
			alert('<s:message code="info.savedcust"/>');
			//alert("Should be changed Cust Account Group : [Z001] Sold-To Party Q-Cells.");
			return;
		}
		
		
	}
	
	function openContactPersonPopup(code, name) {
		var url = "/popup/ContactPersonPopup2.do";
		var pid = "ContactPersonPopup2";  //팝업 페이지의 취상위 div ID
		var param = {CUST_CD : $("#S-ACCOUNT").val()};
		//console.log(param);
		popupOpen(url, pid, param, function(data){
			if(!fn_empty(data)){
				$('[name="' + code + '"]').val(data[0].CODE);
				$('[name="' + name + '"]').text(data[0].FULL_NM);
				
			}
		});
	}
	
	
	function controlBtn(sts, btnFlag){
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
			$('#cBtnCancel').show();

// 			$('#cBtnUser4').hide();
			$('#cmm_pop_CUST_CD').show();
			$('#cmm_pop_MAIN_CONTACT').show();
			$('#cmm_pop_EMP_RESP').show();
			$('#products_btnAdd').show();
			$('#products_btnDel').show();
			$('#partner_btnAdd').show();
			$('#partner_btnDel').show();
			$('#btnCancel_InteractLog').show();
			$('#btnAdd_InteractLog').show();
			$('#btnEdit_InteractLog').show();
			$('#btnSave_InteractLog').show();
			$('#cmm_pop_ACCOUNT_CD').show();
			$('#cmm_pop_M_PS_NO').show();
			$('#cmm_pop_EMP_RESP_NO').show();
			
			if ( sts == '03' ) {
				$('#cBtnUser4').show();
			} else {
				$('#cBtnUser4').hide();	
			}
						
			
// 			var ids = $("#contactReportGrid").jqGrid("getDataIDs");
// 			if ( ids.length > 0 ) {
// 				$('#btnEdit_InteractLog').attr('disabled','disabled');			
// 			} else {
// 				$('#btnEdit_InteractLog')removeAttr('disabled');
// 			}
			
		}else{
			$('#cBtnDel').hide();
			$('#cBtnSave').hide();
			$('#cBtnUser1').show();
			$('#cBtnUser2').hide();
			$('#partner_btnAdd').hide();
			$('#item_btnAdd').hide();
			$('#item_btnPfAdd').hide();
			$('#item_btnDel').hide();
			$('#partner_btnDel').hide();
			$('#text_btnDel').hide();
			$('#item_btnPfDel').hide();
			$('#cBtnCancel').hide();
			
			if ( sts == '03' ) {
				$('#cBtnUser4').show();
			} else {
				$('#cBtnUser4').hide();	
			}			
			
			
			if ( $('#SL07-REF_QT_NO').val() != '' ) {
				$('#cBtnUser4').hide();	
			} else {
				$('#cBtnUser4').show();
			}
			
			$('#cmm_pop_CUST_CD').hide();
			$('#cmm_pop_MAIN_CONTACT').hide();
			$('#cmm_pop_EMP_RESP').hide();
			$('#products_btnAdd').hide();
			$('#products_btnDel').hide();
			$('#partner_btnAdd').hide();
			$('#partner_btnDel').hide();
			$('#btnCancel_InteractLog').hide();
			$('#btnAdd_InteractLog').hide();
			$('#btnEdit_InteractLog').hide();
			$('#btnSave_InteractLog').hide();
			$('#cmm_pop_ACCOUNT_CD').hide();
			$('#cmm_pop_M_PS_NO').hide();
			$('#cmm_pop_EMP_RESP_NO').hide();
			
			fn_formDisable(['frmGeneral']);
			fn_formDisable(['frmNote']);
			fn_formDisable(['frmContRpt']);
			fn_formDisable(['frmContRptNote']);
			
			
		}
	}
	
	function cAdd(){
		addNewTab('/lead/LeadEntry.do', 'New Lead');
		
	}
	
	/* 그리드 헤더 체크박스 선택 */
	function hdCheckboxAll(e, gid) {
		e = e || event;
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;

		var ids = $('#' + gid).jqGrid('getDataIDs');
		for (var i = 0, len = ids.length; i < len; i++) {
			if ($(e.target).prop('checked') == true) {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', true);
			} else {
				$('#' + gid + '_' + ids[i] + '_CHK').prop('checked', false);
			}
		}
	}
	
</script>

<c:import url="../import/frameBottom.jsp" />