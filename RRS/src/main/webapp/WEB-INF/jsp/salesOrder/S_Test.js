function cSearch(currentPage){
	alert(1);
		var vCurrentPage = 1;
		var vRowsPerPage;
		if(!fn_empty(currentPage)){
			vCurrentPage = currentPage;
		} else if(!fn_empty($('#CURRENT_PAGE').val())) {
			vCurrentPage = $('#CURRENT_PAGE').val();
		} else {
			vCurrentPage = 1;
		}
		vRowsPerPage = btGrid.getGridRowSel('salesOrderGrid_pager');
		$('#CURRENT_PAGE').val(vCurrentPage);
		$('#ROWS_PER_PAGE').val(vRowsPerPage);
		
		var url = "/salesOrder/searchSalesOrderList.do";
		
		var formData = formIdAllToMap('frmSearch');
		var param = {"param":formData};
		
		fn_ajax(url, false, param, function(data, xhr){
			reloadGrid("salesOrderGrid", data.result);
			btGrid.gridQueryPaging($('#salesOrderGrid'), 'cSearch', data.result);
			
		});
	}
	
	function salesOrderGrid_ondblClickRow(rowid, iRow, iCol, e){
		var gridData = $("#salesOrderGrid").getRowData(rowid);
		
		var param = "?isStatus=S" + "&DOC_NO=" + gridData["DOC_NO"];

		//window.top.addTab('SL08', '/salesOrder/SalesOrderEntry.do' + param, 'Sales Order Entry');
		window.top.addTab('SO_' + gridData["DOC_NO"], '/salesOrder/SalesOrderEntry.do' + param, 'S.O-' + gridData["DOC_NO"]);
	}
	
	function cUser1(){
		var gridData = $("#salesOrderGrid").getRowData($("#salesOrderGrid").getGridParam('selrow'));
		var param = "?isStatus=C" + "&DOC_NO=" + gridData["DOC_NO"];
		
		if(!fn_empty($("#salesOrderGrid").getGridParam('selrow'))){
			if(confirm("<s:message code='confirm.copy'/>")){
				window.top.addTab('SO_' + gridData["DOC_NO"] + 'C', '/salesOrder/SalesOrderEntry.do' + param, 'SO_Copy');
			}
		}
	}
	
	
	function cAdd(){
		var param = "?isStatus=N";
		
		window.top.addTab('SL08', '/salesOrder/SalesOrderEntry.do' + param, 'Sales Order Entry');
	}
	
	function openCustomerPopUp(custVal){
		var url = "/customer/customerSearchPopup.do";
		var pid = "CustomerSearchPopup";  //팝업 페이지의 취상위 div ID
		var param = { 'CUST_CD':custVal };
		param.window = window;
		
		oneTimeFlag = false;
		
		popupOpen(url, pid, param, function(e, selecedData) {
			if(!fn_empty(selecedData)){
				$.each(selecedData, function(k, v) {
					if('CUST_CD' == k){
						$('#S-SOLD_CUST_CD').val(v);
					}
					if('CUST_NM' == k){
						$('#S-SOLD_CUST_NM').text(v);
					}
				});
			}
		});
	}