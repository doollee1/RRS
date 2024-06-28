<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<script src="../js/jszip/jszip.js"></script>

<div id="CreditCustomerPortfolioPopup">
	<form id="frmSearch" action="#" style="display: none;">
		<input type="hidden" name="CURRENT_PAGE"  id="CURRENT_PAGE" />
		<input type="hidden" name="ROWS_PER_PAGE"  id="ROWS_PER_PAGE" />
	</form>
	
	<div class="oms_popup_button">
		<button id="CreditCustomerPortfolioPopup_search" class='btn btn-default' type='button'><i class='fa fa-search'></i>Search</button>
		<button id="CreditCustomerPortfolioPopup_save" class='btn btn-default' type='button'><i class='fa fa-save'></i>Save</button>
	</div>
	
	<div id="ctm_sech_wrap">
		<table class="new_search_pop" style="width: 50%">
			<tr>
				<td><p><s:message code="notice.noticdate"/></p></td>
				<td class="medium_td">
					<input type="text" id="CreditCustomerPortfolioPopup_from" data-type="date" disabled="disabled" readonly="readonly" style="width:90px; float:left;" />
					<p style="float:left; margin-right:15px; margin-left:15px;">~</p>
					<input type="text" id="CreditCustomerPortfolioPopup_to" data-type="date" disabled="disabled" readonly="readonly" style="width:90px;float:left;" />
					<select id="CreditCustomerPortfolioPopup_COMP_CD">
						<option value="1000" selected="selected">Hanwha Q CELLS GmbH</option>
						<option value="3500">Hanwha Q CELLS France SAS</option>
					</select>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="CreditCustomerPortfolioPopup_customerList"></table>
		<div id="CreditCustomerPortfolioPopup_customerList_pager"></div>
	</div>
</div>

<script>
(function() {
	var creditCustomerInfoList = [];
	
	window.hdCheckboxAll = function(e, gid) {
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
	
	window.grid_cbox_onclick = function(grid, rowId, colkey) {
		var check = $('#' + grid + '_' + rowId + '_CHK');
		if (check.prop('checked')) {
			check.prop('checked', true);
		} else {
			check.prop('checked', false);
		}
		
		var row = $('#CreditCustomerPortfolioPopup_customerList').jqGrid('getRowData', rowId);
		if (!row.CUST_CD) {
			check.prop('checked', false);
			alert('<s:message code="info.catnotcheck"/>');
		}
	}
	
	function createSearchGrid() {
		var colName = [
			'<input type="checkbox" style="margin-top:1px;" onclick="hdCheckboxAll(event, \'CreditCustomerPortfolioPopup_customerList\')" /> ',
			'Cover ID',
			'<s:message code="credit.Atradius"/>',
			'<s:message code="customer.Customer"/>',
			'<s:message code="customer.Name"/>',
			'<s:message code="customer.CityName"/>',
			'<s:message code="customer.VATRegNo"/>',
			'<s:message code="credit.External"/>',
			'<s:message code="credit.Internal"/>',
			'<s:message code="credit.Total"/>',
			'<s:message code="customer.ApplyDate"/>',
			'<s:message code="customer.ExpiryDate"/>',
			'<s:message code="credit.Request"/>',
			'<s:message code="credit.Result"/>',
			'<s:message code="credit.ReturnMessage"/>',
			'COMP_CD'
		];
		
		var colModel = [
			{ name : 'CHK',index : 'CHK', width : 20, align : 'center', formatter : gridCboxFormat},
			{ name: 'CoverId', width: 100, align: 'center' },
			{ name: 'OrgId', width: 100, align: 'center' },
			{ name: 'CUST_CD', width: 100, align: 'center' },
			{ name: 'CUST_NM', width: 250, align: 'left' },
			{ name: 'CITY_NM', width: 200, align: 'left' },
			{ name: 'VAT_REG_NO', width: 150, align: 'center' },
			{ name: 'EXTLIM', width: 150, align: 'right' },
			{ name: 'INLIM', width: 150, align: 'right' },
			{ name: 'LIMIT', width: 150, align: 'right' },
			{ name: 'EV_ZZBDATUM', width: 100, align: 'center' },
			{ name: 'EV_ZZGBDAT', width: 100, align: 'center' },			
			{ name: 'REQ_CREDIT', width: 150, align: 'right' },
			{ name: 'EV_RESULT', width: 150, align: 'right' },
			{ name: 'ReqDesc', width: 1200, align: 'left' },
			{ name: 'COMP_CD', width: 100, align: 'center' }
		];
		
		var gSetting = {
			height: 370,
			pgflg:true,
			exportflg : true,  //엑셀, pdf 출력 버튼 노출여부
			colsetting : true,  // 컬럼 설정 버튼 노출여부
			searchInit : false,  // 데이터 검색 버튼 노출여부
			resizeing : true,
			rownumbers:false,
			//shrinkToFit: true,
			autowidth: true,
			queryPagingGrid:true // 쿼리 페이징 처리 여부
		};
		
		btGrid.createGrid('CreditCustomerPortfolioPopup_customerList', colName, colModel, gSetting);
	}
	
    function pad(num) {
        var s = '0' + num;
        return s.substr(s.length - 2);
    }
	
	function fromPopulateList(selected, evnt) {ted);
		var seldate = selected;
		var datearr = seldate.split(".");
		var day = datearr[0];
		var month = datearr[1] - 1;
		var year = datearr[2];
		var newDate = new Date(year, month, day); 	
		newDate.setDate(newDate.getDate() + 7);
		
		var Result = pad(newDate.getDate())+ '.' + pad((newDate.getMonth()+1)) + '.' + newDate.getFullYear();
		$('#CreditCustomerPortfolioPopup_to').datepicker('setDate', Result); /**/
	}
	
	function toPopulateList(selected, evnt) {
		var seldate = selected;
		var datearr = seldate.split(".");
		var day = datearr[0];
		var month = datearr[1] - 1;
		var year = datearr[2];
		var newDate = new Date(year, month, day); 
		newDate.setDate(newDate.getDate() - 7);
		
		var Result = pad(newDate.getDate())+ '.' + pad((newDate.getMonth()+1)) + '.' + newDate.getFullYear();
		$('#CreditCustomerPortfolioPopup_from').datepicker('setDate', Result);
	}
	
	$('#CreditCustomerPortfolioPopup').dialog({
		title : 'Mailbox',
		autoOpen : false,
		height: 600,
		width: 1200,
		modal : true,
		buttons : {
			'close' : {
				text: 'Close',
				click: function() {
					popupClose($(this).attr('id')); /* 필수로 들어가야함 */
				}
			}
		},
		close : function() {
			popupClose($(this).attr('id')); /* 필수로 들어가야함 */
		},
		open : function() {
			$('#CreditCustomerPortfolioPopup_from').datepicker({ dateFormat : 'dd.mm.yy', showOn : 'both', onSelect : fromPopulateList });			
			$('#CreditCustomerPortfolioPopup_from').datepicker('setDate', new Date());
			$('#CreditCustomerPortfolioPopup_to').datepicker({ dateFormat : 'dd.mm.yy', showOn : 'both', onSelect : toPopulateList });		
			fromPopulateList($('#CreditCustomerPortfolioPopup_from').val(), null);
			
			createSearchGrid();
			btGrid.gridResizing('CreditCustomerPortfolioPopup_customerList');
			
			document.getElementById('CreditCustomerPortfolioPopup_search').addEventListener('click', function(e) {
				var param = {
					COMP_CD: $("#CreditCustomerPortfolioPopup_COMP_CD").val(),
					From: $(CreditCustomerPortfolioPopup_from).val().split('.').reverse().join('-'),
					To: $(CreditCustomerPortfolioPopup_to).val().split('.').reverse().join('-')
				}
				
				var term = new Date(param.To) - new Date(param.From);
				if (term < 0 || term / 86400000 > 7) {
					alert('<s:message code="info.checkinputdate"/>');
					return;
				}
				
				fn_ajax('/remote/retrievePortfolio.do', true, param, function(data) {
					var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
					var xmlSelect = xml.querySelector('PortfolioCovers');
					if( xmlSelect == null ) {
						alert('<s:message code="info.portfolio"/>');
						reloadGrid('CreditCustomerPortfolioPopup_customerList', []);
						btGrid.gridResizing('CreditCustomerPortfolioPopup_customerList');
						return;
					}
					var zipData = xml.querySelector('PortfolioCovers').textContent;
					if (!zipData) {
						alert('<s:message code="info.portfolio"/>');
						reloadGrid('CreditCustomerPortfolioPopup_customerList', []);
						btGrid.gridResizing('CreditCustomerPortfolioPopup_customerList');
						return;
					}
					
					var zip = JSZip();
					zip.loadAsync(zipData, {base64: true})
					.then(function(zzz) {
						zip.file('covers.xml').async('string')
						.then(function(xmlstring) {
							var replaceXmlstring = xmlstring.replace(/\n/g, '');
							var coverList = replaceXmlstring.split('<\/c:CoverDecision>');
							coverList = coverList.splice(0, coverList.length - 1);
							
							var coverMkList = [];
							coverList.forEach(function(v) {
								coverMkList.push(v + '<\/c:CoverDecision>');
							});
							
							var portfolioList = [];
							var policyList = [];
							coverMkList.forEach(function(v) {
								var xml = new DOMParser().parseFromString(v, 'text/xml');
								var obj = {};
								obj.CoverId = xml.querySelector('CoverDecision').getAttribute('CoverId');
								var attradiusId = xml.querySelector('[registeredOffice="SYMPH"] id').textContent;
								policyList.push(attradiusId);
								obj.OrgId = attradiusId;
								obj.EV_ZZGBDAT =!!xml.querySelector('EffectTo') ? Util.converter.dateFormat2(xml.querySelector('EffectTo').textContent) : '';								
								obj.EV_ZZBDATUM = !!xml.querySelector('EffectFrom') ? Util.converter.dateFormat2(xml.querySelector('EffectFrom').textContent) : '';
								obj.REQ_CREDIT = !!xml.querySelector('RequestedAmount') ? Util.converter.currencyFormat(xml.querySelector('RequestedAmount').textContent) : '';
								obj.EV_RESULT = !!xml.querySelector('FirstAmount Amount') ? Util.converter.currencyFormat(xml.querySelector('FirstAmount Amount').textContent) : '';
								obj.ReqDesc = !!xml.querySelector('ConditionText') ? xml.querySelector('ConditionText').textContent : xml.querySelector('CreditLimitResultCode').textContent;
								
								portfolioList.push(obj);
							});
							
							var param = {
								policyList: policyList
							};
							
							fn_ajax('/customer/retrieveCustomerByAttradiusId.do', true, param, function(data) {
								var companyList = [];
								var custList = [];
								var portfolioGridList = [];
								portfolioList.forEach(function(v, i) {
									var flag = false;
									Array.prototype.some.call(data.RESULT, function(k) {
										if (v.OrgId === k.EASY_NO) {
											companyList.push(k.COMP_CD);
											custList.push(k.CUST_CD);
											$.extend(v, k);
											portfolioGridList.push(v);
											flag = true;
											return true;
										}
										return false;
									});
									if (!flag) {
										portfolioGridList.push(v);
									}
								});
								
								if (custList.length === 0) {
									portfolioGridList.sort(function(a, b) { return a.CoverId - b.CoverId });
									reloadGrid('CreditCustomerPortfolioPopup_customerList', portfolioGridList);
									btGrid.gridResizing('CreditCustomerPortfolioPopup_customerList');
									return;
								}
								
								
								var param = {
									companyList: companyList,
									custList: custList
								};
								
								fn_ajax('/common/retrieveCreditAll.do', true, param, function(data) {
									if (!!data.RESULT) {
										var tknb1 = [];
										Array.prototype.some.call(data.RESULT, function(v) {
											if (v.tableName === 'T_KNB1') {
												tknb1 = v.rows;
												return true;
											}
											return false;
										});
										
										Array.prototype.forEach.call(portfolioGridList, function(v) {
											tknb1.some(function(t) {
												if (!!v.CUST_CD && v.CUST_CD.indexOf(t.KUNNR) > -1) {
													v.INLIM = Util.converter.currencyFormat(String(parseFloat(t.LIMIT) - parseFloat(t.EXTLIM)));
													t.LIMIT = Util.converter.currencyFormat(t.LIMIT);
													t.EXTLIM = Util.converter.currencyFormat(t.EXTLIM);
													$.extend(v, t);
													return true;
												}
												return false;
											});
										});
										
										portfolioGridList.sort(function(a, b) { return a.CoverId - b.CoverId });
										reloadGrid('CreditCustomerPortfolioPopup_customerList', portfolioGridList);
										btGrid.gridResizing('CreditCustomerPortfolioPopup_customerList');
									}
								});
							});
						});
					});
				});
			});
			
			document.getElementById('CreditCustomerPortfolioPopup_save').addEventListener('click', function(e) {
				var custList = [];
				var grid = $('#CreditCustomerPortfolioPopup_customerList');
				var ids = grid.jqGrid("getDataIDs");
				for (var i = 0; i < ids.length; i++) {
					var rowId = ids[i];
					var index = $('#' + rowId)[0].rowIndex;
					if ($('#CreditCustomerPortfolioPopup_customerList_' + ids[i] + '_CHK').prop('checked')) {
						var data = $('#CreditCustomerPortfolioPopup_customerList').jqGrid('getRowData', rowId);
						custList.push(data);
					}
				}
				
				if (custList.length === 0) {
					alert('<s:message code="info.selectcust"/>');
					return;
				}
				
				custList.forEach(function(v) {
					v.EV_RESULT = Util.converter.currencyFormat2(v.EV_RESULT);
					v.REQ_CREDIT = Util.converter.currencyFormat2(v.REQ_CREDIT);
					v.EV_ZZGBDAT = Util.converter.dateFormat3(v.EV_ZZGBDAT);
					v.EV_ZZBDATUM = Util.converter.dateFormat3(v.EV_ZZBDATUM);
				});
				
				fn_ajax('/common/updateCreditAll.do', true, { custList: custList }, function(data) {
					var tknb1 = [];
					Array.prototype.some.call(data.RESULT, function(v) {
						if (v.tableName === 'T_KNB1') {
							tknb1 = v.rows;
							return true;
						}
						return false;
					});
					
					var valid = true;
					var custIdList = [];
					tknb1.some(function(v) {
						if (v.MSGTYP !== 'D') {
							custIdList.push(v.KUNNR);
							valid = false;
							return true;
						}
					});
					if (valid) {
						alert('<s:message code="info.update"/>');
					} else {
						alert('<s:message code="info.updatefail"/>');
					}
				});
			});
		}
	});
})();
</script>