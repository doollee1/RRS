<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div id="CreditCustomerSearchPopup">
	<div class="oms_popup_button"></div>	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>List</h4></div>
			<div class="ct_grid_top_right"></div>
		</div>
		<table id="CreditCustomerSearchPopup_customerList"></table>
		<div id="CreditCustomerSearchPopup_customerList_pager"></div>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
(function() {
	var creditCustomerInfoList = [];
	
	function createSearchGrid() {
		var colName = [
			'Atradius ID',
			'NAME',
			'Country',
			'Street Line'
		];
		
		var colModel = [
			{ name: 'ORG_ID', width: 150, align: 'center', },
			{ name: 'NAME', width: 300, align: 'left' },
			{ name: 'COUNTRY', width: 120, align: 'center' },
			{ name: 'STREET_LINE', width: 200, align: 'left' }
		];
		
		var gSetting = {
				height: 370,
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
		
		btGrid.createGrid('CreditCustomerSearchPopup_customerList', colName, colModel, gSetting);
		
		$('#CreditCustomerSearchPopup_customerList').jqGrid('setGridParam', {
			ondblClickRow: function(rowid, iRow, iCol, e) {
				var buttons = $('#CreditCustomerSearchPopup').dialog('option', 'buttons');
				buttons.ok.click.apply($('#CreditCustomerSearchPopup'));
			}
		});
	}
	
	$('#CreditCustomerSearchPopup').dialog({
		title : 'Customer Search',
		autoOpen : false,
		height: 600,
		width: 900,
		modal : true,
		buttons : {
			'ok' : {
				text: 'OK',
				click: function() {
					var grid = $('#CreditCustomerSearchPopup_customerList');
					var index = grid.getGridParam('selrow');
					if (!index) {
						alert('<s:message code="customer.msg.mandatorycustomer"/>');
					} else {
						var data = creditCustomerInfoList[index - 1];
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
			createSearchGrid();
			
			var xml = $(this).data('xml');
			var orgIdList = xml.querySelectorAll('OrgId');
			var streetLineList = xml.querySelectorAll('StreetLine');
			var legalFormDescriptionList = xml.querySelectorAll('LegalFormDescription');
			var name = xml.querySelectorAll('NameLine');
			var country = xml.querySelectorAll('CountryISOCode');
			
			Array.prototype.forEach.call(orgIdList, function(v, i) {
				creditCustomerInfoList.push({
					ORG_ID: orgIdList[i].textContent,
					NAME: name[i].textContent,
					COUNTRY: country[i].textContent,
					STREET_LINE: streetLineList[i].textContent
					//STREET_LINE: streetLineList[i].textContent,
					//LEGAL_FORM_DESCRIPTION: legalFormDescriptionList[i].textContent
				})
			});
			
			reloadGrid('CreditCustomerSearchPopup_customerList', creditCustomerInfoList);
			btGrid.gridResizing('CreditCustomerSearchPopup_customerList');
		}
	});
	console.log('CreditCustomerSearchPopup');
})();
</script>