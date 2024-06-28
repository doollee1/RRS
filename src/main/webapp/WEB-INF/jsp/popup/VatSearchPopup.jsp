<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div id="VatSearchPopup">
	<div class="oms_popup_button"></div>	
	<!-- 그리드 시작 -->
	<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
		<div class="ct_grid_top_wrap">
			<div class="ct_grid_top_left"><h4>List</h4></div>
			<div class="ct_grid_top_right">
				<button type='button' class='btn btn-default' id='VatSearchPopup_customerListAdd'><i class='fa fa-plus-square-o'></i><s:message code='button.add'/></button>
				<button type='button' class='btn btn-default' id='VatSearchPopup_customerListDel'><i class='fa fa-trash-o'></i><s:message code='button.delete'/></button>
			</div>
		</div>
		<table id="VatSearchPopup_customerList"></table>
	</div>
	<!-- 그리드 끝 -->
</div>

<script>
function grid_cbox_onclick(gid, rowid, colkey) {
}

(function() {
	function deleteGridRow(id) {
		var grid = $('#' + id);
		var ids = grid.jqGrid("getDataIDs");
		for (var i = 0; i < ids.length; i++) {
			var rowId = ids[i];
			var index = $('#' + rowId)[0].rowIndex;
			if ($('#' + id +'_' + ids[i] + '_CHK').prop('checked')) {
				btGrid.gridDelRow(id, ids[i]);
			}
		}
	}
	
	$("#VatSearchPopup_customerListAdd").click(function() {
		btGrid.gridAddRow("VatSearchPopup_customerList", "last");
		btGrid.gridSaveRow('VatSearchPopup_customerList');
	});
	
	$("#VatSearchPopup_customerListDel").click(function() {
		deleteGridRow('VatSearchPopup_customerList');
	});
	
	/*
	$('#VatSearchPopup_customerList').focusout(function(e) {
		if (!e.target.classList.contains('ui-row-ltr')) {
			btGrid.gridSaveRow('VatSearchPopup_customerList');
		}
	});
	*/
	
	function makeGridSelectData(codes) {
		var selectData = '';
		Array.prototype.forEach.call(codes, function(code) {
			if (!code.CODE) {
				return;
			}
			selectData += (code.CODE + ':' + code.S_CODE_NM + ';');
		});
		
		return selectData.substr(0, selectData.length - 1);
	}
	
	function createSearchGrid(countryCd) {
		var colName = [
			'',
			'',
			'',
			'Vat Number',
			'Valid Vat'
		];
		
		var selectData = makeGridSelectData(countryCd);
		
		var colModel = [
			{ name : 'CHK',index : 'CHK', width : 20, align : 'center',formatter : gridCboxFormat, sortable: false },
			{ name: 'SEQ', hidden: true },
			{ name: 'COUNTRY_CD', hidden: true },
			{ name: 'VAT_REG_NO', width: 200, align: 'center', editable: true},
			{ name: 'VAT_NO_CHK_YN', width: 200, align: 'center', classes: 'gridbtncheck', editable: false }
		];
		
		var gSetting = {
			height: 330,
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
		
		btGrid.createGrid('VatSearchPopup_customerList', colName, colModel, gSetting);
		
		$('#VatSearchPopup_customerList').jqGrid('setGridParam', {
			onCellSelect: function (rowId, index, content, event) {
				if (index === 4) {
					var row = $('#VatSearchPopup_customerList').jqGrid('getRowData', rowId);
					if (row.VAT_NO_CHK_YN === 'Y') {
						return;
					}
					if (!row.VAT_REG_NO) {
						alert('<s:message code="error.inputvat"/>');
						return;
					}
					
					var param = {
						VAT_REG_NO: row.VAT_REG_NO
					};
					
					fn_ajax('/remote/checkEuropeanCommission.do', true, param, function(data) {
						var xml = new DOMParser().parseFromString(data.RESULT, 'text/xml');
						var elm = xml.querySelector('valid');
						if (!!elm) {
							if (elm.textContent === 'false') {
								alert('<s:message code="info.invalidvat"/>');
							} else {
								var countryCd = row.VAT_REG_NO.substr(0, 2);
								$("#VatSearchPopup_customerList").jqGrid('setCell', rowId, 'VAT_NO_CHK_YN', 'Y');
								$("#VatSearchPopup_customerList").jqGrid('setCell', rowId, 'COUNTRY_CD', countryCd);
							}
						} else {
							elm = xml.querySelector('faultstring');
							if (!!elm) {
								alert(elm.textContent);
							}
						}
					});
				}
			}
		});
	}
	
	$('#VatSearchPopup').dialog({
		title : 'Extension VAT List',
		autoOpen : false,
		height: 464,
		width: 550,
		modal : true,
		buttons : {
			'ok' : {
				text: 'Apply',
				click: function() {
					var gridData = btGrid.getGridData('VatSearchPopup_customerList');
					var valid = true;
					Array.prototype.forEach.call(gridData, function(v) {
						if (!v.VAT_REG_NO || !v.VAT_NO_CHK_YN || v.VAT_NO_CHK_YN === 'N') {
							valid = false;
							return;
						}
					});
					
					if (!valid) {
						alert('<s:message code="info.checkvat"/>');
						return;
					}
					
					var data = {
						custVatList: gridData
					};
					popupClose($(this).attr('id'), data);
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
			var win = $(this).data('window');
			var countryCd = win.Util.component.getCommomCode('COUNTRY_CD');
			createSearchGrid(countryCd);
			reloadGrid('VatSearchPopup_customerList', $(this).data('custVatList'));
		}
	});
})();
</script>