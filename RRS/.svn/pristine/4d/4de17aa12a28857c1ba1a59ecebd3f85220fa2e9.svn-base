<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div id="EmployeeSearchPopup">
	<div class="oms_popup_button">
	<button id="EmployeeSearchPopup_search" class='btn btn-default' type='button'><i class='fa fa-search'></i>Search</button>
	</div>
	<div id="ctm_sech_wrap">
		<table width="100%" class="new_search_pop">
			<tr>
				<td class="small_td"><s:message code="customer.grd.PsNO"/></td>
				<td><input id=EmployeeSearchPopup_PS_NO type="text" name="Customer"></td>
				<td><s:message code="customer.grd.Name"/></td>
				<td><input id=EmployeeSearchPopup_NAME type="text" name="name"></td>
				<td><s:message code="customer.grd.Department"/></td>
				<td><select  id="EmployeeSearchPopup_DEPT_CD" data-dbcolumn="DEPT_CD"></select></td>
			</tr>
		</table>
	</div>
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="pop_grid_wrap">
			<table id="EmployeeSearchPopup_customerList"></table>
			<div id="EmployeeSearchPopup_customerList_pager"></div>
		</div>
	</div>
	<!-- 그리드 끝 -->
	
</div>

<script>
(function() {
	function createSearchGrid() {
		var colName = ['',
		               '<s:message code="customer.grd.PsNO"/>',
		               '<s:message code="customer.grd.Name"/>',
		               '<s:message code="customer.grd.FirstName"/>',
		               '<s:message code="customer.grd.Telephone1"/>',
		               '<s:message code="customer.grd.Department"/>',
		               '<s:message code="customer.grd.Fax"/>',
		               '<s:message code="customer.grd.E_Mail"/>'
		               ];
		
		var colModel = [
			{ name: 'SEQ', hidden:true },
			{ name: 'PS_NO', width: 200, align: 'center' },
			{ name: 'NAME', width: 150, align: 'center' },
			{ name: 'NAME_1ST', width: 150, align: 'center' },
			{ name: 'TEL_NO', width: 200, align: 'center' },
			{ name: 'DEPT_CD_NM', width: 250, align: 'center' },
			{ name: 'FAX_NO', width: 200, align: 'center' },
			{ name: 'E_Mail', width: 200, align: 'center' }
		];
		
		var gSetting = {
			height: 270,
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
		
		btGrid.createGrid('EmployeeSearchPopup_customerList', colName, colModel, gSetting);
		
		$('#EmployeeSearchPopup_customerList').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				var buttons = $('#EmployeeSearchPopup').dialog('option', 'buttons');
				buttons.ok.click.apply($('#EmployeeSearchPopup'));
			}
		});
	}
	
	// laod common code
	var customerInfoList;
	var searchElms = document.querySelectorAll('#EmployeeSearchPopup [data-dbcolumn]');
	
	$('#EmployeeSearchPopup').dialog({
		title : 'Employee Search',
		autoOpen : false,
		height: 500,
		width: 930,
		modal : true,
		buttons : {
			'ok' : {
				text: 'OK',
				click: function() {
					var grid = $('#EmployeeSearchPopup_customerList');
					var index = grid.getGridParam('selrow');
					if (!index) {
						alert('<s:message code="customer.msg.mandatorycustomer"/>');
					} else {
						var data = customerInfoList[index - 1];
						popupClose($(this).attr('id'), data);
					}
				}
			},
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
			var psNo = $(this).data('PS_NO');
			if (!!psNo) {
				document.getElementById('EmployeeSearchPopup_PS_NO').value = psNo;
			}
			var name = $(this).data('NAME');
			if (!!name) {
				document.getElementById('EmployeeSearchPopup_NAME').value = name;
			}
			var deptCd = $(this).data('DEPT_CD');
			if (!!deptCd) {
				document.getElementById('EmployeeSearchPopup_DEPT_CD').value = deptCd;
			}
			
			var that = $(this);
			$.when($(this).data('window').Util.component.createCombobox(searchElms, 'ALL'))
			.done(function() {
				createSearchGrid();
				customerInfoList = that.data('result');
				if (!!customerInfoList) {
					reloadGrid('EmployeeSearchPopup_customerList', Object.keys(customerInfoList).map(function(k) { return customerInfoList[k] }));
				} else {
					var elm = document.getElementById('EmployeeSearchPopup_search');
					var event = document.createEvent("Event");
					event.initEvent("click", false, true); 
					elm.dispatchEvent(event);
				}
				btGrid.gridResizing('EmployeeSearchPopup_customerList');
			});
			
			var onSearchFld = '#EmployeeSearchPopup_PS_NO, #EmployeeSearchPopup_NAME, #EmployeeSearchPopup_DEPT_CD';
			
			$(onSearchFld).on('keypress', function (e) {
							if(e.which == 13){
								document.getElementById('EmployeeSearchPopup_search').click()
							}
			});
		}
	});
	
	////////////////////////////////////////////////////////////////////
	// Search
	////////////////////////////////////////////////////////////////////
	document.getElementById('EmployeeSearchPopup_search').addEventListener('click', function() {
		var param = {
			PS_NO: document.getElementById('EmployeeSearchPopup_PS_NO').value,
			NAME: document.getElementById('EmployeeSearchPopup_NAME').value,
			DEPT_CD: document.getElementById('EmployeeSearchPopup_DEPT_CD').value,
		};
		
		fn_ajax('/customer/retrieveEmployee.do', false, param, function(data) {
			customerInfoList = data.RESULT;
			reloadGrid('EmployeeSearchPopup_customerList', Object.keys(customerInfoList).map(function(k) { return customerInfoList[k] }));
		});
	});
})();
</script>