<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%
	/**
	 * @Name : QuotationPopup
	 * @Description : Qutation 조회=팝업
	 */
%>
<c:import url="../import/frameTop.jsp"></c:import>
<div id="QuotationPopup">
	<form id="frmHeader" action="#">
		<input type="hidden" name="MODI_TMS" id="MODI_TMS" />
		<input type="hidden" name="MAX_PRIORITY" id="MAX_PRIORITY" />
		<input type="hidden" name="PRIORITY" id="PRIORITY" />
		<input type="hidden" name="USER_ID" id="USER_ID" />
		<div class="ct_grid_top_wrap">								
			<div class="ct_grid_top_left">
				<h4><s:message code="quotation.infomation"/></h4>	
			</div>
			</div>
			<table class="table_line" width="100%">
				<tr>
					<td class="small_td"><p><s:message code="quotation.quotationNo"/></p></td>
					<td><input type="text" name="DOC_NO" id="DOC_NO" readonly disabled="" data-dbcolumn="DOC_NO"></td>
					<td class="small_td"><p><s:message code="quotation.quotType"/></p></td>
					<td class="small_td"><input type="text" name="DOC_TP" id="DOC_TP" disabled="" readonly/>
							<p class="data_under_text" name="DOC_TP_NM" id="DOC_TP_NM"></p></td>
					<td class="small_td"><p><s:message code="quotation.poNo"/></p></td>
					<td><input type="text" name="PO_NO" id="PO_NO" readonly disabled="" ></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="quotation.validFrom"/></p></td>
					<td><input type="text" id="VAL_FR_DT" name="VAL_FR_DT" data-type="date" readonly disabled=""/></td>
					<td class="small_td"><p><s:message code="quotation.validTo"/></p></td>
					<td><input type="text" name="VAL_TO_DT" id="VAL_TO_DT" data-type="date" readonly disabled=""/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="quotation.soldTo"/></p></td>
					<td><input type="text" name="SOLD_CUST_CD" id="SOLD_CUST_CD" readonly disabled="">
					<p class="data_under_text" name="SOLD_CUST_NM" id="SOLD_CUST_NM"></p></td>
					<td class="small_td"><p><s:message code="quotation.shipTo"/></p></td>
					<td><input type="text" name="SHIP_CUST_CD" id="SHIP_CUST_CD" readonly disabled="">
					<p class="data_under_text" name="SHIP_CUST_NM" id="SHIP_CUST_NM"></p></td>
					<td class="small_td"><p><s:message code="sales.billto"/></p></td>
					<td><input type="text" name="BILL_CUST_CD" id="BILL_CUST_CD" readonly disabled="">
					<p class="data_under_text" name="BILL_CUST_NM" id="BILL_CUST_NM"></p></td>
				</tr>
			</table>
			<div class="ct_grid_top_left">
				<h4><s:message code="quotation.sales"/></h4>
			</div>
			<table class="table_line" width="100%">
				<tr>
					<td class="small_td"><p><s:message code="quotation.salesOrg"/></p></td>
					<td><input type="text" name="SALES_ORG_CD" id="SALES_ORG_CD" readonly disabled=""/>
					<p class="data_under_text" name="SALES_ORG_NM" id="SALES_ORG_NM"></p></td>
					<td class="small_td"><p><s:message code="quotation.distributionCh"/></p></td>
					<td><input type="text" name="DISTRB_CH" id="DISTRB_CH" readonly disabled=""/>
					<p class="data_under_text" name="DISTRB_CH_NM" id="DISTRB_CH_NM"></p></td>
					<td class="small_td"><p><s:message code="quotation.division"/></p></td>
					<td><input type="text" name="DIV_CD" id="DIV_CD" readonly disabled=""/>
					<p class="data_under_text" name="DIV_NM" id="DIV_NM"></p></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="quotation.reqDelDate"/></p></td>
					<td><input type ="text" name="DELI_DT" id="DELI_DT" readonly disabled=""/>
					<td class="small_td"><p><s:message code="quotation.delPl"/></p></td>
					<td><input type="text" name="DELI_PLANT_CD" id="DELI_PLANT_CD" readonly disabled="" />
					<p class="data_under_text" name="DELI_PLANT_NM" id="DELI_PLANT_NM"></p></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="quotation.totalAmt"/></p></td>
					<td><input type="text" name="T_AMT" id="T_AMT" readonly disabled="" style="text-align:right;">
					<td class="small_td"><p><s:message code="quotation.netValue"/></p></td>
					<td><input type="text" name="NET_AMT" id="NET_AMT" readonly disabled="" style="text-align:right;"></td>
					<td class="small_td"><p><s:message code="quotation.vat"/></p></td>
						<td class="Sbox_in_sel"><input type="text" name="VAT_AMT" id="VAT_AMT" maxlength="13" readonly disabled="" style="text-align:right;">
						<p style="float:left;" class="box_pb_sign">/</p><input class="grid_input_eur" type="text" name="VAT" id="VAT" readonly disabled="">%</td>	
				</tr>
				<tr>
					<td class="small_td"><p><s:message code="quotation.priceDate"/></p></td>
					<td><input type="text" name="PRICE_DT" id="PRICE_DT" data-type="date" readonly disabled="" /></td>
					<td class="small_td"><p><s:message code="quotation.paymentTerms"/></p></td>
					<td><input type="text" name="PAY_TERM" id="PAY_TERM" readonly disabled=""/>
					<p class="data_under_text" name="PAY_TERM_NM" id="PAY_TERM_NM"></p></td>
					<td class="small_td"><p><s:message code="quotation.incoterms"/></p></td>
					<td class="Sbox_in_sel"><select name="INCOTERMS_CD" id="INCOTERMS_CD" readonly disabled="" ></select>
							<input type="text" name="INCOTERMS_DESC" id="INCOTERMS_DESC" readonly disabled="" ></td>
				</tr>
				</table>
			<div id="ctm_mg_wrap">
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<div class="ct_grid_top_left">
						<h4><p><s:message code="quotation.itemList"/></p></h4>
					</div>
						<table id="itemGrid"></table>
						<div id="itemGrid_pager"></div>
				</div>
			</div>
			<div id="ctm_mg_wrap">
				<div class="ctu_g_wrap" style="width:100%; float:left; padding-top:0px;">
					<div class="ct_grid_top_left">
						<h4><p><s:message code="title.approvallist"/></p></h4>
					</div>
						<table id="approvalGrid"></table>
				</div>
			</div>
			<table width="100%">
				<tr>
					<td style="padding:10px 10px 10px 20px; width:150px;"><s:message code='title.approvalyn'/>&nbsp;</td>
					<td><div style="float:left; margin-right:10px;"><input type="radio" id="Allow" name="APLV_TP" value="Y" checked > <s:message code='title.approval'/></div>
					<div><input type="radio" id="Reject" name="APLV_TP" value="R" > <s:message code='title.reject'/></div></td>
				</tr>
				<tr>
					<td style="padding:10px 10px 10px 20px; width:150px;"><s:message code='title.rejectRsn'/>&nbsp;</td>
					<td><textarea id="REJECT_RSN" name="REJECT_RSN" rows="2" style="width:95%; border-radius:4px;"></textarea></td>
				</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
var args;
$(function() {
	
	$('#QuotationPopup').dialog({
		title: '<s:message code="quotation.detailinfo"/>',
		autoOpen: true,
		height: 860,
		width: 1200,
		modal: true,
		buttons: {
			'Approval': {
				id: 'approval',
				text: '<s:message code="title.approval"/>',
				click: function() {

					if($("input:radio[name=APLV_TP]:checked").val() == 'R' && fn_empty($("#REJECT_RSN").val())){
						args = '<s:message code='title.rejectRsn'/>';
						alert("<s:message code='errors.required' arguments='" + args + "' javaScriptEscape='false'/>");
					}else{
						openApprovalPopup();
					}
				}
			},
			'Close': {
				text: '<s:message code="button.close"/>',
				click: function() {
					$(this).dialog('close');
				}
			}
		},
		open: function(e, ui) {
			alert("${docNo}");
			createItemGrid();
			createApprovalGrid();
			createCodeBox('INCOTERMS_CD',false);
			var docNo = "${docNo}";
			$('#DOC_NO').val(docNo);
			$("#approval").hide();
			cSearch();
			selectItemTab();
			selectApprovalList();
		},
		close: function(e, ui) {
			/* 필수로 들어가야함 */
			p_rtnData = [];
			popupClose($(this).data('pid'));
		}
	});
});

function createItemGrid(){
	var colName = [
	 			  'COMP_CD'
	 			, '<s:message code="quotation.grd.document"/>'
	 			, 'SEQ'
	 			, '<s:message code="quotation.grd.item"/>'
	 			, '<s:message code="quotation.grd.material"/>'
	 			, '<s:message code="quotation.grd.description"/>'
	 			, '<s:message code="quotation.grd.itemCat"/>'
	 			, '<s:message code="quotation.grd.bUnit"/>'
	 			, '<s:message code="quotation.grd.qty"/>'
	 			, '<s:message code="quotation.grd.ordUnit"/>'
	 			, 'MW'
	 			, 'Requested Price'
	 			, 'ERP Price'
	 			, 'Price Unit'
	 			, 'Dlv. Date'
	 			, '<s:message code="quotation.grd.netPrice"/>'
	 			, '<s:message code="sales.grd.ENetprice"/>'
	 			, '<s:message code="quotation.grd.netValue"/>'
	 			, '<s:message code="sales.grd.ENetvalue"/>'
	 			, 'Document Currency'
	 			, '<s:message code="quotation.grd.atpQty"/>'
	 			, '<s:message code="quotation.grd.batch"/>'
	 			, '<s:message code="quotation.grd.per"/>'
	 			, '<s:message code="quotation.grd.dayType"/>'
	 			, '<s:message code="quotation.grd.dlvDate"/>'
	 			, '<s:message code="quotation.grd.curr"/>'
	 			, '<s:message code="quotation.grd.div"/>'
	 			, '<s:message code="quotation.grd.plnt"/>'
	 			, '<s:message code="quotation.grd.atpChk"/>'
	 			];
	 	var colModel = [
	 		  { name: 'COMP_CD', width: 50, align: 'center', hidden:true}
	 		, { name: 'DOC_NO', width: 50, align: 'center', hidden:true}
	 		, { name: 'SEQ', width: 50, align: 'center', hidden:true}
	 		, { name: 'ITEM_SEQ', width: 20, align: 'center', hidden:false}
	 		, { name: 'MATL_CD', width: 50, align: 'center', hidden:false}
	 		, { name: 'MATL_DESC', width: 70, align: 'left', hidden:false}
	 		, { name: 'ITEM_CTG_GR', width: 50, align: 'center', hidden:true}
	 		, { name: 'BASIC_UNIT', width: 50, align: 'center', hidden:true}
	 		, { name: 'ORD_QTY', width: 30, align: 'right', hidden:false}
	 		, { name: 'ORD_UNIT_CD', width: 50, align: 'center', hidden:false}
	 		, { name: 'MW', width: 40, align: 'right', hidden:false}
	 		, { name: 'REQUESTED_PRICE', width: 50, align: 'right', hidden:false}
	 		, { name: 'ERP_PRICE', width: 50, align: 'right', hidden:false}
	 		, { name: 'PRICE_UNIT', width: 60, align: 'right', hidden:false}
	 		, { name: 'DELI_DT_1ST', width: 50, align: 'center', hidden:false}
	 		, { name: 'NET_PRICE', width: 50, align: 'right', hidden:true}
	 		, { name: 'ERP_NET_PRICE', width: 50, align: 'right', hidden:true}
	 		, { name: 'NET_VAL', width: 40, align: 'right', hidden:false}
	 		, { name: 'ERP_NET_VAL', width: 40, align: 'right', hidden:false}
	 		, { name: 'CURR_CD', width: 50, align: 'right', hidden:false}
	 		, { name: 'ATP_QTY', width: 30, align: 'right', hidden:true}
	 		, { name: 'BATCH_NO', width: 50, align: 'center', hidden:true}
	 		, { name: 'PER', width: 50, align: 'center', hidden:true}
	 		, { name: 'DELI_DT_1ST_TP', width: 50, align: 'center', hidden:true}
	 		, { name: 'DELI_DT_1ST', width: 50, align: 'center', hidden:true}
	 		, { name: 'CURR', width: 50, align: 'center', hidden:true}
	 		, { name: 'DIV_CD', width: 50, align: 'center', hidden:true}
	 		, { name: 'PLANT_CD', width: 50, align: 'center', hidden:true}
	 		, { name: 'ATP_CHK', width: 50, align: 'center', hidden:true}
	 		]
	
	var gSetting = {
			height:110,
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
	btGrid.createGrid('itemGrid', colName, colModel, gSetting);
}

function createApprovalGrid(){
	var colName = [
			  '<s:message code="title.approvalid"/>'
			, '<s:message code="title.approvaldt"/>'
			, '<s:message code="title.approvalyn"/>'
			, '<s:message code="title.rejectRsn"/>'
			, 'PRIORITY'
			, 'MAX_PRIORITY'
			];
	var colModel = [
		  { name: 'APPROVAL_ID', width: 150, align: 'left'}
		, { name: 'APPR_DT', width: 100, align: 'center'}
		, { name: 'APPROVAL_STS_NM', width: 70, align: 'center'}
		, { name: 'REJECT_RSN', width: 200, align: 'left'}
		, { name: 'PRIORITY', width: 100, align: 'center',hidden:true}
		, { name: 'MAX_PRIORITY', width: 100, align: 'center',hidden:true}
		];
	
	var gSetting = {
		height:80,
        pgflg:false,
		searchInit : false,
		resizeing : true,
		rownumbers:false,
		queryPagingGrid:false, // 쿼리 페이징 처리 여부
		shrinkToFit: true,
		autowidth: true
	};
	// 그리드 생성 및 초기화
	btGrid.createGrid('approvalGrid', colName, colModel, gSetting);

}
function cSearch(currentPage){
	var url = "/quotation/selectApprovalInfo.do";
	var param = { "param" : {
			  "DOC_NO"  :$('#DOC_NO').val(),
			  "DOC_GR"  : 'QT'
		}
	};
	
	fn_ajax(url, true, param, function(data, xhr){
		if(data.resultApprovalInfo != null){
			//초기화
			$("#frmHeader").trigger('reset');
			
			//bind
			fn_dataBindByPrefix('frmHeader', '', data.resultApprovalInfo);

		}else{
			alert('<s:message code="info.nodata.msg"/>');
			$("#DOC_NO").val("");
			$("#DOC_NO").focus();
		}
	});
}

function setRowStatus(grid){
	var selRow = $('#' + grid).jqGrid('getGridParam', 'selrow');
	
	var rowSts = "";
	('I' != $('#' + grid).jqGrid('getCell', selRow, 'ROW_STATUS')) ? rowSts = 'U' : rowSts = 'I';
	$('#' + grid).jqGrid('setCell', selRow, 'ROW_STATUS', rowSts);
}

function selectItemTab(){
	
	if('' != $("#DOC_NO").val()){
		var url = "/quotation/selectApprovalItem.do";
		var param = { "param" : {
				  "DOC_NO"  : $("#DOC_NO").val(),
				  "DOC_GR"  : 'QT'
			}
		};
		fn_ajax(url, true, param, function(data, xhr){
			reloadGrid("itemGrid", data.result);   // 그리드 조회 데이터 출력
			btGrid.gridQueryPaging($('#itemGrid'), 'selectItemTab', data.result);  // 그리드 페이징 설정
			$('#itemGrid').jqGrid('setSelection', $('#itemGrid').jqGrid('getDataIDs')[0]);
			for(i=0;i< data.result.length;i++){
				if(data.result[i].ERP_NET_PRICE != data.result[i].NET_PRICE ){
					$('#itemGrid').jqGrid('setCell',i + 1,"MW","",{'color':'red','font-weight':'bold'});
					$('#itemGrid').jqGrid('setCell',i + 1,"REQUESTED_PRICE","",{'color':'red','font-weight':'bold'});
					$('#itemGrid').jqGrid('setCell',i + 1,"ERP_PRICE","",{'color':'red','font-weight':'bold'});
					$('#itemGrid').jqGrid('setCell',i + 1,"ERP_NET_PRICE","",{'color':'red','font-weight':'bold'});
					$('#itemGrid').jqGrid('setCell',i + 1,"NET_PRICE","",{'color':'red','font-weight':'bold'});
				}
			}
		});
	}
}

function selectApprovalList(){
	var url = "/quotation/selectApprovalList.do";
	var param = { "param" : {
			  "DOC_NO"  : $("#DOC_NO").val(),
			  "DOC_GR"  : 'QT'
		}
	};
	
	fn_ajax(url, true, param, function(data, xhr){
		if(!fn_empty(data.result)){
			reloadGrid("approvalGrid", data.result);   // 그리드 조회 데이터 출력
			$("#MAX_PRIORITY").val(data.result[0].MAX_PRIORITY);
			
			$("#USER_ID").val(data.userid);
			if($("#USER_ID").val() == data.result[0].NEXT_APPROVAL_ID){
				$("#approval").show();
			}
			for(i=0;i< data.result.length;i++){
				if((data.result[i].APPR_ID == $("#USER_ID").val()) || data.result[i].DEPUTY_ID == $("#USER_ID").val()){
					$("#PRIORITY").val(data.result[i].PRIORITY);
				}
				if(data.result[i].NEXT_APPROVAL_ID == data.result[i].APPR_ID || data.result[i].NEXT_APPROVAL_ID == data.result[i].DEPUTY_ID){
					$('#approvalGrid').jqGrid('setSelection', $('#approvalGrid').jqGrid('getDataIDs')[i]);
				}
			}
		}
	});
}

function updateApproval(){
	
	var url = "/quotation/updateApproval_pre.do";
	var param = {"param":{"DOC_NO": $("#DOC_NO").val()
						 ,"DOC_GR": 'QT'
						 ,"APPR_ID":$("#USER_ID").val()
						 ,"PRIORITY":$("#PRIORITY").val()
						 ,"MAX_PRIORITY":$("#MAX_PRIORITY").val()
						 ,"APPROVAL_STS":$("input:radio[name=APLV_TP]:checked").val()
						 ,"REJECT_RSN":$("#REJECT_RSN").val()}};
	fn_ajax(url, false, param, function(data, xhr){
		if(!fn_empty(data)){
			if(data.ALEADY == 'Y'){
				alert("<s:message code='errors.approval'/>");
			}else{
				alert("<s:message code='info.save'/>");
				popupClose($('#QuotationPopup').data('pid'));
			}
		}
	});
}

function openApprovalPopup(){
	
		var url= '/quotation/getModiTms.do'
		var param = {"param" : { "DOC_NO" : $('#DOC_NO').val() }};
		
		if($("#MAX_PRIORITY").val() > $("#PRIORITY").val() && $("input:radio[name=APLV_TP]:checked").val() == 'Y'){
			fn_ajax(url, false, param, function(data, xhr){
				if(data.result != $("#MODI_TMS").val()){
					alert("<s:message code='error.alreadyUpd'/>");
				}else{
					var url = "/popup/mailPreview.do";
					var pid = "MailPreviewPopup";
					var param = { 
							'MAIL_CD': 'AP'
						  , 'MAIL_LANG': getCookie("Language")
						  , 'BTN_YN': 'Y'
						  , 'DOC_NO': $('#DOC_NO').val()
						  , 'CUST_CD': $('#SOLD_CUST_CD').val()
						  , 'CUST_NM': $('#SOLD_CUST_NM').text()
						  , 'DOC_GR' : 'QT'
						  , 'NEXT' : 'Y'
							};
					param.window = window;

					popupOpen(url, pid, param, function(data) {
						if(!fn_empty(data)){
							if(data.SEND_EMAIL == "Y"){
								updateApproval();
							}
						}
					});	
				}
			});
		}else{
			updateApproval();
		}
};
</script>