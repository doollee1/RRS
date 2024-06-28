<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : Contact Person
	 */
%>
<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="ContactPerson" />
</c:import>
	 
<!-- dummy -->
<div class="top_button_h_margin"></div>

<div id="ctu_wrap">
	<!--  <input type="text"  name="lineAlign"  id="lineAlign" style="visibility:hidden;"/>-->
	<!-- 검색조건 영역 시작1 -->
	<form id="frmSearch" action="#">
		<input type="hidden"  name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden"  name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
			<div class="tab_top_search">
		<table width="100%">
			<tbody>
				<tr>
	      			<td class="small_td"><p><s:message code="customer.Customer"/></p></td>
	      			<td><input type="text" id="CUST_CD" name="CUST_CD"></td>
	      			<td class="small_td"><p><s:message code="customer.Name"/></p></td>
	      			<td><input type="text" id="CUST_NM" name="CUST_NM" maxlength="20"></td>
	      			<td class="small_td"><p><s:message code="customer.SrchTerm"/></p></td>
	      			<td class="2coll_wide_td">
	      				<input type="text" id="SEARCH_NM1" name="SEARCH_NM1" maxlength="20">
	      				<input type="text" id="SEARCH_NM2" name="SEARCH_NM2" maxlength="20">
	      			</td>
	      		</tr>
	      	</tbody>
	      </table>
	    </div>  
	</form>
	<!-- 검색조건 영역 끝 -->
		
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='customer.contactList'/></h4>
			</div>
		</div>		
		<table id="grid1"></table>
	    <div id="grid1_pager"></div>
	</div>
	<!-- 그리드 끝 -->

	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4><s:message code='customer.PersonInfo'/></h4>
			</div>
			<div class="ct_grid_top_right">
				<button class='btn btn-default' id='btnAdd' type='button'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
				<button class='btn btn-default' id='btnEdit' type='button'><i class='fa fa-edit'></i><s:message code='button.modify'/></button>
				<button class='btn btn-default' id='btnSave' type='button'><i class='fa fa-save'></i><s:message code='button.save'/></button>
				<input type="hidden"  name="CURRENT_PAGE2"  id="CURRENT_PAGE2" />
				<input type="hidden"  name="ROWS_PER_PAGE2"  id="ROWS_PER_PAGE2" />
			</div>
		</div>
	</div>
		<form id="frmPersonInfo" action="#">
		<input type="hidden" name="ISNEW" id="ISNEW" value="1" />
		<input type="hidden" name="CODE"  id="CODE" value="1" />
		<input type="hidden" name="H_CUST_CD" id="H_CUST_CD" />
		<input type="hidden" name="ACCOUNT_GR" id="ACCOUNT_GR" />
		
			<table class="table_line2" width="100%">
					<tr>
		      			<td class="small_td"><p><span>*</span>&nbsp;<s:message code="customer.lastName"/></td>
		      			<td><input type="text" id="NAME_2ND" name="NAME_2ND" maxlength="35" ess="ess" class="cmc_txt disabled" disabled="" readonly="readonly" ></td>
		      			<td class="small_td"><p><span>*</span>&nbsp;<s:message code="customer.firstName"/></td>
		      			<td><input type="text" id="NAME_1ST" name="NAME_1ST" maxlength="35" ess="ess" class="cmc_txt disabled" disabled="" readonly="readonly" ></td>
		      			<td class="small_td"><p><s:message code="customer.fullName"/></p></td>
		      			<td><input type="text" id="FULL_NM" name="FULL_NM" maxlength="35" disabled="" readonly="readonly"></td>
	      			</tr>
	      			<tr>
	      				<td class="small_td"><p><s:message code="customer.SrchTermOne"/></p></td>
	      				<td><input type="text" id="C_SEARCH_NM1" name="C_SEARCH_NM1" maxlength="10" disabled="" readonly="readonly">
						<input type="text" id="C_SEARCH_NM2" name="C_SEARCH_NM2" maxlength="10" disabled="" readonly="readonly"></td>
						<td class="small_td"><p><s:message code="customer.grd.Department"/></p></td>
						<td>
							<select id="DEPT_CD" name="DEPT_CD" disabled="" readonly="readonly"></select>
		        		</td>
						<td class="small_td"><p>Archive</p></td>
						<td><input style="margin-left:-0.5px;" type="checkbox" name="DEL_YN" id="DEL_YN" disabled="" readonly="readonly"></td>
					</tr>

					<tr>
						<td class="small_td"><p><s:message code="customer.StreetHouseNumber"/></p></td>
						<td>
							<input type="text" id="STREET_NM" name="STREET_NM" disabled="" readonly="readonly">
							<input type="text" id="HAUS_NO" name="HAUS_NO" disabled="" readonly="readonly"></td>
						<td class="small_td"><p><s:message code="customer.grd.Function"/></p></td>
						<td>
							<select id="FUNC_CD" name="FUNC_CD" disabled="" readonly="readonly"></select>
		        		</td>
		        		<td></td>
		        		<td></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="customer.PostalCodeCity"/></p></td>
						<td colspan="2">
							<input type="text" id="POST_CD" name="POST_CD" disabled="" readonly="readonly">
							<input type="text" id="CITY_CD" name="CITY_CD" disabled="" readonly="readonly"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="customer.Country"/></p></td>
						<td colspan="2">
							<select id="COUNTRY_CD" name="COUNTRY_CD" disabled="" readonly="readonly" ></select>
		        		</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
		        	</tr>

	       	 		<tr>
						<td class="small_td"><p><s:message code="customer.Telephone"/></p></td>
						<td><input type="text" id="TEL_NO" name="TEL_NO" maxlength="16" disabled="" readonly="readonly"></td>
						<td class="small_td"><p><s:message code="customer.Extension"/></p></td>
						<td><input type="text" id="TEL_NO_EXT" name="TEL_NO_EXT" maxlength="20" disabled="" readonly="readonly"></td>
						<td class="small_td"><p><s:message code="customer.MobilePhone"/></p></td>
						<td><input type="text" id="MOBILE_NO" name="MOBILE_NO" maxlength="16" disabled="" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="customer.Fax"/></p></td>
						<td><input type="text" id="FAX_NO" name="FAX_NO" maxlength="31" disabled="" readonly="readonly"></td>
						<td><p><s:message code="customer.Extension"/></p></td>
						<td><input type="text" id="FAX_NO_EXT" name="FAX_NO_EXT" maxlength="20" disabled="" readonly="readonly"></td>
						<td><p><s:message code="customer.E_MAIL"/></p></td>
						<td><input type="text" id="E_MAIL" name="E_MAIL" maxlength="35" disabled="" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="small_td"><p><s:message code="customer.createDate"/></p></td>
						<td><input type="text" id="REG_DT" name="REG_DT" disabled="" readonly="readonly"></td>
						<td><p><s:message code="customer.changeDate"/></p></td>
						<td><input type="text" id="UPT_DT" name="UPT_DT" disabled="" readonly="readonly"></td>
						<td><p><s:message code="customer.updateid"/></p></td>
						<td><input type="text" id="UPT_ID" name="UPT_ID" disabled="" readonly="readonly"></td>
					</tr>
				</table>
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:2px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4>QCells Attributes</h4>
			</div>
		</div>
	</div>
				<table class="table_line2" width="100%">
					<tr>
						<td>
							<table width="60%">
								<tr>
									<td width="50px"><input type="checkbox" name="QT_YN" id="QT_YN" disabled="" readonly="readonly"></td>
									<td class="small_td"><p style="margin-left:-2px">Send quotation via E-mail</p></td>
									<td width="50px"><input type="checkbox" name="SO_YN" id="SO_YN" disabled="" readonly="readonly"></td>
									<td class="small_td"><p style="margin-left:-2px">Send proforma/order confirmation via E-mail</p></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="DLV_YN" id="DLV_YN" disabled="" readonly="readonly"></td>
									<td class="small_td"><p style="margin-left:-2px">Send delivery note via E-mail</p></td>
									<td><input type="checkbox" name="INV_YN" id="INV_YN" disabled="" readonly="readonly"></td>
									<td class="small_td"><p style="margin-left:-2px">Send invoice via E-mail</p></td>
										
								</tr>
							</table>
						</td>
					</tr>
				</table>	
    </form>
	</div>
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
  var args;
	//초기 로드
	$(function() {
		setCommBtn('Search', true);				
		setCommBtn('Add', false);				
		setCommBtn('Save', false);				

		initLayout();
		createGrid1();

		var codeBoxArray = [ 'DEPT_CD'
						   , 'FUNC_CD'
						   , 'COUNTRY_CD'
							];
					
		createCodeBoxByEdit(codeBoxArray, true);
			
		$('#CUST_CD').focus();
		$('#grid1').bind('jqGridSelectRow', function(e, rowid, status) {
				grid1_onCilckRow(e, rowid, status);
			});
	
		$('#btnEdit').on('click', function (e) {
			if(fn_empty($('#grid1').jqGrid('getGridParam', 'selrow'))){
				args = '<s:message code='system.customer'/>';
				alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");
			}else{
				$('[name="ISNEW"]').val('0');
				$("#NAME_2ND").attr("disabled",false).attr("readonly",false); //입력가능
				$('#NAME_1ST').attr("disabled",false).attr("readonly",false);
				$('#C_SEARCH_NM1').attr("disabled",false).attr("readonly",false);
				$('#C_SEARCH_NM2').attr("disabled",false).attr("readonly",false);
				$('#DEPT_CD').attr("disabled",false).attr("readonly",false);
				$('#FUNC_CD').attr("disabled",false).attr("readonly",false);
				$('#DEL_YN').attr("disabled",false).attr("readonly",false);
				$('#STATUS').attr("disabled",false).attr("readonly",false);
				$('#TEL_NO').attr("disabled",false).attr("readonly",false);
				$('#TEL_NO_EXT').attr("disabled",false).attr("readonly",false);
				$('#MOBILE_NO').attr("disabled",false).attr("readonly",false);
				$('#FAX_NO').attr("disabled",false).attr("readonly",false);
				$('#FAX_NO_EXT').attr("disabled",false).attr("readonly",false);
				$('#E_MAIL').attr("disabled",false).attr("readonly",false);
				$('#UPT_DT').val($.datepicker.formatDate('dd.mm.yy', new Date()));
				$('#UPT_ID').val("${loginVO.userId}");
				$('#QT_YN').attr("disabled",false).attr("readonly",false);
				$('#SO_YN').attr("disabled",false).attr("readonly",false);
				$('#INV_YN').attr("disabled",false).attr("readonly",false);
				$('#DLV_YN').attr("disabled",false).attr("readonly",false);
				$('#btnSave').attr("disabled",false).attr("readonly",false);
				$('#btnAdd').attr("disabled",false).attr("readonly",false);
			}
		});
		
		$('#btnAdd').on('click', function (e) {
			$('#btnEdit').attr("disabled",true).attr("readonly",true);
			$('#btnSave').attr("disabled",false).attr("readonly",false);
			addPerson();
			addAddress();
		});

		$('#btnSave').on('click', function (e) {
			savePerson();
		});
		
		$("#NAME_1ST").on('keyup', function (e) {
			$("#FULL_NM").val($("#NAME_2ND").val() + ' ' + $("#NAME_1ST").val());
		});
		
		$("#NAME_2ND").on('keyup', function (e) {
			$("#FULL_NM").val($("#NAME_2ND").val() + ' ' + $("#NAME_1ST").val());
		});

		if(auth.substring(1,2) =='N'){
			$("#btnAdd").hide();
			$("#btnEdit").hide();
		}
		
		if(auth.substring(3,4) =='N'){
			$("#btnSave").hide();
		}
		
		$('.tab_top_search input').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } }); 
	});
	
	function createGrid1(){
		var colName = [
			     	  '<s:message code="customer.partnerid"/>'
					, '<s:message code="system.customer"/>'
		     		, '<s:message code="customer.lastName"/>'
		     		, '<s:message code="customer.firstName"/>'
		     		, '<s:message code="customer.SrchTerm"/>'
		     		];
		     	var colModel = [
 				 	  { name: 'CODE', width: 70, align: 'center' }
					, { name: 'CUST_CD', width: 70, align: 'center', hidden :true }          
		     		, { name: 'NAME_2ND', width: 70, align: 'left', }
		     		, { name: 'NAME_1ST', width: 70, align: 'left'}
		     		, { name: 'SEARCH_NM', width: 70, align: 'left'}
		     		];
		     	
		var gSetting = {
				pgflg:true,
				exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
				colsetting : true,  // 컬럼 설정 버튼 노출여부
				searchInit : false,  // 데이터 검색 버튼 노출여부
				resizeing : true,
				rownumbers:false,
				shrinkToFit: true,
				autowidth: true,
				queryPagingGrid:true, // 쿼리 페이징 처리 여부
				height:260
		};
		
		btGrid.createGrid('grid1', colName, colModel, gSetting);
	}
	
	
	function grid1_onCilckRow(e, rowid, status){
		
		$('#btnEdit').attr("disabled",false).attr("readonly",false);
		
		$("#frmPersonInfo").trigger('reset');
		$("#NAME_2ND").attr("disabled",true).attr("readonly",false); //입력가능
		$('#NAME_1ST').attr("disabled",true).attr("readonly",false);
		$('#C_SEARCH_NM1').attr("disabled",true).attr("readonly",false);
		$('#C_SEARCH_NM2').attr("disabled",true).attr("readonly",false);
		$('#DEPT_CD').attr("disabled",true).attr("readonly",false);
		$('#FUNC_CD').attr("disabled",true).attr("readonly",false);
		$('#DEL_YN').attr("disabled",true).attr("readonly",false);
		$('#STATUS').attr("disabled",true).attr("readonly",false);
		$('#TEL_NO').attr("disabled",true).attr("readonly",false);
		$('#TEL_NO_EXT').attr("disabled",true).attr("readonly",false);
		$('#MOBILE_NO').attr("disabled",true).attr("readonly",false);
		$('#FAX_NO').attr("disabled",true).attr("readonly",false);
		$('#FAX_NO_EXT').attr("disabled",true).attr("readonly",false);
		$('#E_MAIL').attr("disabled",true).attr("readonly",false);
		$('#QT_YN').attr("disabled",true).attr("readonly",false);
		$('#SO_YN').attr("disabled",true).attr("readonly",false);
		$('#INV_YN').attr("disabled",true).attr("readonly",false);
		$('#DLV_YN').attr("disabled",true).attr("readonly",false);
		$('#btnSave').attr("disabled",true).attr("readonly",false);
		
		if(fn_empty(rowid)){
			rowid = $('#grid1').jqGrid('getGridParam', 'selrow');
		}
		var rowData = $("#grid1").getRowData(rowid);
		
		var url = '/customer/getContactInfo.do';
		var formData = formIdAllToMap('frmSearch');
		
		formData["CUST_CD"] = rowData["CUST_CD"];
		formData["CODE"] = rowData["CODE"];
		
		var param = {"param":formData};
		fn_ajax(url, false, param, function(data, xhr){
			if(!fn_empty(data)){
				fn_dataBind('frmPersonInfo', data.result);
			}else{
				$("#frmPersonInfo").trigger('reset');
			}
		});
	}
	
	function cSearch(currentPage){

		var param = {"CUST_CD": $("#CUST_CD").val(),
					 "NAME"   : $("#CUST_NM").val(),
					 "SEARCH_NM1" : $("SEARCH_NM1").val(),
					 "SEARCH_NM2" : $("SEARCH_NM2").val()};
						
		fn_ajax('/customer/retrieveGeneral.do', true, param, function(data) {
			if (!data.RESULT) {
				return;
			}
			
			if (data.RESULT.length > 1) {
				var url = "/popup/ContactPersonSearchPopup.do";
				var pid = "ContactPearsonSearchPopup";			
				var param = {"CUST_CD" : $("#CUST_CD").val()
							,"CUST_NM" : $("#CUST_NM").val()
							,"SEARCH_NM1" : $("#SEARCH_NM1").val()
							,"SEARCH_NM2" : $("#SEARCH_NM2").val()};
				param.window = window;
				
				popupOpen(url, pid, param, function(e, selecedData){
					if(!fn_empty(selecedData)){
						$.each(selecedData, function(k, v) {
							if('CUST_CD' == k){
								$('#CUST_CD').val(v);
							}else if('CUST_NM' == k){
								$('#CUST_NM').val(v);
							}else if('SEARCH_NM1' == k){
								$('#SEARCH_NM1').val(v);
							}else if('SEARCH_NM2' == k){
								$('#SEARCH_NM2').val(v);
							}else if('ACCOUNT_GR' == k){
								$('#ACCOUNT_GR').val(v);
							}
						});
						searchPerson();
					}
				});
			} else if (data.RESULT.length === 1) {
				fn_dataBind('frmSearch', data.RESULT[0]);
				$('#ACCOUNT_GR').val(data.RESULT[0].ACCOUNT_GR);
				searchPerson();

			} else if (data.RESULT.length === 0) {
				//alert('<s:message code="validator.notfound"/>');
			}
		});
	}
	
	function searchPerson(){
		var url = '/customer/getContactList.do';
		var sendData = {'CUST_CD': $('#CUST_CD').val()};
		fn_ajax(url, false, sendData, function(data, xhr){
			if(!fn_empty(data.result)){
				reloadGrid("grid1", data.result);
				btGrid.gridQueryPaging($('#grid1'), 'cSearch', data.result);
				$('#grid1').jqGrid('setSelection', $('#grid1').jqGrid('getDataIDs')[0]);
			}else{
				//alert('<s:message code="validator.notfound"/>');
				$("#frmPersonInfo").trigger('reset');
				
				$("#NAME_2ND").attr("disabled",true).attr("readonly",false); //입력가능
				$('#NAME_1ST').attr("disabled",true).attr("readonly",false);
				$('#C_SEARCH_NM1').attr("disabled",true).attr("readonly",false);
				$('#C_SEARCH_NM2').attr("disabled",true).attr("readonly",false);
				$('#DEPT_CD').attr("disabled",true).attr("readonly",false);
				$('#FUNC_CD').attr("disabled",true).attr("readonly",false);
				$('#DEL_YN').attr("disabled",true).attr("readonly",false);
				$('#STATUS').attr("disabled",true).attr("readonly",false);
				$('#TEL_NO').attr("disabled",true).attr("readonly",false);
				$('#TEL_NO_EXT').attr("disabled",true).attr("readonly",false);
				$('#MOBILE_NO').attr("disabled",true).attr("readonly",false);
				$('#FAX_NO').attr("disabled",true).attr("readonly",false);
				$('#FAX_NO_EXT').attr("disabled",true).attr("readonly",false);
				$('#E_MAIL').attr("disabled",true).attr("readonly",false);
				$('#QT_YN').attr("disabled",true).attr("readonly",false);
				$('#SO_YN').attr("disabled",true).attr("readonly",false);
				$('#INV_YN').attr("disabled",true).attr("readonly",false);
				$('#DLV_YN').attr("disabled",true).attr("readonly",false);
				$('#btnSave').attr("disabled",true).attr("readonly",false);
				
				$('#grid1').jqGrid('clearGridData');
				$('#grid1').trigger('reloadGrid');
			}
		});
	}
	function addPerson(){
		var url = '/customer/selectCustomerCnt.do';
		var sendData = {'CUST_CD':$('#CUST_CD').val()};
		
		fn_ajax(url, false, sendData, function(data, xhr){
			if(data.result > 0){
				$("#frmPersonInfo").trigger('reset');
				$('[name="ISNEW"]').val('1');
				$('#H_CUST_CD').val($("#CUST_CD").val());
				$("#NAME_2ND").attr("disabled",false).attr("readonly",false); //입력가능
				$('#NAME_1ST').attr("disabled",false).attr("readonly",false);
				$('#C_SEARCH_NM1').attr("disabled",false).attr("readonly",false);
				$('#C_SEARCH_NM2').attr("disabled",false).attr("readonly",false);
				$('#DEPT_CD').attr("disabled",false).attr("readonly",false);
				$('#FUNC_CD').attr("disabled",false).attr("readonly",false);
				$('#DEL_YN').attr("disabled",false).attr("readonly",false);
				$('#STATUS').attr("disabled",false).attr("readonly",false);
				$('#TEL_NO').attr("disabled",false).attr("readonly",false);
				$('#TEL_NO_EXT').attr("disabled",false).attr("readonly",false);
				$('#MOBILE_NO').attr("disabled",false).attr("readonly",false);
				$('#FAX_NO').attr("disabled",false).attr("readonly",false);
				$('#FAX_NO_EXT').attr("disabled",false).attr("readonly",false);
				$('#E_MAIL').attr("disabled",false).attr("readonly",false);
				$('#REG_DT').val($.datepicker.formatDate('dd.mm.yy', new Date()));
				$('#UPT_DT').val($.datepicker.formatDate('dd.mm.yy', new Date()));
				$('#UPT_ID').val("${loginVO.userId}");
				$('#QT_YN').attr("disabled",false).attr("readonly",false);
				$('#SO_YN').attr("disabled",false).attr("readonly",false);
				$('#INV_YN').attr("disabled",false).attr("readonly",false);
				$('#DLV_YN').attr("disabled",false).attr("readonly",false);
			}else{
				args = '<s:message code='system.customer'/>';
				alert("<s:message code='errors.select' arguments='" + args + "' javaScriptEscape='false'/>");
			}
		});
	}
	
	function addAddress(){
		var url = '/customer/retrieveGeneral.do';
		var sendData = {'CUST_CD':$('#CUST_CD').val()};
		
		fn_ajax(url, false, sendData, function(data, xhr){
			$('#STREET_NM').val(data.RESULT[0].STREET_NM);
			$('#HAUS_NO').val(data.RESULT[0].HAUS_NO);
			$('#POST_CD').val(data.RESULT[0].POST_CD);
			$('#CITY_CD').val(data.RESULT[0].CITY_NM);
			$('#COUNTRY_CD').val(data.RESULT[0].COUNTRY_CD);
			$("#COUNTRY_CD").val(data.RESULT[0].COUNTRY_CD).attr("selected", "selected");
		});
}
	function savePerson(){
		if (fn_inputCheck('frmPersonInfo') == false) return;
		
		if (confirm("<s:message code='confirm.save'/>")) {
			var formdata = formIdAllToMap('frmPersonInfo');
			
			var url = '/customer/saveContactPerson.do';
			var param = {'paramData':formdata
						,'CUST_CD' : $("#CUST_CD").val()};
			fn_ajax(url, false, param, function(data, xhr){
				alert("<s:message code='info.save'/>");
				searchPerson();
			});
		}
	}
</script>
<c:import url="../import/frameBottom.jsp" />