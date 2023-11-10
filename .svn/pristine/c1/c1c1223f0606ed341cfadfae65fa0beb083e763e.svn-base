<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : InterfaceSample
	 * @Description : Interface 컨트롤 샘플 화면
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="InterfaceSample" />
</c:import>

<div id="ctm_wrap">
	<!-- 검색조건 영역 시작 -->
	<form id="frmSearch" action="#">
	
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">			
				<li class="cls"></li>			
				<li class="sech_list">
					<label> Receive ERP Customer&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="button" id="btnSapCustIF" name="btnSapCustIF" value="btnSapCustIF" />
				</li>	
				
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive CRM Customer  &nbsp;&nbsp;&nbsp;&nbsp; </label>
					
					<label > Year&nbsp; </label>
					<input type="text" id="CRM_CRDAT" name="CRM_CRDAT" value="20120101"/>					
					<input type="text" id="CRM_CRDAT_TO" name="CRM_CRDAT_TO" value="20120101"/>
					
					<input type="button" id="btnCrmCustIF" name="btnCrmCustIF" value="btnCrmCustIF" />
				</li>
				
				
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive MS Partner  &nbsp;&nbsp;&nbsp;&nbsp; </label>
					<input type="button" id="btnSapMSPartIF" name="btnSapMSPartIF" value="btnSapMSPartIF" />
				</li>
				
			</ul>
		</div>
		
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="cls"></li>
				<li class="cls"></li>
					<label > Receive SAP Product  &nbsp;&nbsp;&nbsp;&nbsp; </label>
					<label > Changed ('X') &nbsp;</label>
					<input type="text" id="ZCDPOR" name="ZCDPOR" value="X"/>
					<label > VKORG &nbsp;</label>
					<input type="text" id="P_VKORG" name="P_VKORG" value="1000"/>
					<label > WERKS </label>
					<input type="text" id="P_WERKS" name="P_WERKS" value="1000"/>
					<input type="button" id="btnSapProdIF" name="btnSapProdIF" value="btnSapProdIF" />
				<li class="sech_list">
				</li>
				
				<li class="cls"></li>
				<li class="sech_list">
					<label > Receive SAP BOM &nbsp;&nbsp;&nbsp;&nbsp; </label>
					<label > WERKS &nbsp;</label>
					<input type="text" id="B_WERKS" name="B_WERKS" value="1000"/>
					<label > STLAN &nbsp;</label>
					<input type="text" id="B_STLAN" name="B_STLAN" value="5"/>
					<label > STLTY </label>
					<input type="text" id="B_STLTY" name="B_STLTY" value="M"/>
					<label > MATNR &nbsp;</label>
					<input type="text" id="B_MATNR" name="B_MATNR" value=""/>
					<input type="button" id="btnSapBomIF" name="btnSapBomIF" value="btnSapBomIF" />
				</li>
				
			</ul>
		</div>
		
	
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive Sap EMP&nbsp;&nbsp;&nbsp;&nbsp; </label>
					<input type="button" id="btnSapEmpIF" name="btnSapEmpIF" value="btnSapEmpIF" />
				</li>
			</ul>
		</div>
		
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive CRM Lead  &nbsp;&nbsp;&nbsp;&nbsp;</label>
					<label > Date &nbsp;</label>
					<input type="text" id="IS_POSTING_DATE" name="IS_POSTING_DATE" value="20160101"/>	
					<input type="text" id="IS_POSTING_DATE_TO" name="IS_POSTING_DATE_TO" value="20160101"/>					
					<input type="button" id="btnCrmLeadIF" name="btnCrmLeadIF" value="btnCrmLeadIF" />
				</li>
				
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive CRM Quotation &nbsp;&nbsp;&nbsp;&nbsp;</label>
					<label > Date &nbsp;</label>
					<input type="text" id="IS_DATE" name="IS_DATE" value="20150101"/>	
					<input type="text" id="IS_DATE_TO" name="IS_DATE_TO" value="20150101"/>	
					<input type="button" id="btnCrmQuotIF" name="btnCrmQuotIF" value="btnCrmQuotIF" />
				</li>
			</ul>
		</div>
		
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive ERP Sales Order   &nbsp;&nbsp;&nbsp;&nbsp; </label>
					<label > Date &nbsp;</label>
					<input type="text" id="ERDAT_ST" name="ERDAT_ST" value="20160101"/>
					<label > ~ &nbsp;</label>
					<input type="text" id="ERDAT_ED" name="ERDAT_ED" value="20160101"/>
					<input type="button" id="btnSapOrderIF" name="btnSapOrderIF" value="btnSapOrderIF" />
				</li>
				
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive ERP Customer Grade  &nbsp;&nbsp;&nbsp;&nbsp; </label>
					<label > Customer &nbsp;</label>
					<input type="text" id="CUST_CD" name="CUST_CD" value=""/>
					<input type="button" id="btnCustomerKLABC" name="btnCustomerKLABC" value="CustomerGrade" />
				</li>
			</ul>
		</div>
		
		
		
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="cls"></li>
<!-- 				<li class="sech_list"> -->
<!-- 					<label> CRM Connection </label> -->
<!-- 					<input type="button" id="btnCRMIF" name="btnCRMIF" value="CRM Conn." /> -->
<!-- 				</li> -->
<!-- 				<li class="sech_list"> -->
<!-- 					<label> Receive Mail Test </label> -->
<!-- 					<input type="button" id="btnInvoice" name="btnInvoice" value="Invoice" /> -->
<!-- 				</li>				 -->
<!-- 				<li class="sech_list"> -->
<!-- 					<label> 프로시져 테스트 </label> -->
<!-- 					<input type="button" id="btnProcTest" name="btnProcTest" value="btnProcTest" />					 -->
<!-- 				</li> -->
				<li class="sech_list">
					<label><a href='<c:url value="/external/module/ModuleSearch.do"/>'>external material Test</a></label>
					
				</li>
				
				<li class="cls"></li>
				<li class="sech_list">
					<label> ERP Conn Test &nbsp;&nbsp;&nbsp;&nbsp;</label>
					
					<input type="button" id="btnConnTest" name="btnConnTest" value="btnConnTest" />
				</li>
				<li class="cls"></li>
				<li class="sech_list">
					<label> CRM Conn Test &nbsp;&nbsp;&nbsp;&nbsp;</label>
					
					<input type="button" id="btnCRMConnTest" name="btnCRMConnTest" value="btnCRMConnTest" />
				</li>				
			</ul>
		</div>
		
		
		<div id="ctm_sech_wrap" >
			<ul class="sech_ul">
				<li class="cls"></li>
				<li class="sech_list">
					<label> Receive Sales Order Batch   &nbsp;&nbsp;&nbsp;&nbsp; </label>
					<input type="button" id="btnSapOrderBatch" name="btnSapOrderBatch" value="btnSapOrderBatch" />
				</li>
			</ul>
		</div>
		
	</form>
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
			
		$("#btnEmail").click(function(e) {
			sendEmail();
		})
		
		$("#btnSapProdIF").click(function(e){
			var url = "/common/callSapIfErpProduct.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {ZCDPOR : $("#ZCDPOR").val()
					   , P_VKORG : $("#P_VKORG").val()
					   , P_WERKS : $("#P_WERKS").val()
						};
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.MESSAGE);
			});
			
		})

		$("#btnSapBomIF").click(function(e){
			var url = "/common/callSapIfErpBom.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = { WERKS : $("#B_WERKS").val()
				        , STLAN : $("#B_STLAN").val()
				        , STLTY : $("#B_STLTY").val()
				        , MATNR : $("#B_MATNR").val()
					    };
			
			fn_ajax(url, true, param, function(data, xhr){
				alert(data.MESSAGE);
			});
		})
		
		$("#btnSapEmpIF").click(function(e){
			var url = "/common/callSapIfErpEmp.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {"param":formData};
			
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.MESSAGE);
			});
		})
		
		$("#btnSapMSPartIF").click(function(e){
			var url = "/common/callErpMsPartner.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {"param":formData};
			
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.MESSAGE);
			});
		})	
		
		$("#btnCRMIF").click(function(e){
			var url = "/common/connCRM.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {"param":formData};
			
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.MESSAGE);
			});
		})		

		$("#btnInvoice").click(function(e){

			fn_ajax('/salesOrder/sendEmail_Invoice.do', false, {}, function(data, xhr){
			});
		})
		
		$("#btnSapCustIF").click(function(e){
			var url = "/common/callErpCustomer.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {"param":formData};
			
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.MESSAGE);
			});
		})	

		$("#btnSapOrderIF").click(function(e){
			var url = "/common/callErpSalesOrder.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = { ERDAT_ST : $("#ERDAT_ST").val()
				        , ERDAT_ED : $("#ERDAT_ED").val()
					    };
			
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.MESSAGE);
			});
		})	

		$("#btnCrmCustIF").click(function(e){
			var url = "/common/callCrmCustomer.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {IS_CRDAT : $("#CRM_CRDAT").val()
					   , IS_CRDAT_TO : $("#CRM_CRDAT_TO").val()
					   };
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.MESSAGE);
			});
		})	

		$("#btnCrmLeadIF").click(function(e){
			var url = "/common/callCrmLead.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {IS_POSTING_DATE : $("#IS_POSTING_DATE").val()
					   , IS_POSTING_DATE_TO : $("#IS_POSTING_DATE_TO").val() };
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.MESSAGE);
			});
		})	

		$("#btnCrmQuotIF").click(function(e){
			var url = "/common/callCrmQuot.do";
			
			var formData = formIdAllToMap('frmSearch');
			var param = {IS_POSTING_DATE : $("#IS_DATE").val()
					   , IS_POSTING_DATE_TO : $("#IS_DATE_TO").val()};
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.MESSAGE);
			});
		})	
		
		// 프로시져 테스트
		$("#btnProcTest").bind("click", function () {			
			var url = "/sample/callProcTest.do";
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.result);
			});
		});
		
		
		// 접속 테스트
		$("#btnConnTest").bind("click", function () {			
			var url = "/common/callERPConnTest.do";
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.result);
			});
		});
		

		// 접속 테스트
		$("#btnCRMConnTest").bind("click", function () {			
			var url = "/common/callCRMConnTest.do";
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.result);
			});
		});

		// 
		$("#btnSapOrderBatch").bind("click", function () {			
			var url = "/common/callERPSOBatch.do";
			fn_ajax(url, false, {}, function(data, xhr){
				alert(data.result);
			});
		});	
		
		$("#btnCustomerKLABC").bind("click", function () {			
			var url = "/common/callErpCustomerKLBABC.do";

			var formData = formIdAllToMap('frmSearch');
			var param = {CUST_CD : $("#CUST_CD").val()};
			
			fn_ajax(url, false, param, function(data, xhr){
				alert(data.result);
			});
		});	
		
		
	});	
	
	function sendEmail() {
		var url = "/common/sendMail.do";
		
		var param = {"param" : { "mail_yn":"Y" } };
		
		fn_ajax(url, false, param, function(data, xhr){
			alert(data.MESSAGE);
		});			
	}
</script>

<c:import url="../import/frameBottom.jsp" />