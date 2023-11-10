<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<c:import url="../import/frameTop.jsp">
	<c:param name="progcd" value="CreditCustomer" />
</c:import>

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
	      				<input type="text" data-searchcolumn="SEARCH_NM1" maxlength="20">
	      				<input type="text" data-searchcolumn="SEARCH_NM2" maxlength="20">
	      			</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="customer.CityName"/></p></td>
					<td><input type="text" data-searchcolumn="CITY_NM"></td>
					<td class="small_td"><p><s:message code="customer.PostalCode"/></p></td>
					<td><input type="text" data-searchcolumn="POST_CD"></td>
					<td class="small_td"><p><s:message code="customer.Country"/></p></td>
					<td><select data-searchcolumn="COUNTRY_CD"></select></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="credit.Atradius"/></p></td>
					<td><p><input type="text" data-searchcolumn="EASY_NO" maxlength="10"></input></p></td>
					<td class="small_td"><p><s:message code="customer.CompanyCode"/></p></td>
					<td>
						<select id="CreditCustomerPortfolioPopup_COMP_CD" data-searchcolumn="COMP_CD">
						</select>
					</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div id="ctd_wrap">
	<div class="ctu_gl_wrap ctu_resize" style="width:calc(50% - 10px); height:calc(50%); padding-top:-95px;">
		<div id="ctd_dg_wrap" style="margin-bottom:40px">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4>Customer List</h4>
				</div>		
			</div>
			<table id="creditCustomerGrid"></table>
			<div id="creditCustomerGrid_pager"></div>
		</div>
	</div>
	
	<div id="CreditCustomer_custinfo" class="ctu_gr_wrap ctu_resize" style="width:calc(50% - 10px); height:calc(50%); padding-top:0px;">
		<form id="frmDetail" action="#">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left">
				<h4>Customer Information</h4>
			</div>
			<div class="ct_grid_top_right">
			<!--
				<button class="btn btn-default" id="CreditCustomer_OrganisationID" disabled="disabled" name="item_btnPfAdd" type="button"><i class="fa fa-plus-square-o"></i>Request ID</button>
			-->
			</div>
		</div>
		
		<table class="tblForm" style="border:1px solid #ddd; padding-top:5px;">
			<tr>
				<th width="171"><s:message code="credit.CompanyName"/></th>
				<td><input type="text" data-custinfo="CUST_NM" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/></td>
				</tr>
			<tr>
				<th><s:message code="credit.VAT"/></th>
				<td class="inputright"><input type="text" data-custinfo="VAT_REG_NO" class="cmc_txt" maxlength="50" style="width:calc(50% - 10px);"/>
					<input class="btn btn-default" id="CreditCustomer_checkVat" type="button" value="Verify"></input>
				</td>
			</tr>
			<tr>
				<th><s:message code="credit.Street"/></th>
				<td><input type="text" data-custinfo="STREET_NM" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/></td>
			</tr>
			<tr>
				<th><s:message code="credit.House"/></th>
				<td><input type="text" data-custinfo="HAUS_NO" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/></td>
			</tr>
			<tr>
				<th><s:message code="credit.PostalCode"/></th>
				<td><input type="text" data-custinfo="POST_CD" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/></td>
			</tr>
			<tr>
				<th><s:message code="credit.City"/></th>
				<td><input type="text" data-custinfo="CITY_NM" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/></td>
				</tr>
			<tr>
				<th><s:message code="credit.Country"/></th>
				<td><input type="text" data-custinfo="COUNTRY_CD" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/>
				<!--<td><input type="text" data-custinfo="COUNTRY_CD" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 0px);"/>-->
				</tr>
			<tr>
				<th><s:message code="credit.Atradius"/></th>
				<td><input type="text" data-custinfo="EASY_NO" class="cmc_txt" maxlength="50" disabled="disabled" style="width:calc(50% - 10px);"/>
					<button class="btn btn-default" id="CreditCustomer_OrganisationID" disabled="disabled" name="item_btnPfAdd" type="button"><i class="fa fa-plus-square-o"></i>Request ID</button>
					<button class="btn btn-default" id="CreditCustomer_OrganisationIDSave" type="button"><i class="fa fa-save"></i><s:message code="credit.Save"/></button>
				</tr>
		</table>		
				
		<div id="ctd_dg_wrap" style="margin-bottom:40px">
			<div class="ct_grid_top_wrap">
				<div class="ct_grid_top_left">
					<h4><s:message code="credit.Credit"/></h4>
				</div>
				<div class="ct_grid_top_right">
					<button class="btn btn-default" id="CreditCustomer_Credit" disabled="disabled" type="button"><i class="fa fa-plus-square-o"></i><s:message code="credit.Request"/></button>
					<button class="btn btn-default" id="CreditCustomer_Cancel" disabled="disabled" type="button"><i class="fa fa-refresh"></i><s:message code="credit.Cancel"/></button>
					<button class="btn btn-default" id="CreditCustomer_Save" disabled="disabled" type="button"><i class="fa fa-save"></i><s:message code="credit.Save"/></button>
				</div>	
			</div>
			<table id="CreditCustomer_creditinfo" class="tblForm" style="border:1px solid #ddd; padding-top:5px;">
				<tr>
					<th width="171"><s:message code="credit.External"/></th>
					<td><input type="text" data-creditinfo="EV_EXTLIM" class="cmc_txt" disabled="disabled" data-validcurrency="" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="credit.Internal"/></th>
					<td><input type="text" data-creditinfo="EV_INLIM" class="cmc_txt" disabled="disabled" data-validcurrency="" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="credit.Total"/></th>
					<td><input type="text" data-creditinfo="EV_LIMIT" class="cmc_txt" disabled="disabled" data-validcurrency="" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="credit.CreditExposure"/></th>
					<td><input type="text" data-creditinfo="EV_OPEN" class="cmc_txt" disabled="disabled" data-validcurrency="" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="customer.ExpiryDate"/></th>
					<td><input type="text" data-creditinfo="EV_ZZGBDAT" disabled="disabled" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="customer.ApplyDate"/></th>
					<td><input type="text" data-creditinfo="EV_ZZBDATUM" disabled="disabled" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="credit.Request"/></th>
					<td><input type="text" data-custinfo="REQ_CREDIT" data-creditinfo="REQ_CREDIT" class="cmc_txt" data-validcurrency="" maxlength="14" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="credit.Result"/></th>
					<td><input type="text" data-creditinfo="EV_RESULT" class="cmc_txt" disabled="disabled" data-validcurrency="" style="width:calc(50% - 10px);"/></td>
				</tr>
				<tr>
					<th><s:message code="credit.ReturnMessage"/></th>
					<td><textarea data-creditinfo="EV_DECS" class="cmc_txt" disabled="disabled" style="width:calc(50% - 10px); height:150px;"></textarea></td>
					</tr>
			</table>
		</div>
		</form>
	</div>
</div>
</div>	


<script>
(function() {
	var custinfoElms = document.querySelectorAll('#CreditCustomer_custinfo [data-custinfo]');
	var creditinfoElms = document.querySelectorAll('#CreditCustomer_creditinfo [data-creditinfo]');
	var currencyElms = document.querySelectorAll('[data-validcurrency]');
	
	var reqAtradiusBtn = document.getElementById('CreditCustomer_OrganisationID');
	var saveAtradiusBtn = document.getElementById('CreditCustomer_OrganisationIDSave');
	var reqCreditBtn = document.getElementById('CreditCustomer_Credit');
	var reqCancelBtn = document.getElementById('CreditCustomer_Cancel');
	var reqSaveBtn = document.getElementById('CreditCustomer_Save');
	
	var isSoldTo = false;
	
	var isChange = false;
	var beforeSelection = 1;
	var dataLen = 0;
	
	function createGrid() {
		var colName =  [
			'<s:message code="customer.Customer"/>',
			'<s:message code="customer.Name"/>',
			'<s:message code="customer.AccountGrp"/>',
			'<s:message code="customer.Grade"/>',
			'',
			'',
			'',
			'',
			'',
			'',
			'<s:message code="customer.PostalCode"/>',
			'<s:message code="customer.CityName"/>',
			'<s:message code="customer.Country"/>',
			'',
			'',
			'EASY_NO'
		];
		
		var colModel = [
			{ name: 'CUST_CD', width: 100, align: 'center' },
			{ name: 'CUST_NM', width: 250, align: 'left' },
			{ name: 'ACCOUNT_GR_NM', width: 200, align: 'left', hidden: true },
			{ name: 'GRADE', width: 100, align: 'center' , hidden: true },
			{ name: 'COMP_CD', hidden: true },
			{ name: 'ACCOUNT_GR', hidden: true },
			{ name: 'COMP_NM', hidden: true },
			{ name: 'VAT_REG_NO', hidden: true },
			{ name: 'STREET_NM', hidden: true },
			{ name: 'HAUS_NO', hidden: true },
			{ name: 'POST_CD', width: 80, align: 'left' },
			{ name: 'CITY_NM', width: 200, align: 'left' },
			{ name: 'COUNTRY_CD', width: 80, align: 'center' },
			{ name: 'POLICY_NO', hidden: true },
			{ name: 'REQ_CREDIT', hidden: true },
			{ name: 'EASY_NO', hidden: true }			
		];
		
		var gSetting = {
			height: 608,
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
		
		btGrid.createGrid('creditCustomerGrid', colName, colModel, gSetting);
		btGrid.gridResizing('creditCustomerGrid');
	}
	
	// for cache
	var searchElms = document.querySelectorAll('[data-searchcolumn]');
	
	function initialize() {
		$.when(Util.component.createCombobox(searchElms, true))
		.done(function() {
			createGrid();			
			$("#CreditCustomerPortfolioPopup_COMP_CD option").each(function() {				
				if ($(this).val() != '1000' && $(this).val() != '3500') {
					$(this).remove();	
				}
			});
		});
		
		$('.tab_top_search input').on('keypress', function(e) { if(e.keyCode === 13) { cSearch() } }); 
	}
	
	function formatCurrency() {
		Array.prototype.forEach.call(currencyElms, function(elm) {
			var list = elm.value.split('.');
			var value = list[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.'); 
			if (list.length > 1) {
				value += (',' + list[1]);
			}
			if (!!value && value.indexOf(',') === -1) {
				value += ',00';
			}
			elm.value = value;
		});
	}
	
	function redrawData(customerList) {
		reloadGrid('creditCustomerGrid', customerList);
	}
	
	function refresh() {
		Array.prototype.forEach.call(custinfoElms, function(elm) {
			elm.value = '';
		});
		
		Array.prototype.forEach.call(creditinfoElms, function(elm) {
			elm.value = '';
		});
		
		reqCreditBtn.setAttribute('disabled', 'disabled');
		reqCancelBtn.setAttribute('disabled', 'disabled');
		reqSaveBtn.setAttribute('disabled', 'disabled');
	}
	
	/*
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
	*/
	
	var reqCredit = document.querySelector('[data-creditinfo="REQ_CREDIT"]');
	reqCredit.addEventListener('input', function(e) {
		var list = reqCredit.value.replace(/[^0-9,]/g, '').split(','); 
		var value = list[0].replace(/\B(?=(\d{3})+(?!\d))/g, "."); 
		if (list.length > 1) {
			value += (',' + list[1].substr(0, 2));
		}
		reqCredit.value = value;
	});
	
	////////////////////////////////////////////////////////////////////
	// select event
	////////////////////////////////////////////////////////////////////
	$('#creditCustomerGrid').bind('jqGridSelectRow', function(e, rowId, status) {
		$("input").change(function(){
			isChange  = true;
		});
		
		if(isChange) {
			if(confirm('<s:message code="info.saveChk"/>')) {
				return;	
			} else {
				isChange  = false;
				reqAtradiusBtn.removeAttribute('disabled');
				refresh();
				var row = $('#creditCustomerGrid').jqGrid('getRowData', rowId);
				$.each(row, function(k, v) {
					Array.prototype.some.call(custinfoElms, function(elm) {
						if (elm.dataset.custinfo === k) {
							elm.value = v;
							return true;
						}
						return false;
					});
				});
				
				// call erp for SoldTo
				if (row.ACCOUNT_GR !== 'Z001' && row.ACCOUNT_GR !== '0001') {
					isSoldTo = false;
					var atradiusId = document.querySelector('[data-custinfo="EASY_NO"]').value;
					if (!!atradiusId) {
						reqCreditBtn.removeAttribute('disabled');
						reqCancelBtn.removeAttribute('disabled');
						reqSaveBtn.removeAttribute('disabled');
					}
					formatCurrency();
					return;
				}
				
				isSoldTo = true;
				var param = {
					COMP_CD: row.COMP_CD,
					CUST_CD: row.CUST_CD
				};
				
				fn_ajax('/common/retrieveCredit.do', true, param, function(data) {
					if (!!data.RESULT) {
						var exportParameter;
						Array.prototype.some.call(data.RESULT, function(v) {
							if (v.tableName === 'ExportParameter') {
								exportParameter = v.rows[0];
								return true;
							}
							return false;
						});
						
						if (!!exportParameter) {
							var totalAmount = exportParameter.EV_LIMIT;
							var externalAmount = exportParameter.EV_EXTLIM;
							var internalAmount = parseFloat(totalAmount) - parseFloat(externalAmount);
							
							document.querySelector('[data-creditinfo="EV_LIMIT"]').value = totalAmount;
							document.querySelector('[data-creditinfo="EV_EXTLIM"]').value = externalAmount;
							document.querySelector('[data-creditinfo="EV_INLIM"]').value = internalAmount;
							document.querySelector('[data-creditinfo="EV_OPEN"]').value = exportParameter.EV_OPEN;
							
							document.querySelector('[data-creditinfo="EV_ZZGBDAT"]').value = Util.converter.dateFormat2(exportParameter.EV_ZZGBDAT);
							document.querySelector('[data-creditinfo="EV_ZZBDATUM"]').value = Util.converter.dateFormat2(exportParameter.EV_ZZBDATUM);
							document.querySelector('[data-creditinfo="EV_DECS"]').value = exportParameter.EV_ZZTEXT1;
							
							var atradiusId = document.querySelector('[data-custinfo="EASY_NO"]').value;
							if (!!atradiusId) {
								reqCreditBtn.removeAttribute('disabled');
								reqCancelBtn.removeAttribute('disabled');
								reqSaveBtn.removeAttribute('disabled');
							}
						}
						
						formatCurrency();
					}
				});
			}
		} else {
			isChange  = false;
			reqAtradiusBtn.removeAttribute('disabled');
			refresh();
			var row = $('#creditCustomerGrid').jqGrid('getRowData', rowId);
			$.each(row, function(k, v) {
				Array.prototype.some.call(custinfoElms, function(elm) {
					if (elm.dataset.custinfo === k) {
						elm.value = v;
						return true;
					}
					return false;
				});
			});
			
			// call erp for SoldTo
			if (row.ACCOUNT_GR !== 'Z001' && row.ACCOUNT_GR !== '0001') {
				isSoldTo = false;
				var atradiusId = document.querySelector('[data-custinfo="EASY_NO"]').value;
				if (!!atradiusId) {
					reqCreditBtn.removeAttribute('disabled');
					reqCancelBtn.removeAttribute('disabled');
					reqSaveBtn.removeAttribute('disabled');
				}
				formatCurrency();
				return;
			}
			
			isSoldTo = true;
			var param = {
				COMP_CD: row.COMP_CD,
				CUST_CD: row.CUST_CD
			};
			
			fn_ajax('/common/retrieveCredit.do', true, param, function(data) {
				if (!!data.RESULT) {
					var exportParameter;
					Array.prototype.some.call(data.RESULT, function(v) {
						if (v.tableName === 'ExportParameter') {
							exportParameter = v.rows[0];
							return true;
						}
						return false;
					});
					
					if (!!exportParameter) {
						var totalAmount = exportParameter.EV_LIMIT;
						var externalAmount = exportParameter.EV_EXTLIM;
						var internalAmount = parseFloat(totalAmount) - parseFloat(externalAmount);
						
						document.querySelector('[data-creditinfo="EV_LIMIT"]').value = totalAmount;
						document.querySelector('[data-creditinfo="EV_EXTLIM"]').value = externalAmount;
						document.querySelector('[data-creditinfo="EV_INLIM"]').value = internalAmount;
						document.querySelector('[data-creditinfo="EV_OPEN"]').value = exportParameter.EV_OPEN;
						
						document.querySelector('[data-creditinfo="EV_ZZGBDAT"]').value = Util.converter.dateFormat2(exportParameter.EV_ZZGBDAT);
						document.querySelector('[data-creditinfo="EV_ZZBDATUM"]').value = Util.converter.dateFormat2(exportParameter.EV_ZZBDATUM);
						document.querySelector('[data-creditinfo="EV_DECS"]').value = exportParameter.EV_ZZTEXT1;
						
						var atradiusId = document.querySelector('[data-custinfo="EASY_NO"]').value;
						if (!!atradiusId) {
							reqCreditBtn.removeAttribute('disabled');
							reqCancelBtn.removeAttribute('disabled');
							reqSaveBtn.removeAttribute('disabled');
						}
					}

					formatCurrency();
				}
			});
		}
		

		
	});
	
	////////////////////////////////////////////////////////////////////
	// request valid VAT
	////////////////////////////////////////////////////////////////////
	document.getElementById('CreditCustomer_checkVat').addEventListener('click', function(e) {
		var vatNo = document.querySelector('[data-custinfo="VAT_REG_NO"]').value;
		if (!vatNo) {
			alert('<s:message code="error.inputvat"/>');
			return;
		}
		var param = {
			VAT_REG_NO: vatNo
		};
		
		fn_ajax('/remote/checkEuropeanCommission.do', true, param, function(data) {
			var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
			var elm = xml.querySelector('valid');
			if (!!elm) {
				if (elm.textContent === 'false') {
					alert('<s:message code="info.invalidvat"/>');
					if ( dataLen != 1 ) {
						isChange = true;
					}
				} else {
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
	
	////////////////////////////////////////////////////////////////////
	// request get attradius id
	////////////////////////////////////////////////////////////////////
	reqAtradiusBtn.addEventListener('click', function(e) {
		var param = {
			CUST_NM: document.querySelector('[data-custinfo="CUST_NM"]').value,
			VAT_REG_NO: document.querySelector('[data-custinfo="VAT_REG_NO"]').value,
			STREET_NM: document.querySelector('[data-custinfo="STREET_NM"]').value,
			HAUS_NO: document.querySelector('[data-custinfo="HAUS_NO"]').value,
			POST_CD: document.querySelector('[data-custinfo="POST_CD"]').value,
			CITY_NM: document.querySelector('[data-custinfo="CITY_NM"]').value,
			COUNTRY_CD: document.querySelector('[data-custinfo="COUNTRY_CD"]').value
		}
		
		fn_ajax('/remote/retrieveOrganisationID.do', true, param, function(data) {
			var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
			
			if (!!xml.querySelector('errorDescription')) {
				alert(xml.querySelector('errorDescription').textContent);
				return;
			}
			
			var count = xml.querySelector('CountOrg').textContent;
			if (count === '1') {
				document.querySelector('[data-custinfo="EASY_NO"]').value = xml.querySelector('OrgId').textContent;
				reqCreditBtn.removeAttribute('disabled');
				if (isSoldTo) {
					reqCancelBtn.removeAttribute('disabled');
					reqSaveBtn.removeAttribute('disabled');
				}
			} else {
				popupOpen('/customer/creditCustomerSearchPopup.do', 'CreditCustomerSearchPopup', { xml: xml }, function(e, selecedData) {
					if (!!selecedData && !!selecedData) {
						document.querySelector('[data-custinfo="EASY_NO"]').value = selecedData.ORG_ID;
						reqCreditBtn.removeAttribute('disabled');
						if (isSoldTo) {
							reqCancelBtn.removeAttribute('disabled');
							reqSaveBtn.removeAttribute('disabled');
						}
					}
				});
			}
			if ( dataLen != 1 ) {
				isChange = true;
			}
			beforeSelection = $('#creditCustomerGrid').jqGrid('getGridParam', 'selrow');
		});
	});
	
	////////////////////////////////////////////////////////////////////
	// save attradius id
	////////////////////////////////////////////////////////////////////
	saveAtradiusBtn.addEventListener('click', function(e) {
		var easyno = document.querySelector('[data-custinfo="EASY_NO"]').value;
		if (!easyno) {
			alert('<s:message code="info.attradius"/>');
			return;
		}

		//var selRow = $('#creditCustomerGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $('#creditCustomerGrid').jqGrid('getRowData', beforeSelection);
		var param = {
			COMP_CD: rowData.COMP_CD,
			CUST_CD: rowData.CUST_CD,
			EASY_NO: easyno
		}
		
		fn_ajax('/customer/updateAtradiusId.do', true, param, function(data) {
			//$("#creditCustomerGrid").jqGrid('setCell', selRow, 'EASY_NO', policyNo);
			$("#creditCustomerGrid").jqGrid('setCell', beforeSelection, 'EASY_NO', easyno);
			isChange = false;
			alert('<s:message code="success.sendemail"/>');
		});
	});
	
	////////////////////////////////////////////////////////////////////
	// request credit
	////////////////////////////////////////////////////////////////////
	reqCreditBtn.addEventListener('click', function(e) {
		var requestAmount = document.querySelector('[data-creditinfo="REQ_CREDIT"]').value;
		if (!requestAmount) {
			alert('<s:message code="info.reqamount"/>');
			return;
		}
		
		var selRow = $('#creditCustomerGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $('#creditCustomerGrid').jqGrid('getRowData', selRow);
		var param = {
			COMP_CD: rowData.COMP_CD,
			CUST_CD: rowData.CUST_CD,
			EASY_NO: document.querySelector('[data-custinfo="EASY_NO"]').value,
			REQUEST_AMOUNT: requestAmount.replace(/\./g, '').replace(/\,/g, '.')
		};
		
		fn_ajax('/remote/creditLimit.do', true, param, function(data) {
			var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
			if (!!xml.querySelector('errorDescription')) {
				alert(xml.querySelector('errorDescription').textContent);
				return;
			}
			
			var elm = xml.querySelector('CreditLimitResultCode');
			var resultCode;
			if (!!elm) {
				resultCode = elm.textContent;
			} else {
				resultCode = xml.querySelector('ReferredDecision').textContent;
			}
			
			if (resultCode === 'APPR') {
				var amount = xml.querySelector('FirstAmount Amount').textContent;
				document.querySelector('[data-creditinfo="EV_RESULT"]').value = amount.replace(/\./g, ',').replace(/\B(?=(\d{3})+(?!\d))/g, '.');
				document.querySelector('[data-creditinfo="EV_DECS"]').value = resultCode;
			} else {
				document.querySelector('[data-creditinfo="EV_RESULT"]').value = '0,00';
				var desc;
				var condition = xml.querySelector('ConditionText');
				if (!!condition) {
					desc = condition.textContent;
				} else {
					desc = resultCode;
				}
				if ( dataLen != 1 ) {
					isChange = true;
					beforeSelection = $('#creditCustomerGrid').jqGrid('getGridParam', 'selrow');					
				}
				document.querySelector('[data-creditinfo="EV_DECS"]').value = desc;
			}
		});
	});
	
	////////////////////////////////////////////////////////////////////
	// request cancel
	////////////////////////////////////////////////////////////////////
	reqCancelBtn.addEventListener('click', function(e) {
		
		var selRow = $('#creditCustomerGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $('#creditCustomerGrid').jqGrid('getRowData', selRow);
		var param = {
			COMP_CD: rowData.COMP_CD,
			EASY_NO: document.querySelector('[data-custinfo="EASY_NO"]').value
		};
		
		fn_ajax('/remote/cancelCredit.do', true, param, function(data) {
			var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
			
			if (!!xml.querySelector('errorDescription')) {
				alert(xml.querySelector('errorDescription').textContent);
				return;
			}
			
			var resultCode = xml.querySelector('CreditLimitResultCode').textContent;
			if (resultCode === 'APPR') {
				document.querySelector('[data-creditinfo="EV_ZZGBDAT"]').value = '00.00.0000';
				document.querySelector('[data-creditinfo="EV_ZZBDATUM"]').value = '00.00.0000';
				document.querySelector('[data-creditinfo="EV_RESULT"]').value = '0,00';
				document.querySelector('[data-creditinfo="REQ_CREDIT"]').value = '0,00';
				document.querySelector('[data-creditinfo="EV_DECS"]').value = '';
				alert('<s:message code="success.sendemail"/>');
			} else {
				alert('Error');
			}
		});
	});
	
	////////////////////////////////////////////////////////////////////
	// save to erp
	////////////////////////////////////////////////////////////////////
	reqSaveBtn.addEventListener('click', function(e) {
		//var selRow = $('#creditCustomerGrid').jqGrid('getGridParam', 'selrow');
		var rowData = $('#creditCustomerGrid').jqGrid('getRowData', beforeSelection);
		var param = {
			CUST_CD: rowData.CUST_CD,
			COMP_CD: rowData.COMP_CD,
			EASY_NO: document.querySelector('[data-custinfo="EASY_NO"]').value,
			EV_RESULT: Util.converter.currencyFormat2(document.querySelector('[data-creditinfo="EV_RESULT"]').value),
			REQ_CREDIT: Util.converter.currencyFormat2(document.querySelector('[data-creditinfo="REQ_CREDIT"]').value),
			EV_ZZGBDAT: Util.converter.dateFormat3(document.querySelector('[data-creditinfo="EV_ZZGBDAT"]').value),
			EV_ZZBDATUM: Util.converter.dateFormat3(document.querySelector('[data-creditinfo="EV_ZZBDATUM"]').value),
			EV_DECS: document.querySelector('[data-creditinfo="EV_DECS"]').value
		}
		
		var invalid = false;
		$.each(param, function(k, v) {
			if (!v && k !== 'EV_DECS') {
				invalid = true;
			}
		});
		
		if (invalid) {
			alert('<s:message code="info.invalid"/>');
			return;
		}
		
		fn_ajax('/common/updateCredit.do', true, param, function(data) {
			cSearch();
			isChange = false;
			alert('<s:message code="success.sendemail"/>');
		});
	});
	
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	function cSearch() {
		refresh();
		var param = {};
		Array.prototype.forEach.call(searchElms, function(elm) {
			var value = elm.value;
			if (!!value) {
				param = param || {};
				var column = elm.dataset.searchcolumn;
				param[column] = value;
			}
		});
		
		fn_ajax('/customer/retrieveHeader.do', true, param, function(data) {
			if (!data.RESULT) {
				return;
			}
			dataLen = data.RESULT.length;
			redrawData(data.RESULT);
		});
	}
	
	////////////////////////////////////////////////////////////////////
	// retrieve Portfolio for mailbox
	////////////////////////////////////////////////////////////////////
	function cUser1() {
		popupOpen('/customer/creditCustomerPortfolioPopup.do', 'CreditCustomerPortfolioPopup', {}, function() {
		});
	}
	
	window.cSearch = cSearch;
	window.cUser1 = cUser1; 
	
	setTimeout(function() {
		var mailBox = document.getElementById('cBtnUser1');
		mailBox.innerHTML = 'MailBox';
		$('#cBtnUser1').addClass("cBtnMailBox_style");
	});
	
	initialize();
})();
</script>

<c:import url="../import/frameBottom.jsp" />